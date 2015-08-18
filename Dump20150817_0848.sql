
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS v_resumen_clasificacion_dias;
/*!50001 DROP VIEW IF EXISTS v_resumen_clasificacion_dias*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_resumen_clasificacion_dias` AS SELECT 
 1 AS IdReportePedidosxPdv,
 1 AS IdClasificacionDia,
 1 AS HoraCero,
 1 AS HoraUno,
 1 AS HoraDos,
 1 AS HoraTres,
 1 AS HoraCuatro,
 1 AS HoraCinco,
 1 AS HoraSeis,
 1 AS HoraSiete,
 1 AS HoraOcho,
 1 AS HoraNueve,
 1 AS HoraDiez,
 1 AS HoraOnce,
 1 AS HoraDoce,
 1 AS HoraTrece,
 1 AS HoraCatorce,
 1 AS HoraQuince,
 1 AS HoraDieciSeis,
 1 AS HoraDieciSiete,
 1 AS HoraDieciOcho,
 1 AS HoraDieciNueve,
 1 AS HoraVeinte,
 1 AS HoraVeintiUna,
 1 AS HoraVeintiDos,
 1 AS HoraVeintiTres*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS v_resumen_pedidos_clientefiel;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_clientefiel*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_resumen_pedidos_clientefiel` AS SELECT 
 1 AS IdSede,
 1 AS NombreSede,
 1 AS IdReportePedidosxPdv,
 1 AS IdFlota,
 1 AS NombreFlota,
 1 AS IdClasificacionDia,
 1 AS NombreClasificacionDia,
 1 AS NumeroPosicion,
 1 AS IdHorario,
 1 AS HoraInicio,
 1 AS HoraFinal,
 1 AS NumeroServicios*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS v_resumen_pedidos_festivos;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_festivos*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_resumen_pedidos_festivos` AS SELECT 
 1 AS IdSede,
 1 AS NombreSede,
 1 AS IdReportePedidosxPdv,
 1 AS IdFlota,
 1 AS NombreFlota,
 1 AS IdClasificacionDia,
 1 AS NombreClasificacionDia,
 1 AS NumeroPosicion,
 1 AS IdHorario,
 1 AS HoraInicio,
 1 AS HoraFinal,
 1 AS NumeroDiaSemana,
 1 AS NombreDiaSemana,
 1 AS NumeroServicios*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS v_resumen_pedidos_normal;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_normal*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_resumen_pedidos_normal` AS SELECT 
 1 AS IdSede,
 1 AS NombreSede,
 1 AS IdReportePedidosxPdv,
 1 AS IdFlota,
 1 AS NombreFlota,
 1 AS IdClasificacionDia,
 1 AS NombreClasificacionDia,
 1 AS NumeroPosicion,
 1 AS IdHorario,
 1 AS HoraInicio,
 1 AS HoraFinal,
 1 AS NumeroDiaSemana,
 1 AS NombreDiaSemana,
 1 AS NumeroServicios*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS v_resumen_pedidos_normal_dia;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_normal_dia*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_resumen_pedidos_normal_dia` AS SELECT 
 1 AS NumeroPosicion,
 1 AS IdHorario,
 1 AS HoraInicio,
 1 AS HoraFinal,
 1 AS Lunes,
 1 AS Martes,
 1 AS Miercoles,
 1 AS Jueves,
 1 AS Viernes,
 1 AS Sabado*/;
SET character_set_client = @saved_cs_client;
/*!50003 DROP FUNCTION IF EXISTS CalcularNumeroDiasClienteFiel */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `CALCULARNUMERODIASCLIENTEFIEL`(FechaInicio VARCHAR(15), FechaFinal VARCHAR(15)) RETURNS int(11)
BEGIN

	DECLARE MiFechaInicio DATE;
    DECLARE MiFechaFinal DATE;
    DECLARE NumeroVeces INT;
    DECLARE MiDia INT;

    SET MiFechaInicio = STR_TO_DATE(FechaInicio, '%d/%m/%Y');
    SET MiFechaFinal = STR_TO_DATE(FechaFinal, '%d/%m/%Y');
    
    SET NumeroVeces = 0;
        
	WHILE MiFechaInicio <= MiFechaFinal  DO
		
        SET MiDia = day(MiFechaInicio);
            
        IF (MiDia = 10) OR (MiDia = 25) THEN
			SET NumeroVeces = NumeroVeces + 1;
		END IF;
            
		SET miFechaInicio = miFechaInicio + 1;
	END WHILE;

RETURN NumeroVeces ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS CalcularNumeroDiasFestivo */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `CALCULARNUMERODIASFESTIVO`(FechaInicio VARCHAR(15), FechaFinal VARCHAR(15)) RETURNS int(11)
BEGIN

	DECLARE MiFechaInicio DATE;
    DECLARE MiFechaFinal DATE;
    DECLARE NumeroVeces INT;
    DECLARE NumeroRegistros INT;
    DECLARE MiDiaSemana INT;

    SET MiFechaInicio = STR_TO_DATE(FechaInicio, '%d/%m/%Y');
    SET MiFechaFinal = STR_TO_DATE(FechaFinal, '%d/%m/%Y');
    
    SET NumeroVeces = 0;
    
	SELECT COUNT(*) INTO NumeroRegistros FROM m_FechaFestivos
			WHERE 	FechaFestivo >= MiFechaInicio AND 
					FechaFestivo <= MiFechaFinal ;
    
    SET NumeroVeces = NumeroRegistros;
    
	WHILE MiFechaInicio <= MiFechaFinal  DO
		
        SET MiDiaSemana = dayofweek(MiFechaInicio);
            
        IF (MiDiaSemana = 1) THEN
			SET NumeroVeces = NumeroVeces + 1;
		END IF;
            
		SET miFechaInicio = miFechaInicio + 1;
	END WHILE;

RETURN NumeroVeces ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS CalcularNumeroDiasPromedio */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `CALCULARNUMERODIASPROMEDIO`(FechaInicio VARCHAR(15), FechaFinal VARCHAR(15), NumeroDiaSemana INT) RETURNS int(11)
BEGIN

	DECLARE MiFechaInicio DATE;
    DECLARE MiFechaFinal DATE;
    DECLARE NumeroVeces INT;
    DECLARE MiDiaSemana INT;
    DECLARE MiDia INT;
    DECLARE NumeroRegistros INT;
    
    SET MiFechaInicio = STR_TO_DATE(FechaInicio, '%d/%m/%Y');
    SET MiFechaFinal = STR_TO_DATE(FechaFinal, '%d/%m/%Y');
    
    SET NumeroVeces = 0;
    
    IF (NumeroDiaSemana != 1) THEN
		
		WHILE MiFechaInicio <= MiFechaFinal  DO
		
			SET MiDia = day(MiFechaInicio);
            
            IF (MiDia != 10 AND MiDia != 25) THEN
            
				SELECT COUNT(*) INTO NumeroRegistros FROM m_FechaFestivos
					WHERE FechaFestivo = MiFechaInicio;
                    
                IF NumeroRegistros = 0 THEN    
					SELECT dayofweek(MiFechaInicio) INTO MiDiaSemana;
					
					IF MiDiaSemana = NumeroDiaSemana then
						SET NumeroVeces = NumeroVeces + 1;
					END IF;
                END IF;    
								
            END IF;
            
            SET miFechaInicio = miFechaInicio + 1;
		END WHILE;
	END IF;

RETURN NumeroVeces ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS EsDiaClienteFiel */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost FUNCTION EsDiaClienteFiel(P_IdFlota INT, P_FechaPos VARCHAR (20)) RETURNS int(11)
BEGIN

	DECLARE Ln_TotalRegistros INT;
	DECLARE Ln_DiaMes INT;
    
	-- Definición de la consulta
	DECLARE Cursor_DiasClienteFiel_Flota CURSOR FOR
		SELECT COUNT(*) FROM m_DiasClienteFiel WHERE IdFlota = P_IdFlota AND NumeroDiaMes = Ln_DiaMes; 

	SET Ln_DiaMes = DAYOFMONTH(STR_TO_DATE(P_FechaPos, '%d/%m/%Y'));
	
	OPEN Cursor_DiasClienteFiel_Flota;        
    FETCH Cursor_DiasClienteFiel_Flota INTO Ln_TotalRegistros;        
    CLOSE Cursor_DiasClienteFiel_Flota;
    	
    RETURN Ln_TotalRegistros;    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS HoraInicioTurno */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost FUNCTION HoraInicioTurno(P_IdReportePedidosxPdv INT, 
															P_IdClasificacionDia INT,
															P_IdProgramacionSugerida INT,
                                                            P_NumeroPosicion INT,
                                                            P_IdHorario INT) RETURNS int(11)
BEGIN

	DECLARE Ln_Total INT;
    DECLARE Ln_Total_Real INT;
    DECLARE Ln_HoraInicio INT;
    DECLARE Ln_IdHorario INT DEFAULT 0;
    DECLARE Ln_NumeroPosicion INT DEFAULT 0;
    
    

	DECLARE Cursor_Necesidades_Hora CURSOR FOR
		SELECT Promedio_Mensajeros_Hora_Normal
			FROM t_resumen_clasificacion_dias
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND 
					IdClasificacionDia = P_IdClasificacionDia AND
                    NumeroPosicion = P_NumeroPosicion;

    SET Ln_HoraInicio = -1;    
    SET Ln_IdHorario = 0;
    OPEN Cursor_Necesidades_Hora ;
    FETCH Cursor_Necesidades_Hora INTO Ln_Total;
    
    IF Ln_Total > 0 THEN
    
		CASE P_IdHorario
        
			WHEN 0 THEN 
				SELECT SUM(HoraCero) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 1 THEN 
				SELECT SUM(HoraUno) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
                    
            WHEN 2 THEN         
				SELECT SUM(HoraDos) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 3 THEN         
				SELECT SUM(HoraTres) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 4 THEN         
				SELECT SUM(HoraCuatro) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 5 THEN         
				SELECT SUM(HoraCinco) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 6 THEN         
				SELECT SUM(HoraSeis) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 7 THEN         
				SELECT SUM(HoraSiete) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 8 THEN         
				SELECT SUM(HoraOcho) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 9 THEN         
				SELECT SUM(HoraNueve) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 10 THEN         
				SELECT SUM(HoraDiez) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 11 THEN         
				SELECT SUM(HoraOnce) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 12 THEN         
				SELECT SUM(HoraDoce) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 13 THEN         
				SELECT SUM(HoraTrece) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 14 THEN         
				SELECT SUM(HoraCatorce) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 15 THEN         
				SELECT SUM(HoraQuince) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 16 THEN         
				SELECT SUM(HoraDieciSeis) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 17 THEN         
				SELECT SUM(HoraDieciSiete) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 18 THEN         
				SELECT SUM(HoraDieciOcho) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 19 THEN         
				SELECT SUM(HoraDieciNueve) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 20 THEN         
				SELECT SUM(HoraVeinte) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 21 THEN         
				SELECT SUM(HoraVeintiUna) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 22 THEN         
				SELECT SUM(HoraVeintiDos) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
            
            WHEN 23 THEN         
				SELECT SUM(HoraVeintiTres) INTO Ln_Total_Real 
					FROM Temp_ProgramacionSugeridaDetalle
					WHERE IdProgramacionSugerida = P_IdProgramacionSugerida;
		
        END CASE;
        
            
    END IF;

	IF Ln_Total_Real < Ln_Total THEN
		SET Ln_HoraInicio = P_IdHorario;
	END IF;
        
	RETURN Ln_HoraInicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS NumeroMensajeros */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost FUNCTION NumeroMensajeros(P_IdFlota INT) RETURNS int(11)
