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
-- Table structure for table `m_clasificaciondias`
--

DROP TABLE IF EXISTS `m_clasificaciondias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_clasificaciondias` (
  `IdClasificacionDia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la clasificacion del dia de programacion',
  `NombreClasificacionDia` varchar(45) NOT NULL COMMENT 'Nombre de la clasificacion del dia de programacion',
  `MinimoHorasTurno` int(11) NOT NULL DEFAULT '0',
  `MaximoHorasTurno` int(11) NOT NULL DEFAULT '0',
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'Usuario de grabación de registro.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de grabación de registro.',
  `IdUsuarioUltimaModifica` int(11) NOT NULL COMMENT 'Id de usuario que realiza la última modificación.',
  `FechaUltimaModifica` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la última modificación.',
  PRIMARY KEY (`IdClasificacionDia`),
  UNIQUE KEY `nombreClasificacionProgramacion_UNIQUE` (`NombreClasificacionDia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_clasificaciondias`
--

LOCK TABLES `m_clasificaciondias` WRITE;
/*!40000 ALTER TABLE `m_clasificaciondias` DISABLE KEYS */;
INSERT INTO `m_clasificaciondias` VALUES (1,'DIA NORMAL',8,10,1,1,'2015-04-28 21:20:18',0,'2015-04-28 21:20:18'),(2,'DIA FESTIVO',8,12,1,1,'2015-04-28 21:20:18',0,'2015-04-28 21:20:18'),(3,'DIA CLIENTE FIEL',8,12,1,1,'2015-04-28 21:20:18',0,'2015-04-28 21:20:18');
/*!40000 ALTER TABLE `m_clasificaciondias` ENABLE KEYS */;
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
