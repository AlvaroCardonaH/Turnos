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
-- Table structure for table `m_horarioxflota`
--

DROP TABLE IF EXISTS `m_horarioxflota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_horarioxflota` (
  `IdHorarioxFlota` int(11) NOT NULL AUTO_INCREMENT,
  `IdFlota` int(11) NOT NULL COMMENT 'Número de identificación de flota',
  `IdHorario` int(11) NOT NULL COMMENT 'Id de identificación de horario',
  `NumeroPosicion` int(11) NOT NULL COMMENT 'Orden del rango de hora para la asignación de turnos',
  `EstaHabilitada` int(11) NOT NULL DEFAULT '1' COMMENT 'Indicador de si la hora esta habil para laboral en esa flota. 0-> No Habil\n1-> Habil',
  `EsHoraPico` int(11) NOT NULL DEFAULT '0' COMMENT 'Indicador si la hora en esa flota se considera hora pico.',
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'Id de usuario que registra la transacción.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que se realiza la transacción.',
  `IdUsuarioUltimaModifica` int(11) NOT NULL COMMENT 'Id de usuario que realiza la última modificación.',
  `FechaUltimaModifica` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la última modificación.',
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  PRIMARY KEY (`IdHorarioxFlota`),
  UNIQUE KEY `UNQ_NROPOS_HORFLOTA` (`IdFlota`,`IdHorario`,`NumeroPosicion`),
  KEY `IND_IDFLOTA_HORFLOTA` (`IdFlota`),
  KEY `IND_IDHORARIO_HORFLOTA` (`IdHorario`),
  CONSTRAINT `FK_IDFLOTA_HORFLOTA` FOREIGN KEY (`IdFlota`) REFERENCES `m_flotas` (`IdFlota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_IDHORARIO_HORFLOTA` FOREIGN KEY (`IdHorario`) REFERENCES `m_horario` (`IdHorario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_horarioxflota`
--

LOCK TABLES `m_horarioxflota` WRITE;
/*!40000 ALTER TABLE `m_horarioxflota` DISABLE KEYS */;
INSERT INTO `m_horarioxflota` VALUES (1,1,0,19,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(2,1,1,20,1,0,1,'2015-04-01 05:01:18',0,'2015-04-28 21:28:13',1),(3,1,6,1,1,0,1,'2015-04-01 05:01:18',0,'2015-04-28 21:28:13',1),(4,1,7,2,1,0,1,'2015-04-01 05:01:18',0,'2015-04-28 21:28:13',1),(5,1,8,3,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(6,1,9,4,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(7,1,10,5,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(8,1,11,6,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(9,1,12,7,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(10,1,13,8,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(11,1,14,9,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(12,1,15,10,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(13,1,16,11,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(14,1,17,12,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(15,1,18,13,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(16,1,19,14,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(17,1,20,15,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(18,1,21,16,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(19,1,22,17,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(20,1,23,18,1,0,1,'2015-04-01 05:01:19',0,'2015-04-28 21:28:13',1),(21,1,2,21,1,0,1,'2015-04-01 05:01:18',0,'2015-04-28 21:28:13',1);
/*!40000 ALTER TABLE `m_horarioxflota` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-17  8:39:02