BEGIN

	DECLARE Ln_Total INT;
    
	-- Definición de la consulta
	DECLARE Cursor_Mensajeros CURSOR FOR
		SELECT COUNT(*) FROM m_mensajeros; 

	DECLARE Cursor_Mensajeros_Flota CURSOR FOR
		SELECT COUNT(*) AS NumeroTotal FROM m_mensajeros WHERE IdFlota = P_IdFlota ; 

	IF P_IdFlota = 0 THEN
		OPEN Cursor_Mensajeros;        
        FETCH Cursor_Mensajeros INTO Ln_Total;        
        CLOSE Cursor_Mensajeros;
    ELSE
		OPEN Cursor_Mensajeros_Flota;        
        FETCH Cursor_Mensajeros_Flota INTO Ln_Total;        
        CLOSE Cursor_Mensajeros_Flota;    
    END IF;
    	
    RETURN Ln_Total;    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS TipoDiaSemana */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost FUNCTION TipoDiaSemana(P_DiaSemana INT) RETURNS int(11)
BEGIN

	DECLARE Ln_IdClasificacionDia INT;
	DECLARE Ln_DiaSemana INT;
    
	-- Definición de la consulta
	DECLARE Cursor_DiasSemana CURSOR FOR
		SELECT IdClasificacionDia FROM m_DiasSemana WHERE NumeroDiaSemana = Ln_DiaSemana; 

	SET Ln_DiaSemana = P_DiaSemana;
	
	OPEN Cursor_DiasSemana ;       
    FETCH Cursor_DiasSemana INTO Ln_IdClasificacionDia;        
    CLOSE Cursor_DiasSemana;
    	
    RETURN Ln_IdClasificacionDia;    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS verificarFechaFestivo */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `VERIFICARFECHAFESTIVO`(laFecha DATE) RETURNS int(11)
BEGIN
	DECLARE existe INT;
    DECLARE NumeroRegistros INT;

	SELECT COUNT(*) INTO NumeroRegistros FROM m_FechaFestivos
		WHERE FechaFestivo = laFecha;
        
    IF NumeroRegistros > 0  then
		SET existe = 1;
    ELSE
		SET existe = 0;
    END IF;
    
RETURN existe;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Actualizar_Programacion_HorarioMensajero */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Actualizar_Programacion_HorarioMensajero(
						P_IdProgramacionSugeridaDetalle INT,
						P_IdHorario INT,
                        P_PorcentajeHoras DECIMAL(6,2)
                        )
