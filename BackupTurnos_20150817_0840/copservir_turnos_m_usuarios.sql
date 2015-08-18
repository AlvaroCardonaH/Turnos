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
-- Table structure for table `m_usuarios`
--

DROP TABLE IF EXISTS `m_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroDocumento` int(11) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `PrimerNombre` varchar(15) NOT NULL,
  `SegundoNombre` varchar(15) DEFAULT NULL,
  `PrimerApellido` varchar(15) NOT NULL,
  `SegundoApellido` varchar(15) DEFAULT NULL,
  `EmailUsuario` varchar(255) NOT NULL,
  `IdRol` int(11) NOT NULL,
  `IdEstadoRegistro` int(11) NOT NULL,
  `Activo` int(11) DEFAULT '1',
  `IdUsuarioGraba` int(11) NOT NULL,
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IdUsuarioModifica` int(11) NOT NULL,
  `FechaModifica` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auth_key` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_strategy` varchar(45) DEFAULT NULL,
  `salt` varchar(45) DEFAULT NULL,
  `login_attempts` int(11) DEFAULT NULL,
  `login_time` int(11) DEFAULT NULL,
  `login_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `EmailUsuario_UNIQUE` (`EmailUsuario`),
  UNIQUE KEY `NumeroDocumento_UNIQUE` (`NumeroDocumento`),
  KEY `FK_IDROL_USUARIOS_idx` (`IdRol`),
  KEY `FK_IDREGISTRO_USUARIOS_idx` (`IdEstadoRegistro`),
  CONSTRAINT `FK_IDREGISTRO_USUARIOS` FOREIGN KEY (`IdEstadoRegistro`) REFERENCES `m_estadosregistro` (`IdEstadoRegistro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_IDROL_USUARIOS` FOREIGN KEY (`IdRol`) REFERENCES `m_roles` (`IdRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_usuarios`
--

LOCK TABLES `m_usuarios` WRITE;
/*!40000 ALTER TABLE `m_usuarios` DISABLE KEYS */;
INSERT INTO `m_usuarios` VALUES (5,1143838547,'ADMIN','ALVARO','','CARDONA','HURTADO','alvaro.cardona@datacssa.com',1,1,1,4,'2015-07-07 19:00:04',5,'2015-07-07 20:33:48',NULL,'28707498225c3fe178c5326a89e38164',NULL,NULL,NULL,36,'127.0.0.1');
/*!40000 ALTER TABLE `m_usuarios` ENABLE KEYS */;
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
