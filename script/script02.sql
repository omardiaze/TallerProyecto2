-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-03-2018 a las 00:08:00
-- Versión del servidor: 5.5.45
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `atencionciudadano`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspEntidadGenerarCodigo` (`_entidad` VARCHAR(50), OUT `_codigo` VARCHAR(50))  BEGIN
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
    
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `ufnDevolverEstado` (`codigo` INT, `valor` INT) RETURNS VARCHAR(500) CHARSET utf8 BEGIN
	 DECLARE new_username VARCHAR(500);

    SELECT ct.nombre
      INTO new_username
      FROM catalogoestado ct      
     WHERE ct.codigo = codigo and ct.valor = valor;

    RETURN COALESCE(new_username, 'Username not found');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idArea` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idArea`, `nombre`) VALUES
(1, 'Participacion Vecinal'),
(3, 'Seguridad'),
(6, 'Juventud y Deportes'),
(7, 'Proyectos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `idAsignacion` int(11) NOT NULL,
  `observacion` varchar(500) NOT NULL,
  `fecha` datetime NOT NULL,
  `idSolicitudQR` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`idAsignacion`, `observacion`, `fecha`, `idSolicitudQR`, `idPersona`) VALUES
(1, 'demo', '2017-12-20 20:53:11', 67, 75),
(2, 'Observacion requerida', '2017-12-20 21:22:38', 68, 75),
(3, 'Observacion requerida', '2017-12-20 21:22:38', 69, 75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogoestado`
--

CREATE TABLE `catalogoestado` (
  `idCatalogoEstado` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catalogoestado`
--

INSERT INTO `catalogoestado` (`idCatalogoEstado`, `codigo`, `valor`, `nombre`) VALUES
(1, 1000, 1000, 'Estado Tipo Solicitud'),
(2, 1000, 1, 'Activo'),
(3, 1000, 2, 'Inactivo'),
(4, 1001, 1001, 'Estado Tipo Documento'),
(5, 1001, 1, 'Activo'),
(6, 1001, 2, 'Inactivo'),
(7, 1002, 1002, 'Estado Motivo'),
(8, 1002, 1, 'Activo'),
(9, 1002, 2, 'Inactivo'),
(10, 2000, 2000, 'Estado Solicitud'),
(11, 2000, 1, 'Pendiente'),
(12, 2000, 2, 'Aceptado'),
(13, 2001, 2001, 'Notificacion'),
(14, 2001, 1, 'Correo'),
(15, 2001, 2, 'Domicilio'),
(16, 2000, 3, 'Asignado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idPersona` int(11) NOT NULL,
  `idArea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idPersona`, `idArea`) VALUES
