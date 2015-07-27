DELIMITER //

CREATE PROCEDURE Crear_TurnoFijo_ProgramacionSugerida_NormalClienteFiel(IN P_IdFlota INT,
							P_NumeroHorasTurno INT,
                            P_IdProgramacionSugerida INT)
BEGIN

	DECLARE Ln_TmpPrimeraPosicion INT;
    DECLARE Ln_TmpUltimaPosicion INT;
    DECLARE Ln_TmpNumeroRegistros INT;
    DECLARE Ln_TmpNumeroHoras INT;
    DECLARE Ln_TmpPosicion INT;
    DECLARE Ln_TmpIdHorario INT;
    DECLARE Lc_TmpHoraInicio VARCHAR(10);
    DECLARE Lc_TmpHoraFinal VARCHAR(10);
    
    SET Ln_TmpNumeroRegistros  = 0;
    
    SELECT IFNULL(COUNT(*),0) INTO Ln_TmpNumeroRegistros 
    FROM Temp_HorasMensajero
	WHERE Tmp_PorcentajeHoras = 100;
    
	SELECT MIN(NumeroPosicion), MAX(NumeroPosicion) INTO Ln_TmpPrimeraPosicion, Ln_TmpUltimaPosicion 
		FROM m_horarioxflota
		WHERE IdFlota = P_IdFlota;
        
    IF Ln_TmpNumeroRegistros > 1 THEN
    
		SET Ln_TmpPosicion = Ln_TmpPrimeraPosicion;
        SET Ln_TmpNumeroHoras = 1;
        
        Resumen_TmpTurno: WHILE (Ln_TmpPosicion <= Ln_TmpUltimaPosicion) AND (Ln_TmpNumeroHoras <= P_NumeroHorasTurno) DO
                
			SELECT h.IdHorario, h.HoraInicio, h.HoraFinal INTO Ln_TmpIdHorario, Lc_TmpHoraInicio, Lc_TmpHoraFinal
			FROM m_horarioxflota hf INNER JOIN m_horario h ON hf.IdHorario = h.IdHorario
			WHERE hf.IdFlota = P_IdFlota AND hf.NumeroPosicion = Ln_TmpPosicion;
						
			INSERT INTO Temp_ProgramacionSugerida (IdProgramacionSugerida, NroMensajero, NumeroPosicion, 
			IdHorario, HoraInicio, HoraFinal, Valor, PorcentajeHoras)
			VALUES
			(P_IdProgramacionSugerida, 1, Ln_TmpPosicion, Ln_TmpIdHorario, Lc_TmpHoraInicio, Lc_TmpHoraFinal, 1, 100);
            
            SET Ln_TmpPosicion = Ln_TmpPosicion + 1;
            SET Ln_TmpNumeroHoras = Ln_TmpNumeroHoras + 1;
        
        END WHILE Resumen_TmpTurno;
        
        SET Ln_TmpNumeroHoras = Ln_TmpNumeroHoras - 1;
        
		UPDATE Temp_HorasMensajero SET Tmp_TotalHoras = Ln_TmpNumeroHoras
		WHERE  IdProgramacionSugerida = P_IdProgramacionSugerida AND Tmp_NroMensajero = 1;
        
		SET Ln_TmpPosicion = Ln_TmpUltimaPosicion;
        SET Ln_TmpNumeroHoras = 1;
        
        Resumen_TmpTurno: WHILE (Ln_TmpPosicion >= Ln_TmpPrimeraPosicion) AND (Ln_TmpNumeroHoras <= P_NumeroHorasTurno) DO
                
			SELECT h.IdHorario, h.HoraInicio, h.HoraFinal INTO Ln_TmpIdHorario, Lc_TmpHoraInicio, Lc_TmpHoraFinal
			FROM m_horarioxflota hf INNER JOIN m_horario h ON hf.IdHorario = h.IdHorario
			WHERE hf.IdFlota = P_IdFlota AND hf.NumeroPosicion = Ln_TmpPosicion;
						
			INSERT INTO Temp_ProgramacionSugerida (IdProgramacionSugerida, NroMensajero, NumeroPosicion, 
			IdHorario, HoraInicio, HoraFinal, Valor, PorcentajeHoras)
			VALUES
			(P_IdProgramacionSugerida, 2, Ln_TmpPosicion, Ln_TmpIdHorario, Lc_TmpHoraInicio, Lc_TmpHoraFinal, 1, 100);
            
            SET Ln_TmpPosicion = Ln_TmpPosicion - 1;
            SET Ln_TmpNumeroHoras = Ln_TmpNumeroHoras + 1;
        
        END WHILE Resumen_TmpTurno;
        
        SET Ln_TmpNumeroHoras = Ln_TmpNumeroHoras - 1;
        
		UPDATE Temp_HorasMensajero SET Tmp_TotalHoras = Ln_TmpNumeroHoras
		WHERE  IdProgramacionSugerida = P_IdProgramacionSugerida AND Tmp_NroMensajero = 2;        
        
    END IF;

END //