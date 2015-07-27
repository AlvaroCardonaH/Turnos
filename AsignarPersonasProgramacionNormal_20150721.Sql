DELIMITER //
CREATE PROCEDURE AsignarPersonasProgramacionNormal (P_IdProgramacionSugerida INT)
BEGIN

	DECLARE Ld_FechaAux DATE;
    DECLARE Ln_PosicionTurno INT;
    DECLARE Lc_Salida VARCHAR(255);
    DECLARE Ln_NumeroRegistros INT;
    DECLARE Ln_EsFestivo INT;
    DECLARE Ln_EsDiaClienteFiel INT;
    DECLARE Ln_DiaSemana INT;
    DECLARE Ln_EsDiaNormal INT;
    DECLARE Ln_IdClasificacionDiaAux INT;
    DECLARE Ln_No_Mas_Datos INT;
    
    DECLARE P_IdClasificacionDia INT;
    DECLARE P_IdReportePedidosxPdv INT;
    DECLARE P_FechaInicio DATE;
    DECLARE P_FechaFinal DATE;
    DECLARE P_TotalMensajeros INT;
    DECLARE P_IdFlota INT;
	DECLARE Ln_NumeroDias INT;
	DECLARE Ld_FechaPrimerDia DATE;
	DECLARE Ld_FechaUltimoDia DATE;
	DECLARE Ln_NumeroSemana INT;
	DECLARE Ln_Sale INT;
	
	DECLARE Ln_NumeroMensajero INT;
	DECLARE Ln_HoraCero INT; 
	DECLARE Ln_HoraUno INT; 
	DECLARE Ln_HoraDos INT; 
	DECLARE Ln_HoraTres INT; 
	DECLARE Ln_HoraCuatro INT; 
	DECLARE Ln_HoraCinco INT; 
	DECLARE Ln_HoraSeis INT; 
	DECLARE Ln_HoraSiete INT; 
	DECLARE Ln_HoraOcho INT; 
	DECLARE Ln_HoraNueve INT; 
	DECLARE Ln_HoraDiez INT; 
	DECLARE Ln_HoraOnce INT; 
	DECLARE Ln_HoraDoce INT; 
	DECLARE Ln_HoraTrece INT; 
	DECLARE Ln_HoraCatorce INT; 
	DECLARE Ln_HoraQuince INT; 
	DECLARE Ln_HoraDieciSeis INT; 
	DECLARE Ln_HoraDieciSiete INT; 
	DECLARE Ln_HoraDieciOcho INT; 
	DECLARE Ln_HoraDieciNueve INT; 
	DECLARE Ln_HoraVeinte INT; 
	DECLARE Ln_HoraVeintiUna INT; 
	DECLARE Ln_HoraVeintiDos INT; 
	DECLARE Ln_HoraVeintiTres INT;
    
    DECLARE Lc_HoraInicioTurno CHAR(10);
    DECLARE Lc_HoraFinalTurno CHAR(10); 
	
	DECLARE Ld_FechaInicial DATE;
	DECLARE Ld_FechaFinal DATE;
    
    DECLARE Ln_NumeroTurno INT; 
	
	DECLARE Ln_Documento INT;
	DECLARE Lc_NombreCompleto VARCHAR(80);
	
	DECLARE Cursor_ProgramacionSugerida CURSOR FOR
		SELECT PS.IdClasificacionDia, PS.IdReportePedidosxPdv, PS.FechaInicio, PS.FechaFinal, PS.NumeroMensajerosProgramacion, RP.IdFlota
		FROM t_programacionsugerida PS INNER JOIN h_reportepedidosxpdv RP ON PS.IdReportePedidosxPdv = RP.IdReportePedidosxPdv
		WHERE PS.IdProgramacionSugerida = P_IdProgramacionSugerida;	
	
    DECLARE Cursor_Temporal CURSOR FOR 		
		SELECT PSD.NumeroMensajero, PSD.HoraCero, PSD.HoraUno, PSD.HoraDos, PSD.HoraTres, PSD.HoraCuatro, PSD.HoraCinco, PSD.HoraSeis, PSD.HoraSiete, 
			PSD.HoraOcho, PSD.HoraNueve, PSD.HoraDiez, PSD.HoraOnce, PSD.HoraDoce, PSD.HoraTrece, PSD.HoraCatorce, PSD.HoraQuince, PSD.HoraDieciSeis, 
			PSD.HoraDieciSiete, PSD.HoraDieciOcho, PSD.HoraDieciNueve, PSD.HoraVeinte, PSD.HoraVeintiUna, PSD.HoraVeintiDos, PSD.HoraVeintiTres
		FROM (t_programacionsugeridadetalle PSD INNER JOIN t_programacionsugerida PS
		ON (PSD.IdProgramacionSugerida = PS.IdProgramacionSugerida)
		INNER JOIN h_reportepedidosxpdv RP ON PS.IdReportePedidosxPdv = RP.IdReportePedidosxPdv)
		WHERE PS.IdProgramacionSugerida = P_IdProgramacionSugerida 
		ORDER BY PSD.NumeroMensajero;	
	
	DECLARE Cursor_Mensajeros CURSOR FOR			
		SELECT M.Documento, 
		CONCAT(M.PrimerNombre, ' ', M.SegundoNombre, ' ', M.PrimerApellido, ' ', M.SegundoApellido) AS NombreCompleto 
		FROM m_mensajeros M 
		WHERE M.IdFlota = P_IdFlota AND M.CodigoEstadoRegistro = 1;			
		
	DECLARE Cursor_Semanas CURSOR FOR 
		SELECT FechaInicial , FechaFinal
		FROM Temp_ProgramacionSemanas	
		ORDER BY NumeroSemana;
			
	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;	

	CREATE TEMPORARY TABLE Temp_ProgramacionSemanas (NumeroSemana INT, FechaInicial DATE, FechaFinal DATE);
    
    CREATE TEMPORARY TABLE Temp_ProgramacionTurnosNormal (NumeroTurno INT, FechaInicio DATE, FechaFinal DATE, HoraInicio CHAR(10), HoraFinal CHAR(10),
															Documento INT, NombreCompleto VARCHAR(80));
	
	CREATE TEMPORARY TABLE Temp_Mensajeros (NumeroMensajero INT, Documento INT, NombreCompleto VARCHAR(80));
		
	-- Consultar datos generales de la programacion sugerida
	OPEN Cursor_ProgramacionSugerida;        
    FETCH Cursor_ProgramacionSugerida INTO P_IdClasificacionDia, P_IdReportePedidosxPdv, P_FechaInicio, P_FechaFinal, P_TotalMensajeros, P_IdFlota;        
    CLOSE Cursor_ProgramacionSugerida;
	
	SET Ln_No_Mas_Datos = 0;
	SET Ln_NumeroMensajero = 1;
	
	OPEN Cursor_Mensajeros;
	FETCH Cursor_Mensajeros INTO Ln_Documento, Lc_NombreCompleto;
	
	Resumen_Loop: WHILE ((Ln_No_Mas_Datos = 0)) DO
		INSERT INTO Temp_Mensajeros (NumeroMensajero, Documento, NombreCompleto) VALUES (Ln_NumeroMensajero, Ln_Documento, Lc_NombreCompleto);
		
		FETCH Cursor_Mensajeros INTO Ln_Documento, Lc_NombreCompleto;
		SET Ln_NumeroMensajero = Ln_NumeroMensajero + 1;
	END WHILE Resumen_Loop;
	
	CLOSE Cursor_Mensajeros;
	
	SET Ln_No_Mas_Datos = 0;			
    
	SET Ln_PosicionTurno = 1 + ROUND(RAND() * P_TotalMensajeros);
	
    SET Lc_Salida = "";
			
	SET Ln_NumeroSemana = 0;

	SET Ld_FechaAux = P_FechaInicio;	
	
    Rango_Fecha: WHILE ((Ld_FechaAux <= P_FechaFinal) AND (Ld_FechaAux <> '0000-00-00')) DO
	
		SET Ln_NumeroSemana = Ln_NumeroSemana + 1;
		SET Ln_NumeroDias = 1; 
		
		SET Ld_FechaPrimerDia = Ld_FechaAux;
		SET Ld_FechaUltimoDia = Ld_FechaAux;
		SET Ln_Sale = 0;
		
		Rango_Semana: WHILE ((Ln_NumeroDias <= 7) AND (Ld_FechaAux <= P_FechaFinal) AND (Ld_FechaAux <> '0000-00-00') AND (Ln_Sale = 0)) DO
		
			SET Ln_EsFestivo = verificarFechaFestivo (Ld_FechaAux);        
			SET Ln_EsDiaClienteFiel = EsDiaClienteFiel (P_IdFlota, DATE_FORMAT(Ld_FechaAux, '%d/%m/%Y'));
			SET Ln_DiaSemana =  DAYOFWEEK(Ld_FechaAux);
			SET Ln_IdClasificacionDiaAux = TipoDiaSemana (Ln_DiaSemana);
			
			SET Ln_Sale = 1;
			
			-- Validar que no sea un dia FESTIVO
			IF (Ln_EsFestivo = 0) THEN
				-- Validar que no sea un dia CLIENTE FIEL
				IF (Ln_EsDiaClienteFiel = 0) THEN
					-- Validar Si es un Dia Clasificacdo Como Normal (IdClasificacion = 1)
					IF (Ln_IdClasificacionDiaAux = P_IdClasificacionDia) THEN
						SET Ld_FechaUltimoDia = Ld_FechaAux;	
						SET Ln_Sale = 0;
					END IF;  
				END IF;	
			END IF;
												
			SET Ln_NumeroDias = Ln_NumeroDias + 1;									
			SET Ld_FechaAux = Ld_FechaAux + 1;		
			
		END WHILE Rango_Semana;
		
		IF 	((verificarFechaFestivo (Ld_FechaPrimerDia) = 0) AND (verificarFechaFestivo (Ld_FechaUltimoDia) = 0)) AND  
			((TipoDiaSemana (DAYOFWEEK(Ld_FechaPrimerDia)) = P_IdClasificacionDia) AND (TipoDiaSemana (DAYOFWEEK(Ld_FechaUltimoDia)) = P_IdClasificacionDia)) AND
			((EsDiaClienteFiel (P_IdFlota, DATE_FORMAT(Ld_FechaPrimerDia, '%d/%m/%Y')) = 0) AND (EsDiaClienteFiel (P_IdFlota, DATE_FORMAT(Ld_FechaUltimoDia, '%d/%m/%Y')) = 0))  THEN
			INSERT INTO Temp_ProgramacionSemanas (NumeroSemana , FechaInicial , FechaFinal) VALUES (Ln_NumeroSemana, Ld_FechaPrimerDia, Ld_FechaUltimoDia);
		END IF;	
		
	END WHILE Rango_Fecha;	
	
    SET Ln_No_Mas_Datos = 0;
    SET Ln_NumeroTurno = 0;
	
	OPEN Cursor_Semanas;		
	FETCH Cursor_Semanas INTO Ld_FechaInicial , Ld_FechaFinal;
		
	-- Ciclo Semanas	
	Resumen_Semanas:  WHILE ((Ln_No_Mas_Datos = 0)) DO
	
		SET Ln_NumeroTurno = 0;
		
		OPEN Cursor_Temporal; 		
		FETCH Cursor_Temporal INTO Ln_NumeroMensajero, Ln_HoraCero, Ln_HoraUno, Ln_HoraDos, Ln_HoraTres, Ln_HoraCuatro, Ln_HoraCinco, Ln_HoraSeis, Ln_HoraSiete, 
				Ln_HoraOcho, Ln_HoraNueve, Ln_HoraDiez, Ln_HoraOnce, Ln_HoraDoce, Ln_HoraTrece, Ln_HoraCatorce, Ln_HoraQuince, Ln_HoraDieciSeis, 
				Ln_HoraDieciSiete, Ln_HoraDieciOcho, Ln_HoraDieciNueve, Ln_HoraVeinte, Ln_HoraVeintiUna, Ln_HoraVeintiDos, Ln_HoraVeintiTres;		
		
		-- Ciclo Horarios			
		Resumen_Temporal: WHILE ((Ln_No_Mas_Datos = 0)) DO

			SET Lc_HoraInicioTurno = '';
			SET Lc_HoraFinalTurno = '';
			SET Ln_NumeroTurno = Ln_NumeroTurno + 1;
			
			CALL HorariosInicioFinTurno (P_IdFlota, Ln_HoraCero, Ln_HoraUno, Ln_HoraDos, Ln_HoraTres, Ln_HoraCuatro, Ln_HoraCinco, Ln_HoraSeis, Ln_HoraSiete, 
					Ln_HoraOcho, Ln_HoraNueve, Ln_HoraDiez, Ln_HoraOnce, Ln_HoraDoce, Ln_HoraTrece, Ln_HoraCatorce, Ln_HoraQuince, Ln_HoraDieciSeis, 
					Ln_HoraDieciSiete, Ln_HoraDieciOcho, Ln_HoraDieciNueve, Ln_HoraVeinte, Ln_HoraVeintiUna, Ln_HoraVeintiDos, Ln_HoraVeintiTres,
					Lc_HoraInicioTurno, Lc_HoraFinalTurno);
					
			SET Ln_Sale = 0;
			
			Ciclo_Mensajero_Disponible: WHILE ((Ln_Sale = 0)) DO
				SELECT FLOOR(1 + (RAND() * P_TotalMensajeros)) INTO Ln_PosicionTurno;
				
				SELECT Documento, NombreCompleto INTO Ln_Documento, Lc_NombreCompleto
				FROM Temp_Mensajeros WHERE NumeroMensajero = Ln_PosicionTurno;
				
				-- HoraInicio = Lc_HoraInicioTurno AND HoraFinal = Lc_HoraFinalTurno AND
				SELECT IFNULL(COUNT(*),0) INTO Ln_NumeroRegistros FROM Temp_ProgramacionTurnosNormal 
				WHERE FechaInicio = Ld_FechaInicial AND FechaFinal = Ld_FechaFinal AND Documento = Ln_Documento;
						
				IF Ln_NumeroRegistros = 0 THEN
						
					INSERT INTO Temp_ProgramacionTurnosNormal (NumeroTurno, FechaInicio, FechaFinal, HoraInicio, HoraFinal, Documento, NombreCompleto) VALUES 
					(Ln_NumeroTurno, Ld_FechaInicial, Ld_FechaFinal, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto);        
					
					SET Ln_Sale = 1;
				END IF;
			END WHILE Ciclo_Mensajero_Disponible;
			
			FETCH Cursor_Temporal INTO Ln_NumeroMensajero, Ln_HoraCero, Ln_HoraUno, Ln_HoraDos, Ln_HoraTres, Ln_HoraCuatro, Ln_HoraCinco, Ln_HoraSeis, Ln_HoraSiete, 
					Ln_HoraOcho, Ln_HoraNueve, Ln_HoraDiez, Ln_HoraOnce, Ln_HoraDoce, Ln_HoraTrece, Ln_HoraCatorce, Ln_HoraQuince, Ln_HoraDieciSeis, 
					Ln_HoraDieciSiete, Ln_HoraDieciOcho, Ln_HoraDieciNueve, Ln_HoraVeinte, Ln_HoraVeintiUna, Ln_HoraVeintiDos, Ln_HoraVeintiTres;
			
		END WHILE Resumen_Temporal;
		
		CLOSE Cursor_Temporal;
		SET Ln_No_Mas_Datos = 0;
		
		FETCH Cursor_Semanas INTO Ld_FechaInicial , Ld_FechaFinal;
		
	END WHILE Resumen_Semanas;
	
	CLOSE Cursor_Semanas;
	
	INSERT INTO t_ProgramacionTurnos (IdFlota, IdProgramacionSugerida, IdClasificacionDia, FechaInicial, FechaFinal) VALUES
	(P_IdFlota, P_IdProgramacionSugerida, P_IdClasificacionDia, P_FechaInicio, P_FechaFinal);
	
    -- SELECT Lc_Salida;
END //