(75, 1),
(76, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE `entidad` (
  `idEntidad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nomenclatura` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`idEntidad`, `nombre`, `nomenclatura`, `cantidad`) VALUES
(1, 'TipoSolicitud', 'TS', 10),
(2, 'TipoDocumento', 'TD', 3),
(3, 'Motivo', 'MO', 2),
(4, 'Persona', 'PE', 70),
(5, 'Solicitud', 'SO', 0),
(6, 'Reclamo', '', 52),
(7, 'Queja', '', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivoqr`
--

CREATE TABLE `motivoqr` (
  `idMotivoQR` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` int(11) NOT NULL,
  `idTipoSolicitud` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `motivoqr`
--

INSERT INTO `motivoqr` (`idMotivoQR`, `codigo`, `nombre`, `estado`, `idTipoSolicitud`) VALUES
(1, 'MO0001', 'Inadecuado Servicio en Areas Verdes', 1, 1),
(2, 'MO0002', 'Impuesto a la Renta y Arbitrios', 1, 1),
(3, 'MO0003', 'Plataforma de Atencion', 1, 1),
(4, 'MO0004', 'Mantenimiento de veredas', 1, 2),
(5, 'MO0005', 'Ruidos molestos', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `apellido` varchar(500) NOT NULL,
  `numeroDocumento` varchar(50) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `codigo`, `nombre`, `apellido`, `numeroDocumento`, `idTipoDocumento`) VALUES
(19, 'PE0014', 'Marlon', 'Cordova Torres', '45477693', 1),
(20, 'PE0015', 'Marlon', 'Cordova Torres', '45477693', 1),
(21, 'PE0016', 'Marlon', 'Cordova Torres', '45477693', 1),
(22, 'PE0017', 'Marlon', 'Cordova Torres', '45477693', 1),
(23, 'PE0018', 'Marlon', 'Cordova Torres', '45477693', 1),
(24, 'PE0019', 'Marlon', 'Cordova Torres', '45477693', 1),
(25, 'PE0020', 'Marlon', 'Cordova Torres', '45477693', 1),
(26, 'PE0021', 'Marlon', 'Cordova Torres', '45477693', 1),
(27, 'PE0022', 'Marlon', 'Cordova Torres', '45477693', 1),
(28, 'PE0023', 'Marlon', 'Cordova Torres', '45477693', 1),
(29, 'PE0024', 'Marlon', 'Cordova Torres', '45477693', 1),
(30, 'PE0025', 'Marlon', 'Cordova Torres', '45477693', 1),
(31, 'PE0026', 'Marlon', 'Cordova Torres', '45477693', 1),
(32, 'PE0027', 'Marlon', 'Cordova Torres', '45477693', 1),
(33, 'PE0028', 'Marlon', 'Cordova Torres', '45477693', 1),
(34, 'PE0029', 'Marlon', 'Cordova Torres', '45477693', 1),
(35, 'PE0030', 'Marlon', 'Cordova Torres', '45477693', 1),
(36, 'PE0031', ' Otro Movimiento', 'Cordova Torres', '45477693', 1),
(37, 'PE0032', ' Otro Movimiento', 'Cordova Torres', '45477693', 1),
(38, 'PE0033', 'Marlon', 'Cordova Torres', '45477693', 1),
(39, 'PE0034', 'Marlon', 'Cordova Torres', '45477693', 1),
(40, 'PE0035', 'Marlon', 'Cordova Torres', '45477693', 1),
(41, 'PE0036', 'Marlon', 'Cordova Torres', '45477693', 1),
(42, 'PE0037', 'Marlon', 'Cordova Torres', '45477693', 1),
(43, 'PE0038', '6776u67u', 'u76u67u', '45477693', 1),
(44, 'PE0039', 'Marlon', 'Cordova Torres', '45477693', 1),
(45, 'PE0040', 'demo', 'cordova', '45477693', 1),
(46, 'PE0041', 'demo d', 'cordova', '45477693', 1),
(47, 'PE0042', 'Marlon', 'Cordova Torres', '45477693', 1),
(48, 'PE0043', 'Marlon', 'Cordova Torres', '45477693', 1),
(49, 'PE0044', 'marlon', 'cordova', '45477693', 1),
(50, 'PE0045', 'marlon', 'cordova', '45477693', 1),
(51, 'PE0046', 'Marlon', 'Cordova', '45477693', 1),
(52, 'PE0047', 'Marlon', 'Cordova Torres', '45477693', 1),
(53, 'PE0048', 'Marlon', 'Cordova Torres', '45477693', 1),
(54, 'PE0049', 'Marlon', 'Cordova Torres', '45477693', 1),
(55, 'PE0050', 'Marlon', 'Cordova Torres', '45477693', 1),
(56, 'PE0051', 'Marlon', 'Cordova Torres', '45477693', 1),
(57, 'PE0052', '43543', '545345', '45477693', 1),
(58, 'PE0053', 'Marlon', 'Cordova Torres', '45477693', 1),
(59, 'PE0054', 'Marlon', 'Cordova Torres', '45477693', 1),
(60, 'PE0055', 'Marlon', 'Cordova Torres', '45477693', 1),
(61, 'PE0056', 'Marlon', 'Cordova Torres', '45477693', 1),
(62, 'PE0057', 'Marlon', 'Cordova Torres', '45477693', 1),
(63, 'PE0058', 'Marlon', 'Cordova Torres', '45477693', 1),
(64, 'PE0059', 'Marlon', 'Cordova Torres', '45477693', 1),
(65, 'PE0060', 'Marlon', 'Cordova Torres', '45477693', 1),
(66, 'PE0061', 'Marlon', 'Cordova Torres', '45477693', 1),
(67, 'PE0062', 'Marlon', 'Cordova Torres', '45477693', 1),
(68, 'PE0063', 'Marlon', 'Cordova Torres', '45477693', 1),
(69, 'PE0064', 'Marlon', 'Cordova Torres', '45477693', 1),
(70, 'PE0065', 'Marlon', 'Cordova Torres', '45477693', 1),
(71, 'PE0066', 'Marlon', 'Cordova Torres', '45477693', 1),
(72, 'PE0067', 'Marlon', 'Cordova Torres', '45477693', 1),
(73, 'PE0068', 'Marlon', 'Cordova Torres', '45477693', 1),
(74, 'PE0069', 'marlon', 'cordova', '45477693', 1),
(75, 'pe001', 'Omar Diaz', 'Diaz', '1234556', 1),
(76, 'pe002', 'Brayan Bonifaz', 'Bonifaz', '54454455445', 1),
(78, 'PE0070', 'Brayan', 'Bonifaz Samaniego', '47743593', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `queja`
--

CREATE TABLE `queja` (
  `idSolicitudQR` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo`
--

CREATE TABLE `reclamo` (
  `idSolicitudQR` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `codigoSirec` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reclamo`
--

INSERT INTO `reclamo` (`idSolicitudQR`, `numero`, `codigoSirec`) VALUES
(12, '2017-0002', ''),
(15, '2017-0003', ''),
(16, '2017-0004', ''),
(17, '2017-0005', ''),
(18, '2017-0006', ''),
(19, '2017-0007', ''),
(21, '2017-0008', ''),
(22, '2017-0009', ''),
(23, '2017-0010', ''),
(24, '2017-0011', ''),
(25, '2017-0012', ''),
(26, '2017-0013', ''),
(28, '2017-0014', ''),
(29, '2017-0015', ''),
(31, '2017-0016', ''),
(33, '2017-0017', ''),
(34, '2017-0018', ''),
(35, '2017-0019', ''),
(36, '2017-0020', ''),
(37, '2017-0021', ''),
(38, '2017-0022', ''),
(39, '2017-0023', ''),
(40, '2017-000024', ''),
(41, '2017-000025', ''),
(42, '2017-000026', ''),
(43, '2017-000027', ''),
(44, '2017-000028', ''),
(45, '2017-000029', ''),
(46, '2017-000030', ''),
(47, '2017-000031', ''),
(48, '2017-000032', ''),
(49, '2017-000033', ''),
(50, '2017-000034', ''),
(51, '2017-000035', ''),
(52, '2017-000036', ''),
(53, '2017-000037', ''),
(54, '2017-000038', ''),
(55, '2017-000039', ''),
(56, '2017-000040', ''),
(58, '2017-000041', ''),
(59, '2017-000042', ''),
(60, '2017-000043', ''),
(61, '2017-000044', ''),
(62, '2017-000045', ''),
(63, '2017-000046', ''),
(64, '2017-000047', ''),
(65, '2017-000048', ''),
(66, '2017-000049', ''),
(67, '2017-000050', ''),
(68, '2017-000051', ''),
(69, '2017-000052', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitante`
--

CREATE TABLE `solicitante` (
  `idPersona` int(11) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(500) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitante`
--

INSERT INTO `solicitante` (`idPersona`, `telefono`, `correo`, `direccion`, `estado`) VALUES
(19, '96773435', 'marloncordova@outlook.com', 'Av Avenida 124', 1),
(20, '96773435', 'marloncordova@outlook.com', 'Av Avenida 124', 1),
(21, '96773435', 'marloncordova@outlook.com', 'Av Avenida 124', 1),
(22, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(23, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(24, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(25, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(26, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(27, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(28, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(29, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(30, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(31, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(32, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(33, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(34, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(35, '96773435', 'marloncordova@outlook.com', 'hjhjhjghhj', 1),
(36, '96773435', 'marloncordova@outlook.com', 'av', 1),
(37, '96773435', 'marloncordova@outlook.com', 'av', 1),
(38, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(39, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(40, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(41, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(42, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(43, '55454456456453', 'marloncordova@outlook.com', '76u67u67', 1),
(44, '96773435', 'marloncordova@outlook.com', '7j7uj7j7', 1),
(45, '344234', 'marloncordova@outlook.com', 'reewrwer', 1),
(46, '967734361', 'marloncordova@outlook.com', 'de', 1),
(47, '96773435', 'marloncordova@outlook.com', 'demnooo', 1),
(48, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(49, '967734364', 'marloncordova@outlook.com', '87j8k89k', 1),
(50, '967734364', 'marloncordova@outlook.com', 'htyhytht', 1),
(51, '967734364', 'marloncordova@outlook.com', 'Afrgvrtgtr', 1),
(52, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(53, '96773435', 'marloncordova@outlook.com', 'rgferg', 1),
(54, '96773435', 'marloncordova@outlook.com', 'kjjkojjjk', 1),
(55, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(56, '96773435', 'marloncordova@outlook.com', 'tgrth', 1),
(57, '4354353', 'marloncordova@outlook.com', '43435345', 1),
(58, '96773435', 'marloncordova@outlook.com', 'qweqwe', 1),
(59, '96773435', 'marloncordova@outlook.com', 't4rggtrgt', 1),
(60, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(61, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(62, '96773435', 'marloncordova@outlook.com', 'iooo', 1),
(63, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(64, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(65, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(66, '96773435', 'marloncordova@outlook.com', 'yuyuuy', 1),
(67, '96773435', 'marloncordova@outlook.com', 'yuyuyyuy', 1),
(68, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(69, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(70, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(71, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(72, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(73, '96773435', 'marloncordova@outlook.com', 'Sector 2, Grupo 24,Mz F, Lote 12', 1),
(74, '4554567878785', 'marloncordova@outlook.com', 'IUUIHIU', 1),
(78, '999999999', 'omardiaze@gmail.com', 'Av. Aviacion 4674', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudqr`
--

CREATE TABLE `solicitudqr` (
  `idSolicitudQR` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fechaLimite` datetime DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL,
  `idMotivoQR` int(11) DEFAULT NULL,
  `idTipoSolicitud` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `notificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitudqr`
--

INSERT INTO `solicitudqr` (`idSolicitudQR`, `fechaCreacion`, `descripcion`, `fechaLimite`, `file`, `idMotivoQR`, `idTipoSolicitud`, `idPersona`, `estado`, `notificacion`) VALUES
(66, '2017-12-07 13:11:16', 'popppo', '2018-01-06 13:11:16', '', 0, 1, 73, 1, 1),
(67, '2017-12-07 14:23:54', 'RETERETER', '2018-01-06 14:23:54', '', 0, 1, 74, 3, 1),
(68, '2017-12-20 20:44:22', 'demo', '2018-01-19 20:44:22', '', NULL, 1, 19, 3, 1),
(69, '2017-12-20 21:20:17', 'Reclamo por areas verdes', '2018-01-19 21:20:17', '', 1, 1, 78, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`idTipoDocumento`, `codigo`, `nombre`, `estado`) VALUES
(1, 'TP0001', 'DNI', 1),
(2, 'TP0002', 'Carné de extranjería', 1),
(3, 'TP0003', 'Pasaporte', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposolicitud`
--

CREATE TABLE `tiposolicitud` (
  `idTipoSolicitud` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposolicitud`
--

INSERT INTO `tiposolicitud` (`idTipoSolicitud`, `codigo`, `nombre`, `estado`) VALUES
(1, 'TS0001', 'Reclamo', 1),
(2, 'TS0002', 'Queja', 1),
(3, 'TS0003', 'Sugerencia', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`idAsignacion`);

--
-- Indices de la tabla `catalogoestado`
--
ALTER TABLE `catalogoestado`
  ADD PRIMARY KEY (`idCatalogoEstado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`idEntidad`);

--
-- Indices de la tabla `motivoqr`
--
ALTER TABLE `motivoqr`
  ADD PRIMARY KEY (`idMotivoQR`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `queja`
--
ALTER TABLE `queja`
  ADD PRIMARY KEY (`idSolicitudQR`);

--
-- Indices de la tabla `reclamo`
--
ALTER TABLE `reclamo`
  ADD PRIMARY KEY (`idSolicitudQR`);

--
-- Indices de la tabla `solicitante`
--
ALTER TABLE `solicitante`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `solicitudqr`
--
ALTER TABLE `solicitudqr`
  ADD PRIMARY KEY (`idSolicitudQR`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tiposolicitud`
--
ALTER TABLE `tiposolicitud`
  ADD PRIMARY KEY (`idTipoSolicitud`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `idAsignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `catalogoestado`
--
ALTER TABLE `catalogoestado`
  MODIFY `idCatalogoEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT de la tabla `entidad`
--
ALTER TABLE `entidad`
  MODIFY `idEntidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `motivoqr`
--
ALTER TABLE `motivoqr`
  MODIFY `idMotivoQR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT de la tabla `solicitudqr`
--
ALTER TABLE `solicitudqr`
  MODIFY `idSolicitudQR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tiposolicitud`
--
ALTER TABLE `tiposolicitud`
  MODIFY `idTipoSolicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
