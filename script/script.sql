-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: atencionciudadano
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `catalogoestado`
--

DROP TABLE IF EXISTS `catalogoestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogoestado` (
  `idCatalogoEstado` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  PRIMARY KEY (`idCatalogoEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoestado`
--

LOCK TABLES `catalogoestado` WRITE;
/*!40000 ALTER TABLE `catalogoestado` DISABLE KEYS */;
INSERT INTO `catalogoestado` VALUES (1,1000,1000,'Estado Tipo Solicitud'),(2,1000,1,'Activo'),(3,1000,2,'Inactivo'),(4,1001,1001,'Estado Tipo Documento'),(5,1001,1,'Activo'),(6,1001,2,'Inactivo'),(7,1002,1002,'Estado Motivo'),(8,1002,1,'Activo'),(9,1002,2,'Inactivo'),(10,2000,2000,'Estado Solicitud'),(11,2000,1,'Pendiente'),(12,2000,2,'Asignado');
/*!40000 ALTER TABLE `catalogoestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidad`
--

DROP TABLE IF EXISTS `entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidad` (
  `idEntidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `nomenclatura` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idEntidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad`
--

LOCK TABLES `entidad` WRITE;
/*!40000 ALTER TABLE `entidad` DISABLE KEYS */;
INSERT INTO `entidad` VALUES (1,'TipoSolicitud','TS',10),(2,'TipoDocumento','TD',3),(3,'Motivo','MO',2),(4,'Persona','PE',36),(5,'Solicitud','SO',0),(6,'Reclamo','',18),(7,'Queja','',7);
/*!40000 ALTER TABLE `entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivoqr`
--

DROP TABLE IF EXISTS `motivoqr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivoqr` (
  `idMotivoQR` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idMotivoQR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivoqr`
--

LOCK TABLES `motivoqr` WRITE;
/*!40000 ALTER TABLE `motivoqr` DISABLE KEYS */;
INSERT INTO `motivoqr` VALUES (1,'MO0001','Motivo 1',1),(2,'MO0002','Motivo 2',1);
/*!40000 ALTER TABLE `motivoqr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `apellido` varchar(500) NOT NULL,
  `numeroDocumento` varchar(50) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (19,'PE0014','Marlon','Cordova Torres','45477693',1),(20,'PE0015','Marlon','Cordova Torres','45477693',1),(21,'PE0016','Marlon','Cordova Torres','45477693',1),(22,'PE0017','Marlon','Cordova Torres','45477693',1),(23,'PE0018','Marlon','Cordova Torres','45477693',1),(24,'PE0019','Marlon','Cordova Torres','45477693',1),(25,'PE0020','Marlon','Cordova Torres','45477693',1),(26,'PE0021','Marlon','Cordova Torres','45477693',1),(27,'PE0022','Marlon','Cordova Torres','45477693',1),(28,'PE0023','Marlon','Cordova Torres','45477693',1),(29,'PE0024','Marlon','Cordova Torres','45477693',1),(30,'PE0025','Marlon','Cordova Torres','45477693',1),(31,'PE0026','Marlon','Cordova Torres','45477693',1),(32,'PE0027','Marlon','Cordova Torres','45477693',1),(33,'PE0028','Marlon','Cordova Torres','45477693',1),(34,'PE0029','Marlon','Cordova Torres','45477693',1),(35,'PE0030','Marlon','Cordova Torres','45477693',1),(36,'PE0031',' Otro Movimiento','Cordova Torres','45477693',1),(37,'PE0032',' Otro Movimiento','Cordova Torres','45477693',1),(38,'PE0033','Marlon','Cordova Torres','45477693',1),(39,'PE0034','Marlon','Cordova Torres','45477693',1),(40,'PE0035','Marlon','Cordova Torres','45477693',1),(41,'PE0036','Marlon','Cordova Torres','45477693',1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queja`
--

DROP TABLE IF EXISTS `queja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queja` (
  `idSolicitudQR` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  PRIMARY KEY (`idSolicitudQR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queja`
--

LOCK TABLES `queja` WRITE;
/*!40000 ALTER TABLE `queja` DISABLE KEYS */;
INSERT INTO `queja` VALUES (30,'2017-0006'),(32,'2017-0007');
/*!40000 ALTER TABLE `queja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamo` (
  `idSolicitudQR` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `codigoSirec` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSolicitudQR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
INSERT INTO `reclamo` VALUES (12,'2017-0002',''),(15,'2017-0003',''),(16,'2017-0004',''),(17,'2017-0005',''),(18,'2017-0006',''),(19,'2017-0007',''),(21,'2017-0008',''),(22,'2017-0009',''),(23,'2017-0010',''),(24,'2017-0011',''),(25,'2017-0012',''),(26,'2017-0013',''),(28,'2017-0014',''),(29,'2017-0015',''),(31,'2017-0016',''),(33,'2017-0017',''),(34,'2017-0018','');
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitante` (
  `idPersona` int(11) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(500) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
INSERT INTO `solicitante` VALUES (19,'96773435','marloncordova@outlook.com','Av Avenida 124',1),(20,'96773435','marloncordova@outlook.com','Av Avenida 124',1),(21,'96773435','marloncordova@outlook.com','Av Avenida 124',1),(22,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(23,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(24,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(25,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(26,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(27,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(28,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(29,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(30,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(31,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(32,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(33,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(34,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(35,'96773435','marloncordova@outlook.com','hjhjhjghhj',1),(36,'96773435','marloncordova@outlook.com','av',1),(37,'96773435','marloncordova@outlook.com','av',1),(38,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(39,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(40,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(41,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1);
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudqr`
--

DROP TABLE IF EXISTS `solicitudqr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudqr` (
  `idSolicitudQR` int(11) NOT NULL AUTO_INCREMENT,
  `fechaCreacion` datetime NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fechaLimite` datetime DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `idMotivoQR` int(11) DEFAULT NULL,
  `idTipoSolicitud` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSolicitudQR`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudqr`
--

LOCK TABLES `solicitudqr` WRITE;
/*!40000 ALTER TABLE `solicitudqr` DISABLE KEYS */;
INSERT INTO `solicitudqr` VALUES (28,'2017-12-05 18:17:33','jjkjkjk','2018-01-04 18:17:33','',1,1,35,1),(29,'2017-12-05 19:29:41','dfsdd','2018-01-04 19:29:41','',1,1,36,1),(30,'2017-12-05 19:30:02','dfsdd','2018-01-04 19:30:02','',1,2,37,1),(31,'2017-12-05 19:38:32','VCVCVCV','2018-01-04 19:38:32','',1,1,38,1),(32,'2017-12-05 19:38:41','VCVCVCV','2018-01-04 19:38:41','',1,2,39,1),(33,'2017-12-05 19:40:29','VCVCVCV','2018-01-04 19:40:29','',1,1,40,1),(34,'2017-12-05 19:54:37','DMSSSSS','2018-01-04 19:54:37','',1,1,41,1);
/*!40000 ALTER TABLE `solicitudqr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'TP0001','DNI',1),(2,'TP0002','Carne de extranjeria',1),(3,'TP0003','Pasaporte',1);
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposolicitud`
--

DROP TABLE IF EXISTS `tiposolicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposolicitud` (
  `idTipoSolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idTipoSolicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposolicitud`
--

LOCK TABLES `tiposolicitud` WRITE;
/*!40000 ALTER TABLE `tiposolicitud` DISABLE KEYS */;
INSERT INTO `tiposolicitud` VALUES (1,'TS0001','Reclamo',1),(2,'TS0002','Queja',1),(3,'TS0003','Sugerencia',1);
/*!40000 ALTER TABLE `tiposolicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'atencionciudadano'
--
/*!50003 DROP FUNCTION IF EXISTS `ufnDevolverEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ufnDevolverEstado`(codigo INT,valor int) RETURNS varchar(500) CHARSET utf8
BEGIN
	 DECLARE new_username VARCHAR(500);

    SELECT ct.nombre
      INTO new_username
      FROM catalogoestado ct      
     WHERE ct.codigo = codigo and ct.valor = valor;

    RETURN COALESCE(new_username, 'Username not found');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspEntidadGenerarCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspEntidadGenerarCodigo`(_entidad varchar(50), OUT _codigo varchar(50))
BEGIN
	declare _nomenclatura varchar(50);
    declare _cantidad int;
    
    select nomenclatura into _nomenclatura from entidad
    where nombre = _entidad;
    
    select cantidad into _cantidad from entidad
    where nombre = _entidad;
    set _cantidad = _cantidad +1;
    
    set _codigo = concat('0000',_cantidad);
    set _codigo = concat(_nomenclatura,right(_codigo,4));
    
    SET SQL_SAFE_UPDATES = 0;

    update entidad set
    cantidad = _cantidad
	where nombre = _entidad;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-05 21:06:22
