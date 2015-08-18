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
-- Table structure for table `m_diassemana`
--

DROP TABLE IF EXISTS `m_diassemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_diassemana` (
  `NumeroDiaSemana` int(11) NOT NULL COMMENT 'Número del día de la Semana',
  `NombreDiaSemana` varchar(20) NOT NULL COMMENT 'Nombre del día de la Semana',
  `IdClasificacionDia` int(11) NOT NULL,
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'Usuario de grabación de registro.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de grabación de registro.',
  `IdUsuarioUltimaModifica` int(11) NOT NULL COMMENT 'Id de usuario que realiza la última modificación.',
  `FechaUltimaModifica` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se realiza la última modificación.',
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  PRIMARY KEY (`NumeroDiaSemana`),
  UNIQUE KEY `NombreDiaSemana_UNIQUE` (`NombreDiaSemana`),
  KEY `fk_m_DiasSemana_m_ClasificacionDias1_idx` (`IdClasificacionDia`),
  CONSTRAINT `fk_m_DiasSemana_m_ClasificacionDias1` FOREIGN KEY (`IdClasificacionDia`) REFERENCES `m_clasificaciondias` (`IdClasificacionDia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_diassemana`
--

LOCK TABLES `m_diassemana` WRITE;
/*!40000 ALTER TABLE `m_diassemana` DISABLE KEYS */;
INSERT INTO `m_diassemana` VALUES (1,'DOMINGO',2,1,'2015-04-28 21:23:42',1,'2015-06-15 11:43:09',1),(2,'LUNES',1,1,'2015-04-28 21:23:42',1,'2015-06-30 23:28:13',1),(3,'MARTES',1,1,'2015-04-28 21:23:42',0,'2015-04-28 21:23:42',1),(4,'MIERCOLES',1,1,'2015-04-28 21:23:42',0,'2015-04-28 21:23:42',1),(5,'JUEVES',1,1,'2015-04-28 21:23:42',0,'2015-04-28 21:23:42',1),(6,'VIERNES',1,1,'2015-04-28 21:23:42',0,'2015-04-28 21:23:42',1),(7,'SABADO',1,1,'2015-04-28 21:23:42',0,'2015-04-28 21:23:42',1);
/*!40000 ALTER TABLE `m_diassemana` ENABLE KEYS */;
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
