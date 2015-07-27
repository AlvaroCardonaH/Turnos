DELIMITER //

CREATE PROCEDURE Crear_ProgramacionSugerida_Inicial(
							P_IdReportePedidosxPdv INT,
                            P_IdClasificacionDia INT,
                            P_NumeroMensajeros INT,
                            P_IdFlota INT,
                            P_FechaInicio DATE, 
                            P_FechaFinal DATE, 
                            P_IdUsuarioGraba INT)
BEGIN

	DECLARE Ln_NumeroPosicion INT;
	DECLARE Ln_IdHorario INT; 
	DECLARE Lc_HoraInicio VARCHAR(5) ;
	DECLARE Lc_HoraFinal VARCHAR(5); 
	DECLARE Ln_No_Mas_Datos INT;
    DECLARE Ln_Promedio_Mensajeros_Hora INT;
    
    DECLARE Ln_Mensajero INT DEFAULT 0;
    DECLARE Ln_TotalHorasMensajero INT DEFAULT 0;
    DECLARE Ln_TotalMensajerosHora INT;
    
    DECLARE Ln_IdProgramacionSugerida INT;
	DECLARE Ln_NumeroPosicionAux INT;
	
	DECLARE Ln_PrimeraPosicion INT;
	DECLARE Ln_UltimaPosicion INT;
	DECLARE Ln_NroVeces INT;
	
	DECLARE lc_HoraInicio_Aux VARCHAR(5);
	DECLARE lc_HoraFinal_Aux VARCHAR(5);
    DECLARE Ln_IdHorario_Aux INT;
    DECLARE Lc_NombreTabla VARCHAR(80);
	DECLARE Ln_DescripcionProgramacion INT;
	DECLARE Ln_NumeroHorasMinima INT;
    
    DECLARE Ln_IdProgramacionSugerida_Aux INT;
    DECLARE Ln_Mensajero_Aux INT;    
    DECLARE Ln_Ultimo_Prog INT;
    DECLARE Ln_Ultimo_Detalle INT;
    
	DECLARE Ln_MaximoHorasTurno INT;
	DECLARE Ln_MinimoHorasTurno INT;

	DECLARE Ln_Valor DECIMAL(6,2);
	DECLARE Ln_PorcentajeHoras DECIMAL(6,2);
	
    DECLARE Cursor_Temporal CURSOR FOR 
		SELECT IdProgramacionSugerida, NroMensajero, IdHorario, PorcentajeHoras
			FROM  Temp_ProgramacionSugerida 
			ORDER BY IdProgramacionSugerida, NroMensajero;

	-- Definición de la consulta
	DECLARE Cursor_Necesidades_Mensajeros CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, 			
			(CASE P_IdClasificacionDia 
				WHEN 1 THEN Promedio_Mensajeros_Hora_Normal 
				WHEN 2 THEN Promedio_Mensajeros_Hora_Festivo 
				WHEN 3 THEN Promedio_Mensajeros_Hora_ClienteFiel
				ELSE 0 
			END ) Promedio_Mensajeros_Hora_Normal 		
			FROM t_resumen_clasificacion_dias
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND 
				IdClasificacionDia = P_IdClasificacionDia 
			ORDER BY NumeroPosicion; 

    DECLARE Cursor_Mensajeros CURSOR FOR 
		SELECT Tmp_NroMensajero, Tmp_TotalHoras, Tmp_PorcentajeHoras
			FROM  Temp_HorasMensajero 
			WHERE IdProgramacionSugerida = Ln_IdProgramacionSugerida AND Tmp_PorcentajeHoras > 0
			ORDER BY IdProgramacionSugerida, Tmp_NroMensajero;
			
	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;

	-- SELECT MIN(NumeroPosicion), MAX(NumeroPosicion) INTO Ln_PrimeraPosicion, Ln_UltimaPosicion
	--		FROM t_resumen_clasificacion_dias
	--		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND 
	--			IdClasificacionDia = P_IdClasificacionDia;

	SELECT MIN(NumeroPosicion), MAX(NumeroPosicion) INTO Ln_PrimeraPosicion, Ln_UltimaPosicion 
		FROM m_horarioxflota
		WHERE IdFlota = P_IdFlota;
				
	CREATE TEMPORARY TABLE Temp_ProgramacionSugerida (IdProgramacionSugerida INT, IdHorario INT, NroMensajero INT, NumeroPosicion INT, 
		HoraInicio VARCHAR(5), HoraFinal VARCHAR(5), Valor INT, PorcentajeHoras DECIMAL(6,2));

    CREATE TEMPORARY TABLE Temp_HorasMensajero 
		(IdProgramacionSugerida INT, Tmp_NroMensajero INT, Tmp_TotalHoras INT, Tmp_PorcentajeHoras INT);
        
	SELECT CD.MinimoHorasTurno, CD.MaximoHorasTurno INTO Ln_MinimoHorasTurno, Ln_MaximoHorasTurno 
	FROM m_ClasificacionDias CD			
	WHERE CD.IdClasificacionDia = P_IdClasificacionDia;
        
	SET Ln_IdProgramacionSugerida = 0;
    
	SET Ln_NumeroHorasMinima = Ln_MinimoHorasTurno;
    
	SET Ln_DescripcionProgramacion = Ln_MinimoHorasTurno - 1;
	
	NumeroHorasMinima_Loop : WHILE (Ln_NumeroHorasMinima <= Ln_MaximoHorasTurno) DO
		        		
		SET Ln_IdProgramacionSugerida = Ln_IdProgramacionSugerida + 1;
		
		-- Limpiar Totales Horas Asignadas x Mensajero
		SET Ln_Mensajero = 1;    
		Resumen_Loop: WHILE (Ln_Mensajero <= P_NumeroMensajeros) DO 
			SET Ln_PorcentajeHoras = 100;
			INSERT INTO Temp_HorasMensajero VALUES (Ln_IdProgramacionSugerida, Ln_Mensajero,0, Ln_PorcentajeHoras);
			SET Ln_Mensajero = Ln_Mensajero + 1;
		END WHILE Resumen_Loop;
            
		CALL Crear_TurnoFijo_ProgramacionSugerida_NormalClienteFiel (P_IdFlota, Ln_NumeroHorasMinima, Ln_IdProgramacionSugerida);	
			
		-- Abrimos el cursor
		OPEN Cursor_Necesidades_Mensajeros;

		-- Obtenemos las necesidades de mensajeros por hora
		FETCH Cursor_Necesidades_Mensajeros 
			INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_Promedio_Mensajeros_Hora ;		
	
		Resumen_Loop: WHILE ((Ln_No_Mas_Datos = 0)) DO
		
			-- Calcular Mensajeros Por Hora Asignados
			SELECT IFNULL(SUM(Valor),0) INTO Ln_TotalMensajerosHora 
				FROM Temp_ProgramacionSugerida 
				WHERE IdProgramacionSugerida = Ln_IdProgramacionSugerida AND NumeroPosicion = Ln_NumeroPosicion ;
				
			IF (Ln_TotalMensajerosHora  < Ln_Promedio_Mensajeros_Hora) THEN   
			
				SET Ln_Mensajero = 1;
				OPEN Cursor_Mensajeros;
				FETCH Cursor_Mensajeros INTO Ln_Mensajero, Ln_TotalHorasMensajero, Ln_PorcentajeHoras;
								
				Resumen_Mensajero: WHILE ((Ln_No_Mas_Datos = 0) AND (Ln_TotalMensajerosHora  < Ln_Promedio_Mensajeros_Hora)) DO
				
					-- Calcular Horas Asignadas x Mensajero
					SELECT Tmp_TotalHoras INTO Ln_TotalHorasMensajero FROM Temp_HorasMensajero
						WHERE  IdProgramacionSugerida = Ln_IdProgramacionSugerida AND Tmp_NroMensajero = Ln_Mensajero;
					
					IF Ln_TotalHorasMensajero = 0 THEN
					
						SET Ln_NumeroPosicionAux = Ln_NumeroPosicion;
						SET Ln_NroVeces = 1;
						Resumen_Horario: WHILE (Ln_NroVeces <= Ln_NumeroHorasMinima) AND (Ln_NumeroPosicionAux <= Ln_UltimaPosicion) DO
						
							SELECT h.IdHorario, h.HoraInicio, h.HoraFinal INTO Ln_IdHorario_Aux, lc_HoraInicio_Aux, lc_HoraFinal_Aux
							FROM m_horarioxflota hf INNER JOIN m_horario h ON hf.IdHorario = h.IdHorario
							WHERE hf.IdFlota = P_IdFlota AND hf.NumeroPosicion = Ln_NumeroPosicionAux;
						
							INSERT INTO Temp_ProgramacionSugerida (IdProgramacionSugerida, NroMensajero, NumeroPosicion, IdHorario, HoraInicio, HoraFinal, 
							Valor, PorcentajeHoras)
							VALUES
							(Ln_IdProgramacionSugerida, Ln_Mensajero, Ln_NumeroPosicionAux, Ln_IdHorario_Aux, lc_HoraInicio_Aux, lc_HoraFinal_Aux, 
							1, Ln_PorcentajeHoras);
							
							SET Ln_NumeroPosicionAux = Ln_NumeroPosicionAux + 1;
							SET Ln_NroVeces = Ln_NroVeces + 1;
						END WHILE Resumen_Horario;
						
						SET Ln_NroVeces = Ln_NroVeces - 1;
						
						UPDATE Temp_HorasMensajero SET Tmp_TotalHoras = Ln_NroVeces
							WHERE  IdProgramacionSugerida = Ln_IdProgramacionSugerida AND Tmp_NroMensajero = Ln_Mensajero ;
						
						SET Ln_TotalMensajerosHora = Ln_TotalMensajerosHora + 1;
					END IF;
				
					FETCH Cursor_Mensajeros INTO Ln_Mensajero, Ln_TotalHorasMensajero, Ln_PorcentajeHoras;
					
				END WHILE Resumen_Mensajero;
				
				SET Ln_No_Mas_Datos = 0;
				CLOSE Cursor_Mensajeros;
				
			END IF;
			
			FETCH Cursor_Necesidades_Mensajeros 
				INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_Promedio_Mensajeros_Hora ;		

		END WHILE Resumen_Loop;
        
		CLOSE Cursor_Necesidades_Mensajeros;
		
		SET Ln_NumeroHorasMinima = Ln_NumeroHorasMinima + 1;
        
		
		SET Ln_No_Mas_Datos = 0;
	
	END WHILE NumeroHorasMinima_Loop;
    
    SET Ln_No_Mas_Datos = 0;
    
    OPEN Cursor_Temporal;

	FETCH Cursor_Temporal
			INTO Ln_IdProgramacionSugerida, Ln_Mensajero, Ln_IdHorario, Ln_PorcentajeHoras;		
	
	Resumen_Temporal: WHILE ((Ln_No_Mas_Datos = 0)) DO
    
		SET Ln_DescripcionProgramacion = Ln_DescripcionProgramacion + 1;

		INSERT INTO t_programacionsugerida (IdReportePedidosxPdv, IdClasificacionDia, FechaInicio, FechaFinal, IdUsuarioGraba, DescripcionProgramacionSugerida, NumeroMensajerosProgramacion)
        VALUES
        (P_IdReportePedidosxPdv, P_IdClasificacionDia, P_FechaInicio, P_FechaFinal, P_IdUsuarioGraba, concat('PROGRAMACION SUGERIDA PARA ',Ln_DescripcionProgramacion,' HORAS'), P_NumeroMensajeros);
                            
        SET Lc_NombreTabla = 't_programacionsugerida';                
		SELECT IFNULL(Auto_Increment,1) INTO Ln_Ultimo_Prog
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE Table_name = Lc_NombreTabla; 
            
        SET Ln_Ultimo_Prog = Ln_Ultimo_Prog - 1;    
		
		SET Ln_IdProgramacionSugerida_Aux  = Ln_IdProgramacionSugerida;
        
		Resumen_Programacion: WHILE ((Ln_No_Mas_Datos = 0) AND 
									(Ln_IdProgramacionSugerida = Ln_IdProgramacionSugerida_Aux) ) DO
            
            INSERT INTO t_programacionsugeridadetalle (IdProgramacionSugerida, NumeroMensajero)
            VALUES
            (Ln_Ultimo_Prog, Ln_Mensajero);

			SET Lc_NombreTabla = 't_programacionsugeridadetalle';                
			SELECT IFNULL(Auto_Increment,1) INTO Ln_Ultimo_Detalle
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE Table_name = Lc_NombreTabla; 
            
			SET Ln_Ultimo_Detalle = Ln_Ultimo_Detalle- 1;    
            
			SET Ln_Mensajero_Aux = Ln_Mensajero;
            
			Resumen_Mensajero: WHILE ((Ln_No_Mas_Datos = 0) AND 
									(Ln_IdProgramacionSugerida = Ln_IdProgramacionSugerida_Aux) AND 
                                    (Ln_Mensajero = Ln_Mensajero_Aux) )DO
                            
				CALL Actualizar_Programacion_HorarioMensajero (Ln_Ultimo_Detalle, Ln_IdHorario, Ln_PorcentajeHoras);			
                
				FETCH Cursor_Temporal
					INTO Ln_IdProgramacionSugerida, Ln_Mensajero, Ln_IdHorario, Ln_PorcentajeHoras;		                                    

			END WHILE Resumen_Mensajero;
        END WHILE Resumen_Programacion;
    
    END WHILE Resumen_Temporal;
    
    CLOSE Cursor_Temporal;
    
	DROP TEMPORARY TABLE Temp_ProgramacionSugerida ;
	DROP TEMPORARY TABLE Temp_HorasMensajero ;     
    
END //