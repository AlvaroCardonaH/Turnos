DELIMITER //
CREATE PROCEDURE HorariosInicioFinTurno (P_IdFlota INT, P_HoraCero INT, P_HoraUno INT, P_HoraDos INT, P_HoraTres INT, 
P_HoraCuatro INT, P_HoraCinco INT, P_HoraSeis INT, P_HoraSiete INT, P_HoraOcho INT, P_HoraNueve INT, 
P_HoraDiez INT, P_HoraOnce INT, P_HoraDoce INT, P_HoraTrece INT, P_HoraCatorce INT, P_HoraQuince INT, 
P_HoraDieciSeis INT, P_HoraDieciSiete INT, P_HoraDieciOcho INT, P_HoraDieciNueve INT, P_HoraVeinte INT, 
P_HoraVeintiUna INT, P_HoraVeintiDos INT, P_HoraVeintiTres INT, OUT P_HoraInicio CHAR(10), OUT P_HoraFinal CHAR(10)) 
BEGIN

	DECLARE Ln_IdHorario INT;
	DECLARE Ln_NumeroPosicion INT;
	DECLARE Lc_HoraInicio CHAR(10);
	DECLARE Ln_Mayor INT;
	DECLARE Ln_Menor INT;
	DECLARE Lc_HoraUltima CHAR(10);
	DECLARE Lc_HoraPrimera CHAR(10);
    
	-- Definición de la consulta
	DECLARE Cursor_HorarioFlota CURSOR FOR
		SELECT HF.NumeroPosicion, H.HoraInicio 
		FROM m_horarioxflota HF INNER JOIN m_horario H ON HF.IdHorario = H.IdHorario
		WHERE HF.IdFlota = P_IdFlota AND HF.IdHorario = Ln_IdHorario
		ORDER BY HF.NumeroPosicion;

	SET Ln_Mayor = -1;	
	SET Ln_Menor = 25;	
	SET Lc_HoraUltima = '';
	SET P_HoraInicio = '';
	SET P_HoraFinal = '';
	
	IF P_HoraCero = 1 THEN
		SET Ln_IdHorario = 0;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
	
	IF P_HoraUno = 1 THEN
		SET Ln_IdHorario = 1;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
	
	IF P_HoraDos = 1 THEN
		SET Ln_IdHorario = 2;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
	
	IF P_HoraTres = 1 THEN
		SET Ln_IdHorario = 3;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
    	
	IF P_HoraCuatro = 1 THEN
		SET Ln_IdHorario = 4;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraCinco = 1 THEN
		SET Ln_IdHorario = 5;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraSeis = 1 THEN
		SET Ln_IdHorario = 6;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraSiete = 1 THEN
		SET Ln_IdHorario = 7;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraOcho = 1 THEN
		SET Ln_IdHorario = 8;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraNueve = 1 THEN
		SET Ln_IdHorario = 9;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraDiez = 1 THEN
		SET Ln_IdHorario = 10;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraOnce = 1 THEN
		SET Ln_IdHorario = 11;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraDoce = 1 THEN
		SET Ln_IdHorario = 12;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraTrece = 1 THEN
		SET Ln_IdHorario = 13;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraCatorce = 1 THEN
		SET Ln_IdHorario = 14;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraQuince = 1 THEN
		SET Ln_IdHorario = 15;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraDieciSeis = 1 THEN
		SET Ln_IdHorario = 16;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraDieciSiete = 1 THEN
		SET Ln_IdHorario = 17;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraDieciOcho = 1 THEN
		SET Ln_IdHorario = 18;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraDieciNueve = 1 THEN
		SET Ln_IdHorario = 19;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraVeinte = 1 THEN
		SET Ln_IdHorario = 20;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraVeintiUna = 1 THEN
		SET Ln_IdHorario = 21;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraVeintiDos = 1 THEN
		SET Ln_IdHorario = 22;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;	
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
		
	IF P_HoraVeintiTres = 1 THEN
		SET Ln_IdHorario = 23;

		OPEN Cursor_HorarioFlota;
		FETCH Cursor_HorarioFlota INTO Ln_NumeroPosicion, Lc_HoraInicio;		
		
		IF Ln_NumeroPosicion > Ln_Mayor THEN
			SET Ln_Mayor = Ln_NumeroPosicion;
			SET Lc_HoraUltima = Lc_HoraInicio;
		END IF;	

		IF Ln_NumeroPosicion < Ln_Menor THEN
			SET Ln_Menor = Ln_NumeroPosicion;
			SET Lc_HoraPrimera = Lc_HoraInicio;
		END IF;	
		
		CLOSE Cursor_HorarioFlota;
	END IF;
	
	SET P_HoraInicio = Lc_HoraPrimera;
	SET P_HoraFinal = Lc_HoraUltima;
			
END //