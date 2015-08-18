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
-- Table structure for table `t_programacionsugeridadetalle`
--

DROP TABLE IF EXISTS `t_programacionsugeridadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_programacionsugeridadetalle` (
  `IdProgramacionSugeridaDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `IdProgramacionSugerida` int(11) NOT NULL,
  `NumeroMensajero` int(11) NOT NULL,
  `HoraCero` int(11) NOT NULL DEFAULT '0',
  `HoraUno` int(11) NOT NULL DEFAULT '0',
  `HoraDos` int(11) NOT NULL DEFAULT '0',
  `HoraTres` int(11) NOT NULL DEFAULT '0',
  `HoraCuatro` int(11) NOT NULL DEFAULT '0',
  `HoraCinco` int(11) NOT NULL DEFAULT '0',
  `HoraSeis` int(11) NOT NULL DEFAULT '0',
  `HoraSiete` int(11) NOT NULL DEFAULT '0',
  `HoraOcho` int(11) NOT NULL DEFAULT '0',
  `HoraNueve` int(11) NOT NULL DEFAULT '0',
  `HoraDiez` int(11) NOT NULL DEFAULT '0',
  `HoraOnce` int(11) NOT NULL DEFAULT '0',
  `HoraDoce` int(11) NOT NULL DEFAULT '0',
  `HoraTrece` int(11) NOT NULL DEFAULT '0',
  `HoraCatorce` int(11) NOT NULL DEFAULT '0',
  `HoraQuince` int(11) NOT NULL DEFAULT '0',
  `HoraDieciSeis` int(11) NOT NULL DEFAULT '0',
  `HoraDieciSiete` int(11) NOT NULL DEFAULT '0',
  `HoraDieciOcho` int(11) NOT NULL DEFAULT '0',
  `HoraDieciNueve` int(11) NOT NULL DEFAULT '0',
  `HoraVeinte` int(11) NOT NULL DEFAULT '0',
  `HoraVeintiUna` int(11) NOT NULL DEFAULT '0',
  `HoraVeintiDos` int(11) NOT NULL DEFAULT '0',
  `HoraVeintiTres` int(11) NOT NULL DEFAULT '0',
  `TotalHorasProgramadas` int(11) NOT NULL DEFAULT '0',
  `PorcentajeHoras` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`IdProgramacionSugeridaDetalle`),
  UNIQUE KEY `UNQ_PROGSUGERIDA` (`IdProgramacionSugerida`,`NumeroMensajero`),
  CONSTRAINT `FK_IDPROGSUGERIDA_PROGSUGFET` FOREIGN KEY (`IdProgramacionSugerida`) REFERENCES `t_programacionsugerida` (`IdProgramacionSugerida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_programacionsugeridadetalle`
--

LOCK TABLES `t_programacionsugeridadetalle` WRITE;
/*!40000 ALTER TABLE `t_programacionsugeridadetalle` DISABLE KEYS */;
INSERT INTO `t_programacionsugeridadetalle` VALUES (1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,8,100),(2,1,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,8,100),(3,2,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,9,100),(4,2,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,9,100),(5,3,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,10,100),(6,3,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,10,100),(7,4,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,8,100),(8,4,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,8,100),(9,5,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,9,100),(10,5,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,9,100),(11,6,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,10,100),(12,6,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,10,100),(13,7,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,11,100),(14,7,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,11,100),(15,8,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,12,100),(16,8,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,12,100),(17,9,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,8,100),(18,9,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,8,100),(19,10,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,9,100),(20,10,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,9,100),(21,11,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,10,100),(22,11,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,10,100),(23,12,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,11,100),(24,12,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,11,100),(25,13,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,12,100),(26,13,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,12,100);
/*!40000 ALTER TABLE `t_programacionsugeridadetalle` ENABLE KEYS */;
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
