-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: copservir_turnos
-- ------------------------------------------------------
-- Server version	5.6.20

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

--
-- Table structure for table `t_resumen_clasificacion_dias`
--

DROP TABLE IF EXISTS `t_resumen_clasificacion_dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resumen_clasificacion_dias` (
  `IdResumenClasificacionDia` int(11) NOT NULL AUTO_INCREMENT,
  `IdReportePedidosxPdv` int(11) NOT NULL,
  `IdClasificacionDia` int(11) NOT NULL,
  `NumeroPosicion` int(11) NOT NULL,
  `IdHorario` int(11) NOT NULL,
  `HoraInicio` varchar(5) NOT NULL,
  `HoraFinal` varchar(5) NOT NULL,
  `FactorDeAtencion` double NOT NULL DEFAULT '1.8',
  `Lunes_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Lunes` int(11) NOT NULL DEFAULT '0',
  `Martes_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Martes` int(11) NOT NULL DEFAULT '0',
  `Miercoles_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Miercoles` int(11) NOT NULL DEFAULT '0',
  `Jueves_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Jueves` int(11) NOT NULL DEFAULT '0',
  `Viernes_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Viernes` int(11) NOT NULL DEFAULT '0',
  `Sabado_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Sabado` int(11) NOT NULL DEFAULT '0',
  `Domingo_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_Domingo` int(11) NOT NULL DEFAULT '0',
  `ClienteFiel_Servicios` int(11) NOT NULL DEFAULT '0',
  `Numero_Mensajeros_ClienteFiel` int(11) NOT NULL DEFAULT '0',
  `Promedio_Mensajeros_Hora_Normal` int(11) NOT NULL DEFAULT '0',
  `Promedio_Mensajeros_Hora_Festivo` int(11) NOT NULL DEFAULT '0',
  `Promedio_Mensajeros_Hora_ClienteFiel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdResumenClasificacionDia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resumen_clasificacion_dias`
--

LOCK TABLES `t_resumen_clasificacion_dias` WRITE;
/*!40000 ALTER TABLE `t_resumen_clasificacion_dias` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_resumen_clasificacion_dias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-17  8:39:01
