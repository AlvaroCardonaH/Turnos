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
-- Table structure for table `m_mensajeros`
--

DROP TABLE IF EXISTS `m_mensajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_mensajeros` (
  `IdMensajero` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Mensajero.',
  `Documento` int(11) NOT NULL COMMENT 'Número de documento de identificación de mensajero',
  `PrimerNombre` varchar(15) NOT NULL COMMENT 'Primer nombre',
  `SegundoNombre` varchar(15) DEFAULT NULL COMMENT 'segundonombre',
  `PrimerApellido` varchar(15) NOT NULL COMMENT 'Primer apellido',
  `SegundoApellido` varchar(15) DEFAULT NULL COMMENT 'Segundo apellido',
  `IdFlota` int(11) DEFAULT NULL,
  `JornadaFestivoDominical` int(11) NOT NULL DEFAULT '0',
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'Usuario de grabación de registro.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de grabación de registro',
  `IdUsuarioUltimaModifica` int(11) NOT NULL COMMENT 'Id de usuario que realiza la última modificación.',
  `FechaUltimaModifica` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la última modificación.',
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  `NumeroFestivosDominicales` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`IdMensajero`),
  UNIQUE KEY `UNQ_DOCUMENTO_MENSAJERO` (`Documento`),
  KEY `IND_IDFLOTA_MENSAJERO` (`IdFlota`),
  CONSTRAINT `FK_IDFLOTA_MENSAJERO` FOREIGN KEY (`IdFlota`) REFERENCES `m_flotas` (`IdFlota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COMMENT='Tabla con información de Mensajeros';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_mensajeros`
--

LOCK TABLES `m_mensajeros` WRITE;
/*!40000 ALTER TABLE `m_mensajeros` DISABLE KEYS */;
INSERT INTO `m_mensajeros` VALUES (16,80061822,'ALEXSANDER','','LOPEZ','GUAYANA',1,100,1,'2015-07-28 20:17:39',1,'2015-07-28 20:17:39',1,0.00),(17,1024463378,'JAIRO','ALEJANDRO','CONTRERAS','MAHECHA',1,0,1,'2015-07-28 20:18:09',1,'2015-07-28 20:18:09',1,2.00),(18,1048282755,'JAINER','JOSE','SUAREZ','MONTE',1,0,1,'2015-07-28 20:18:38',1,'2015-07-28 20:18:38',1,0.00),(19,1070326056,'JORFERSON','','MEDINA','MORA',1,100,1,'2015-07-28 20:19:08',1,'2015-07-28 20:19:08',1,0.00),(20,1074908367,'FREDY','ALEXANDER','RODRIGUEZ','',1,100,1,'2015-07-28 20:19:37',1,'2015-07-28 20:19:37',1,1.00),(21,1118805039,'RAMIRO','','PINTO','',1,100,1,'2015-07-28 20:20:09',1,'2015-07-28 20:20:09',1,1.50),(22,7448233,'JOSE','ERNESTO','RODRIGUEZ','GARCIA',1,50,1,'2015-07-28 20:20:45',1,'2015-07-28 20:20:45',1,2.00),(23,79768876,'ADELMO','','LEON','RODRIGUEZ',1,100,1,'2015-07-28 20:21:11',1,'2015-07-28 20:21:11',1,1.00),(24,80158363,'ALBERT','','DIAZ','',1,0,1,'2015-07-28 20:21:35',1,'2015-07-28 20:21:35',1,1.50),(25,80757461,'CESAR','MAURICIO','GARCIA','CARRASCAL',1,50,1,'2015-07-28 20:22:16',1,'2015-07-28 20:22:16',1,0.50);
/*!40000 ALTER TABLE `m_mensajeros` ENABLE KEYS */;
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
