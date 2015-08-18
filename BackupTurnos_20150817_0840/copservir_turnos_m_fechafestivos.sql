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
-- Table structure for table `m_fechafestivos`
--

DROP TABLE IF EXISTS `m_fechafestivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_fechafestivos` (
  `IdFechaFestivo` int(11) NOT NULL AUTO_INCREMENT,
  `FechaFestivo` date NOT NULL,
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'Id. Usuario de Grabación de Registro.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de Grabación de Registro.',
  `IdUsuarioUltimaModifica` int(11) DEFAULT NULL COMMENT 'Id. usuario que realiza la ultima modificación del registro.',
  `FechaUltimaModifica` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha del Usuario que realiza la última Modificación del Registro.',
  `CodigoEstadoRegistro` int(11) DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  PRIMARY KEY (`IdFechaFestivo`),
  UNIQUE KEY `FechaFestivo_UNIQUE` (`FechaFestivo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_fechafestivos`
--

LOCK TABLES `m_fechafestivos` WRITE;
/*!40000 ALTER TABLE `m_fechafestivos` DISABLE KEYS */;
INSERT INTO `m_fechafestivos` VALUES (1,'2015-01-01',1,'2015-04-15 04:54:19',1,'2015-05-05 21:30:07',1),(2,'2015-01-12',1,'2015-04-15 04:54:59',0,'0000-00-00 00:00:00',1),(3,'2015-03-23',1,'2015-04-15 04:55:11',0,'0000-00-00 00:00:00',1),(4,'2015-04-02',1,'2015-04-15 04:56:04',0,'0000-00-00 00:00:00',1),(5,'2015-04-03',1,'2015-04-15 04:56:04',0,'0000-00-00 00:00:00',1),(6,'2015-05-01',1,'2015-04-15 04:56:45',0,'0000-00-00 00:00:00',1),(7,'2015-05-18',1,'2015-04-15 04:56:45',0,'0000-00-00 00:00:00',1),(8,'2015-06-08',1,'2015-04-15 04:57:41',0,'0000-00-00 00:00:00',1),(9,'2015-06-15',1,'2015-04-15 04:57:41',0,'0000-00-00 00:00:00',1),(10,'2015-06-29',1,'2015-04-15 04:57:41',0,'0000-00-00 00:00:00',1),(11,'2015-07-20',1,'2015-04-15 04:58:49',0,'0000-00-00 00:00:00',1),(12,'2015-08-07',1,'2015-04-15 04:58:49',0,'0000-00-00 00:00:00',1),(13,'2015-08-17',1,'2015-04-15 04:58:49',0,'0000-00-00 00:00:00',1),(14,'2015-10-12',1,'2015-04-15 05:00:35',0,'0000-00-00 00:00:00',1),(15,'2015-11-02',1,'2015-04-15 05:00:35',0,'0000-00-00 00:00:00',1),(16,'2015-11-16',1,'2015-04-15 05:00:35',0,'0000-00-00 00:00:00',1),(17,'2015-12-08',1,'2015-04-15 05:00:35',0,'0000-00-00 00:00:00',1),(18,'2015-12-25',1,'2015-04-15 05:00:35',0,'0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `m_fechafestivos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-17  8:39:03
