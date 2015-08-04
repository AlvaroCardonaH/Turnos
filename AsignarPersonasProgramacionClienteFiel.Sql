DELIMITER //
CREATE PROCEDURE AsignarPersonasProgramacionClienteFiel (P_IdProgramacionSugerida INT)
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
	
	DECLARE Ln_DiferenciaDias INT;
	DECLARE Ln_DiferenciaHoras INT;
	
	DECLARE Lc_HoraFinalAnterior CHAR(2);
	DECLARE Lc_HoraInicioActual CHAR(2);
	
	DECLARE Ln_UltimoIdProgramacionTurno INT;
	DECLARE Ln_UltimoIdProgramacionFecha INT;
	
	DECLARE Lc_NombreTabla VARCHAR(30);
	
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
		CONCAT(IFNULL(M.PrimerNombre,' '), ' ', IFNULL(M.SegundoNombre,' '), ' ', IFNULL(M.PrimerApellido,' '), ' ', IFNULL(M.SegundoApellido,' ')) AS NombreCompleto
		FROM m_mensajeros M 
		WHERE M.IdFlota = P_IdFlota AND M.CodigoEstadoRegistro = 1;			
		
	DECLARE Cursor_Semanas CURSOR FOR 
		SELECT FechaInicial , FechaFinal
		FROM Temp_ProgramacionSemanas	
		ORDER BY NumeroSemana;
		
	DECLARE Cursor_ProgramacionTurnos CURSOR FOR
		SELECT NumeroTurno, HoraInicio, HoraFinal, Documento, NombreCompleto, DiferenciaHoras, HoraFinalAnterior
		FROM Temp_ProgramacionTurnosClienteFiel
		WHERE FechaInicio = Ld_FechaInicial AND FechaFinal = Ld_FechaFinal
		ORDER BY FechaInicio, NumeroTurno; 
			
	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;	

	CREATE TEMPORARY TABLE Temp_ProgramacionSemanas (NumeroSemana INT, FechaInicial DATE, FechaFinal DATE);
    
    CREATE TEMPORARY TABLE Temp_ProgramacionTurnosClienteFiel (NumeroTurno INT, FechaInicio DATE, FechaFinal DATE, HoraInicio CHAR(10), HoraFinal CHAR(10),
															Documento INT, NombreCompleto VARCHAR(80), DiferenciaHoras INT, HoraFinalAnterior CHAR(10));
	
	CREATE TEMPORARY TABLE Temp_Mensajeros (NumeroMensajero INT, Documento INT, NombreCompleto VARCHAR(80));
		
	-- Consultar datos generales de la programacion sugerida
	OPEN Cursor_ProgramacionSugerida;        
    FETCH Cursor_ProgramacionSugerida INTO P_IdClasificacionDia, P_IdReportePedidosxPdv, P_FechaInicio, P_FechaFinal, P_TotalMensajeros, P_IdFlota;        
    CLOSE Cursor_ProgramacionSugerida;
	
	SET Ln_No_Mas_Datos = 0;
	SET Ln_NumeroMensajero = 1;
	
	SET Ln_DiferenciaDias = P_FechaFinal - P_FechaInicio;
	
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

		SET Ln_EsDiaClienteFiel = EsDiaClienteFiel (P_IdFlota, DATE_FORMAT(Ld_FechaAux, '%d/%m/%Y'));
			
		IF Ln_EsDiaClienteFiel = 1 THEN
			INSERT INTO Temp_ProgramacionSemanas (NumeroSemana , FechaInicial , FechaFinal) VALUES (Ln_NumeroSemana, Ld_FechaPrimerDia, Ld_FechaUltimoDia);
		END IF;
		
		SET Ld_FechaAux = Ld_FechaAux + 1;	
				
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
				SELECT IFNULL(COUNT(*),0) INTO Ln_NumeroRegistros FROM Temp_ProgramacionTurnosClienteFiel 
				WHERE FechaInicio = Ld_FechaInicial AND FechaFinal = Ld_FechaFinal AND Documento = Ln_Documento;
												
				SET Ln_DiferenciaHoras = null;
								
				IF (Ln_NumeroRegistros = 0) THEN
				
					SELECT SUBSTR(TM.HoraFinal,1,2) INTO Lc_HoraFinalAnterior  
						FROM t_ProgramacionTurnoFechas TF INNER JOIN t_ProgramacionTurnoMensajeros TM 
						ON TF.IdProgramacionTurnoFecha = TM.IdProgramacionTurnoFecha
						WHERE (TM.Documento = Ln_Documento) AND 
						( Ld_FechaInicial >= TF.FechaInicio AND Ld_FechaInicial <= TF.FechaFinal)
						ORDER BY TF.FechaFinal DESC
						LIMIT 1;
				
					IF 	Lc_HoraFinalAnterior IS NOT NULL THEN
						
						SET Lc_HoraInicioActual = SUBSTR(Lc_HoraInicioTurno,1,2);
						
						IF Lc_HoraFinalAnterior = '00' THEN
							SET Lc_HoraFinalAnterior = 24;
						END IF;
						
						SET Ln_DiferenciaHoras = (24 - Lc_HoraFinalAnterior) + Lc_HoraInicioActual;
					END IF;
				
					IF (Ln_DiferenciaHoras >=8) OR (Ln_DiferenciaHoras IS NULL) THEN
						INSERT INTO Temp_ProgramacionTurnosClienteFiel (NumeroTurno, FechaInicio, FechaFinal, HoraInicio, HoraFinal, Documento, NombreCompleto, 
						DiferenciaHoras, HoraFinalAnterior) 
						VALUES 
						(Ln_NumeroTurno, Ld_FechaInicial, Ld_FechaFinal, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto, 
						Ln_DiferenciaHoras, Lc_HoraFinalAnterior);        
						
						SET Ln_Sale = 1;
					END IF;
				END IF;
				
				SET Ln_No_Mas_Datos = 0;
				
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
	
	SET Lc_NombreTabla = 't_ProgramacionTurnos';                
	SELECT IFNULL(Auto_Increment,1) INTO Ln_UltimoIdProgramacionTurno
		FROM INFORMATION_SCHEMA.TABLES 
		WHERE Table_name = Lc_NombreTabla; 
            
	SET Ln_UltimoIdProgramacionTurno = Ln_UltimoIdProgramacionTurno - 1; 
	SET Ln_No_Mas_Datos = 0;	
		
	OPEN Cursor_Semanas;		
	FETCH Cursor_Semanas INTO Ld_FechaInicial , Ld_FechaFinal;
	
	-- Ciclo Semanas	
	Resumen_Semanas:  WHILE ((Ln_No_Mas_Datos = 0)) DO
	
		INSERT INTO t_ProgramacionTurnoFechas (IdProgramacionTurno, FechaInicio, FechaFinal) VALUES (Ln_UltimoIdProgramacionTurno, Ld_FechaInicial, Ld_FechaFinal);

		SET Lc_NombreTabla = 't_ProgramacionTurnoFechas';                
		SELECT IFNULL(Auto_Increment,1) INTO Ln_UltimoIdProgramacionFecha
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE Table_name = Lc_NombreTabla; 
				
		SET Ln_UltimoIdProgramacionFecha = Ln_UltimoIdProgramacionFecha - 1; 

		SET Ln_No_Mas_Datos = 0;
		
		OPEN Cursor_ProgramacionTurnos;
		FETCH Cursor_ProgramacionTurnos INTO Ln_NumeroTurno, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto, Ln_DiferenciaHoras, Lc_HoraFinalAnterior;

		Resumen_Programacion:  WHILE ((Ln_No_Mas_Datos = 0)) DO

			INSERT INTO t_ProgramacionTurnoMensajeros (IdProgramacionTurnoFecha, NumeroTurno, HoraInicio, HoraFinal, Documento, NombreCompleto,
			DiferenciaHoras, HoraFinalAnterior) VALUES (Ln_UltimoIdProgramacionFecha, Ln_NumeroTurno, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento,
			Lc_NombreCompleto, Ln_DiferenciaHoras, Lc_HoraFinalAnterior);
		
			FETCH Cursor_ProgramacionTurnos INTO Ln_NumeroTurno, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto, Ln_DiferenciaHoras, Lc_HoraFinalAnterior;
		END WHILE Resumen_Programacion;
		
		CLOSE Cursor_ProgramacionTurnos;
		
		SET Ln_No_Mas_Datos = 0;
		
		FETCH Cursor_Semanas INTO Ld_FechaInicial , Ld_FechaFinal;
	END WHILE Resumen_Semanas;
	
	UPDATE t_ProgramacionSugerida SET Seleccionada = 1 WHERE IdProgramacionSugerida =  P_IdProgramacionSugerida;
	
	UPDATE t_ProgramacionSugerida SET CodigoEstadoRegistro = 0 
		WHERE IdClasificacionDia = P_IdClasificacionDia AND IdReportePedidosxPdv = P_IdReportePedidosxPdv;
		
	
	CLOSE Cursor_Semanas;
	
	DROP TEMPORARY TABLE Temp_ProgramacionSemanas ;
	DROP TEMPORARY TABLE Temp_ProgramacionTurnosClienteFiel ;     
	DROP TEMPORARY TABLE Temp_Mensajeros ;     
	
    -- SELECT Lc_Salida;
END //