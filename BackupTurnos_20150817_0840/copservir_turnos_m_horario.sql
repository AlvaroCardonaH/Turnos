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
-- Table structure for table `m_horario`
--

DROP TABLE IF EXISTS `m_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_horario` (
  `IdHorario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de identificación de horario',
  `HoraInicio` varchar(5) NOT NULL COMMENT 'Hora de Inicio',
  `HoraFinal` varchar(5) NOT NULL COMMENT 'Hora Final',
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'Usuario de grabación de registro.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de grabación de registro',
  `IdUsuarioUltimaModifica` int(11) NOT NULL COMMENT 'Id de usuario que realiza la última modificación.',
  `FechaUltimaModifica` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la última modificación.',
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  PRIMARY KEY (`IdHorario`),
  UNIQUE KEY `UNQ_HORARIO` (`HoraInicio`,`HoraFinal`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COMMENT='Tabla con el registro de las horas del dia. Se indica por cada rango de hora, el inicio y final.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_horario`
--

LOCK TABLES `m_horario` WRITE;
/*!40000 ALTER TABLE `m_horario` DISABLE KEYS */;
INSERT INTO `m_horario` VALUES (0,'00:00','00:59',1,'2015-04-28 20:54:23',1,'2015-04-28 20:54:23',1),(1,'01:00','01:59',1,'2015-04-28 20:54:23',1,'2015-04-28 20:54:23',1),(2,'02:00','02:59',1,'2015-04-28 20:54:23',1,'2015-04-28 20:54:23',1),(3,'03:00','03:59',1,'2015-04-28 20:54:23',1,'2015-04-28 20:54:23',1),(4,'04:00','04:59',1,'2015-04-28 20:54:23',1,'2015-04-28 20:54:23',1),(5,'05:00','05:59',1,'2015-04-28 20:54:23',1,'2015-04-28 20:54:23',1),(6,'06:00','06:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(7,'07:00','07:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(8,'08:00','08:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(9,'09:00','09:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(10,'10:00','10:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(11,'11:00','11:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(12,'12:00','12:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(13,'13:00','13:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(14,'14:00','14:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(15,'15:00','15:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(16,'16:00','16:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(17,'17:00','17:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(18,'18:00','18:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(19,'19:00','19:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(20,'20:00','20:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(21,'21:00','21:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(22,'22:00','22:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1),(23,'23:00','23:59',1,'2015-04-28 20:54:24',1,'2015-04-28 20:54:24',1);
/*!40000 ALTER TABLE `m_horario` ENABLE KEYS */;
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
