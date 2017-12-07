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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoestado`
--

LOCK TABLES `catalogoestado` WRITE;
/*!40000 ALTER TABLE `catalogoestado` DISABLE KEYS */;
INSERT INTO `catalogoestado` VALUES (1,1000,1000,'Estado Tipo Solicitud'),(2,1000,1,'Activo'),(3,1000,2,'Inactivo'),(4,1001,1001,'Estado Tipo Documento'),(5,1001,1,'Activo'),(6,1001,2,'Inactivo'),(7,1002,1002,'Estado Motivo'),(8,1002,1,'Activo'),(9,1002,2,'Inactivo'),(10,2000,2000,'Estado Solicitud'),(11,2000,1,'Pendiente'),(12,2000,2,'Asignado'),(13,2001,2001,'Notificacion'),(14,2001,1,'Correo'),(15,2001,2,'Domicilio');
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
INSERT INTO `entidad` VALUES (1,'TipoSolicitud','TS',10),(2,'TipoDocumento','TD',3),(3,'Motivo','MO',2),(4,'Persona','PE',69),(5,'Solicitud','SO',0),(6,'Reclamo','',50),(7,'Queja','',8);
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
  `idTipoSolicitud` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMotivoQR`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivoqr`
--

LOCK TABLES `motivoqr` WRITE;
/*!40000 ALTER TABLE `motivoqr` DISABLE KEYS */;
INSERT INTO `motivoqr` VALUES (1,'MO0001','Inadecuado Servicio en Areas Verdes',1,1),(2,'MO0002','Impuesto a la Renta y Arbitrios',1,1),(3,'MO0003','Plataforma de Atencion',1,1),(4,'MO0004','Mantenimiento de veredas',1,2),(5,'MO0005','Ruidos molestos',1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (19,'PE0014','Marlon','Cordova Torres','45477693',1),(20,'PE0015','Marlon','Cordova Torres','45477693',1),(21,'PE0016','Marlon','Cordova Torres','45477693',1),(22,'PE0017','Marlon','Cordova Torres','45477693',1),(23,'PE0018','Marlon','Cordova Torres','45477693',1),(24,'PE0019','Marlon','Cordova Torres','45477693',1),(25,'PE0020','Marlon','Cordova Torres','45477693',1),(26,'PE0021','Marlon','Cordova Torres','45477693',1),(27,'PE0022','Marlon','Cordova Torres','45477693',1),(28,'PE0023','Marlon','Cordova Torres','45477693',1),(29,'PE0024','Marlon','Cordova Torres','45477693',1),(30,'PE0025','Marlon','Cordova Torres','45477693',1),(31,'PE0026','Marlon','Cordova Torres','45477693',1),(32,'PE0027','Marlon','Cordova Torres','45477693',1),(33,'PE0028','Marlon','Cordova Torres','45477693',1),(34,'PE0029','Marlon','Cordova Torres','45477693',1),(35,'PE0030','Marlon','Cordova Torres','45477693',1),(36,'PE0031',' Otro Movimiento','Cordova Torres','45477693',1),(37,'PE0032',' Otro Movimiento','Cordova Torres','45477693',1),(38,'PE0033','Marlon','Cordova Torres','45477693',1),(39,'PE0034','Marlon','Cordova Torres','45477693',1),(40,'PE0035','Marlon','Cordova Torres','45477693',1),(41,'PE0036','Marlon','Cordova Torres','45477693',1),(42,'PE0037','Marlon','Cordova Torres','45477693',1),(43,'PE0038','6776u67u','u76u67u','45477693',1),(44,'PE0039','Marlon','Cordova Torres','45477693',1),(45,'PE0040','demo','cordova','45477693',1),(46,'PE0041','demo d','cordova','45477693',1),(47,'PE0042','Marlon','Cordova Torres','45477693',1),(48,'PE0043','Marlon','Cordova Torres','45477693',1),(49,'PE0044','marlon','cordova','45477693',1),(50,'PE0045','marlon','cordova','45477693',1),(51,'PE0046','Marlon','Cordova','45477693',1),(52,'PE0047','Marlon','Cordova Torres','45477693',1),(53,'PE0048','Marlon','Cordova Torres','45477693',1),(54,'PE0049','Marlon','Cordova Torres','45477693',1),(55,'PE0050','Marlon','Cordova Torres','45477693',1),(56,'PE0051','Marlon','Cordova Torres','45477693',1),(57,'PE0052','43543','545345','45477693',1),(58,'PE0053','Marlon','Cordova Torres','45477693',1),(59,'PE0054','Marlon','Cordova Torres','45477693',1),(60,'PE0055','Marlon','Cordova Torres','45477693',1),(61,'PE0056','Marlon','Cordova Torres','45477693',1),(62,'PE0057','Marlon','Cordova Torres','45477693',1),(63,'PE0058','Marlon','Cordova Torres','45477693',1),(64,'PE0059','Marlon','Cordova Torres','45477693',1),(65,'PE0060','Marlon','Cordova Torres','45477693',1),(66,'PE0061','Marlon','Cordova Torres','45477693',1),(67,'PE0062','Marlon','Cordova Torres','45477693',1),(68,'PE0063','Marlon','Cordova Torres','45477693',1),(69,'PE0064','Marlon','Cordova Torres','45477693',1),(70,'PE0065','Marlon','Cordova Torres','45477693',1),(71,'PE0066','Marlon','Cordova Torres','45477693',1),(72,'PE0067','Marlon','Cordova Torres','45477693',1),(73,'PE0068','Marlon','Cordova Torres','45477693',1),(74,'PE0069','marlon','cordova','45477693',1);
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
INSERT INTO `reclamo` VALUES (12,'2017-0002',''),(15,'2017-0003',''),(16,'2017-0004',''),(17,'2017-0005',''),(18,'2017-0006',''),(19,'2017-0007',''),(21,'2017-0008',''),(22,'2017-0009',''),(23,'2017-0010',''),(24,'2017-0011',''),(25,'2017-0012',''),(26,'2017-0013',''),(28,'2017-0014',''),(29,'2017-0015',''),(31,'2017-0016',''),(33,'2017-0017',''),(34,'2017-0018',''),(35,'2017-0019',''),(36,'2017-0020',''),(37,'2017-0021',''),(38,'2017-0022',''),(39,'2017-0023',''),(40,'2017-000024',''),(41,'2017-000025',''),(42,'2017-000026',''),(43,'2017-000027',''),(44,'2017-000028',''),(45,'2017-000029',''),(46,'2017-000030',''),(47,'2017-000031',''),(48,'2017-000032',''),(49,'2017-000033',''),(50,'2017-000034',''),(51,'2017-000035',''),(52,'2017-000036',''),(53,'2017-000037',''),(54,'2017-000038',''),(55,'2017-000039',''),(56,'2017-000040',''),(58,'2017-000041',''),(59,'2017-000042',''),(60,'2017-000043',''),(61,'2017-000044',''),(62,'2017-000045',''),(63,'2017-000046',''),(64,'2017-000047',''),(65,'2017-000048',''),(66,'2017-000049',''),(67,'2017-000050','');
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
INSERT INTO `solicitante` VALUES (19,'96773435','marloncordova@outlook.com','Av Avenida 124',1),(20,'96773435','marloncordova@outlook.com','Av Avenida 124',1),(21,'96773435','marloncordova@outlook.com','Av Avenida 124',1),(22,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(23,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(24,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(25,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(26,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(27,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(28,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(29,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(30,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(31,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(32,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(33,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(34,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(35,'96773435','marloncordova@outlook.com','hjhjhjghhj',1),(36,'96773435','marloncordova@outlook.com','av',1),(37,'96773435','marloncordova@outlook.com','av',1),(38,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(39,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(40,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(41,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(42,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(43,'55454456456453','marloncordova@outlook.com','76u67u67',1),(44,'96773435','marloncordova@outlook.com','7j7uj7j7',1),(45,'344234','marloncordova@outlook.com','reewrwer',1),(46,'967734361','marloncordova@outlook.com','de',1),(47,'96773435','marloncordova@outlook.com','demnooo',1),(48,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(49,'967734364','marloncordova@outlook.com','87j8k89k',1),(50,'967734364','marloncordova@outlook.com','htyhytht',1),(51,'967734364','marloncordova@outlook.com','Afrgvrtgtr',1),(52,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(53,'96773435','marloncordova@outlook.com','rgferg',1),(54,'96773435','marloncordova@outlook.com','kjjkojjjk',1),(55,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(56,'96773435','marloncordova@outlook.com','tgrth',1),(57,'4354353','marloncordova@outlook.com','43435345',1),(58,'96773435','marloncordova@outlook.com','qweqwe',1),(59,'96773435','marloncordova@outlook.com','t4rggtrgt',1),(60,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(61,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(62,'96773435','marloncordova@outlook.com','iooo',1),(63,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(64,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(65,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(66,'96773435','marloncordova@outlook.com','yuyuuy',1),(67,'96773435','marloncordova@outlook.com','yuyuyyuy',1),(68,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(69,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(70,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(71,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(72,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(73,'96773435','marloncordova@outlook.com','Sector 2, Grupo 24,Mz F, Lote 12',1),(74,'4554567878785','marloncordova@outlook.com','IUUIHIU',1);
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
  `file` varchar(500) DEFAULT NULL,
  `idMotivoQR` int(11) DEFAULT NULL,
  `idTipoSolicitud` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `notificacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSolicitudQR`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudqr`
--

LOCK TABLES `solicitudqr` WRITE;
/*!40000 ALTER TABLE `solicitudqr` DISABLE KEYS */;
INSERT INTO `solicitudqr` VALUES (66,'2017-12-07 13:11:16','popppo','2018-01-06 13:11:16','',0,1,73,1,1),(67,'2017-12-07 14:23:54','RETERETER','2018-01-06 14:23:54','',0,1,74,1,1);
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
INSERT INTO `tipodocumento` VALUES (1,'TP0001','DNI',1),(2,'TP0002','Carné de extranjería',1),(3,'TP0003','Pasaporte',1);
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

-- Dump completed on 2017-12-07 14:46:16
