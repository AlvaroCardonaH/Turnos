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
-- Table structure for table `m_usuarios2`
--

DROP TABLE IF EXISTS `m_usuarios2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_usuarios2` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de Identificación del Usuario',
  `Documento` int(12) NOT NULL,
  `LoginUsuario` varchar(20) NOT NULL COMMENT 'Login del usuario para acceso a la aplicación',
  `ContrasenaUsuario` varchar(50) NOT NULL,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `IdUsuarioGraba` int(11) NOT NULL,
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IdUsuarioUltimaModifica` int(11) DEFAULT NULL,
  `FechaUltimaModifica` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `LoginUsuario_UNIQUE` (`LoginUsuario`),
  UNIQUE KEY `Documento` (`Documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usuarios2`
--

LOCK TABLES `m_usuarios2` WRITE;
/*!40000 ALTER TABLE `m_usuarios2` DISABLE KEYS */;
INSERT INTO `m_usuarios2` VALUES (1,123456789,'ADMIN','49ca68e337a12afbd26e1735634c35bb753ffa76','ADMIN','','ADMIN','',2,'2015-04-25 21:18:10',1,'2015-04-25 22:15:21',1),(2,1143838547,'ALVAROCARDONA','49ca68e337a12afbd26e1735634c35bb753ffa76','ALVARO','JOSE','CARDONA','',2,'2015-04-25 21:19:49',1,'2015-05-05 16:54:23',1),(3,34593957,'ANAHURTADO','49ca68e337a12afbd26e1735634c35bb753ffa76','ANA','CRISTINA','HURTADO','GALARZA',1,'2015-06-15 12:06:21',1,'2015-06-15 12:06:21',1);
/*!40000 ALTER TABLE `m_usuarios2` ENABLE KEYS */;
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
