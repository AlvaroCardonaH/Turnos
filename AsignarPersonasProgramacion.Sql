DELIMITER //
CREATE PROCEDURE AsignarPersonasProgramacion (P_IdProgramacionSugerida INT)
BEGIN

	DECLARE Ln_IdClasificacionDia INT;
	DECLARE Ln_CodigoEstadoRegistro INT;
	DECLARE Ln_NumeroMensajeroDisponibles INT;
	DECLARE Ln_NumeroMensajerosNecesitan INT;
	DECLARE Ln_IdFlota INT;
	
	DECLARE Cursor_ProgramacionSugerida CURSOR FOR
		SELECT PS.IdClasificacionDia, PS.CodigoEstadoRegistro, RP.IdFlota
		FROM t_programacionsugerida PS INNER JOIN h_reportepedidosxpdv RP ON PS.IdReportePedidosxPdv = RP.IdReportePedidosxPdv
		WHERE PS.IdProgramacionSugerida = P_IdProgramacionSugerida;	
		
	-- Consultar datos generales de la programacion sugerida
	OPEN Cursor_ProgramacionSugerida;        
    FETCH Cursor_ProgramacionSugerida INTO Ln_IdClasificacionDia, Ln_CodigoEstadoRegistro, Ln_IdFlota ;        
    CLOSE Cursor_ProgramacionSugerida;
	
	-- Numero de Mensajeros Que Se Necesitan
	SELECT COUNT(*) INTO Ln_NumeroMensajerosNecesitan
	FROM t_ProgramacionSugeridaDetalle PS 
	WHERE PS.IdProgramacionSugerida = P_IdProgramacionSugerida;	
	
	IF Ln_CodigoEstadoRegistro = 1 THEN 
	
		-- Numero de Mensajeros Disponibles
		IF Ln_IdClasificacionDia = 2 THEN		
			SELECT COUNT(*) INTO Ln_NumeroMensajeroDisponibles
			FROM m_Mensajeros M 
			WHERE M.IdFlota = Ln_IdFlota AND M.NumeroFestivosDominicales < 2 AND M.CodigoEstadoRegistro = 1;	
		ELSE
			SELECT COUNT(*) INTO Ln_NumeroMensajeroDisponibles
			FROM m_Mensajeros M 
			WHERE M.IdFlota = Ln_IdFlota AND M.CodigoEstadoRegistro = 1;			
		END IF;
		
		IF Ln_NumeroMensajeroDisponibles >= Ln_NumeroMensajerosNecesitan THEN
	
			SELECT Ln_NumeroMensajeroDisponibles , Ln_NumeroMensajerosNecesitan ;
			
			CASE Ln_IdClasificacionDia		
			  WHEN 1 THEN CALL AsignarPersonasProgramacionNormal (P_IdProgramacionSugerida);
			  WHEN 2 THEN CALL AsignarPersonasProgramacionFestivoDominical (P_IdProgramacionSugerida, Ln_NumeroMensajeroDisponibles, Ln_NumeroMensajerosNecesitan);
			  WHEN 3 THEN CALL AsignarPersonasProgramacionClienteFiel (P_IdProgramacionSugerida);
			  ELSE SELECT 0;
			END CASE;	
		
		END IF;
	END IF;	

END //