CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Temp_ProgramacionSugeridaDetalle_Turno`(P_IdHorario INT, P_Contador INT, P_IdProgramacionSugerida INT)
BEGIN

	CASE P_IdHorario
		WHEN 0 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCero = 1, HoraUno = 1, HoraDos = 1, HoraTres = 1, HoraCuatro = 1, HoraCinco = 1, HoraSeis = 1,
					HoraSiete = 1, TotalHorasProgramadas = 8 
				WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;							
		WHEN 1 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraUno = 1, HoraDos = 1, HoraTres = 1, HoraCuatro = 1, HoraCinco = 1, HoraSeis = 1, HoraSiete = 1, 
					HoraOcho = 1, TotalHorasProgramadas = 8 
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 2 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDos = 1, HoraTres = 1, HoraCuatro = 1, HoraCinco = 1, HoraSeis = 1, HoraSiete = 1, HoraOcho = 1, 
					HoraNueve = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 3 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraTres = 1, HoraCuatro = 1, HoraCinco = 1, HoraSeis = 1, HoraSiete = 1, HoraOcho = 1, HoraNueve = 1, 
					HoraDiez = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 4 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCuatro = 1, HoraCinco = 1, HoraSeis = 1, HoraSiete = 1, HoraOcho = 1, HoraNueve = 1, HoraDiez = 1, 
					HoraOnce = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 5 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCinco = 1, HoraSeis = 1, HoraSiete = 1, HoraOcho = 1, HoraNueve = 1, HoraDiez = 1, HoraOnce = 1,
					HoraDoce = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;                                                   
		WHEN 6 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraSeis = 1,  HoraSiete = 1, HoraOcho = 1, HoraNueve = 1, HoraDiez = 1, HoraOnce = 1, HoraDoce = 1, 
					HoraTrece = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 7 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraSiete = 1, HoraOcho = 1, HoraNueve = 1, HoraDiez = 1, HoraOnce = 1, HoraDoce = 1, HoraTrece = 1,
                    HoraCatorce = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 8 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraOcho = 1, HoraNueve = 1, HoraDiez = 1, HoraOnce = 1, HoraDoce = 1, HoraTrece = 1, HoraCatorce = 1, 
					HoraQuince = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 9 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraNueve = 1, HoraDiez = 1, HoraOnce = 1, HoraDoce = 1, HoraTrece = 1, HoraCatorce = 1, HoraQuince = 1, 
					HoraDieciSeis = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 10 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDiez = 1, HoraOnce = 1, HoraDoce = 1, HoraTrece = 1, HoraCatorce = 1, HoraQuince = 1, HoraDieciSeis = 1, 
					HoraDieciSiete = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 11 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraOnce = 1, HoraDoce = 1, HoraTrece = 1, HoraCatorce = 1, HoraQuince = 1, HoraDieciSeis = 1, HoraDieciSiete = 1, 
					HoraDieciOcho = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 12 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDoce = 1, HoraTrece = 1, HoraCatorce = 1, HoraQuince = 1, HoraDieciSeis = 1, HoraDieciSiete = 1, HoraDieciOcho = 1, 
					HoraDieciNueve = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 13 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraTrece = 1,  HoraCatorce = 1, HoraQuince = 1, HoraDieciSeis = 1, HoraDieciSiete = 1, HoraDieciOcho = 1, 
					HoraDieciNueve = 1, HoraVeinte = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 14 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCatorce = 1, HoraQuince = 1, HoraDieciSeis = 1, HoraDieciSiete = 1, HoraDieciOcho = 1, HoraDieciNueve = 1,
                    HoraVeinte = 1, HoraVeintiUna = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 15 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraQuince = 1, HoraDieciSeis = 1, HoraDieciSiete = 1, HoraDieciOcho = 1, HoraDieciNueve = 1,
                    HoraVeinte = 1, HoraVeintiUna = 1, HoraVeintiDos = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 16 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciSeis = 1, HoraDieciSiete = 1, HoraDieciOcho = 1, HoraDieciNueve = 1, HoraVeinte = 1, 
					HoraVeintiUna = 1, HoraVeintiDos = 1, HoraVeintiTres = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 17 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciSiete = 1, HoraDieciOcho = 1, HoraDieciNueve = 1, HoraVeinte = 1, HoraVeintiUna = 1, 
					HoraVeintiDos = 1, HoraVeintiTres = 1, HoraCero = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 18 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciOcho = 1, HoraDieciNueve = 1, HoraVeinte = 1, HoraVeintiUna = 1, HoraVeintiDos = 1, 
					HoraVeintiTres = 1, HoraCero = 1, HoraUno = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 19 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciNueve = 1, HoraVeinte = 1, HoraVeintiUna = 1, HoraVeintiDos = 1, HoraVeintiTres = 1, 
					HoraCero = 1, HoraUno = 1, HoraDos = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 20 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeinte = 1, HoraVeintiUna = 1, HoraVeintiDos = 1, HoraVeintiTres = 1, HoraCero = 1, HoraUno = 1, 
					HoraDos = 1, HoraTres = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 21 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeintiUna = 1, HoraVeintiDos = 1, HoraVeintiTres = 1, HoraCero = 1, HoraUno = 1, HoraDos = 1, 
					HoraTres = 1, HoraCuatro = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 22 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeintiDos = 1, HoraVeintiTres = 1, HoraCero = 1, HoraUno = 1, HoraDos = 1, HoraTres = 1, 
					HoraCuatro = 1, HoraCinco = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
		WHEN 23 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeintiTres = 1, HoraCero = 1, HoraUno = 1, HoraDos = 1, HoraTres = 1, HoraCuatro = 1, HoraCinco = 1, 
					HoraSeis = 1, TotalHorasProgramadas = 8
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;                                                                    
	END CASE;				

END