BEGIN

	CASE P_IdHorario
		WHEN 0 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraCero = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;

		WHEN 1 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraUno = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
		WHEN 2 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDos = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;

		WHEN 3 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraTres = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
		WHEN 4 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraCuatro = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
		WHEN 5 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraCinco = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
		WHEN 6 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraSeis = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 7 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraSiete = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 8 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraOcho = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 9 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraNueve = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 10 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDiez = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 11 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraOnce = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 12 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDoce = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 13 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraTrece = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 14 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraCatorce = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 15 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraQuince = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 16 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDieciSeis = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 17 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDieciSiete = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 18 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDieciOcho = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 19 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraDieciNueve = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 20 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraVeinte = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 21 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraVeintiUna = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 22 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraVeintiDos = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;
                                
 		WHEN 23 THEN 
			UPDATE t_ProgramacionSugeridaDetalle 
				SET HoraVeintiTres = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1, PorcentajeHoras = P_PorcentajeHoras
                WHERE IdProgramacionSugeridaDetalle = P_IdProgramacionSugeridaDetalle;                
                                
 	END CASE;				


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Actualizar_Temp_ProgramacionSugeridaDetalle */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Actualizar_Temp_ProgramacionSugeridaDetalle(P_IdHorario INT, P_Contador INT, INOUT P_Total_Necesidades INT,  P_IdProgramacionSugerida INT)
BEGIN

	CASE P_IdHorario
		WHEN 0 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCero = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
				SET P_Total_Necesidades = P_Total_Necesidades + 1;
		WHEN 1 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraUno = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
				SET P_Total_Necesidades = P_Total_Necesidades + 1;
		WHEN 2 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDos = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
				SET P_Total_Necesidades = P_Total_Necesidades + 1;
		WHEN 3 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraTres = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
				SET P_Total_Necesidades = P_Total_Necesidades + 1;
		WHEN 4 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCuatro = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;
		WHEN 5 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCinco = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;    
		WHEN 6 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraSeis = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;    
		WHEN 7 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraSiete = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 8 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraOcho = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 9 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraNueve = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 10 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDiez = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 11 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraOnce = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 12 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDoce = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 13 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraTrece = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 14 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraCatorce = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 15 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraQuince = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 16 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciSeis = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 17 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciSiete = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 18 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciOcho = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 19 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraDieciNueve = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 20 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeinte = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 21 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeintiUna = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 22 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeintiDos = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
		WHEN 23 THEN 
			UPDATE Temp_ProgramacionSugeridaDetalle 
				SET HoraVeintiTres = 1, TotalHorasProgramadas = TotalHorasProgramadas + 1
                WHERE NumeroMensajero = P_Contador AND IdProgramacionSugerida = P_IdProgramacionSugerida;                
                                
                SET P_Total_Necesidades = P_Total_Necesidades + 1;                                    
	END CASE;				



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS AsignarPersonasProgramacion */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE AsignarPersonasProgramacion(P_IdProgramacionSugerida INT)
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
	
		SELECT COUNT(*) INTO Ln_NumeroMensajeroDisponibles
		FROM m_Mensajeros M 
		WHERE M.IdFlota = Ln_IdFlota AND M.CodigoEstadoRegistro = 1;	

		IF Ln_NumeroMensajeroDisponibles >= Ln_NumeroMensajerosNecesitan THEN
	
			CASE Ln_IdClasificacionDia		
			  WHEN 1 THEN CALL AsignarPersonasProgramacionNormal (P_IdProgramacionSugerida);
			  WHEN 2 THEN CALL AsignarPersonasProgramacionFestivoDominical (P_IdProgramacionSugerida, Ln_NumeroMensajeroDisponibles, 
																			Ln_NumeroMensajerosNecesitan);
			  WHEN 3 THEN CALL AsignarPersonasProgramacionClienteFiel (P_IdProgramacionSugerida);
			  ELSE SELECT 0;
			END CASE;	
		
		END IF;
	END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS AsignarPersonasProgramacionClienteFiel */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE AsignarPersonasProgramacionClienteFiel(P_IdProgramacionSugerida INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS AsignarPersonasProgramacionFestivoDominical */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE AsignarPersonasProgramacionFestivoDominical(P_IdProgramacionSugerida INT,
																P_NumeroMensajerosDisponibles INT, 
																P_NumeroMensajerosNecesitan INT)
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
	DECLARE Ln_Aumento DECIMAL(6,2);
	
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
	
	DECLARE Ln_JornadaFestivoDominical INT;
	
	DECLARE Ln_PorcentajeHoras DECIMAL (6,2);
	
	DECLARE Ln_NumeroFestivosDominicales DECIMAL (6,2);
	
	DECLARE Ln_TotalMensajerosDisponibles INT;
	
	DECLARE Ln_NumeroMensajerosDescansan INT;
	
	DECLARE Ln_Mensajero INT;
	
	DECLARE Cursor_ProgramacionSugerida CURSOR FOR
		SELECT PS.IdClasificacionDia, PS.IdReportePedidosxPdv, PS.FechaInicio, PS.FechaFinal, PS.NumeroMensajerosProgramacion, RP.IdFlota
		FROM t_programacionsugerida PS INNER JOIN h_reportepedidosxpdv RP ON PS.IdReportePedidosxPdv = RP.IdReportePedidosxPdv
		WHERE PS.IdProgramacionSugerida = P_IdProgramacionSugerida;	
	
    DECLARE Cursor_Temporal CURSOR FOR 		
		SELECT PSD.NumeroMensajero, PSD.HoraCero, PSD.HoraUno, PSD.HoraDos, PSD.HoraTres, PSD.HoraCuatro, PSD.HoraCinco, PSD.HoraSeis, PSD.HoraSiete, 
			PSD.HoraOcho, PSD.HoraNueve, PSD.HoraDiez, PSD.HoraOnce, PSD.HoraDoce, PSD.HoraTrece, PSD.HoraCatorce, PSD.HoraQuince, PSD.HoraDieciSeis, 
			PSD.HoraDieciSiete, PSD.HoraDieciOcho, PSD.HoraDieciNueve, PSD.HoraVeinte, PSD.HoraVeintiUna, PSD.HoraVeintiDos, PSD.HoraVeintiTres,
			PSD.PorcentajeHoras
		FROM (t_programacionsugeridadetalle PSD INNER JOIN t_programacionsugerida PS
		ON (PSD.IdProgramacionSugerida = PS.IdProgramacionSugerida)
		INNER JOIN h_reportepedidosxpdv RP ON PS.IdReportePedidosxPdv = RP.IdReportePedidosxPdv)
		WHERE PS.IdProgramacionSugerida = P_IdProgramacionSugerida ;
		-- ORDER BY PSD.NumeroMensajero DESC;	
	
	DECLARE Cursor_Mensajeros CURSOR FOR			
		SELECT M.Documento, 
        CONCAT(IFNULL(M.PrimerNombre,' '), ' ', IFNULL(M.SegundoNombre,' '), ' ', IFNULL(M.PrimerApellido,' '), ' ', IFNULL(M.SegundoApellido,' ')) AS NombreCompleto,
		M.JornadaFestivoDominical,
		M.NumeroFestivosDominicales
		FROM m_mensajeros M 
		WHERE M.IdFlota = P_IdFlota AND M.CodigoEstadoRegistro = 1
		ORDER BY Ln_NumeroFestivosDominicales DESC;	

	DECLARE Cursor_Temporal_Mensajeros CURSOR FOR
		SELECT Documento, NombreCompleto
		FROM Temp_Mensajeros
		WHERE DescansoFestivoDominical = 0 AND Seleccionado = 0
        ORDER BY NumeroFestivosDominicales ASC;

	DECLARE Cursor_Descanso_Mensajeros CURSOR FOR
		SELECT Documento, NombreCompleto
		FROM Temp_Mensajeros
        ORDER BY NumeroFestivosDominicales DESC
		LIMIT Ln_NumeroMensajerosDescansan;
		
	DECLARE Cursor_Semanas CURSOR FOR 
		SELECT FechaInicial , FechaFinal
		FROM Temp_ProgramacionSemanas	
		ORDER BY NumeroSemana;
		
	DECLARE Cursor_ProgramacionTurnos CURSOR FOR
		SELECT NumeroTurno, HoraInicio, HoraFinal, Documento, NombreCompleto, DiferenciaHoras, HoraFinalAnterior, PorcentajeHoras
		FROM Temp_ProgramacionTurnosFestivos
		WHERE FechaInicio = Ld_FechaInicial AND FechaFinal = Ld_FechaFinal
		ORDER BY FechaInicio, NumeroTurno; 
			
	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;	

	CREATE TEMPORARY TABLE Temp_ProgramacionSemanas (NumeroSemana INT, FechaInicial DATE, FechaFinal DATE);
    
    CREATE TEMPORARY TABLE Temp_ProgramacionTurnosFestivos (NumeroTurno INT, FechaInicio DATE, FechaFinal DATE, HoraInicio CHAR(10), HoraFinal CHAR(10),
															Documento INT, NombreCompleto VARCHAR(80), DiferenciaHoras INT, HoraFinalAnterior CHAR(10),
															PorcentajeHoras INT);
	
	CREATE TEMPORARY TABLE Temp_Mensajeros (NumeroMensajero INT, Documento INT, NombreCompleto VARCHAR(80), NumeroFestivosDominicales DECIMAL(6,2),
	Seleccionado INT, PorcentajeHoras INT, DescansoFestivoDominical INT);
		
	-- Numero de Mensajeros que descansan	
	SET Ln_NumeroMensajerosDescansan	= 	P_NumeroMensajerosDisponibles - P_NumeroMensajerosNecesitan;
	
	SELECT P_NumeroMensajerosDisponibles , P_NumeroMensajerosNecesitan, Ln_NumeroMensajerosDescansan ;
		
	-- Consultar datos generales de la programacion sugerida
	OPEN Cursor_ProgramacionSugerida;        
    FETCH Cursor_ProgramacionSugerida INTO P_IdClasificacionDia, P_IdReportePedidosxPdv, P_FechaInicio, P_FechaFinal, P_TotalMensajeros, P_IdFlota;        
    CLOSE Cursor_ProgramacionSugerida;
	
	SET Ln_No_Mas_Datos = 0;
	SET Ln_NumeroMensajero = 1;
	
	SET Ln_DiferenciaDias = P_FechaFinal - P_FechaInicio;
	
	OPEN Cursor_Mensajeros;
	FETCH Cursor_Mensajeros INTO Ln_Documento, Lc_NombreCompleto, Ln_JornadaFestivoDominical, Ln_NumeroFestivosDominicales;
	
	Resumen_Loop: WHILE ((Ln_No_Mas_Datos = 0)) DO
		INSERT INTO Temp_Mensajeros (NumeroMensajero, Documento, NombreCompleto, NumeroFestivosDominicales, Seleccionado, PorcentajeHoras, DescansoFestivoDominical) 
		VALUES 
		(Ln_NumeroMensajero, Ln_Documento, Lc_NombreCompleto, Ln_NumeroFestivosDominicales, 0, 0, 0);
		
		FETCH Cursor_Mensajeros INTO Ln_Documento, Lc_NombreCompleto, Ln_JornadaFestivoDominical, Ln_NumeroFestivosDominicales;
		SET Ln_NumeroMensajero = Ln_NumeroMensajero + 1;
	END WHILE Resumen_Loop;
	
	CLOSE Cursor_Mensajeros;
	
	SET Ln_No_Mas_Datos = 0;			
    
    SET Lc_Salida = "";
			
	SET Ln_NumeroSemana = 0;

	SET Ld_FechaAux = P_FechaInicio;	
	
    Rango_Fecha: WHILE ((Ld_FechaAux <= P_FechaFinal) AND (Ld_FechaAux <> '0000-00-00')) DO
	
		SET Ln_NumeroSemana = Ln_NumeroSemana + 1;
		SET Ln_NumeroDias = 1; 
		
		SET Ld_FechaPrimerDia = Ld_FechaAux;
		SET Ld_FechaUltimoDia = Ld_FechaAux;

		-- SET Ln_EsDiaClienteFiel = EsDiaClienteFiel (P_IdFlota, DATE_FORMAT(Ld_FechaAux, '%d/%m/%Y'));
		SET Ln_EsFestivo = verificarFechaFestivo (Ld_FechaAux);
		SET Ln_DiaSemana =  DAYOFWEEK(Ld_FechaAux);
		SET Ln_IdClasificacionDiaAux = TipoDiaSemana (Ln_DiaSemana);
		SET Ln_EsDiaClienteFiel = EsDiaClienteFiel (P_IdFlota, DATE_FORMAT(Ld_FechaAux, '%d/%m/%Y'));
			
		-- Si el día tambien es cliente fiel , se da la prioridad a Cliente Fiel	
		IF 	Ln_EsDiaClienteFiel = 0 THEN
			IF (Ln_EsFestivo = 1) OR (Ln_IdClasificacionDiaAux = P_IdClasificacionDia) THEN
				INSERT INTO Temp_ProgramacionSemanas (NumeroSemana , FechaInicial , FechaFinal) VALUES (Ln_NumeroSemana, Ld_FechaPrimerDia, Ld_FechaUltimoDia);
			END IF;
		END IF;
		
		SET Ld_FechaAux = Ld_FechaAux + 1;	
				
	END WHILE Rango_Fecha;	
	
    SET Ln_No_Mas_Datos = 0;
    SET Ln_NumeroTurno = 0;
	
	OPEN Cursor_Semanas;		
	FETCH Cursor_Semanas INTO Ld_FechaInicial , Ld_FechaFinal;
		
	-- Ciclo Semanas	
	Resumen_Semanas:  WHILE ((Ln_No_Mas_Datos = 0)) DO

		-- Saber que mensajeros descansan
		OPEN Cursor_Descanso_Mensajeros;
		FETCH Cursor_Descanso_Mensajeros INTO Ln_Documento, Lc_NombreCompleto;
				
		Resumen_Descanso_Mensajeros: WHILE ((Ln_No_Mas_Datos = 0)) DO
				
			UPDATE Temp_Mensajeros SET DescansoFestivoDominical = 1, Seleccionado = 0, NumeroFestivosDominicales = 0 WHERE Documento = Ln_Documento;
				
			FETCH Cursor_Descanso_Mensajeros INTO Ln_Documento, Lc_NombreCompleto;
		END WHILE Resumen_Descanso_Mensajeros;
				
		CLOSE Cursor_Descanso_Mensajeros;
		SET Ln_No_Mas_Datos = 0;
	
		SET Ln_NumeroTurno = 0;
		
		OPEN Cursor_Temporal; 		
		FETCH Cursor_Temporal INTO Ln_NumeroMensajero, Ln_HoraCero, Ln_HoraUno, Ln_HoraDos, Ln_HoraTres, Ln_HoraCuatro, Ln_HoraCinco, Ln_HoraSeis, Ln_HoraSiete, 
				Ln_HoraOcho, Ln_HoraNueve, Ln_HoraDiez, Ln_HoraOnce, Ln_HoraDoce, Ln_HoraTrece, Ln_HoraCatorce, Ln_HoraQuince, Ln_HoraDieciSeis, 
				Ln_HoraDieciSiete, Ln_HoraDieciOcho, Ln_HoraDieciNueve, Ln_HoraVeinte, Ln_HoraVeintiUna, Ln_HoraVeintiDos, Ln_HoraVeintiTres, Ln_PorcentajeHoras;		
		
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
			
				UPDATE Temp_Mensajeros SET NumeroMensajero = 0 WHERE DescansoFestivoDominical = 0 AND Seleccionado = 0;
			
				SELECT COUNT(*) INTO Ln_TotalMensajerosDisponibles FROM Temp_Mensajeros 
				WHERE DescansoFestivoDominical = 0 AND Seleccionado = 0;
				
				OPEN Cursor_temporal_Mensajeros;
				SET Ln_Mensajero = 1;
				FETCH Cursor_temporal_Mensajeros INTO Ln_Documento, Lc_NombreCompleto;
				
				Resumen_Temporal_Mensajeros: WHILE ((Ln_No_Mas_Datos = 0)) DO
				
					SET Ln_Mensajero = Ln_Mensajero + 1;
					UPDATE Temp_Mensajeros SET NumeroMensajero = Ln_Mensajero WHERE Documento = Ln_Documento;
				
					FETCH Cursor_temporal_Mensajeros INTO Ln_Documento, Lc_NombreCompleto;
				END WHILE Resumen_Temporal_Mensajeros;
				
				CLOSE Cursor_temporal_Mensajeros;
				SET Ln_No_Mas_Datos = 0;
				
				SELECT FLOOR(1 + (RAND() * Ln_TotalMensajerosDisponibles)) INTO Ln_PosicionTurno;
								
				SELECT Documento, NombreCompleto INTO Ln_Documento, Lc_NombreCompleto
				FROM Temp_Mensajeros WHERE NumeroMensajero = Ln_PosicionTurno AND DescansoFestivoDominical = 0 AND Seleccionado = 0;
				
				-- HoraInicio = Lc_HoraInicioTurno AND HoraFinal = Lc_HoraFinalTurno AND
				SELECT IFNULL(COUNT(*),0) INTO Ln_NumeroRegistros FROM Temp_ProgramacionTurnosFestivos 
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
						INSERT INTO Temp_ProgramacionTurnosFestivos (NumeroTurno, FechaInicio, FechaFinal, HoraInicio, HoraFinal, Documento, NombreCompleto, 
						DiferenciaHoras, HoraFinalAnterior, PorcentajeHoras) 
						VALUES 
						(Ln_NumeroTurno, Ld_FechaInicial, Ld_FechaFinal, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto, 
						Ln_DiferenciaHoras, Lc_HoraFinalAnterior, Ln_PorcentajeHoras);        
						
						IF Ln_PorcentajeHoras = 100 THEN
							SET Ln_Aumento = 1;
						ELSE
							SET Ln_Aumento = 0.5;
						END IF;
						
						UPDATE Temp_Mensajeros SET PorcentajeHoras = Ln_PorcentajeHoras, Seleccionado = 1, 
								NumeroFestivosDominicales = NumeroFestivosDominicales + Ln_Aumento
								WHERE Documento = Ln_Documento;						
						SET Ln_Sale = 1;
					END IF;
				END IF;
				
				SET Ln_No_Mas_Datos = 0;
				
			END WHILE Ciclo_Mensajero_Disponible;
			
			FETCH Cursor_Temporal INTO Ln_NumeroMensajero, Ln_HoraCero, Ln_HoraUno, Ln_HoraDos, Ln_HoraTres, Ln_HoraCuatro, Ln_HoraCinco, Ln_HoraSeis, Ln_HoraSiete, 
					Ln_HoraOcho, Ln_HoraNueve, Ln_HoraDiez, Ln_HoraOnce, Ln_HoraDoce, Ln_HoraTrece, Ln_HoraCatorce, Ln_HoraQuince, Ln_HoraDieciSeis, 
					Ln_HoraDieciSiete, Ln_HoraDieciOcho, Ln_HoraDieciNueve, Ln_HoraVeinte, Ln_HoraVeintiUna, Ln_HoraVeintiDos, Ln_HoraVeintiTres, Ln_PorcentajeHoras;
			
		END WHILE Resumen_Temporal;
		
		CLOSE Cursor_Temporal;
		SET Ln_No_Mas_Datos = 0;
		
		-- Inicializar Valores del Temporal de Mensajeros
		UPDATE Temp_Mensajeros SET DescansoFestivoDominical = 0, PorcentajeHoras = 0, Seleccionado = 0;
		
		SELECT Ld_FechaInicial;
		
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
		FETCH Cursor_ProgramacionTurnos INTO Ln_NumeroTurno, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto, Ln_DiferenciaHoras, Lc_HoraFinalAnterior, Ln_PorcentajeHoras;

		Resumen_Programacion:  WHILE ((Ln_No_Mas_Datos = 0)) DO

			INSERT INTO t_ProgramacionTurnoMensajeros (IdProgramacionTurnoFecha, NumeroTurno, HoraInicio, HoraFinal, Documento, NombreCompleto,
			DiferenciaHoras, HoraFinalAnterior, PorcentajeHoras) VALUES (Ln_UltimoIdProgramacionFecha, Ln_NumeroTurno, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento,
			Lc_NombreCompleto, Ln_DiferenciaHoras, Lc_HoraFinalAnterior, Ln_PorcentajeHoras);
		
			FETCH Cursor_ProgramacionTurnos INTO Ln_NumeroTurno, Lc_HoraInicioTurno, Lc_HoraFinalTurno, Ln_Documento, Lc_NombreCompleto, Ln_DiferenciaHoras, Lc_HoraFinalAnterior, Ln_PorcentajeHoras;
		END WHILE Resumen_Programacion;
		
		CLOSE Cursor_ProgramacionTurnos;
		
		SET Ln_No_Mas_Datos = 0;
		
		FETCH Cursor_Semanas INTO Ld_FechaInicial , Ld_FechaFinal;
	END WHILE Resumen_Semanas;
	
	UPDATE t_ProgramacionSugerida SET Seleccionada = 1 WHERE IdProgramacionSugerida =  P_IdProgramacionSugerida;
	
	UPDATE t_ProgramacionSugerida SET CodigoEstadoRegistro = 0 
		WHERE IdClasificacionDia = P_IdClasificacionDia AND IdReportePedidosxPdv = P_IdReportePedidosxPdv;
		
	UPDATE m_Mensajeros SET NumeroFestivosDominicales = (SELECT Tmp.NumeroFestivosDominicales FROM Temp_Mensajeros Tmp
															WHERE Tmp.Documento = m_Mensajeros.Documento );			
	
	CLOSE Cursor_Semanas;
	
	DROP TEMPORARY TABLE Temp_ProgramacionSemanas ;
	DROP TEMPORARY TABLE Temp_ProgramacionTurnosFestivos ;     
	DROP TEMPORARY TABLE Temp_Mensajeros ;     
	
    -- SELECT Lc_Salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS AsignarPersonasProgramacionNormal */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE AsignarPersonasProgramacionNormal(P_IdProgramacionSugerida INT)
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
		FROM Temp_ProgramacionTurnosNormal
		WHERE FechaInicio = Ld_FechaInicial AND FechaFinal = Ld_FechaFinal
		ORDER BY FechaInicio, NumeroTurno; 
			
	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;	

	CREATE TEMPORARY TABLE Temp_ProgramacionSemanas (NumeroSemana INT, FechaInicial DATE, FechaFinal DATE);
    
    CREATE TEMPORARY TABLE Temp_ProgramacionTurnosNormal (NumeroTurno INT, FechaInicio DATE, FechaFinal DATE, HoraInicio CHAR(10), HoraFinal CHAR(10),
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
		
		Rango_Semana: WHILE ((Ln_NumeroDias <= 7) AND (Ld_FechaAux <= P_FechaFinal) AND (Ld_FechaAux <> '0000-00-00')) DO
		
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
					END IF;  
				END IF;	
			END IF;
												
			SET Ln_DiferenciaDias = Ln_DiferenciaDias - 1;

			IF Ln_DiferenciaDias < 4 THEN
				SET Ld_FechaUltimoDia = P_FechaFinal;
				SET Ld_FechaAux = P_FechaFinal;
			END IF;

			SET Ln_NumeroDias = Ln_NumeroDias + 1;									
			SET Ld_FechaAux = Ld_FechaAux + 1;	
						
		END WHILE Rango_Semana;
		
		INSERT INTO Temp_ProgramacionSemanas (NumeroSemana , FechaInicial , FechaFinal) VALUES (Ln_NumeroSemana, Ld_FechaPrimerDia, Ld_FechaUltimoDia);
		
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
												
				SET Ln_DiferenciaHoras = null;
								
				IF (Ln_NumeroRegistros = 0) THEN
				
					SELECT SUBSTR(HoraFinal,1,2) INTO Lc_HoraFinalAnterior  
						FROM Temp_ProgramacionTurnosNormal 
						WHERE Documento = Ln_Documento 
						ORDER BY FechaFinal DESC
						LIMIT 1;
						
					IF 	Lc_HoraFinalAnterior IS NOT NULL THEN
						
						SET Lc_HoraInicioActual = SUBSTR(Lc_HoraInicioTurno,1,2);
						
						IF Lc_HoraFinalAnterior = '00' THEN
							SET Lc_HoraFinalAnterior = 24;
						END IF;
						
						SET Ln_DiferenciaHoras = (24 - Lc_HoraFinalAnterior) + Lc_HoraInicioActual;
					END IF;
				
					IF (Ln_DiferenciaHoras >=8) OR (Ln_DiferenciaHoras IS NULL) THEN
						INSERT INTO Temp_ProgramacionTurnosNormal (NumeroTurno, FechaInicio, FechaFinal, HoraInicio, HoraFinal, Documento, NombreCompleto, 
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
	DROP TEMPORARY TABLE Temp_ProgramacionTurnosNormal ;     
	DROP TEMPORARY TABLE Temp_Mensajeros ;     
	
    -- SELECT Lc_Salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Crear_ProgramacionSugerida */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Crear_ProgramacionSugerida(
			P_IdReportePedidosxPdv INT,
            P_NumeroMensajeros INT,
            P_FechaInicio DATE, 
            P_FechaFinal DATE, 
            P_IdUsuarioGraba INT)
BEGIN

	DECLARE Ln_IdClasificacionDia INT;
	DECLARE Ln_IdFlota INT;
	
	DECLARE Cursor_Reporte CURSOR FOR
		SELECT RP.IdFlota
		FROM h_reportepedidosxpdv RP 
		WHERE RP.IdReportePedidosxPdv = P_IdReportePedidosxPdv;	
	
	-- Consultar datos generales de la programacion sugerida
	OPEN Cursor_Reporte;        
    FETCH Cursor_Reporte INTO Ln_IdFlota;        
    CLOSE Cursor_Reporte;	

	SET Ln_IdClasificacionDia = 1;	
	CALL Crear_ProgramacionSugerida_Inicial (P_IdReportePedidosxPdv,
											Ln_IdClasificacionDia ,
											P_NumeroMensajeros ,
											Ln_IdFlota ,
											P_FechaInicio , 
											P_FechaFinal, 
											P_IdUsuarioGraba );
	
	SET Ln_IdClasificacionDia = 2;	
	CALL Crear_ProgramacionSugerida_FestivosDominical (P_IdReportePedidosxPdv,
													Ln_IdClasificacionDia ,
													P_NumeroMensajeros ,
													Ln_IdFlota ,
													P_FechaInicio , 
													P_FechaFinal, 
													P_IdUsuarioGraba );

	SET Ln_IdClasificacionDia = 3;	
	CALL Crear_ProgramacionSugerida_Inicial (P_IdReportePedidosxPdv,
											Ln_IdClasificacionDia ,
											P_NumeroMensajeros ,
											Ln_IdFlota ,
											P_FechaInicio , 
											P_FechaFinal, 
											P_IdUsuarioGraba );
													
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Crear_ProgramacionSugerida_FestivosDominical */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Crear_ProgramacionSugerida_FestivosDominical(
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
	
	DECLARE Ln_Valor DECIMAL(6,2);
	DECLARE Ln_PorcentajeHoras DECIMAL(6,2);
	
	DECLARE Ln_MaximoHoras INT;
	
	DECLARE Ln_PrimerMensajero INT;
	DECLARE Ln_UltimoMensajero INT;
    
    DECLARE Cursor_Temporal CURSOR FOR 
		SELECT IdProgramacionSugerida, NroMensajero, IdHorario, PorcentajeHoras
			FROM  Temp_ProgramacionSugerida 
			ORDER BY IdProgramacionSugerida, NroMensajero;

	-- Definición de la consulta
	DECLARE Cursor_Necesidades_Mensajeros CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, 			
			(CASE P_IdClasificacionDia 
				WHEN 1 THEN CEILING(Promedio_Mensajeros_Hora_Normal * 1.00)
				WHEN 2 THEN CEILING(Promedio_Mensajeros_Hora_Festivo * 1.00)
				WHEN 3 THEN CEILING(Promedio_Mensajeros_Hora_ClienteFiel * 1.00)
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
                
	SET Ln_IdProgramacionSugerida = 0;
    
	SET Ln_NumeroHorasMinima = 8;
    
	SET Ln_DescripcionProgramacion = 7;
	
	NumeroHorasMinima_Loop : WHILE (Ln_NumeroHorasMinima <= 12) DO
		        		
		SET Ln_IdProgramacionSugerida = Ln_IdProgramacionSugerida + 1;
		
		-- Limpiar Totales Horas Asignadas x Mensajero
		SET Ln_Mensajero = 1;    
		Resumen_Loop: WHILE (Ln_Mensajero <= P_NumeroMensajeros) DO 
		
			SET Ln_Valor = (Ln_Mensajero / P_NumeroMensajeros) * 100;
			
			SET Ln_PorcentajeHoras = 0;
			
			IF Ln_Valor <= 50 THEN
				SET Ln_PorcentajeHoras = 100;
			ELSE
				IF Ln_Valor <= 75 THEN
					SET Ln_PorcentajeHoras = 50;
				END IF;
			END IF;	
			
			INSERT INTO Temp_HorasMensajero VALUES (Ln_IdProgramacionSugerida, Ln_Mensajero,0, Ln_PorcentajeHoras);
			
			SET Ln_Mensajero = Ln_Mensajero + 1;
		END WHILE Resumen_Loop;
		
		CALL Crear_TurnoFijo_ProgramacionSugerida (P_IdFlota, Ln_NumeroHorasMinima, Ln_IdProgramacionSugerida);
		
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

					IF Ln_TotalHorasMensajero = 0 THEN
					
						SET Ln_NumeroPosicionAux = Ln_NumeroPosicion;
						SET Ln_NroVeces = 1;
						
						SET Ln_MaximoHoras = CEILING(Ln_NumeroHorasMinima * (Ln_PorcentajeHoras / 100));
						
						Resumen_Horario: WHILE (Ln_NroVeces <= Ln_MaximoHoras) AND (Ln_NumeroPosicionAux <= Ln_UltimaPosicion) DO
						
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
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Crear_ProgramacionSugerida_Inicial */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Crear_ProgramacionSugerida_Inicial(
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
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Crear_TurnoFijo_ProgramacionSugerida */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Crear_TurnoFijo_ProgramacionSugerida(IN P_IdFlota INT,
							P_NumeroHorasTurno INT,
                            P_IdProgramacionSugerida INT)
BEGIN

	DECLARE Ln_TmpPrimeraPosicion INT;
    DECLARE Ln_TmpUltimaPosicion INT;
    DECLARE Ln_TmpNumeroRegistros100 INT;
    DECLARE Ln_TmpNumeroRegistros50 INT;
    DECLARE Ln_TmpNumeroHoras INT;
    DECLARE Ln_TmpPosicion INT;
    DECLARE Ln_TmpIdHorario INT;
    DECLARE Lc_TmpHoraInicio VARCHAR(10);
    DECLARE Lc_TmpHoraFinal VARCHAR(10);
    
    SET Ln_TmpNumeroRegistros50  = 0;
    SET Ln_TmpNumeroRegistros100 = 0; 
    
    SELECT IFNULL(COUNT(*),0) INTO Ln_TmpNumeroRegistros100 
    FROM Temp_HorasMensajero
	WHERE Tmp_PorcentajeHoras = 100;
    
    SELECT IFNULL(COUNT(*),0) INTO Ln_TmpNumeroRegistros50 
    FROM Temp_HorasMensajero
	WHERE Tmp_PorcentajeHoras = 50;
        
	SELECT MIN(NumeroPosicion), MAX(NumeroPosicion) INTO Ln_TmpPrimeraPosicion, Ln_TmpUltimaPosicion 
		FROM m_horarioxflota
		WHERE IdFlota = P_IdFlota;
        
    IF Ln_TmpNumeroRegistros100 > 1 THEN
    
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Crear_TurnoFijo_ProgramacionSugerida_NormalClienteFiel */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Crear_TurnoFijo_ProgramacionSugerida_NormalClienteFiel(IN P_IdFlota INT,
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Generar_Programacion_Sugerida_Normal */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Generar_Programacion_Sugerida_Normal(P_IdReportePedidosxPdv INT, P_IdClasificacionDia INT, 
						P_NumeroMensajeros INT, P_FechaInicio DATE, P_FechaFinal DATE, P_IdUsuarioGraba INT,
                        P_IdFlota INT)
BEGIN

	-- Declaración de variables
	DECLARE Ln_NumeroPosicion INT;
	DECLARE Ln_IdHorario INT; 
	DECLARE Lc_HoraInicio VARCHAR(5) ;
	DECLARE Lc_HoraFinal VARCHAR(5); 
	DECLARE Ln_No_Mas_Datos INT;
    DECLARE Ln_Promedio_Mensajeros_Hora_Normal INT;
    DECLARE Lc_NombreTabla VARCHAR(80);
    DECLARE Ln_Ultimo_ID INT;
    DECLARE Ln_Contador INT;
    DECLARE Ln_IdProgramacionSugerida INT;
    DECLARE MinimoHoras INT DEFAULT 8;
    
    DECLARE Ln_Hora INT;
    DECLARE Ln_HoraInicioTurno INT;
    DECLARE Ln_PrimeraHora INT;
    DECLARE Ln_UltimaHora INT;
    
    DECLARE Ln_TotalHorasProgramadasMensajero INT;
    DECLARE Ln_Total_Necesidades INT;
    
	-- Definición de la consulta
	DECLARE Cursor_Necesidades_Mensajeros CURSOR FOR
		SELECT IdHorario, HoraInicio, HoraFinal, NumeroPosicion, Promedio_Mensajeros_Hora_Normal
			FROM t_resumen_clasificacion_dias
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND IdClasificacionDia = P_IdClasificacionDia 
			ORDER BY NumeroPosicion; 
            
    DECLARE Cursor_Informacion_AutoIncremento CURSOR FOR 
		SELECT Auto_Increment 
        FROM INFORMATION_SCHEMA.TABLES 
        WHERE Table_name = Lc_NombreTabla;        

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;
    
    -- Eliminar Resumen del Reporte y del Tipo de Dia
	    
    CREATE TEMPORARY TABLE Temp_ProgramacionSugeridaDetalle 
		SELECT * FROM t_ProgramacionSugeridaDetalle WHERE 1 = 0;
    
    SET Ln_Contador = 1;
    SET Ln_IdProgramacionSugerida = 1;
    
	Resumen_Loop: WHILE (Ln_Contador <= P_NumeroMensajeros) DO
		INSERT INTO Temp_ProgramacionSugeridaDetalle (IdProgramacionSugerida, NumeroMensajero) 
        VALUES (Ln_IdProgramacionSugerida, Ln_Contador);
        
        SET Ln_Contador = Ln_Contador + 1;
    END WHILE Resumen_Loop;
    
	-- Abrimos el cursor
	OPEN Cursor_Necesidades_Mensajeros;

	-- Obtenemos las necesidades de mensajeros por hora
	FETCH Cursor_Necesidades_Mensajeros 
		INTO Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroPosicion, Ln_Promedio_Mensajeros_Hora_Normal ;		

	SET Ln_PrimeraHora = Ln_NumeroPosicion;
    
	Resumen_Loop: WHILE ((Ln_No_Mas_Datos = 0)) DO
        
        SET Ln_UltimaHora = Ln_NumeroPosicion;
        
        SET Ln_Contador = 1;
        SET Ln_Total_Necesidades = 0;
        
        Calcular_Necesidad_Loop: WHILE (Ln_Contador <= P_NumeroMensajeros) AND
										(Ln_Total_Necesidades < Ln_Promedio_Mensajeros_Hora_Normal) DO
        
            IF ln_Total_Necesidades <= Ln_Promedio_Mensajeros_Hora_Normal then
				SELECT TotalHorasProgramadas INTO Ln_TotalHorasProgramadasMensajero 
				FROM Temp_ProgramacionSugeridaDetalle WHERE NumeroMensajero = Ln_Contador;
				
				IF Ln_TotalHorasProgramadasMensajero <= MinimoHoras then
					CALL Actualizar_Temp_ProgramacionSugeridaDetalle (Ln_IdHorario, Ln_Contador, Ln_Total_Necesidades, Ln_IdProgramacionSugerida);
				END IF;            
                
            END IF;  -- ln_Total_Necesidades <= Ln_Promedio_Mensajeros_Hora_Normal
            
            SET Ln_Contador = Ln_Contador + 1;
                        
        END WHILE Calcular_Necesidad_Loop;
        
		FETCH Cursor_Necesidades_Mensajeros 
			INTO Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroPosicion, Ln_Promedio_Mensajeros_Hora_Normal ;		

    END WHILE Resumen_Loop;
        
	CLOSE Cursor_Necesidades_Mensajeros;
    
    SET Ln_Contador = 1;
    SET Ln_IdProgramacionSugerida = 2;
    
	Resumen_Loop: WHILE (Ln_Contador <= P_NumeroMensajeros) DO
		INSERT INTO Temp_ProgramacionSugeridaDetalle (IdProgramacionSugerida, NumeroMensajero) 
        VALUES (Ln_IdProgramacionSugerida, Ln_Contador);

		INSERT INTO Temp_ProgramacionSugeridaDetalle (IdProgramacionSugerida, NumeroMensajero) 
        VALUES (Ln_IdProgramacionSugerida+1, Ln_Contador);

		INSERT INTO Temp_ProgramacionSugeridaDetalle (IdProgramacionSugerida, NumeroMensajero) 
        VALUES (Ln_IdProgramacionSugerida+2, Ln_Contador);

		INSERT INTO Temp_ProgramacionSugeridaDetalle (IdProgramacionSugerida, NumeroMensajero) 
        VALUES (Ln_IdProgramacionSugerida+3, Ln_Contador);

		INSERT INTO Temp_ProgramacionSugeridaDetalle (IdProgramacionSugerida, NumeroMensajero) 
        VALUES (Ln_IdProgramacionSugerida+4, Ln_Contador);
        
        SET Ln_Contador = Ln_Contador + 1;
    END WHILE Resumen_Loop;
    
    SET Ln_Contador = 1;
    Asignar_Mensajero_Horas_Loop: WHILE (Ln_Contador <= P_NumeroMensajeros) DO
    
		SET Ln_Hora = Ln_PrimeraHora;
        
        SELECT Ln_PrimeraHora, Ln_UltimaHora;
        
        SET Ln_HoraInicioTurno = -1;
        
        Horario_Loop: WHILE (Ln_Hora <= Ln_UltimaHora) AND (Ln_HoraInicioTurno < 0)  DO
                
            SELECT IdHorario INTO Ln_IdHorario
            FROM copservir_turnos.m_horarioxflota
			WHERE IdFlota = P_IdFlota AND NumeroPosicion = Ln_Hora;   
                
			SET Ln_HoraInicioTurno = HoraInicioTurno (P_IdReportePedidosxPdv, P_IdClasificacionDia, 
														Ln_IdProgramacionSugerida, Ln_hora, Ln_IdHorario) ;
              
            IF  Ln_HoraInicioTurno > 0 THEN 
                SELECT Ln_Hora, Ln_IdHorario, Ln_HoraInicioTurno;   
				CALL Actualizar_Temp_ProgramacionSugeridaDetalle_Turno (Ln_HoraInicioTurno, Ln_Contador, Ln_IdProgramacionSugerida);
                CALL Actualizar_Temp_ProgramacionSugeridaDetalle_Turno_12 (Ln_HoraInicioTurno, Ln_Contador, Ln_IdProgramacionSugerida + 1);
            END IF;    
        
			SET Ln_Hora = Ln_Hora + 1;
        END WHILE Horario_Loop;
        
        SET Ln_Contador = Ln_Contador + 1;
    
    END WHILE Asignar_Mensajero_Horas_Loop;
    
    
    -- INSERT INTO t_ProgramacionSugerida (IdClasificacionDia, IdReportePedidosxPdv, FechaInicio, FechaFinal, 
    -- IdUsuarioGraba, FechaGraba, IdUsuarioUltimaModifica, FechaUltimaModifica, CodigoEstadoRegistro) 
    -- VALUES (1, P_IdReportePedidosxPdv, P_FechaInicio, P_FechaFinal, P_IdUsuarioGraba, current_date(),
    -- P_IdUsuarioGraba, current_date(), 1); 
    
    -- SET Lc_NombreTabla = 't_ProgramacionSugerida';
    -- OPEN Cursor_Informacion_AutoIncremento;        
    -- FETCH Cursor_Informacion_AutoIncremento INTO Ln_Ultimo_ID;
    -- CLOSE Cursor_Informacion_AutoIncremento;
   
    -- SET Ln_IdProgramacionSugerida = Ln_Ultimo_ID - 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Generar_Resumen_DiaClienteFiel */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Generar_Resumen_DiaClienteFiel(
					P_IdReportePedidosxPdv INT, 
                    P_IdClasificacionDia INT, 
					P_NumeroMensajeros_Hora DECIMAL (2,1))
BEGIN

	-- Declaración de variables
	DECLARE Ln_NumeroPosicion INT;
	DECLARE Ln_IdHorario INT; 
	DECLARE Lc_HoraInicio VARCHAR(5) ;
	DECLARE Lc_HoraFinal VARCHAR(5); 
	DECLARE Ln_NumeroDiaSemana INT; 
	DECLARE Lc_NombreDiaSemana VARCHAR(20);
	DECLARE Ln_NumeroServicios INT;
	DECLARE Ln_No_Mas_Datos INT;

	DECLARE Ln_NumeroPosicion_Aux INT;
	DECLARE Ln_IdHorario_Aux INT; 
	DECLARE Lc_HoraInicio_Aux VARCHAR(5) ;
	DECLARE Lc_HoraFinal_Aux VARCHAR(5); 

	DECLARE Ln_NumeroServicios_Domingo INT;	
	DECLARE Ln_NumeroServicios_Lunes INT;
	DECLARE Ln_NumeroServicios_Martes INT;
	DECLARE Ln_NumeroServicios_Miercoles INT;
	DECLARE Ln_NumeroServicios_Jueves INT;
	DECLARE Ln_NumeroServicios_Viernes INT;
	DECLARE Ln_NumeroServicios_Sabado INT;
	DECLARE Ln_NumeroServicios_ClienteFiel INT;

	DECLARE Ln_Numero_Mensajeros_Domingo INT;
	DECLARE Ln_Numero_Mensajeros_Lunes INT;
	DECLARE Ln_Numero_Mensajeros_Martes INT;
	DECLARE Ln_Numero_Mensajeros_Miercoles INT;
	DECLARE Ln_Numero_Mensajeros_Jueves INT;
	DECLARE Ln_Numero_Mensajeros_Viernes INT;
	DECLARE Ln_Numero_Mensajeros_Sabado INT;
	DECLARE Ln_Numero_Mensajeros_ClienteFiel INT;
        
    DECLARE Ln_Promedio_Mensajeros_Hora_ClienteFiel INT;
	DECLARE Ln_Promedio_Mensajeros_Hora_Normal INT;
	DECLARE Ln_Promedio_Mensajeros_Hora_Festivo INT;	
	
    DECLARE Ln_NumeroMensajeros_Dia INT;
    DECLARE Ln_NumeroDias INT;

	-- Definición de la consulta
	DECLARE Cursor_Resumen_Festivo CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, NumeroServicios 
			FROM copservir_turnos.v_resumen_pedidos_clientefiel
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv
			ORDER BY NumeroPosicion; 

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;
    
    -- Eliminar Resumen del Reporte y del Tipo de Dia
    DELETE FROM t_resumen_clasificacion_dias
		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND IdClasificacionDia = P_IdClasificacionDia;
	
	-- Abrimos el cursor
	OPEN Cursor_Resumen_Festivo;

	-- Obtenemos la primera fila en la variables correspondientes
	FETCH Cursor_Resumen_Festivo 
		INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroServicios;		

	-- Comenzamos nuestro bucle de lectura
	Resumen_Loop: WHILE (Ln_No_Mas_Datos = 0) DO

		-- Si el cursor se quedó sin elementos, entonces nos salimos del bucle
		
		SET Ln_NumeroPosicion_Aux = Ln_NumeroPosicion ;
		SET Ln_IdHorario_Aux = Ln_IdHorario;
		SET Lc_HoraInicio_Aux = Lc_HoraInicio;
		SET Lc_HoraFinal_Aux = Lc_HoraFinal;
		
        SET Ln_NumeroServicios_Domingo = 0;
		SET Ln_NumeroServicios_Lunes = 0;
		SET Ln_NumeroServicios_Martes = 0; 
		SET Ln_NumeroServicios_Miercoles = 0;
		SET Ln_NumeroServicios_Jueves = 0;
		SET Ln_NumeroServicios_Viernes = 0;
		SET Ln_NumeroServicios_Sabado = 0;
		SET Ln_NumeroServicios_ClienteFiel = 0;

		SET Ln_Numero_Mensajeros_Domingo = 0;
		SET Ln_Numero_Mensajeros_Lunes = 0;
		SET Ln_Numero_Mensajeros_Martes = 0; 
		SET Ln_Numero_Mensajeros_Miercoles = 0;
		SET Ln_Numero_Mensajeros_Jueves = 0;
		SET Ln_Numero_Mensajeros_Viernes = 0;
		SET Ln_Numero_Mensajeros_Sabado = 0;
		SET Ln_Numero_Mensajeros_ClienteFiel = 0;
        
		SET Ln_Promedio_Mensajeros_Hora_Normal = 0;
		SET Ln_Promedio_Mensajeros_Hora_Festivo = 0;
        SET Ln_Promedio_Mensajeros_Hora_ClienteFiel = 0;
		
        SET Ln_NumeroMensajeros_Dia = 0;
        SET Ln_NumeroDias = 0;
		
			SET Ln_NumeroServicios_ClienteFiel = Ln_NumeroServicios;  
            SET Ln_Numero_Mensajeros_ClienteFiel = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
            SET Ln_NumeroDias = Ln_NumeroDias + 1;            
            
		
        SET Ln_NumeroMensajeros_Dia =	Ln_Numero_Mensajeros_ClienteFiel;
        
		SET Ln_Promedio_Mensajeros_Hora_ClienteFiel = CEIL(Ln_NumeroMensajeros_Dia);
        		
		INSERT INTO t_resumen_clasificacion_dias (IdReportePedidosxPdv, IdClasificacionDia, NumeroPosicion, IdHorario, HoraInicio, HoraFinal, Lunes_Servicios,
			Martes_Servicios, Miercoles_Servicios, Jueves_Servicios, Viernes_Servicios, Sabado_Servicios, Domingo_Servicios, Promedio_Mensajeros_Hora_Festivo,
            Numero_Mensajeros_Lunes, Numero_Mensajeros_Martes, Numero_Mensajeros_Miercoles, Numero_Mensajeros_Jueves, Numero_Mensajeros_Viernes, 
            Numero_Mensajeros_Sabado, Numero_Mensajeros_Domingo, Promedio_Mensajeros_Hora_ClienteFiel, ClienteFiel_Servicios, Numero_Mensajeros_ClienteFiel) 
			VALUES 
			(P_IdReportePedidosxPdv, P_IdClasificacionDia, Ln_NumeroPosicion_Aux, Ln_IdHorario_Aux, Lc_HoraInicio_Aux, Lc_HoraFinal_Aux, Ln_NumeroServicios_Lunes,
			Ln_NumeroServicios_Martes, Ln_NumeroServicios_Miercoles, Ln_NumeroServicios_Jueves, Ln_NumeroServicios_Viernes, Ln_NumeroServicios_Sabado,
            Ln_NumeroServicios_Domingo, Ln_Promedio_Mensajeros_Hora_Festivo, Ln_Numero_Mensajeros_Lunes, Ln_Numero_Mensajeros_Martes, Ln_Numero_Mensajeros_Miercoles, Ln_Numero_Mensajeros_Jueves,
            Ln_Numero_Mensajeros_Viernes, Ln_Numero_Mensajeros_Sabado, Ln_Numero_Mensajeros_Domingo, Ln_Promedio_Mensajeros_Hora_ClienteFiel, 
			Ln_NumeroServicios_ClienteFiel, Ln_Numero_Mensajeros_ClienteFiel);

		-- Obtenemos la primera fila en la variables correspondientes
		FETCH Cursor_Resumen_Festivo 
				INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal,  Ln_NumeroServicios;		
		
		IF Ln_No_Mas_Datos = 1 THEN
			LEAVE Resumen_Loop;
		END IF;
			
    END WHILE Resumen_Loop;
    
	CLOSE Cursor_Resumen_Festivo;
    
	SET Ln_No_Mas_Datos = 0;		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Generar_Resumen_DiaFestivo */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Generar_Resumen_DiaFestivo(
					P_IdReportePedidosxPdv INT, 
                    P_IdClasificacionDia INT, 
					P_NumeroMensajeros_Hora DECIMAL (2,1))
BEGIN


	-- Declaración de variables
	DECLARE Ln_NumeroPosicion INT;
	DECLARE Ln_IdHorario INT; 
	DECLARE Lc_HoraInicio VARCHAR(5) ;
	DECLARE Lc_HoraFinal VARCHAR(5); 
	DECLARE Ln_NumeroDiaSemana INT; 
	DECLARE Lc_NombreDiaSemana VARCHAR(20);
	DECLARE Ln_NumeroServicios INT;
	DECLARE Ln_No_Mas_Datos INT;

	DECLARE Ln_NumeroPosicion_Aux INT;
	DECLARE Ln_IdHorario_Aux INT; 
	DECLARE Lc_HoraInicio_Aux VARCHAR(5) ;
	DECLARE Lc_HoraFinal_Aux VARCHAR(5); 

	DECLARE Ln_NumeroServicios_Domingo INT;	
	DECLARE Ln_NumeroServicios_Lunes INT;
	DECLARE Ln_NumeroServicios_Martes INT;
	DECLARE Ln_NumeroServicios_Miercoles INT;
	DECLARE Ln_NumeroServicios_Jueves INT;
	DECLARE Ln_NumeroServicios_Viernes INT;
	DECLARE Ln_NumeroServicios_Sabado INT;

	DECLARE Ln_Numero_Mensajeros_Domingo INT;
	DECLARE Ln_Numero_Mensajeros_Lunes INT;
	DECLARE Ln_Numero_Mensajeros_Martes INT;
	DECLARE Ln_Numero_Mensajeros_Miercoles INT;
	DECLARE Ln_Numero_Mensajeros_Jueves INT;
	DECLARE Ln_Numero_Mensajeros_Viernes INT;
	DECLARE Ln_Numero_Mensajeros_Sabado INT;
        
    DECLARE Ln_Promedio_Mensajeros_Hora_Festivo INT;
    DECLARE Ln_NumeroMensajeros_Dia INT;
    DECLARE Ln_NumeroDias INT;

	-- Definición de la consulta
	DECLARE Cursor_Resumen_Festivo CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, NumeroDiaSemana, NombreDiaSemana, NumeroServicios 
			FROM copservir_turnos.v_resumen_pedidos_festivos
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv
			ORDER BY NumeroPosicion, NumeroDiaSemana; 

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;
    
    -- Eliminar Resumen del Reporte y del Tipo de Dia
    DELETE FROM t_resumen_clasificacion_dias
		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND IdClasificacionDia = P_IdClasificacionDia;
	
	-- Abrimos el cursor
	OPEN Cursor_Resumen_Festivo;

	-- Obtenemos la primera fila en la variables correspondientes
	FETCH Cursor_Resumen_Festivo 
		INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_NumeroServicios;		

	-- Comenzamos nuestro bucle de lectura
	Resumen_Loop: WHILE (Ln_No_Mas_Datos = 0) DO

		-- Si el cursor se quedó sin elementos, entonces nos salimos del bucle
		
		SET Ln_NumeroPosicion_Aux = Ln_NumeroPosicion ;
		SET Ln_IdHorario_Aux = Ln_IdHorario;
		SET Lc_HoraInicio_Aux = Lc_HoraInicio;
		SET Lc_HoraFinal_Aux = Lc_HoraFinal;
		
        SET Ln_NumeroServicios_Domingo = 0;
		SET Ln_NumeroServicios_Lunes = 0;
		SET Ln_NumeroServicios_Martes = 0; 
		SET Ln_NumeroServicios_Miercoles = 0;
		SET Ln_NumeroServicios_Jueves = 0;
		SET Ln_NumeroServicios_Viernes = 0;
		SET Ln_NumeroServicios_Sabado = 0;

		SET Ln_Numero_Mensajeros_Domingo = 0;
		SET Ln_Numero_Mensajeros_Lunes = 0;
		SET Ln_Numero_Mensajeros_Martes = 0; 
		SET Ln_Numero_Mensajeros_Miercoles = 0;
		SET Ln_Numero_Mensajeros_Jueves = 0;
		SET Ln_Numero_Mensajeros_Viernes = 0;
		SET Ln_Numero_Mensajeros_Sabado = 0;
        
        SET Ln_Promedio_Mensajeros_Hora_Festivo = 0;
        SET Ln_NumeroMensajeros_Dia = 0;
        SET Ln_NumeroDias = 0;
		
		NumeroPosicion_Loop : WHILE ( (Ln_No_Mas_Datos = 0) && (Ln_NumeroPosicion_Aux = Ln_NumeroPosicion) ) DO
				
			CASE Ln_NumeroDiaSemana
				WHEN 1 THEN
					SET Ln_NumeroServicios_Domingo = Ln_NumeroServicios;  
                    SET Ln_Numero_Mensajeros_Domingo = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;            
				WHEN 2 THEN
					SET Ln_NumeroServicios_Lunes = Ln_NumeroServicios;  
                    SET Ln_Numero_Mensajeros_Lunes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 3 THEN
					SET Ln_NumeroServicios_Martes = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Martes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 4 THEN
					SET Ln_NumeroServicios_Miercoles = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Miercoles = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 5 THEN
					SET Ln_NumeroServicios_Jueves = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Jueves = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 6 THEN
					SET Ln_NumeroServicios_Viernes = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Viernes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 7 THEN
					SET Ln_NumeroServicios_Sabado = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Sabado = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				ELSE
					SET Ln_NumeroServicios = 0;
			END CASE;
            
			-- Obtenemos la primera fila en la variables correspondientes
			FETCH Cursor_Resumen_Festivo 
				INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_NumeroServicios;		
		
			IF Ln_No_Mas_Datos = 1 THEN
				LEAVE Resumen_Loop;
			END IF;
		
		END WHILE NumeroPosicion_Loop;
        
        SET Ln_NumeroMensajeros_Dia =	Ln_Numero_Mensajeros_Domingo +     
										Ln_Numero_Mensajeros_Lunes + Ln_Numero_Mensajeros_Martes +
										Ln_Numero_Mensajeros_Miercoles + Ln_Numero_Mensajeros_Jueves +
                                        Ln_Numero_Mensajeros_Viernes + Ln_Numero_Mensajeros_Sabado;
        
        IF Ln_NumeroDias > 0 THEN
			SET Ln_Promedio_Mensajeros_Hora_Festivo = CEIL(Ln_NumeroMensajeros_Dia / Ln_NumeroDias);
        ELSE
			SET Ln_Promedio_Mensajeros_Hora_Festivo = 0;
        END IF;        
        		
		INSERT INTO t_resumen_clasificacion_dias (IdReportePedidosxPdv, IdClasificacionDia, NumeroPosicion, IdHorario, HoraInicio, HoraFinal, Lunes_Servicios,
			Martes_Servicios, Miercoles_Servicios, Jueves_Servicios, Viernes_Servicios, Sabado_Servicios, Domingo_Servicios, Promedio_Mensajeros_Hora_Festivo,
            Numero_Mensajeros_Lunes, Numero_Mensajeros_Martes, Numero_Mensajeros_Miercoles, Numero_Mensajeros_Jueves, Numero_Mensajeros_Viernes, 
            Numero_Mensajeros_Sabado, Numero_Mensajeros_Domingo) VALUES 
			(P_IdReportePedidosxPdv, P_IdClasificacionDia, Ln_NumeroPosicion_Aux, Ln_IdHorario_Aux, Lc_HoraInicio_Aux, Lc_HoraFinal_Aux, Ln_NumeroServicios_Lunes,
			Ln_NumeroServicios_Martes, Ln_NumeroServicios_Miercoles, Ln_NumeroServicios_Jueves, Ln_NumeroServicios_Viernes, Ln_NumeroServicios_Sabado,
            Ln_NumeroServicios_Domingo, Ln_Promedio_Mensajeros_Hora_Festivo, Ln_Numero_Mensajeros_Lunes, Ln_Numero_Mensajeros_Martes, Ln_Numero_Mensajeros_Miercoles, Ln_Numero_Mensajeros_Jueves,
            Ln_Numero_Mensajeros_Viernes, Ln_Numero_Mensajeros_Sabado, Ln_Numero_Mensajeros_Domingo);
		
    END WHILE Resumen_Loop;
    
	CLOSE Cursor_Resumen_Festivo;
    
	SET Ln_No_Mas_Datos = 0;		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS Generar_Resumen_DiaNormal */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE Generar_Resumen_DiaNormal(P_IdReportePedidosxPdv INT, P_IdClasificacionDia INT, 
											P_NumeroMensajeros_Hora DECIMAL (2,1))
BEGIN

	-- Declaración de variables
	DECLARE Ln_NumeroPosicion INT;
	DECLARE Ln_IdHorario INT; 
	DECLARE Lc_HoraInicio VARCHAR(5) ;
	DECLARE Lc_HoraFinal VARCHAR(5); 
	DECLARE Ln_NumeroDiaSemana INT; 
	DECLARE Lc_NombreDiaSemana VARCHAR(20);
	DECLARE Ln_NumeroServicios INT;
	DECLARE Ln_No_Mas_Datos INT;

	DECLARE Ln_NumeroPosicion_Aux INT;
	DECLARE Ln_IdHorario_Aux INT; 
	DECLARE Lc_HoraInicio_Aux VARCHAR(5) ;
	DECLARE Lc_HoraFinal_Aux VARCHAR(5); 
	
	DECLARE Ln_NumeroServicios_Lunes INT;
	DECLARE Ln_NumeroServicios_Martes INT;
	DECLARE Ln_NumeroServicios_Miercoles INT;
	DECLARE Ln_NumeroServicios_Jueves INT;
	DECLARE Ln_NumeroServicios_Viernes INT;
	DECLARE Ln_NumeroServicios_Sabado INT;

	DECLARE Ln_Numero_Mensajeros_Lunes INT;
	DECLARE Ln_Numero_Mensajeros_Martes INT;
	DECLARE Ln_Numero_Mensajeros_Miercoles INT;
	DECLARE Ln_Numero_Mensajeros_Jueves INT;
	DECLARE Ln_Numero_Mensajeros_Viernes INT;
	DECLARE Ln_Numero_Mensajeros_Sabado INT;
        
    DECLARE Ln_Promedio_Mensajeros_Hora_Normal INT;
    DECLARE Ln_NumeroMensajeros_Dia INT;
    DECLARE Ln_NumeroDias INT;

	-- Definición de la consulta
	DECLARE Cursor_Resumen_Normal CURSOR FOR
		SELECT NumeroPosicion, IdHorario, HoraInicio, HoraFinal, NumeroDiaSemana, NombreDiaSemana, NumeroServicios 
			FROM copservir_turnos.v_resumen_pedidos_normal
			WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv
			ORDER BY NumeroPosicion, NumeroDiaSemana; 

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Ln_No_Mas_Datos = 1;

	SET Ln_No_Mas_Datos = 0;
    
    -- Eliminar Resumen del Reporte y del Tipo de Dia
    DELETE FROM t_resumen_clasificacion_dias
		WHERE IdReportePedidosxPdv = P_IdReportePedidosxPdv AND IdClasificacionDia = P_IdClasificacionDia;
	
	-- Abrimos el cursor
	OPEN Cursor_Resumen_Normal;

	-- Obtenemos la primera fila en la variables correspondientes
	FETCH Cursor_Resumen_Normal 
		INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_NumeroServicios;		

	-- Comenzamos nuestro bucle de lectura
	Resumen_Loop: WHILE (Ln_No_Mas_Datos = 0) DO

		-- Si el cursor se quedó sin elementos, entonces nos salimos del bucle
		
		SET Ln_NumeroPosicion_Aux = Ln_NumeroPosicion ;
		SET Ln_IdHorario_Aux = Ln_IdHorario;
		SET Lc_HoraInicio_Aux = Lc_HoraInicio;
		SET Lc_HoraFinal_Aux = Lc_HoraFinal;
		
		SET Ln_NumeroServicios_Lunes = 0;
		SET Ln_NumeroServicios_Martes = 0; 
		SET Ln_NumeroServicios_Miercoles = 0;
		SET Ln_NumeroServicios_Jueves = 0;
		SET Ln_NumeroServicios_Viernes = 0;
		SET Ln_NumeroServicios_Sabado = 0;

		SET Ln_Numero_Mensajeros_Lunes = 0;
		SET Ln_Numero_Mensajeros_Martes = 0; 
		SET Ln_Numero_Mensajeros_Miercoles = 0;
		SET Ln_Numero_Mensajeros_Jueves = 0;
		SET Ln_Numero_Mensajeros_Viernes = 0;
		SET Ln_Numero_Mensajeros_Sabado = 0;
        
        SET Ln_Promedio_Mensajeros_Hora_Normal = 0;
        SET Ln_NumeroMensajeros_Dia = 0;
        SET Ln_NumeroDias = 0;
		
		NumeroPosicion_Loop : WHILE ( (Ln_No_Mas_Datos = 0) && (Ln_NumeroPosicion_Aux = Ln_NumeroPosicion) ) DO
				
			CASE Ln_NumeroDiaSemana
				WHEN 2 THEN
					SET Ln_NumeroServicios_Lunes = Ln_NumeroServicios;  
                    SET Ln_Numero_Mensajeros_Lunes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 3 THEN
					SET Ln_NumeroServicios_Martes = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Martes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 4 THEN
					SET Ln_NumeroServicios_Miercoles = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Miercoles = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 5 THEN
					SET Ln_NumeroServicios_Jueves = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Jueves = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 6 THEN
					SET Ln_NumeroServicios_Viernes = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Viernes = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				WHEN 7 THEN
					SET Ln_NumeroServicios_Sabado = Ln_NumeroServicios;
                    SET Ln_Numero_Mensajeros_Sabado = ROUND((Ln_NumeroServicios / P_NumeroMensajeros_Hora),0);
                    SET Ln_NumeroDias = Ln_NumeroDias + 1;
				ELSE
					SET Ln_NumeroServicios = 0;
			END CASE;
            
			-- Obtenemos la primera fila en la variables correspondientes
			FETCH Cursor_Resumen_Normal 
				INTO Ln_NumeroPosicion, Ln_IdHorario, Lc_HoraInicio, Lc_HoraFinal, Ln_NumeroDiaSemana, Lc_NombreDiaSemana, Ln_NumeroServicios;		
		
			IF Ln_No_Mas_Datos = 1 THEN
				LEAVE Resumen_Loop;
			END IF;
		
		END WHILE NumeroPosicion_Loop;
        
        SET Ln_NumeroMensajeros_Dia =   Ln_Numero_Mensajeros_Lunes + Ln_Numero_Mensajeros_Martes +
										Ln_Numero_Mensajeros_Miercoles + Ln_Numero_Mensajeros_Jueves +
                                        Ln_Numero_Mensajeros_Viernes + Ln_Numero_Mensajeros_Sabado;
        
        IF Ln_NumeroDias > 0 THEN
			SET Ln_Promedio_Mensajeros_Hora_Normal = CEIL(Ln_NumeroMensajeros_Dia / Ln_NumeroDias);
        ELSE
			SET Ln_Promedio_Mensajeros_Hora_Normal = 0;
        END IF;        
        		
		INSERT INTO t_resumen_clasificacion_dias (IdReportePedidosxPdv, IdClasificacionDia, NumeroPosicion, IdHorario, HoraInicio, HoraFinal, Lunes_Servicios,
			Martes_Servicios, Miercoles_Servicios, Jueves_Servicios, Viernes_Servicios, Sabado_Servicios, Promedio_Mensajeros_Hora_Normal,
            Numero_Mensajeros_Lunes, Numero_Mensajeros_Martes, Numero_Mensajeros_Miercoles, Numero_Mensajeros_Jueves,
            Numero_Mensajeros_Viernes, Numero_Mensajeros_Sabado) VALUES 
			(P_IdReportePedidosxPdv, P_IdClasificacionDia, Ln_NumeroPosicion_Aux, Ln_IdHorario_Aux, Lc_HoraInicio_Aux, Lc_HoraFinal_Aux, Ln_NumeroServicios_Lunes,
			Ln_NumeroServicios_Martes, Ln_NumeroServicios_Miercoles, Ln_NumeroServicios_Jueves, Ln_NumeroServicios_Viernes, Ln_NumeroServicios_Sabado,
            Ln_Promedio_Mensajeros_Hora_Normal, Ln_Numero_Mensajeros_Lunes, Ln_Numero_Mensajeros_Martes, Ln_Numero_Mensajeros_Miercoles, Ln_Numero_Mensajeros_Jueves,
            Ln_Numero_Mensajeros_Viernes, Ln_Numero_Mensajeros_Sabado);
		
    END WHILE Resumen_Loop;
    
	CLOSE Cursor_Resumen_Normal;
    
	SET Ln_No_Mas_Datos = 0;		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS HorariosInicioFinTurno */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=root@localhost PROCEDURE HorariosInicioFinTurno(P_IdFlota INT, P_HoraCero INT, P_HoraUno INT, P_HoraDos INT, P_HoraTres INT, 
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
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50001 DROP VIEW IF EXISTS v_resumen_clasificacion_dias*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW v_resumen_clasificacion_dias AS select rep.IdReportePedidosxPdv AS IdReportePedidosxPdv,1 AS IdClasificacionDia,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 0))),0) AS HoraCero,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 1))),0) AS HoraUno,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 2))),0) AS HoraDos,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 3))),0) AS HoraTres,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 4))),0) AS HoraCuatro,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 5))),0) AS HoraCinco,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 6))),0) AS HoraSeis,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 7))),0) AS HoraSiete,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 8))),0) AS HoraOcho,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 9))),0) AS HoraNueve,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 10))),0) AS HoraDiez,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 11))),0) AS HoraOnce,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 12))),0) AS HoraDoce,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 13))),0) AS HoraTrece,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 14))),0) AS HoraCatorce,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 15))),0) AS HoraQuince,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 16))),0) AS HoraDieciSeis,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 17))),0) AS HoraDieciSiete,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 18))),0) AS HoraDieciOcho,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 19))),0) AS HoraDieciNueve,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 20))),0) AS HoraVeinte,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 21))),0) AS HoraVeintiUna,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 22))),0) AS HoraVeintiDos,ifnull((select res.Promedio_Mensajeros_Hora_Normal from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 1) and (res.IdHorario = 23))),0) AS HoraVeintiTres from h_reportepedidosxpdv rep union select rep.IdReportePedidosxPdv AS IdReportePedidosxPdv,2 AS IdClasificacionDia,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 0))),0) AS HoraCero,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 1))),0) AS HoraUno,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 2))),0) AS HoraDos,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 3))),0) AS HoraTres,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 4))),0) AS HoraCuatro,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 5))),0) AS HoraCinco,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 6))),0) AS HoraSeis,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 7))),0) AS HoraSiete,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 8))),0) AS HoraOcho,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 9))),0) AS HoraNueve,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 10))),0) AS HoraDiez,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 11))),0) AS HoraOnce,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 12))),0) AS HoraDoce,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 13))),0) AS HoraTrece,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 14))),0) AS HoraCatorce,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 15))),0) AS HoraQuince,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 16))),0) AS HoraDieciSeis,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 17))),0) AS HoraDieciSiete,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 18))),0) AS HoraDieciOcho,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 19))),0) AS HoraDieciNueve,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 20))),0) AS HoraVeinte,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 21))),0) AS HoraVeintiUna,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 22))),0) AS HoraVeintiDos,ifnull((select res.Promedio_Mensajeros_Hora_Festivo from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 2) and (res.IdHorario = 23))),0) AS HoraVeintiTres from h_reportepedidosxpdv rep union select rep.IdReportePedidosxPdv AS IdReportePedidosxPdv,3 AS IdClasificacionDia,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 0))),0) AS HoraCero,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 1))),0) AS HoraUno,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 2))),0) AS HoraDos,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 3))),0) AS HoraTres,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 4))),0) AS HoraCuatro,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 5))),0) AS HoraCinco,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 6))),0) AS HoraSeis,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 7))),0) AS HoraSiete,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 8))),0) AS HoraOcho,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 9))),0) AS HoraNueve,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 10))),0) AS HoraDiez,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 11))),0) AS HoraOnce,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 12))),0) AS HoraDoce,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 13))),0) AS HoraTrece,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 14))),0) AS HoraCatorce,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 15))),0) AS HoraQuince,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 16))),0) AS HoraDieciSeis,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 17))),0) AS HoraDieciSiete,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 18))),0) AS HoraDieciOcho,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 19))),0) AS HoraDieciNueve,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 20))),0) AS HoraVeinte,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 21))),0) AS HoraVeintiUna,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 22))),0) AS HoraVeintiDos,ifnull((select res.Promedio_Mensajeros_Hora_ClienteFiel from t_resumen_clasificacion_dias res where ((res.IdReportePedidosxPdv = rep.IdReportePedidosxPdv) and (res.IdClasificacionDia = 3) and (res.IdHorario = 23))),0) AS HoraVeintiTres from h_reportepedidosxpdv rep */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_clientefiel*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW v_resumen_pedidos_clientefiel AS select m.IdSede AS IdSede,m.NombreSede AS NombreSede,ped.IdReportePedidosxPdv AS IdReportePedidosxPdv,f.IdFlota AS IdFlota,f.NombreFlota AS NombreFlota,3 AS IdClasificacionDia,'DIA CLIENTE FIEL' AS NombreClasificacionDia,hf.NumeroPosicion AS NumeroPosicion,hor.IdHorario AS IdHorario,hor.HoraInicio AS HoraInicio,hor.HoraFinal AS HoraFinal,ceiling((count(0) / CALCULARNUMERODIASCLIENTEFIEL(date_format(ped.FechaInicio,'%d/%m/%Y'),date_format(ped.FechaFinal,'%d/%m/%Y')))) AS NumeroServicios from (((((h_reportepedidosxpdv ped join h_reportepedidosxpdvdetalle peddet on((ped.IdReportePedidosxPdv = peddet.IdReportePedidosxPdv))) join m_horarioxflota hf on((ped.IdFlota = hf.IdFlota))) join m_flotas f on((hf.IdFlota = f.IdFlota))) join m_sedes m on((f.IdSede = m.IdSede))) join m_horario hor on((hour(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = hor.IdHorario))) where ((dayofmonth(str_to_date(peddet.FechaPos,'%d/%m/%Y')) in (10,25)) and (hour(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = hf.IdHorario) and (f.CodigoEstadoRegistro = 1) and (m.CodigoEstadoRegistro = 1) and (hor.CodigoEstadoRegistro = 1) and (hf.CodigoEstadoRegistro = 1) and (ped.CodigoEstadoRegistro = 1)) group by m.IdSede,m.NombreSede,ped.IdReportePedidosxPdv,f.IdFlota,f.NombreFlota,IdClasificacionDia,NombreClasificacionDia,hf.NumeroPosicion,hor.IdHorario,hor.HoraInicio,hor.HoraFinal order by 1,3,4,6,8 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_festivos*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW v_resumen_pedidos_festivos AS select m.IdSede AS IdSede,m.NombreSede AS NombreSede,ped.IdReportePedidosxPdv AS IdReportePedidosxPdv,f.IdFlota AS IdFlota,f.NombreFlota AS NombreFlota,cd.IdClasificacionDia AS IdClasificacionDia,cd.NombreClasificacionDia AS NombreClasificacionDia,hf.NumeroPosicion AS NumeroPosicion,hor.IdHorario AS IdHorario,hor.HoraInicio AS HoraInicio,hor.HoraFinal AS HoraFinal,ds.NumeroDiaSemana AS NumeroDiaSemana,ds.NombreDiaSemana AS NombreDiaSemana,ceiling((count(0) / CALCULARNUMERODIASFESTIVO(date_format(ped.FechaInicio,'%d/%m/%Y'),date_format(ped.FechaFinal,'%d/%m/%Y')))) AS NumeroServicios from (((((((h_reportepedidosxpdv ped join h_reportepedidosxpdvdetalle peddet on((ped.IdReportePedidosxPdv = peddet.IdReportePedidosxPdv))) join m_horarioxflota hf on((ped.IdFlota = hf.IdFlota))) join m_flotas f on((hf.IdFlota = f.IdFlota))) join m_sedes m on((f.IdSede = m.IdSede))) join m_diassemana ds on((dayofweek(str_to_date(peddet.FechaPos,'%d/%m/%Y')) = ds.NumeroDiaSemana))) join m_clasificaciondias cd on((ds.IdClasificacionDia = cd.IdClasificacionDia))) join m_horario hor on((hour(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = hor.IdHorario))) where ((dayofmonth(str_to_date(peddet.FechaPos,'%d/%m/%Y')) not in (10,25)) and (hour(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = hf.IdHorario) and ((VERIFICARFECHAFESTIVO(str_to_date(peddet.FechaPos,'%d/%m/%Y')) = 1) or (ds.NumeroDiaSemana = 1)) and (ped.CodigoEstadoRegistro = 1) and (hf.CodigoEstadoRegistro = 1) and (f.CodigoEstadoRegistro = 1) and (m.CodigoEstadoRegistro = 1) and (ds.CodigoEstadoRegistro = 1) and (cd.CodigoEstadoRegistro = 1) and (hor.CodigoEstadoRegistro = 1)) group by m.IdSede,m.NombreSede,ped.IdReportePedidosxPdv,f.IdFlota,f.NombreFlota,cd.IdClasificacionDia,cd.NombreClasificacionDia,hf.NumeroPosicion,hor.IdHorario,hor.HoraInicio,hor.HoraFinal,ds.NumeroDiaSemana,ds.NombreDiaSemana order by 1,3,4,6,8,11 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_normal*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW v_resumen_pedidos_normal AS select m.IdSede AS IdSede,m.NombreSede AS NombreSede,ped.IdReportePedidosxPdv AS IdReportePedidosxPdv,f.IdFlota AS IdFlota,f.NombreFlota AS NombreFlota,cd.IdClasificacionDia AS IdClasificacionDia,cd.NombreClasificacionDia AS NombreClasificacionDia,hf.NumeroPosicion AS NumeroPosicion,hor.IdHorario AS IdHorario,hor.HoraInicio AS HoraInicio,hor.HoraFinal AS HoraFinal,ds.NumeroDiaSemana AS NumeroDiaSemana,ds.NombreDiaSemana AS NombreDiaSemana,ceiling((count(0) / CALCULARNUMERODIASPROMEDIO(date_format(ped.FechaInicio,'%d/%m/%Y'),date_format(ped.FechaFinal,'%d/%m/%Y'),ds.NumeroDiaSemana))) AS NumeroServicios from (((((((h_reportepedidosxpdv ped join h_reportepedidosxpdvdetalle peddet on((ped.IdReportePedidosxPdv = peddet.IdReportePedidosxPdv))) join m_horarioxflota hf on((ped.IdFlota = hf.IdFlota))) join m_flotas f on((hf.IdFlota = f.IdFlota))) join m_sedes m on((f.IdSede = m.IdSede))) join m_diassemana ds on((dayofweek(str_to_date(peddet.FechaPos,'%d/%m/%Y')) = ds.NumeroDiaSemana))) join m_clasificaciondias cd on((ds.IdClasificacionDia = cd.IdClasificacionDia))) join m_horario hor on((hour(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = hor.IdHorario))) where ((dayofmonth(str_to_date(peddet.FechaPos,'%d/%m/%Y')) not in (10,25)) and (hour(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = hf.IdHorario) and (VERIFICARFECHAFESTIVO(str_to_date(peddet.FechaPos,'%d/%m/%Y %H')) = 0) and (ds.NumeroDiaSemana <> 1) and (ped.CodigoEstadoRegistro = 1) and (hf.CodigoEstadoRegistro = 1) and (f.CodigoEstadoRegistro = 1) and (m.CodigoEstadoRegistro = 1) and (ds.CodigoEstadoRegistro = 1) and (cd.CodigoEstadoRegistro = 1) and (hor.CodigoEstadoRegistro = 1)) group by m.IdSede,m.NombreSede,ped.IdReportePedidosxPdv,f.IdFlota,f.NombreFlota,cd.IdClasificacionDia,cd.NombreClasificacionDia,hf.NumeroPosicion,hor.IdHorario,hor.HoraInicio,hor.HoraFinal,ds.NumeroDiaSemana,ds.NombreDiaSemana order by 1,3,4,6,8,12 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS v_resumen_pedidos_normal_dia*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW v_resumen_pedidos_normal_dia AS select r.NumeroPosicion AS NumeroPosicion,r.IdHorario AS IdHorario,r.HoraInicio AS HoraInicio,r.HoraFinal AS HoraFinal,ifnull((select r1.NumeroServicios from v_resumen_pedidos_normal r1 where ((r1.IdHorario = r.IdHorario) and (r1.NumeroDiaSemana = 2) and (r.IdReportePedidosxPdv = r1.IdReportePedidosxPdv))),0) AS Lunes,ifnull((select r1.NumeroServicios from v_resumen_pedidos_normal r1 where ((r1.IdHorario = r.IdHorario) and (r1.NumeroDiaSemana = 3) and (r.IdReportePedidosxPdv = r1.IdReportePedidosxPdv))),0) AS Martes,ifnull((select r1.NumeroServicios from v_resumen_pedidos_normal r1 where ((r1.IdHorario = r.IdHorario) and (r1.NumeroDiaSemana = 4) and (r.IdReportePedidosxPdv = r1.IdReportePedidosxPdv))),0) AS Miercoles,ifnull((select r1.NumeroServicios from v_resumen_pedidos_normal r1 where ((r1.IdHorario = r.IdHorario) and (r1.NumeroDiaSemana = 5) and (r.IdReportePedidosxPdv = r1.IdReportePedidosxPdv))),0) AS Jueves,ifnull((select r1.NumeroServicios from v_resumen_pedidos_normal r1 where ((r1.IdHorario = r.IdHorario) and (r1.NumeroDiaSemana = 6) and (r.IdReportePedidosxPdv = r1.IdReportePedidosxPdv))),0) AS Viernes,ifnull((select r1.NumeroServicios from v_resumen_pedidos_normal r1 where ((r1.IdHorario = r.IdHorario) and (r1.NumeroDiaSemana = 7) and (r.IdReportePedidosxPdv = r1.IdReportePedidosxPdv))),0) AS Sabado from v_resumen_pedidos_normal r where (r.IdReportePedidosxPdv = 2) group by r.NumeroPosicion,r.IdHorario,r.HoraInicio,r.HoraFinal order by r.NumeroPosicion */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

