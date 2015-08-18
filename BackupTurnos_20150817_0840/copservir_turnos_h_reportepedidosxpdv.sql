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
-- Table structure for table `h_reportepedidosxpdv`
--

DROP TABLE IF EXISTS `h_reportepedidosxpdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_reportepedidosxpdv` (
  `IdReportePedidosxPdv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de registro de registro de interface del reporte de pedidos x pdv',
  `FechaInicio` date NOT NULL COMMENT 'Fecha de Inicio del Informe de Reporte de Pedidos x Pdv',
  `FechaFinal` date NOT NULL COMMENT 'Fecha Final del Informe de Reporte de Pedidos x pdv',
  `IdFlota` int(11) NOT NULL COMMENT 'Número de identificación de flota',
  `CodigoEstadoReporte` int(11) NOT NULL DEFAULT '1' COMMENT 'Código de estado del reporte de pedido x pdv. 1->Pendiente de Procesar  2-> Procesado',
  `IdUsuarioGraba` int(11) NOT NULL COMMENT 'ID Usuario de grabación de registro.',
  `FechaGraba` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de grabación de registro',
  `CodigoEstadoRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Codigo indicador de estado del registro. 1->Activo 0->Inactivo (Eliminado)',
  PRIMARY KEY (`IdReportePedidosxPdv`),
  KEY `fk_h_ReportePedidosxPdv_m_Flotas1_idx` (`IdFlota`),
  CONSTRAINT `fk_h_ReportePedidosxPdv_m_Flotas1` FOREIGN KEY (`IdFlota`) REFERENCES `m_flotas` (`IdFlota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_reportepedidosxpdv`
--

LOCK TABLES `h_reportepedidosxpdv` WRITE;
/*!40000 ALTER TABLE `h_reportepedidosxpdv` DISABLE KEYS */;
INSERT INTO `h_reportepedidosxpdv` VALUES (22,'2015-06-30','2015-07-27',1,1,1,'2015-08-01 00:22:38',1);
/*!40000 ALTER TABLE `h_reportepedidosxpdv` ENABLE KEYS */;
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
