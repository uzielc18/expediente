-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2018 a las 06:14:11
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `historias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclauditorias`
--

CREATE TABLE `aclauditorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `aclusuarios_id` int(10) UNSIGNED NOT NULL,
  `accion_realizada` text,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `created` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclcargos`
--

CREATE TABLE `aclcargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `abr` varchar(45) DEFAULT NULL,
  `aclempresas_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclconfiguraciones`
--

CREATE TABLE `aclconfiguraciones` (
  `id` int(10) NOT NULL,
  `variable` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `valor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclconfiguraciones`
--

INSERT INTO `aclconfiguraciones` (`id`, `variable`, `valor`) VALUES
(1, 'IGV', '0.18'),
(2, 'INVENTARIO_ID_SP', '1'),
(3, 'ANIO', '2017'),
(4, 'id_guia_ultimo_ingreso_plegador', '5785'),
(5, 'RETENCION', '0.03'),
(7, 'DETRACCION', '0.10'),
(8, 'MIN_PRODUCCION', '70'),
(9, 'INVENTARIO_ID_SC', '2'),
(10, 'SOLES', '1'),
(11, 'DOLARES', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acldatos`
--

CREATE TABLE `acldatos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `appaterno` varchar(250) DEFAULT NULL,
  `apmaterno` varchar(250) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `telefono` varchar(18) DEFAULT NULL,
  `celular` varchar(18) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `fnacimiento` date DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `aclusuarios_id` int(10) UNSIGNED DEFAULT NULL,
  `aclempresas_id` int(11) DEFAULT NULL,
  `filiaciones_id` int(11) NOT NULL,
  `aclcargos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acldatos`
--

INSERT INTO `acldatos` (`id`, `nombre`, `appaterno`, `apmaterno`, `dni`, `telefono`, `celular`, `correo`, `direccion`, `fnacimiento`, `fecha_at`, `fecha_in`, `estado`, `userid`, `aclusuarios_id`, `aclempresas_id`, `filiaciones_id`, `aclcargos_id`) VALUES
(2, 'ADIEL', 'CARPIO', 'VILLANUEVA', '44220498', '5831843', '949227178', '1302@hotmail.com', 'Cal. Las Retamas Mz. B Lt. 2 Los Pinos-La Molina', '1987-02-13', NULL, '2014-02-05 10:52:48', '1', 1, 2, 1, 0, 0),
(3, 'UZIEL', 'CARPIO', 'VILLANUEVA', '43408841', '3592197', '990005806', 'uzielc18@hotmail.com', 'Urb. San Francisco Mz C Lt 12', '1985-12-15', NULL, '2014-12-03 13:15:54', '1', 1, 3, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclempresas`
--

CREATE TABLE `aclempresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `abr` varchar(25) DEFAULT NULL,
  `razonsocial` varchar(250) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `detalle` text,
  `telefonos` varchar(50) DEFAULT NULL,
  `telefonos1` varchar(50) DEFAULT NULL,
  `telefonos2` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclempresas`
--

INSERT INTO `aclempresas` (`id`, `nombre`, `abr`, `razonsocial`, `ruc`, `direccion`, `detalle`, `telefonos`, `telefonos1`, `telefonos2`, `activo`, `estado`, `logo`, `fecha_at`) VALUES
(1, 'Control de historias en el HPNP', 'S. Patricia', 'Cirujia', '20101619241', 'ATE LIMA LIMA', 'cirujia', '4361203', '4361203', '116', 1, '1', 'logoSP.png', '2012-04-19 09:08:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclmenus`
--

CREATE TABLE `aclmenus` (
  `id` int(10) UNSIGNED NOT NULL,
  `aclmenus_id` int(10) UNSIGNED DEFAULT NULL,
  `aclrecursos_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `posicion` int(11) DEFAULT NULL,
  `clases` varchar(50) DEFAULT NULL,
  `class_new` varchar(100) DEFAULT NULL,
  `visible_en` int(1) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `ubicacion` tinyint(1) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclmenus`
--

INSERT INTO `aclmenus` (`id`, `aclmenus_id`, `aclrecursos_id`, `nombre`, `url`, `posicion`, `clases`, `class_new`, `visible_en`, `activo`, `ubicacion`, `fecha_at`, `fecha_in`, `userid`) VALUES
(1, 18, 1, 'Usuarios', 'admin/usuarios', 2, 'user', 'user', 2, 1, 3, NULL, '2012-04-24 09:58:23', NULL),
(3, 18, 2, 'Roles', 'admin/roles', 3, 'users', 'users', 2, 1, 3, NULL, '2012-04-19 10:42:04', NULL),
(4, 18, 3, 'Recursos', 'admin/recursos', 4, 'user', NULL, 2, 1, 3, NULL, '2018-01-10 11:58:27', NULL),
(5, 18, 4, 'Menu', 'admin/menu', 5, 'user', NULL, 2, 1, 3, NULL, '2018-01-10 12:00:52', NULL),
(7, 18, 5, 'Privilegios', 'admin/privilegios', 6, NULL, NULL, 2, 1, 3, NULL, '2012-04-19 10:42:20', NULL),
(18, NULL, 17, 'Administracion', 'admin/usuarios/index', 2, 'administrar', 'cogs', 2, 1, 3, NULL, '2018-01-12 01:15:53', NULL),
(19, NULL, 14, 'Mi Perfil', 'admin/usuarios/perfil', 8, 'usuario', 'user', 3, 1, 1, NULL, '2013-12-06 17:25:45', NULL),
(21, 18, 15, 'Config. Aplicacion', 'admin', 7, NULL, NULL, 2, 1, 3, NULL, '2012-04-19 10:42:41', NULL),
(22, 18, 18, 'Auditorias', 'admin/auditorias', 8, NULL, NULL, 2, 1, 3, NULL, '2012-04-19 10:42:48', NULL),
(23, NULL, 20, 'Empresas', 'admin/aclempresas', 1, 'empresas', 'industry', 2, 1, 3, '2012-04-19 10:41:40', '2018-01-15 23:15:33', NULL),
(24, 32, 21, 'Areas', 'admin/plareas', 9, NULL, NULL, 2, 1, 1, '2012-04-19 12:20:25', '2012-06-25 11:24:15', 3),
(28, NULL, 15, 'Admin', 'admin/index/bienvenido', 3, NULL, NULL, 1, 1, 1, '2012-04-19 13:37:17', '2018-01-11 22:52:18', 3),
(48, 32, 45, 'Plan de Cuentas', 'admin/cuentas', 8, NULL, NULL, 2, 1, 1, '2012-05-21 09:39:35', '2012-06-26 09:42:07', 3),
(53, 32, 33, 'Cargos', 'admin/placargos', 4, NULL, NULL, 2, 1, 1, '2012-06-04 11:44:06', '2012-06-25 12:34:06', 3),
(58, 32, 60, 'Variables', 'admin/configuraciones', 8, NULL, NULL, 2, 1, 1, '2012-07-30 12:41:57', NULL, 3),
(92, 32, 88, 'Almacenes', 'admin/almacenes', 10, NULL, NULL, 2, 1, 1, '2012-12-10 17:09:50', NULL, 3),
(180, 32, 60, 'Configuraciones', 'admin/configuraciones', 50, NULL, NULL, 2, 1, 1, '2015-04-07 10:32:57', NULL, 3),
(182, NULL, 61, 'Aplicacion', 'apps/index', 1, NULL, NULL, 2, 1, 1, '2018-01-11 22:34:58', '2018-01-11 22:52:06', 3),
(183, NULL, 62, 'Enfermedades', 'admin/admin_enfermedades', 3, NULL, 'btc', 2, 1, 3, '2018-01-15 23:17:26', '2018-01-15 23:18:06', 3),
(184, NULL, 63, 'Admin Datos usuarios', 'admin/admin_acldatos', 4, NULL, 'smile-o', 2, 1, 3, '2018-01-16 10:34:50', NULL, 3),
(185, NULL, 11, 'Pagina de inicio', 'index/', 1, NULL, 'fa-globe', 3, 1, 1, '2018-01-28 23:25:03', '2018-01-28 23:26:36', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclpermisos`
--

CREATE TABLE `aclpermisos` (
  `id` int(10) UNSIGNED NOT NULL,
  `aclroles_id` int(10) UNSIGNED NOT NULL,
  `aclrecursos_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclpermisos`
--

INSERT INTO `aclpermisos` (`id`, `aclroles_id`, `aclrecursos_id`) VALUES
(1171, 4, 30),
(5580, 7, 58),
(5899, 7, 104),
(6179, 7, 125),
(6279, 7, 14),
(6288, 7, 11),
(6297, 7, 19),
(6306, 7, 25),
(6323, 7, 23),
(6337, 7, 26),
(10288, 2, 183),
(10289, 4, 183),
(10350, 2, 88),
(10351, 4, 88),
(10362, 2, 33),
(10363, 4, 33),
(10536, 2, 20),
(10537, 4, 20),
(10538, 2, 64),
(10539, 4, 64),
(10540, 2, 63),
(10541, 4, 63),
(10542, 2, 62),
(10543, 4, 62),
(10544, 2, 18),
(10545, 4, 18),
(10546, 2, 60),
(10547, 4, 60),
(10548, 2, 45),
(10549, 4, 45),
(10550, 2, 15),
(10551, 4, 15),
(10552, 2, 4),
(10553, 4, 4),
(10554, 2, 21),
(10555, 4, 21),
(10556, 2, 5),
(10557, 4, 5),
(10558, 2, 3),
(10559, 4, 3),
(10560, 2, 2),
(10561, 4, 2),
(10562, 2, 46),
(10563, 4, 46),
(10564, 2, 1),
(10565, 4, 1),
(10566, 2, 17),
(10567, 4, 17),
(10568, 2, 14),
(10569, 4, 14),
(10570, 2, 61),
(10571, 4, 61),
(10572, 2, 11),
(10573, 4, 11),
(10574, 2, 19),
(10575, 4, 19),
(10576, 2, 25),
(10577, 4, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclrecursos`
--

CREATE TABLE `aclrecursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `modulo` varchar(100) DEFAULT NULL,
  `controlador` varchar(100) DEFAULT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `recurso` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclrecursos`
--

INSERT INTO `aclrecursos` (`id`, `modulo`, `controlador`, `accion`, `recurso`, `descripcion`, `activo`, `fecha_at`, `fecha_in`, `estado`, `userid`) VALUES
(1, 'admin', 'usuarios', NULL, 'admin/usuarios/*', 'modulo para la administracion de los usuarios del sistema', 1, NULL, '2012-04-24 13:11:06', NULL, NULL),
(2, 'admin', 'roles', NULL, 'admin/roles/*', 'modulo para la gestion de los roles de la aplicacion\r\n', 1, NULL, NULL, NULL, NULL),
(3, 'admin', 'recursos', NULL, 'admin/recursos/*', 'modulo para la gestion de los recursos de la aplicacion', 1, NULL, NULL, NULL, NULL),
(4, 'admin', 'menu', NULL, 'admin/menu/*', 'modulo para la administracion del menu en la app', 1, NULL, NULL, NULL, NULL),
(5, 'admin', 'privilegios', NULL, 'admin/privilegios/*', 'modulo para la administracion de los privilegios que tendra cada rol', 1, NULL, NULL, NULL, NULL),
(11, NULL, 'index', NULL, 'index/*', 'modulo inicial del sistema, donde se loguean los usuarios y donde se desloguean', 1, NULL, NULL, NULL, NULL),
(14, 'admin', 'usuarios', 'perfil', 'admin/usuarios/perfil', 'modulo para la configuracion del perfil del usuario', 1, NULL, NULL, NULL, NULL),
(15, 'admin', 'index', NULL, 'admin/index/*', 'modulo para la configuraciÃ³n del sistema', 1, NULL, NULL, NULL, NULL),
(17, 'admin', 'usuarios', 'index', 'admin/usuarios/index', 'modulo para listar los usuarios del sistema, lo usarÃƒÂ¡ el menu administracion', 1, NULL, NULL, NULL, NULL),
(18, 'admin', 'auditorias', NULL, 'admin/auditorias/*', 'Modulo para revisar las acciones que los usuarios han realizado en el sistema', 1, NULL, NULL, NULL, NULL),
(19, NULL, 'index', 'index', 'index/index', 'recurso que no necesita permisos, es solo de prueba :-)', 1, NULL, NULL, NULL, NULL),
(20, 'admin', 'aclempresas', NULL, 'admin/aclempresas/*', 'para la creaciÃ³n de empresas', 1, '2012-04-19 10:12:50', NULL, NULL, NULL),
(21, 'admin', 'plareas', NULL, 'admin/plareas/*', 'CreaciÃ³n de las Ã¡reas por empresas', 1, '2012-04-19 12:18:44', NULL, NULL, NULL),
(25, NULL, 'logout', NULL, 'logout/*', 'PARA SALIR DEL SISTEMA', 1, '2012-04-24 13:27:39', NULL, NULL, NULL),
(45, 'admin', 'cuentas', NULL, 'admin/cuentas/*', 'Plan de cuentas son de 2 digitos', 1, '2012-05-10 09:09:36', NULL, NULL, NULL),
(46, 'admin', 'subcuentas', NULL, 'admin/subcuentas/*', 'Crea las sub cuentas', 1, '2012-05-10 09:10:25', NULL, NULL, NULL),
(60, 'admin', 'configuraciones', NULL, 'admin/configuraciones/*', 'ConfiguraciÃ³n de las variables', 1, '2012-07-30 12:38:55', NULL, NULL, NULL),
(61, 'apps', 'index', NULL, 'apps/index/*', 'index de bienvenida', 1, '2018-01-11 22:30:45', NULL, NULL, NULL),
(62, 'admin', 'admin_enfermedades', NULL, 'admin/admin_enfermedades/*', 'Admin Enfermedades', 1, '2018-01-15 23:14:56', NULL, NULL, NULL),
(63, 'admin', 'admin_acldatos', NULL, 'admin/admin_acldatos/*', 'Control Rapido de DAtos ', 1, '2018-01-16 10:33:39', NULL, NULL, NULL),
(64, 'admin', 'admin_aclcargos', NULL, 'admin/admin_aclcargos/*', 'admin de cargos', 1, '2018-01-16 14:17:27', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclroles`
--

CREATE TABLE `aclroles` (
  `id` int(10) UNSIGNED NOT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `padres` varchar(200) DEFAULT NULL,
  `plantilla` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclroles`
--

INSERT INTO `aclroles` (`id`, `rol`, `padres`, `plantilla`, `activo`, `fecha_at`, `fecha_in`, `userid`) VALUES
(1, 'usuario comun', NULL, NULL, 0, NULL, '2013-01-24 12:58:42', NULL),
(2, 'usuario administrador', NULL, NULL, 1, NULL, '2014-03-24 11:44:01', NULL),
(4, 'administrador del sistema', NULL, NULL, 1, NULL, '2012-06-20 09:22:31', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclubicaciones`
--

CREATE TABLE `aclubicaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclusuarios`
--

CREATE TABLE `aclusuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `aclempresas_id` int(10) UNSIGNED NOT NULL,
  `aclroles_id` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `nombres` varchar(250) DEFAULT NULL,
  `clave` varchar(200) DEFAULT NULL,
  `keyseguridad` varchar(250) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclusuarios`
--

INSERT INTO `aclusuarios` (`id`, `aclempresas_id`, `aclroles_id`, `usuario`, `nombres`, `clave`, `keyseguridad`, `picture`, `activo`, `fecha_at`, `fecha_in`, `estado`, `userid`) VALUES
(1, 1, 2, 'Administrador', 'Administrador', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'avatar5.png', 1, '2012-04-19 11:38:30', '2018-01-16 10:55:38', '1', 3),
(2, 1, 2, 'adiel', 'Adiel', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'avatar2.png', 1, '2012-05-08 13:30:10', '2018-01-16 10:37:37', '1', 1),
(3, 1, 2, 'uziel', 'Uziel', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'avatar2.png', 1, '2014-12-02 09:04:03', '2018-01-16 10:37:01', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` int(10) UNSIGNED DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id`, `codigo`, `descripcion`, `activo`, `fecha_at`) VALUES
(1, 10, 'EFECTIVO Y EQUIVALENTES DE EFECTIVO', 1, '2012-05-07 10:39:59'),
(3, 11, 'INVERCIONES FINANACIERAS', 1, '2012-05-07 11:17:34'),
(4, 12, 'CUENTAS POR COBRAR COMERCIALES-TERCEROS', 1, '2012-05-07 11:18:00'),
(5, 13, 'CUENTAS POR COBRAR COMERCIALES-RELACIONADAS', 1, '2012-05-07 11:18:29'),
(6, 14, 'CUENTAS POR COBRAR AL PERSONAL, A LOS ACCIONISTAS ', 1, '2012-05-07 11:18:54'),
(7, 16, 'CUENTAS POR COBRAR DIVERSAS - TERCEROS            ', 1, '2012-05-07 11:19:18'),
(8, 17, 'CUENTAS POR COBRAR DIVERSAS - RELACIONADAS    ', 1, '2012-05-07 11:19:32'),
(9, 18, 'SERVICIOS Y OTROS CONTRATADOS POR ANTICIPADO ', 1, '2012-05-07 11:19:48'),
(10, 19, 'ESTIMACIÃ N DE CUENTAS DE COBRANZA DUDOSA          ', 1, '2012-05-07 11:20:02'),
(11, 20, 'MERCADERÃ–AS                 ', 1, '2012-05-07 11:20:13'),
(12, 21, 'PRODUCTOS TERMINADOS         ', 1, '2012-05-07 11:20:25'),
(13, 22, 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS             ', 1, '2012-05-07 11:20:39'),
(14, 23, 'PRODUCTOS EN PROCESO                              ', 1, '2012-05-07 11:20:53'),
(15, 24, 'MATERIAS PRIMAS          ', 1, '2012-05-07 11:21:07'),
(16, 25, 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS    ', 1, '2012-05-07 11:21:20'),
(17, 26, 'ENVASES Y EMBALAJES       ', 1, '2012-05-07 11:21:34'),
(18, 27, 'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA    ', 1, '2012-05-07 11:21:50'),
(19, 28, 'EXISTENCIAS POR RECIBIR                           ', 1, '2012-05-07 11:22:21'),
(20, 29, 'DESVALORIZACIÃ N DE EXISTENCIAS        ', 1, '2012-05-07 11:22:37'),
(21, 30, 'INVERSIONES MOBILIARIAS        ', 1, '2012-05-07 11:22:50'),
(22, 31, 'INVERSIONES INMOBILIARIAS         ', 1, '2012-05-07 11:23:04'),
(23, 32, 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO    ', 1, '2012-05-07 11:23:16'),
(24, 33, 'NMUEBLES, MAQUINARIA Y EQUIPO   ', 1, '2012-05-07 11:23:29'),
(25, 34, 'INTANGIBLES                  ', 1, '2012-05-07 11:23:47'),
(26, 35, 'ACTIVOS BIOLÃ GICOS ', 1, '2012-05-07 11:24:08'),
(27, 36, 'DESVALORIZACIÃ N DE ACTIVO INMOVILIZADO     ', 1, '2012-05-07 11:24:22'),
(28, 37, 'ACTIVO DIFERIDO             ', 1, '2012-05-07 11:24:57'),
(29, 38, 'OTROS ACTIVOS                 ', 1, '2012-05-07 11:25:10'),
(30, 39, 'DEPRECIACIÃ N, AMORTIZACIÃ N Y AGOTAMIENTO ACUMULADO', 1, '2012-05-07 11:25:39'),
(31, 40, 'TRIBUTOS Y APORTES AL SISTEMA DE PENSIONES Y DE SA', 1, '2012-05-07 11:25:56'),
(32, 41, 'REMUNERACIONES Y PARTICIPACIONES POR PAGAR        ', 1, '2012-05-07 11:26:13'),
(33, 42, 'CUENTAS POR PAGAR COMERCIALES ? TERCEROS          ', 1, '2012-05-07 11:26:39'),
(34, 43, 'CUENTAS POR PAGAR COMERCIALES ? RELACIONADAS      ', 1, '2012-05-07 11:26:52'),
(35, 44, 'CUENTAS POR PAGAR A LOS ACCIONISTAS, DIRECTORES Y ', 1, '2012-05-07 11:27:10'),
(36, 45, 'OBLIGACIONES FINANCIERAS                          ', 1, '2012-05-07 11:27:24'),
(37, 46, 'CUENTAS POR PAGAR DIVERSAS ? TERCEROS', 1, '2012-05-07 11:27:38'),
(38, 47, 'CUENTAS POR PAGAR DIVERSAS ? RELACIONADAS', 1, '2012-05-07 11:27:52'),
(39, 48, 'PROVISIONES ', 1, '2012-05-07 11:28:11'),
(40, 49, 'PASIVO DIFERIDO   ', 1, '2012-05-07 11:28:27'),
(41, 50, 'CAPITAL    ', 1, '2012-05-07 11:28:39'),
(42, 51, '51   ', 1, '2012-05-07 11:28:56'),
(43, 52, 'CAPITAL ADICIONAL     ', 1, '2012-05-07 11:29:12'),
(44, 56, 'RESULTADOS NO REALIZADOS  ', 1, '2012-05-07 11:29:25'),
(45, 57, 'EXCEDENTE DE REVALUACIÃ N   ', 1, '2012-05-07 11:29:50'),
(46, 58, 'RESERVAS  ', 1, '2012-05-07 11:30:02'),
(47, 59, 'RESULTADOS ACUMULADOS   ', 1, '2012-05-07 11:30:14'),
(48, 60, 'COMPRAS     ', 1, '2012-05-07 11:30:25'),
(49, 61, 'VARIACIÃ N DE EXISTENCIAS  ', 1, '2012-05-07 11:30:46'),
(50, 62, 'GASTOS DE PERSONAL, DIRECTORES Y GERENTES ', 0, '2012-05-07 11:31:01'),
(51, 63, 'GASTOS DE SERVICIOS PRESTADOS POR TERCEROS  ', 1, '2012-05-07 11:31:16'),
(52, 64, 'GASTOS POR TRIBUTOS  ', 1, '2012-05-07 11:31:30'),
(53, 65, 'OTROS GASTOS DE GESTIÃ N    ', 1, '2012-05-07 11:31:45'),
(54, 66, 'PÃ‰RDIDA POR MEDICIÃ N DE ACTIVOS NO FINANCIEROS AL', 1, '2012-05-07 11:36:46'),
(55, 67, 'GASTOS FINANCIEROS   ', 1, '2012-05-07 11:41:02'),
(56, 68, 'VALUACIÃ N Y DETERIORO DE ACTIVOS Y PROVISIONES ', 1, '2012-05-07 11:42:02'),
(57, 69, 'COSTO DE VENTAS   ', 1, '2012-05-07 11:42:31'),
(58, 70, 'VENTAS   ', 1, '2012-05-07 11:42:53'),
(59, 71, 'VARIACIÃ N DE LA PRODUCCIÃ N ALMACENADA  ', 1, '2012-05-07 11:43:29'),
(60, 72, 'PRODUCCIÃ N DE ACTIVO INMOVILIZADO   ', 1, '2012-05-07 11:43:47'),
(61, 73, 'DESCUENTOS, REBAJAS Y BONIFICACIONES OBTENIDOS', 1, '2012-05-07 11:44:00'),
(62, 74, 'DESCUENTOS, REBAJAS Y BONIFICACIONES CONCEDIDOS ', 1, '2012-05-07 11:44:39'),
(63, 75, 'OTROS INGRESOS DE GESTION    ', 1, '2012-05-07 11:44:56'),
(64, 76, 'GANANCIA POR MEDICION DE ACTIVOS NO FINANCIEROS AL', 1, '2012-05-07 11:45:17'),
(65, 77, 'INGRESOS FINANCIEROS  ', 1, '2012-05-07 11:45:30'),
(66, 78, 'CARGAS CUBIERTAS POR PROVISIONES   ', 1, '2012-05-07 11:45:44'),
(67, 79, 'CARGAS IMPUTABLES A CUENTAS DE COSTOS Y GASTOS    ', 1, '2012-05-07 11:45:58'),
(68, 80, 'MARGEN COMERCIAL  ', 1, '2012-05-07 11:46:10'),
(69, 81, 'PRODUCCIÃ N DEL EJERCICIO   ', 1, '2012-05-07 11:46:21'),
(70, 82, 'VALOR AGREGADO ', 1, '2012-05-07 11:46:32'),
(71, 83, 'EXCEDENTE BRUTO (INSUFICIENCIA BRUTA) DE EXPLOTACI', 1, '2012-05-07 11:46:48'),
(72, 84, 'RESULTADO DE EXPLOTACIÃ N   ', 1, '2012-05-07 11:47:01'),
(73, 85, 'RESULTADO ANTES DE PARTICIPACIONES E IMPUESTOS   ', 1, '2012-05-07 11:47:15'),
(74, 87, 'PARTICIPACIONES DE LOS TRABAJADORES  ', 1, '2012-05-07 11:47:27'),
(75, 88, 'IMPUESTO A LA RENTA   ', 1, '2012-05-07 11:47:39'),
(76, 89, 'DETERMINACIÃ N DEL RESULTADO DEL EJERCICIO   ', 1, '2012-05-07 11:47:51'),
(77, 91, 'COSTOS POR DISTRIBUIR.       ', 1, '2012-05-07 11:48:09'),
(78, 92, 'COSTOS DE PRODUCCIÃ N.    ', 1, '2012-05-07 11:48:21'),
(79, 93, 'CENTROS DE COSTOS.    ', 1, '2012-05-07 11:48:32'),
(80, 94, 'GASTOS ADMINISTRATIVOS.   ', 1, '2012-05-07 11:48:44'),
(81, 95, 'GASTOS DE VENTAS.    ', 1, '2012-05-07 11:48:54'),
(82, 96, 'GASTOS FINANCIEROS      ', 1, '2012-05-07 11:49:04'),
(83, 97, 'GASTOS FINANCIEROS  ', 1, '2012-05-07 11:49:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `tiempo_enfermedad_actual` tinyint(3) DEFAULT NULL,
  `tiempo_enfermedad_real` tinyint(3) DEFAULT NULL,
  `inicio` varchar(45) DEFAULT NULL,
  `curso` varchar(45) DEFAULT NULL,
  `relato_cronologico` text,
  `quirurgicos` varchar(250) DEFAULT NULL,
  `epidemiologicos` varchar(250) DEFAULT NULL,
  `familiares` varchar(250) DEFAULT NULL,
  `filiaciones_id` int(11) NOT NULL,
  `tipoenfermedad_id` int(11) NOT NULL,
  `patologicos_id` int(11) NOT NULL,
  `fisiologicos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `orden` tinyint(1) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `aclcargos_id` int(11) NOT NULL,
  `reporteoperatorio_id` int(11) NOT NULL,
  `acldatos_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

CREATE TABLE `estadocivil` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenclinico`
--

CREATE TABLE `examenclinico` (
  `id` int(11) NOT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `enfermedades_id` int(11) NOT NULL,
  `examenes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `minimo` varchar(20) DEFAULT NULL,
  `maximo` varchar(20) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `orden` tinyint(2) DEFAULT NULL,
  `tipoexamenes_id` int(11) NOT NULL,
  `medidas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filiaciones`
--

CREATE TABLE `filiaciones` (
  `id` int(11) NOT NULL,
  `edad` tinyint(3) DEFAULT NULL,
  `grado` varchar(45) DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `hc_n` varchar(45) DEFAULT NULL,
  `tps_n` varchar(45) DEFAULT NULL,
  `grupo_sang` varchar(45) DEFAULT NULL,
  `cip_n` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `sexos_id` int(11) NOT NULL,
  `situacionservicios_id` int(11) NOT NULL,
  `estadocivil_id` int(11) NOT NULL,
  `gradoinstruccion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fisiologicos`
--

CREATE TABLE `fisiologicos` (
  `id` int(11) NOT NULL,
  `natales` varchar(150) DEFAULT NULL,
  `infancia` varchar(150) DEFAULT NULL,
  `menarquia` varchar(150) DEFAULT NULL,
  `fur` varchar(45) DEFAULT NULL,
  `rc` tinyint(3) DEFAULT NULL,
  `mac` varchar(45) DEFAULT NULL,
  `g` varchar(45) DEFAULT NULL,
  `p` varchar(45) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='					';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gradoinstruccion`
--

CREATE TABLE `gradoinstruccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` int(11) NOT NULL,
  `monbre` varchar(100) DEFAULT NULL,
  `abreviatura` varchar(20) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologicos`
--

CREATE TABLE `patologicos` (
  `id` int(11) NOT NULL,
  `hta` varchar(45) DEFAULT NULL,
  `dm` varchar(45) DEFAULT NULL,
  `ebp` varchar(45) DEFAULT NULL,
  `ram` varchar(45) DEFAULT NULL,
  `otros` varchar(250) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporteoperatorio`
--

CREATE TABLE `reporteoperatorio` (
  `id` int(11) NOT NULL,
  `preoperatorio` varchar(250) DEFAULT NULL,
  `postoperatorio` varchar(250) DEFAULT NULL,
  `operacion` varchar(250) DEFAULT NULL,
  `hallazgos` varchar(250) DEFAULT NULL,
  `filiaciones_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situacionservicios`
--

CREATE TABLE `situacionservicios` (
  `id` int(11) NOT NULL,
  `situacion_servicio` varchar(150) DEFAULT NULL,
  `abreviatura` char(3) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoenfermedad`
--

CREATE TABLE `tipoenfermedad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoexamenes`
--

CREATE TABLE `tipoexamenes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `orden` tinyint(2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `tipoexamenes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo`
--

CREATE TABLE `ubigeo` (
  `id` int(10) NOT NULL,
  `codigo_dep` int(10) DEFAULT NULL,
  `codigo_prov` int(10) DEFAULT NULL,
  `codigo_dist` int(10) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubigeo`
--

INSERT INTO `ubigeo` (`id`, `codigo_dep`, `codigo_prov`, `codigo_dist`, `departamento`, `provincia`, `distrito`) VALUES
(1, 1, 1, 1, 'AMAZONAS', 'CHACHAPOYAS', 'CHACHAPOYAS'),
(2, 1, 1, 2, 'AMAZONAS', 'CHACHAPOYAS', 'ASUNCION'),
(3, 1, 1, 3, 'AMAZONAS', 'CHACHAPOYAS', 'BALSAS'),
(4, 1, 1, 4, 'AMAZONAS', 'CHACHAPOYAS', 'CHETO'),
(5, 1, 1, 5, 'AMAZONAS', 'CHACHAPOYAS', 'CHILIQUIN'),
(6, 1, 1, 6, 'AMAZONAS', 'CHACHAPOYAS', 'CHUQUIBAMBA'),
(7, 1, 1, 7, 'AMAZONAS', 'CHACHAPOYAS', 'GRANADA'),
(8, 1, 1, 8, 'AMAZONAS', 'CHACHAPOYAS', 'HUANCAS'),
(9, 1, 1, 9, 'AMAZONAS', 'CHACHAPOYAS', 'LA JALCA'),
(10, 1, 1, 10, 'AMAZONAS', 'CHACHAPOYAS', 'LEIMEBAMBA'),
(11, 1, 1, 11, 'AMAZONAS', 'CHACHAPOYAS', 'LEVANTO'),
(12, 1, 1, 12, 'AMAZONAS', 'CHACHAPOYAS', 'MAGDALENA'),
(13, 1, 1, 13, 'AMAZONAS', 'CHACHAPOYAS', 'MARISCAL CASTILLA'),
(14, 1, 1, 14, 'AMAZONAS', 'CHACHAPOYAS', 'MOLINOPAMPA'),
(15, 1, 1, 15, 'AMAZONAS', 'CHACHAPOYAS', 'MONTEVIDEO'),
(16, 1, 1, 16, 'AMAZONAS', 'CHACHAPOYAS', 'OLLEROS'),
(17, 1, 1, 17, 'AMAZONAS', 'CHACHAPOYAS', 'QUINJALCA'),
(18, 1, 1, 18, 'AMAZONAS', 'CHACHAPOYAS', 'SAN FCO DE DAGUAS'),
(19, 1, 1, 19, 'AMAZONAS', 'CHACHAPOYAS', 'SAN ISIDRO DE MAINO'),
(20, 1, 1, 20, 'AMAZONAS', 'CHACHAPOYAS', 'SOLOCO'),
(21, 1, 1, 21, 'AMAZONAS', 'CHACHAPOYAS', 'SONCHE'),
(22, 1, 2, 1, 'AMAZONAS', 'BAGUA', 'LA PECA'),
(23, 1, 2, 2, 'AMAZONAS', 'BAGUA', 'ARAMANGO'),
(24, 1, 2, 3, 'AMAZONAS', 'BAGUA', 'COPALLIN'),
(25, 1, 2, 4, 'AMAZONAS', 'BAGUA', 'EL PARCO'),
(26, 1, 2, 6, 'AMAZONAS', 'BAGUA', 'IMAZA'),
(27, 1, 3, 1, 'AMAZONAS', 'BONGARA', 'JUMBILLA'),
(28, 1, 3, 2, 'AMAZONAS', 'BONGARA', 'COROSHA'),
(29, 1, 3, 3, 'AMAZONAS', 'BONGARA', 'CUISPES'),
(30, 1, 3, 4, 'AMAZONAS', 'BONGARA', 'CHISQUILLA'),
(31, 1, 3, 5, 'AMAZONAS', 'BONGARA', 'CHURUJA'),
(32, 1, 3, 6, 'AMAZONAS', 'BONGARA', 'FLORIDA'),
(33, 1, 3, 7, 'AMAZONAS', 'BONGARA', 'RECTA'),
(34, 1, 3, 8, 'AMAZONAS', 'BONGARA', 'SAN CARLOS'),
(35, 1, 3, 9, 'AMAZONAS', 'BONGARA', 'SHIPASBAMBA'),
(36, 1, 3, 10, 'AMAZONAS', 'BONGARA', 'VALERA'),
(37, 1, 3, 11, 'AMAZONAS', 'BONGARA', 'YAMBRASBAMBA'),
(38, 1, 3, 12, 'AMAZONAS', 'BONGARA', 'JAZAN'),
(39, 1, 4, 1, 'AMAZONAS', 'LUYA', 'LAMUD'),
(40, 1, 4, 2, 'AMAZONAS', 'LUYA', 'CAMPORREDONDO'),
(41, 1, 4, 3, 'AMAZONAS', 'LUYA', 'COCABAMBA'),
(42, 1, 4, 4, 'AMAZONAS', 'LUYA', 'COLCAMAR'),
(43, 1, 4, 5, 'AMAZONAS', 'LUYA', 'CONILA'),
(44, 1, 4, 6, 'AMAZONAS', 'LUYA', 'INGUILPATA'),
(45, 1, 4, 7, 'AMAZONAS', 'LUYA', 'LONGUITA'),
(46, 1, 4, 8, 'AMAZONAS', 'LUYA', 'LONYA CHICO'),
(47, 1, 4, 9, 'AMAZONAS', 'LUYA', 'LUYA'),
(48, 1, 4, 10, 'AMAZONAS', 'LUYA', 'LUYA VIEJO'),
(49, 1, 4, 11, 'AMAZONAS', 'LUYA', 'MARIA'),
(50, 1, 4, 12, 'AMAZONAS', 'LUYA', 'OCALLI'),
(51, 1, 4, 13, 'AMAZONAS', 'LUYA', 'OCUMAL'),
(52, 1, 4, 14, 'AMAZONAS', 'LUYA', 'PISUQUIA'),
(53, 1, 4, 15, 'AMAZONAS', 'LUYA', 'SAN CRISTOBAL'),
(54, 1, 4, 16, 'AMAZONAS', 'LUYA', 'SAN FRANCISCO DE YESO'),
(55, 1, 4, 17, 'AMAZONAS', 'LUYA', 'SAN JERONIMO'),
(56, 1, 4, 18, 'AMAZONAS', 'LUYA', 'SAN JUAN DE LOPECANCHA'),
(57, 1, 4, 19, 'AMAZONAS', 'LUYA', 'SANTA CATALINA'),
(58, 1, 4, 20, 'AMAZONAS', 'LUYA', 'SANTO TOMAS'),
(59, 1, 4, 21, 'AMAZONAS', 'LUYA', 'TINGO'),
(60, 1, 4, 22, 'AMAZONAS', 'LUYA', 'TRITA'),
(61, 1, 4, 23, 'AMAZONAS', 'LUYA', 'PROVIDENCIA'),
(62, 1, 5, 1, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SAN NICOLAS'),
(63, 1, 5, 2, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'COCHAMAL'),
(64, 1, 5, 3, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'CHIRIMOTO'),
(65, 1, 5, 4, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'HUAMBO'),
(66, 1, 5, 5, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LIMABAMBA'),
(67, 1, 5, 6, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LONGAR'),
(68, 1, 5, 7, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MILPUC'),
(69, 1, 5, 8, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MCAL BENAVIDES'),
(70, 1, 5, 9, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'OMIA'),
(71, 1, 5, 10, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SANTA ROSA'),
(72, 1, 5, 11, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'TOTORA'),
(73, 1, 5, 12, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'VISTA ALEGRE'),
(74, 1, 6, 1, 'AMAZONAS', 'CONDORCANQUI', 'NIEVA'),
(75, 1, 6, 2, 'AMAZONAS', 'CONDORCANQUI', 'RIO SANTIAGO'),
(76, 1, 6, 3, 'AMAZONAS', 'CONDORCANQUI', 'EL CENEPA'),
(77, 1, 7, 1, 'AMAZONAS', 'UTCUBAMBA', 'BAGUA GRANDE'),
(78, 1, 7, 2, 'AMAZONAS', 'UTCUBAMBA', 'CAJARURO'),
(79, 1, 7, 3, 'AMAZONAS', 'UTCUBAMBA', 'CUMBA'),
(80, 1, 7, 4, 'AMAZONAS', 'UTCUBAMBA', 'EL MILAGRO'),
(81, 1, 7, 5, 'AMAZONAS', 'UTCUBAMBA', 'JAMALCA'),
(82, 1, 7, 6, 'AMAZONAS', 'UTCUBAMBA', 'LONYA GRANDE'),
(83, 1, 7, 7, 'AMAZONAS', 'UTCUBAMBA', 'YAMON'),
(84, 2, 1, 1, 'ANCASH', 'HUARAZ', 'HUARAZ'),
(85, 2, 1, 2, 'ANCASH', 'HUARAZ', 'INDEPENDENCIA'),
(86, 2, 1, 3, 'ANCASH', 'HUARAZ', 'COCHABAMBA'),
(87, 2, 1, 4, 'ANCASH', 'HUARAZ', 'COLCABAMBA'),
(88, 2, 1, 5, 'ANCASH', 'HUARAZ', 'HUANCHAY'),
(89, 2, 1, 6, 'ANCASH', 'HUARAZ', 'JANGAS'),
(90, 2, 1, 7, 'ANCASH', 'HUARAZ', 'LA LIBERTAD'),
(91, 2, 1, 8, 'ANCASH', 'HUARAZ', 'OLLEROS'),
(92, 2, 1, 9, 'ANCASH', 'HUARAZ', 'PAMPAS'),
(93, 2, 1, 10, 'ANCASH', 'HUARAZ', 'PARIACOTO'),
(94, 2, 1, 11, 'ANCASH', 'HUARAZ', 'PIRA'),
(95, 2, 1, 12, 'ANCASH', 'HUARAZ', 'TARICA'),
(96, 2, 2, 1, 'ANCASH', 'AIJA', 'AIJA'),
(97, 2, 2, 3, 'ANCASH', 'AIJA', 'CORIS'),
(98, 2, 2, 5, 'ANCASH', 'AIJA', 'HUACLLAN'),
(99, 2, 2, 6, 'ANCASH', 'AIJA', 'LA MERCED'),
(100, 2, 2, 8, 'ANCASH', 'AIJA', 'SUCCHA'),
(101, 2, 3, 1, 'ANCASH', 'BOLOGNESI', 'CHIQUIAN'),
(102, 2, 3, 2, 'ANCASH', 'BOLOGNESI', 'A PARDO LEZAMETA'),
(103, 2, 3, 4, 'ANCASH', 'BOLOGNESI', 'AQUIA'),
(104, 2, 3, 5, 'ANCASH', 'BOLOGNESI', 'CAJACAY'),
(105, 2, 3, 10, 'ANCASH', 'BOLOGNESI', 'HUAYLLACAYAN'),
(106, 2, 3, 11, 'ANCASH', 'BOLOGNESI', 'HUASTA'),
(107, 2, 3, 13, 'ANCASH', 'BOLOGNESI', 'MANGAS'),
(108, 2, 3, 15, 'ANCASH', 'BOLOGNESI', 'PACLLON'),
(109, 2, 3, 17, 'ANCASH', 'BOLOGNESI', 'SAN MIGUEL DE CORPANQUI'),
(110, 2, 3, 20, 'ANCASH', 'BOLOGNESI', 'TICLLOS'),
(111, 2, 3, 21, 'ANCASH', 'BOLOGNESI', 'ANTONIO RAIMONDI'),
(112, 2, 3, 22, 'ANCASH', 'BOLOGNESI', 'CANIS'),
(113, 2, 3, 23, 'ANCASH', 'BOLOGNESI', 'COLQUIOC'),
(114, 2, 3, 24, 'ANCASH', 'BOLOGNESI', 'LA PRIMAVERA'),
(115, 2, 3, 25, 'ANCASH', 'BOLOGNESI', 'HUALLANCA'),
(116, 2, 4, 1, 'ANCASH', 'CARHUAZ', 'CARHUAZ'),
(117, 2, 4, 2, 'ANCASH', 'CARHUAZ', 'ACOPAMPA'),
(118, 2, 4, 3, 'ANCASH', 'CARHUAZ', 'AMASHCA'),
(119, 2, 4, 4, 'ANCASH', 'CARHUAZ', 'ANTA'),
(120, 2, 4, 5, 'ANCASH', 'CARHUAZ', 'ATAQUERO'),
(121, 2, 4, 6, 'ANCASH', 'CARHUAZ', 'MARCARA'),
(122, 2, 4, 7, 'ANCASH', 'CARHUAZ', 'PARIAHUANCA'),
(123, 2, 4, 8, 'ANCASH', 'CARHUAZ', 'SAN MIGUEL DE ACO'),
(124, 2, 4, 9, 'ANCASH', 'CARHUAZ', 'SHILLA'),
(125, 2, 4, 10, 'ANCASH', 'CARHUAZ', 'TINCO'),
(126, 2, 4, 11, 'ANCASH', 'CARHUAZ', 'YUNGAR'),
(127, 2, 5, 1, 'ANCASH', 'CASMA', 'CASMA'),
(128, 2, 5, 2, 'ANCASH', 'CASMA', 'BUENA VISTA ALTA'),
(129, 2, 5, 3, 'ANCASH', 'CASMA', 'COMANDANTE NOEL'),
(130, 2, 5, 5, 'ANCASH', 'CASMA', 'YAUTAN'),
(131, 2, 6, 1, 'ANCASH', 'CORONGO', 'CORONGO'),
(132, 2, 6, 2, 'ANCASH', 'CORONGO', 'ACO'),
(133, 2, 6, 3, 'ANCASH', 'CORONGO', 'BAMBAS'),
(134, 2, 6, 4, 'ANCASH', 'CORONGO', 'CUSCA'),
(135, 2, 6, 5, 'ANCASH', 'CORONGO', 'LA PAMPA'),
(136, 2, 6, 6, 'ANCASH', 'CORONGO', 'YANAC'),
(137, 2, 6, 7, 'ANCASH', 'CORONGO', 'YUPAN'),
(138, 2, 7, 1, 'ANCASH', 'HUAYLAS', 'CARAZ'),
(139, 2, 7, 2, 'ANCASH', 'HUAYLAS', 'HUALLANCA'),
(140, 2, 7, 3, 'ANCASH', 'HUAYLAS', 'HUATA'),
(141, 2, 7, 4, 'ANCASH', 'HUAYLAS', 'HUAYLAS'),
(142, 2, 7, 5, 'ANCASH', 'HUAYLAS', 'MATO'),
(143, 2, 7, 6, 'ANCASH', 'HUAYLAS', 'PAMPAROMAS'),
(144, 2, 7, 7, 'ANCASH', 'HUAYLAS', 'PUEBLO LIBRE'),
(145, 2, 7, 8, 'ANCASH', 'HUAYLAS', 'SANTA CRUZ'),
(146, 2, 7, 9, 'ANCASH', 'HUAYLAS', 'YURACMARCA'),
(147, 2, 7, 10, 'ANCASH', 'HUAYLAS', 'SANTO TORIBIO'),
(148, 2, 8, 1, 'ANCASH', 'HUARI', 'HUARI'),
(149, 2, 8, 2, 'ANCASH', 'HUARI', 'CAJAY'),
(150, 2, 8, 3, 'ANCASH', 'HUARI', 'CHAVIN DE HUANTAR'),
(151, 2, 8, 4, 'ANCASH', 'HUARI', 'HUACACHI'),
(152, 2, 8, 5, 'ANCASH', 'HUARI', 'HUACHIS'),
(153, 2, 8, 6, 'ANCASH', 'HUARI', 'HUACCHIS'),
(154, 2, 8, 7, 'ANCASH', 'HUARI', 'HUANTAR'),
(155, 2, 8, 8, 'ANCASH', 'HUARI', 'MASIN'),
(156, 2, 8, 9, 'ANCASH', 'HUARI', 'PAUCAS'),
(157, 2, 8, 10, 'ANCASH', 'HUARI', 'PONTO'),
(158, 2, 8, 11, 'ANCASH', 'HUARI', 'RAHUAPAMPA'),
(159, 2, 8, 12, 'ANCASH', 'HUARI', 'RAPAYAN'),
(160, 2, 8, 13, 'ANCASH', 'HUARI', 'SAN MARCOS'),
(161, 2, 8, 14, 'ANCASH', 'HUARI', 'SAN PEDRO DE CHANA'),
(162, 2, 8, 15, 'ANCASH', 'HUARI', 'UCO'),
(163, 2, 8, 16, 'ANCASH', 'HUARI', 'ANRA'),
(164, 2, 9, 1, 'ANCASH', 'MARISCAL LUZURIAGA', 'PISCOBAMBA'),
(165, 2, 9, 2, 'ANCASH', 'MARISCAL LUZURIAGA', 'CASCA'),
(166, 2, 9, 3, 'ANCASH', 'MARISCAL LUZURIAGA', 'LUCMA'),
(167, 2, 9, 4, 'ANCASH', 'MARISCAL LUZURIAGA', 'FIDEL OLIVAS ESCUDERO'),
(168, 2, 9, 5, 'ANCASH', 'MARISCAL LUZURIAGA', 'LLAMA'),
(169, 2, 9, 6, 'ANCASH', 'MARISCAL LUZURIAGA', 'LLUMPA'),
(170, 2, 9, 7, 'ANCASH', 'MARISCAL LUZURIAGA', 'MUSGA'),
(171, 2, 9, 8, 'ANCASH', 'MARISCAL LUZURIAGA', 'ELEAZAR GUZMAN BARRON'),
(172, 2, 10, 1, 'ANCASH', 'PALLASCA', 'CABANA'),
(173, 2, 10, 2, 'ANCASH', 'PALLASCA', 'BOLOGNESI'),
(174, 2, 10, 3, 'ANCASH', 'PALLASCA', 'CONCHUCOS'),
(175, 2, 10, 4, 'ANCASH', 'PALLASCA', 'HUACASCHUQUE'),
(176, 2, 10, 5, 'ANCASH', 'PALLASCA', 'HUANDOVAL'),
(177, 2, 10, 6, 'ANCASH', 'PALLASCA', 'LACABAMBA'),
(178, 2, 10, 7, 'ANCASH', 'PALLASCA', 'LLAPO'),
(179, 2, 10, 8, 'ANCASH', 'PALLASCA', 'PALLASCA'),
(180, 2, 10, 9, 'ANCASH', 'PALLASCA', 'PAMPAS'),
(181, 2, 10, 10, 'ANCASH', 'PALLASCA', 'SANTA ROSA'),
(182, 2, 10, 11, 'ANCASH', 'PALLASCA', 'TAUCA'),
(183, 2, 11, 1, 'ANCASH', 'POMABAMBA', 'POMABAMBA'),
(184, 2, 11, 2, 'ANCASH', 'POMABAMBA', 'HUAYLLAN'),
(185, 2, 11, 3, 'ANCASH', 'POMABAMBA', 'PAROBAMBA'),
(186, 2, 11, 4, 'ANCASH', 'POMABAMBA', 'QUINUABAMBA'),
(187, 2, 12, 1, 'ANCASH', 'RECUAY', 'RECUAY'),
(188, 2, 12, 2, 'ANCASH', 'RECUAY', 'COTAPARACO'),
(189, 2, 12, 3, 'ANCASH', 'RECUAY', 'HUAYLLAPAMPA'),
(190, 2, 12, 4, 'ANCASH', 'RECUAY', 'MARCA'),
(191, 2, 12, 5, 'ANCASH', 'RECUAY', 'PAMPAS CHICO'),
(192, 2, 12, 6, 'ANCASH', 'RECUAY', 'PARARIN'),
(193, 2, 12, 7, 'ANCASH', 'RECUAY', 'TAPACOCHA'),
(194, 2, 12, 8, 'ANCASH', 'RECUAY', 'TICAPAMPA'),
(195, 2, 12, 9, 'ANCASH', 'RECUAY', 'LLACLLIN'),
(196, 2, 12, 10, 'ANCASH', 'RECUAY', 'CATAC'),
(197, 2, 13, 1, 'ANCASH', 'SANTA', 'CHIMBOTE'),
(198, 2, 13, 2, 'ANCASH', 'SANTA', 'CACERES DEL PERU'),
(199, 2, 13, 3, 'ANCASH', 'SANTA', 'MACATE'),
(200, 2, 13, 4, 'ANCASH', 'SANTA', 'MORO'),
(201, 2, 13, 5, 'ANCASH', 'SANTA', 'NEPEÑA'),
(202, 2, 13, 6, 'ANCASH', 'SANTA', 'SAMANCO'),
(203, 2, 13, 7, 'ANCASH', 'SANTA', 'SANTA'),
(204, 2, 13, 8, 'ANCASH', 'SANTA', 'COISHCO'),
(205, 2, 13, 9, 'ANCASH', 'SANTA', 'NUEVO CHIMBOTE'),
(206, 2, 14, 1, 'ANCASH', 'SIHUAS', 'SIHUAS'),
(207, 2, 14, 2, 'ANCASH', 'SIHUAS', 'ALFONSO UGARTE'),
(208, 2, 14, 3, 'ANCASH', 'SIHUAS', 'CHINGALPO'),
(209, 2, 14, 4, 'ANCASH', 'SIHUAS', 'HUAYLLABAMBA'),
(210, 2, 14, 5, 'ANCASH', 'SIHUAS', 'QUICHES'),
(211, 2, 14, 6, 'ANCASH', 'SIHUAS', 'SICSIBAMBA'),
(212, 2, 14, 7, 'ANCASH', 'SIHUAS', 'ACOBAMBA'),
(213, 2, 14, 8, 'ANCASH', 'SIHUAS', 'CASHAPAMPA'),
(214, 2, 14, 9, 'ANCASH', 'SIHUAS', 'RAGASH'),
(215, 2, 14, 10, 'ANCASH', 'SIHUAS', 'SAN JUAN'),
(216, 2, 15, 1, 'ANCASH', 'YUNGAY', 'YUNGAY'),
(217, 2, 15, 2, 'ANCASH', 'YUNGAY', 'CASCAPARA'),
(218, 2, 15, 3, 'ANCASH', 'YUNGAY', 'MANCOS'),
(219, 2, 15, 4, 'ANCASH', 'YUNGAY', 'MATACOTO'),
(220, 2, 15, 5, 'ANCASH', 'YUNGAY', 'QUILLO'),
(221, 2, 15, 6, 'ANCASH', 'YUNGAY', 'RANRAHIRCA'),
(222, 2, 15, 7, 'ANCASH', 'YUNGAY', 'SHUPLUY'),
(223, 2, 15, 8, 'ANCASH', 'YUNGAY', 'YANAMA'),
(224, 2, 16, 1, 'ANCASH', 'ANTONIO RAIMONDI', 'LLAMELLIN'),
(225, 2, 16, 2, 'ANCASH', 'ANTONIO RAIMONDI', 'ACZO'),
(226, 2, 16, 3, 'ANCASH', 'ANTONIO RAIMONDI', 'CHACCHO'),
(227, 2, 16, 4, 'ANCASH', 'ANTONIO RAIMONDI', 'CHINGAS'),
(228, 2, 16, 5, 'ANCASH', 'ANTONIO RAIMONDI', 'MIRGAS'),
(229, 2, 16, 6, 'ANCASH', 'ANTONIO RAIMONDI', 'SAN JUAN DE RONTOY'),
(230, 2, 17, 1, 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN LUIS'),
(231, 2, 17, 2, 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'YAUYA'),
(232, 2, 17, 3, 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN NICOLAS'),
(233, 2, 18, 1, 'ANCASH', 'ASUNCION', 'CHACAS'),
(234, 2, 18, 2, 'ANCASH', 'ASUNCION', 'ACOCHACA'),
(235, 2, 19, 1, 'ANCASH', 'HUARMEY', 'HUARMEY'),
(236, 2, 19, 2, 'ANCASH', 'HUARMEY', 'COCHAPETI'),
(237, 2, 19, 3, 'ANCASH', 'HUARMEY', 'HUAYAN'),
(238, 2, 19, 4, 'ANCASH', 'HUARMEY', 'MALVAS'),
(239, 2, 19, 5, 'ANCASH', 'HUARMEY', 'CULEBRAS'),
(240, 2, 20, 1, 'ANCASH', 'OCROS', 'ACAS'),
(241, 2, 20, 2, 'ANCASH', 'OCROS', 'CAJAMARQUILLA'),
(242, 2, 20, 3, 'ANCASH', 'OCROS', 'CARHUAPAMPA'),
(243, 2, 20, 4, 'ANCASH', 'OCROS', 'COCHAS'),
(244, 2, 20, 5, 'ANCASH', 'OCROS', 'CONGAS'),
(245, 2, 20, 6, 'ANCASH', 'OCROS', 'LLIPA'),
(246, 2, 20, 7, 'ANCASH', 'OCROS', 'OCROS'),
(247, 2, 20, 8, 'ANCASH', 'OCROS', 'SAN CRISTOBAL DE RAJAN'),
(248, 2, 20, 9, 'ANCASH', 'OCROS', 'SAN PEDRO'),
(249, 2, 20, 10, 'ANCASH', 'OCROS', 'SANTIAGO DE CHILCAS'),
(250, 3, 1, 1, 'APURIMAC', 'ABANCAY', 'ABANCAY'),
(251, 3, 1, 2, 'APURIMAC', 'ABANCAY', 'CIRCA'),
(252, 3, 1, 3, 'APURIMAC', 'ABANCAY', 'CURAHUASI'),
(253, 3, 1, 4, 'APURIMAC', 'ABANCAY', 'CHACOCHE'),
(254, 3, 1, 5, 'APURIMAC', 'ABANCAY', 'HUANIPACA'),
(255, 3, 1, 6, 'APURIMAC', 'ABANCAY', 'LAMBRAMA'),
(256, 3, 1, 7, 'APURIMAC', 'ABANCAY', 'PICHIRHUA'),
(257, 3, 1, 8, 'APURIMAC', 'ABANCAY', 'SAN PEDRO DE CACHORA'),
(258, 3, 1, 9, 'APURIMAC', 'ABANCAY', 'TAMBURCO'),
(259, 3, 2, 1, 'APURIMAC', 'AYMARAES', 'CHALHUANCA'),
(260, 3, 2, 2, 'APURIMAC', 'AYMARAES', 'CAPAYA'),
(261, 3, 2, 3, 'APURIMAC', 'AYMARAES', 'CARAYBAMBA'),
(262, 3, 2, 4, 'APURIMAC', 'AYMARAES', 'COLCABAMBA'),
(263, 3, 2, 5, 'APURIMAC', 'AYMARAES', 'COTARUSE'),
(264, 3, 2, 6, 'APURIMAC', 'AYMARAES', 'CHAPIMARCA'),
(265, 3, 2, 7, 'APURIMAC', 'AYMARAES', 'IHUAYLLO'),
(266, 3, 2, 8, 'APURIMAC', 'AYMARAES', 'LUCRE'),
(267, 3, 2, 9, 'APURIMAC', 'AYMARAES', 'POCOHUANCA'),
(268, 3, 2, 10, 'APURIMAC', 'AYMARAES', 'SAÑAICA'),
(269, 3, 2, 11, 'APURIMAC', 'AYMARAES', 'SORAYA'),
(270, 3, 2, 12, 'APURIMAC', 'AYMARAES', 'TAPAIRIHUA'),
(271, 3, 2, 13, 'APURIMAC', 'AYMARAES', 'TINTAY'),
(272, 3, 2, 14, 'APURIMAC', 'AYMARAES', 'TORAYA'),
(273, 3, 2, 15, 'APURIMAC', 'AYMARAES', 'YANACA'),
(274, 3, 2, 16, 'APURIMAC', 'AYMARAES', 'SAN JUAN DE CHACÑA'),
(275, 3, 2, 17, 'APURIMAC', 'AYMARAES', 'JUSTO APU SAHUARAURA'),
(276, 3, 3, 1, 'APURIMAC', 'ANDAHUAYLAS', 'ANDAHUAYLAS'),
(277, 3, 3, 2, 'APURIMAC', 'ANDAHUAYLAS', 'ANDARAPA'),
(278, 3, 3, 3, 'APURIMAC', 'ANDAHUAYLAS', 'CHIARA'),
(279, 3, 3, 4, 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAMA'),
(280, 3, 3, 5, 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAY'),
(281, 3, 3, 6, 'APURIMAC', 'ANDAHUAYLAS', 'KISHUARA'),
(282, 3, 3, 7, 'APURIMAC', 'ANDAHUAYLAS', 'PACOBAMBA'),
(283, 3, 3, 8, 'APURIMAC', 'ANDAHUAYLAS', 'PAMPACHIRI'),
(284, 3, 3, 9, 'APURIMAC', 'ANDAHUAYLAS', 'SAN ANTONIO DE CACHI'),
(285, 3, 3, 10, 'APURIMAC', 'ANDAHUAYLAS', 'SAN JERONIMO'),
(286, 3, 3, 11, 'APURIMAC', 'ANDAHUAYLAS', 'TALAVERA'),
(287, 3, 3, 12, 'APURIMAC', 'ANDAHUAYLAS', 'TURPO'),
(288, 3, 3, 13, 'APURIMAC', 'ANDAHUAYLAS', 'PACUCHA'),
(289, 3, 3, 14, 'APURIMAC', 'ANDAHUAYLAS', 'POMACOCHA'),
(290, 3, 3, 15, 'APURIMAC', 'ANDAHUAYLAS', 'STA MARIA DE CHICMO'),
(291, 3, 3, 16, 'APURIMAC', 'ANDAHUAYLAS', 'TUMAY HUARACA'),
(292, 3, 3, 17, 'APURIMAC', 'ANDAHUAYLAS', 'HUAYANA'),
(293, 3, 3, 18, 'APURIMAC', 'ANDAHUAYLAS', 'SAN MIGUEL DE CHACCRAMPA'),
(294, 3, 3, 19, 'APURIMAC', 'ANDAHUAYLAS', 'KAQUIABAMBA'),
(295, 3, 4, 1, 'APURIMAC', 'ANTABAMBA', 'ANTABAMBA'),
(296, 3, 4, 2, 'APURIMAC', 'ANTABAMBA', 'EL ORO'),
(297, 3, 4, 3, 'APURIMAC', 'ANTABAMBA', 'HUAQUIRCA'),
(298, 3, 4, 4, 'APURIMAC', 'ANTABAMBA', 'JUAN ESPINOZA MEDRANO'),
(299, 3, 4, 5, 'APURIMAC', 'ANTABAMBA', 'OROPESA'),
(300, 3, 4, 6, 'APURIMAC', 'ANTABAMBA', 'PACHACONAS'),
(301, 3, 4, 7, 'APURIMAC', 'ANTABAMBA', 'SABAINO'),
(302, 3, 5, 1, 'APURIMAC', 'COTABAMBAS', 'TAMBOBAMBA'),
(303, 3, 5, 2, 'APURIMAC', 'COTABAMBAS', 'COYLLURQUI'),
(304, 3, 5, 3, 'APURIMAC', 'COTABAMBAS', 'COTABAMBAS'),
(305, 3, 5, 4, 'APURIMAC', 'COTABAMBAS', 'HAQUIRA'),
(306, 3, 5, 5, 'APURIMAC', 'COTABAMBAS', 'MARA'),
(307, 3, 5, 6, 'APURIMAC', 'COTABAMBAS', 'CHALLHUAHUACHO'),
(308, 3, 6, 1, 'APURIMAC', 'GRAU', 'CHUQUIBAMBILLA'),
(309, 3, 6, 2, 'APURIMAC', 'GRAU', 'CURPAHUASI'),
(310, 3, 6, 3, 'APURIMAC', 'GRAU', 'HUAILLATI'),
(311, 3, 6, 4, 'APURIMAC', 'GRAU', 'MAMARA'),
(312, 3, 6, 5, 'APURIMAC', 'GRAU', 'MARISCAL GAMARRA'),
(313, 3, 6, 6, 'APURIMAC', 'GRAU', 'MICAELA BASTIDAS'),
(314, 3, 6, 7, 'APURIMAC', 'GRAU', 'PROGRESO'),
(315, 3, 6, 8, 'APURIMAC', 'GRAU', 'PATAYPAMPA'),
(316, 3, 6, 9, 'APURIMAC', 'GRAU', 'SAN ANTONIO'),
(317, 3, 6, 10, 'APURIMAC', 'GRAU', 'TURPAY'),
(318, 3, 6, 11, 'APURIMAC', 'GRAU', 'VILCABAMBA'),
(319, 3, 6, 12, 'APURIMAC', 'GRAU', 'VIRUNDO'),
(320, 3, 6, 13, 'APURIMAC', 'GRAU', 'SANTA ROSA'),
(321, 3, 6, 14, 'APURIMAC', 'GRAU', 'CURASCO'),
(322, 3, 7, 1, 'APURIMAC', 'CHINCHEROS', 'CHINCHEROS'),
(323, 3, 7, 2, 'APURIMAC', 'CHINCHEROS', 'ONGOY'),
(324, 3, 7, 3, 'APURIMAC', 'CHINCHEROS', 'OCOBAMBA'),
(325, 3, 7, 4, 'APURIMAC', 'CHINCHEROS', 'COCHARCAS'),
(326, 3, 7, 5, 'APURIMAC', 'CHINCHEROS', 'ANCO HUALLO'),
(327, 3, 7, 6, 'APURIMAC', 'CHINCHEROS', 'HUACCANA'),
(328, 3, 7, 7, 'APURIMAC', 'CHINCHEROS', 'URANMARCA'),
(329, 3, 7, 8, 'APURIMAC', 'CHINCHEROS', 'RANRACANCHA'),
(330, 4, 1, 1, 'AREQUIPA', 'AREQUIPA', 'AREQUIPA'),
(331, 4, 1, 2, 'AREQUIPA', 'AREQUIPA', 'CAYMA'),
(332, 4, 1, 3, 'AREQUIPA', 'AREQUIPA', 'CERRO COLORADO'),
(333, 4, 1, 4, 'AREQUIPA', 'AREQUIPA', 'CHARACATO'),
(334, 4, 1, 5, 'AREQUIPA', 'AREQUIPA', 'CHIGUATA'),
(335, 4, 1, 6, 'AREQUIPA', 'AREQUIPA', 'LA JOYA'),
(336, 4, 1, 7, 'AREQUIPA', 'AREQUIPA', 'MIRAFLORES'),
(337, 4, 1, 8, 'AREQUIPA', 'AREQUIPA', 'MOLLEBAYA'),
(338, 4, 1, 9, 'AREQUIPA', 'AREQUIPA', 'PAUCARPATA'),
(339, 4, 1, 10, 'AREQUIPA', 'AREQUIPA', 'POCSI'),
(340, 4, 1, 11, 'AREQUIPA', 'AREQUIPA', 'POLOBAYA'),
(341, 4, 1, 12, 'AREQUIPA', 'AREQUIPA', 'QUEQUEÑA'),
(342, 4, 1, 13, 'AREQUIPA', 'AREQUIPA', 'SABANDIA'),
(343, 4, 1, 14, 'AREQUIPA', 'AREQUIPA', 'SACHACA'),
(344, 4, 1, 15, 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE SIGUAS'),
(345, 4, 1, 16, 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE TARUCANI'),
(346, 4, 1, 17, 'AREQUIPA', 'AREQUIPA', 'SANTA ISABEL DE SIGUAS'),
(347, 4, 1, 18, 'AREQUIPA', 'AREQUIPA', 'STA RITA DE SIGUAS'),
(348, 4, 1, 19, 'AREQUIPA', 'AREQUIPA', 'SOCABAYA'),
(349, 4, 1, 20, 'AREQUIPA', 'AREQUIPA', 'TIABAYA'),
(350, 4, 1, 21, 'AREQUIPA', 'AREQUIPA', 'UCHUMAYO'),
(351, 4, 1, 22, 'AREQUIPA', 'AREQUIPA', 'VITOR'),
(352, 4, 1, 23, 'AREQUIPA', 'AREQUIPA', 'YANAHUARA'),
(353, 4, 1, 24, 'AREQUIPA', 'AREQUIPA', 'YARABAMBA'),
(354, 4, 1, 25, 'AREQUIPA', 'AREQUIPA', 'YURA'),
(355, 4, 1, 26, 'AREQUIPA', 'AREQUIPA', 'MARIANO MELGAR'),
(356, 4, 1, 27, 'AREQUIPA', 'AREQUIPA', 'JACOBO HUNTER'),
(357, 4, 1, 28, 'AREQUIPA', 'AREQUIPA', 'ALTO SELVA ALEGRE'),
(358, 4, 1, 29, 'AREQUIPA', 'AREQUIPA', 'JOSE LUIS BUSTAMANTE Y RIVERO'),
(359, 4, 2, 1, 'AREQUIPA', 'CAYLLOMA', 'CHIVAY'),
(360, 4, 2, 2, 'AREQUIPA', 'CAYLLOMA', 'ACHOMA'),
(361, 4, 2, 3, 'AREQUIPA', 'CAYLLOMA', 'CABANACONDE'),
(362, 4, 2, 4, 'AREQUIPA', 'CAYLLOMA', 'CAYLLOMA'),
(363, 4, 2, 5, 'AREQUIPA', 'CAYLLOMA', 'CALLALLI'),
(364, 4, 2, 6, 'AREQUIPA', 'CAYLLOMA', 'COPORAQUE'),
(365, 4, 2, 7, 'AREQUIPA', 'CAYLLOMA', 'HUAMBO'),
(366, 4, 2, 8, 'AREQUIPA', 'CAYLLOMA', 'HUANCA'),
(367, 4, 2, 9, 'AREQUIPA', 'CAYLLOMA', 'ICHUPAMPA'),
(368, 4, 2, 10, 'AREQUIPA', 'CAYLLOMA', 'LARI'),
(369, 4, 2, 11, 'AREQUIPA', 'CAYLLOMA', 'LLUTA'),
(370, 4, 2, 12, 'AREQUIPA', 'CAYLLOMA', 'MACA'),
(371, 4, 2, 13, 'AREQUIPA', 'CAYLLOMA', 'MADRIGAL'),
(372, 4, 2, 14, 'AREQUIPA', 'CAYLLOMA', 'SAN ANTONIO DE CHUCA'),
(373, 4, 2, 15, 'AREQUIPA', 'CAYLLOMA', 'SIBAYO'),
(374, 4, 2, 16, 'AREQUIPA', 'CAYLLOMA', 'TAPAY'),
(375, 4, 2, 17, 'AREQUIPA', 'CAYLLOMA', 'TISCO'),
(376, 4, 2, 18, 'AREQUIPA', 'CAYLLOMA', 'TUTI'),
(377, 4, 2, 19, 'AREQUIPA', 'CAYLLOMA', 'YANQUE'),
(378, 4, 2, 20, 'AREQUIPA', 'CAYLLOMA', 'MAJES'),
(379, 4, 3, 1, 'AREQUIPA', 'CAMANA', 'CAMANA'),
(380, 4, 3, 2, 'AREQUIPA', 'CAMANA', 'JOSE MARIA QUIMPER'),
(381, 4, 3, 3, 'AREQUIPA', 'CAMANA', 'MARIANO N VALCARCEL'),
(382, 4, 3, 4, 'AREQUIPA', 'CAMANA', 'MARISCAL CACERES'),
(383, 4, 3, 5, 'AREQUIPA', 'CAMANA', 'NICOLAS DE PIEROLA'),
(384, 4, 3, 6, 'AREQUIPA', 'CAMANA', 'OCOÑA'),
(385, 4, 3, 7, 'AREQUIPA', 'CAMANA', 'QUILCA'),
(386, 4, 3, 8, 'AREQUIPA', 'CAMANA', 'SAMUEL PASTOR'),
(387, 4, 4, 1, 'AREQUIPA', 'CARAVELI', 'CARAVELI'),
(388, 4, 4, 2, 'AREQUIPA', 'CARAVELI', 'ACARI'),
(389, 4, 4, 3, 'AREQUIPA', 'CARAVELI', 'ATICO'),
(390, 4, 4, 4, 'AREQUIPA', 'CARAVELI', 'ATIQUIPA'),
(391, 4, 4, 5, 'AREQUIPA', 'CARAVELI', 'BELLA UNION'),
(392, 4, 4, 6, 'AREQUIPA', 'CARAVELI', 'CAHUACHO'),
(393, 4, 4, 7, 'AREQUIPA', 'CARAVELI', 'CHALA'),
(394, 4, 4, 8, 'AREQUIPA', 'CARAVELI', 'CHAPARRA'),
(395, 4, 4, 9, 'AREQUIPA', 'CARAVELI', 'HUANUHUANU'),
(396, 4, 4, 10, 'AREQUIPA', 'CARAVELI', 'JAQUI'),
(397, 4, 4, 11, 'AREQUIPA', 'CARAVELI', 'LOMAS'),
(398, 4, 4, 12, 'AREQUIPA', 'CARAVELI', 'QUICACHA'),
(399, 4, 4, 13, 'AREQUIPA', 'CARAVELI', 'YAUCA'),
(400, 4, 5, 1, 'AREQUIPA', 'CASTILLA', 'APLAO'),
(401, 4, 5, 2, 'AREQUIPA', 'CASTILLA', 'ANDAGUA'),
(402, 4, 5, 3, 'AREQUIPA', 'CASTILLA', 'AYO'),
(403, 4, 5, 4, 'AREQUIPA', 'CASTILLA', 'CHACHAS'),
(404, 4, 5, 5, 'AREQUIPA', 'CASTILLA', 'CHILCAYMARCA'),
(405, 4, 5, 6, 'AREQUIPA', 'CASTILLA', 'CHOCO'),
(406, 4, 5, 7, 'AREQUIPA', 'CASTILLA', 'HUANCARQUI'),
(407, 4, 5, 8, 'AREQUIPA', 'CASTILLA', 'MACHAGUAY'),
(408, 4, 5, 9, 'AREQUIPA', 'CASTILLA', 'ORCOPAMPA'),
(409, 4, 5, 10, 'AREQUIPA', 'CASTILLA', 'PAMPACOLCA'),
(410, 4, 5, 11, 'AREQUIPA', 'CASTILLA', 'TIPAN'),
(411, 4, 5, 12, 'AREQUIPA', 'CASTILLA', 'URACA'),
(412, 4, 5, 13, 'AREQUIPA', 'CASTILLA', 'UÑON'),
(413, 4, 5, 14, 'AREQUIPA', 'CASTILLA', 'VIRACO'),
(414, 4, 6, 1, 'AREQUIPA', 'CONDESUYOS', 'CHUQUIBAMBA'),
(415, 4, 6, 2, 'AREQUIPA', 'CONDESUYOS', 'ANDARAY'),
(416, 4, 6, 3, 'AREQUIPA', 'CONDESUYOS', 'CAYARANI'),
(417, 4, 6, 4, 'AREQUIPA', 'CONDESUYOS', 'CHICHAS'),
(418, 4, 6, 5, 'AREQUIPA', 'CONDESUYOS', 'IRAY'),
(419, 4, 6, 6, 'AREQUIPA', 'CONDESUYOS', 'SALAMANCA'),
(420, 4, 6, 7, 'AREQUIPA', 'CONDESUYOS', 'YANAQUIHUA'),
(421, 4, 6, 8, 'AREQUIPA', 'CONDESUYOS', 'RIO GRANDE'),
(422, 4, 7, 1, 'AREQUIPA', 'ISLAY', 'MOLLENDO'),
(423, 4, 7, 2, 'AREQUIPA', 'ISLAY', 'COCACHACRA'),
(424, 4, 7, 3, 'AREQUIPA', 'ISLAY', 'DEAN VALDIVIA'),
(425, 4, 7, 4, 'AREQUIPA', 'ISLAY', 'ISLAY'),
(426, 4, 7, 5, 'AREQUIPA', 'ISLAY', 'MEJIA'),
(427, 4, 7, 6, 'AREQUIPA', 'ISLAY', 'PUNTA DE BOMBON'),
(428, 4, 8, 1, 'AREQUIPA', 'LA UNION', 'COTAHUASI'),
(429, 4, 8, 2, 'AREQUIPA', 'LA UNION', 'ALCA'),
(430, 4, 8, 3, 'AREQUIPA', 'LA UNION', 'CHARCANA'),
(431, 4, 8, 4, 'AREQUIPA', 'LA UNION', 'HUAYNACOTAS'),
(432, 4, 8, 5, 'AREQUIPA', 'LA UNION', 'PAMPAMARCA'),
(433, 4, 8, 6, 'AREQUIPA', 'LA UNION', 'PUYCA'),
(434, 4, 8, 7, 'AREQUIPA', 'LA UNION', 'QUECHUALLA'),
(435, 4, 8, 8, 'AREQUIPA', 'LA UNION', 'SAYLA'),
(436, 4, 8, 9, 'AREQUIPA', 'LA UNION', 'TAURIA'),
(437, 4, 8, 10, 'AREQUIPA', 'LA UNION', 'TOMEPAMPA'),
(438, 4, 8, 11, 'AREQUIPA', 'LA UNION', 'TORO'),
(439, 5, 1, 1, 'AYACUCHO', 'HUAMANGA', 'AYACUCHO'),
(440, 5, 1, 2, 'AYACUCHO', 'HUAMANGA', 'ACOS VINCHOS'),
(441, 5, 1, 3, 'AYACUCHO', 'HUAMANGA', 'CARMEN ALTO'),
(442, 5, 1, 4, 'AYACUCHO', 'HUAMANGA', 'CHIARA'),
(443, 5, 1, 5, 'AYACUCHO', 'HUAMANGA', 'QUINUA'),
(444, 5, 1, 6, 'AYACUCHO', 'HUAMANGA', 'SAN JOSE DE TICLLAS'),
(445, 5, 1, 7, 'AYACUCHO', 'HUAMANGA', 'SAN JUAN BAUTISTA'),
(446, 5, 1, 8, 'AYACUCHO', 'HUAMANGA', 'SANTIAGO DE PISCHA'),
(447, 5, 1, 9, 'AYACUCHO', 'HUAMANGA', 'VINCHOS'),
(448, 5, 1, 10, 'AYACUCHO', 'HUAMANGA', 'TAMBILLO'),
(449, 5, 1, 11, 'AYACUCHO', 'HUAMANGA', 'ACOCRO'),
(450, 5, 1, 12, 'AYACUCHO', 'HUAMANGA', 'SOCOS'),
(451, 5, 1, 13, 'AYACUCHO', 'HUAMANGA', 'OCROS'),
(452, 5, 1, 14, 'AYACUCHO', 'HUAMANGA', 'PACAYCASA'),
(453, 5, 1, 15, 'AYACUCHO', 'HUAMANGA', 'JESUS NAZARENO'),
(454, 5, 2, 1, 'AYACUCHO', 'CANGALLO', 'CANGALLO'),
(455, 5, 2, 4, 'AYACUCHO', 'CANGALLO', 'CHUSCHI'),
(456, 5, 2, 6, 'AYACUCHO', 'CANGALLO', 'LOS MOROCHUCOS'),
(457, 5, 2, 7, 'AYACUCHO', 'CANGALLO', 'PARAS'),
(458, 5, 2, 8, 'AYACUCHO', 'CANGALLO', 'TOTOS'),
(459, 5, 2, 11, 'AYACUCHO', 'CANGALLO', 'MARIA PARADO DE BELLIDO'),
(460, 5, 3, 1, 'AYACUCHO', 'HUANTA', 'HUANTA'),
(461, 5, 3, 2, 'AYACUCHO', 'HUANTA', 'AYAHUANCO'),
(462, 5, 3, 3, 'AYACUCHO', 'HUANTA', 'HUAMANGUILLA'),
(463, 5, 3, 4, 'AYACUCHO', 'HUANTA', 'IGUAIN'),
(464, 5, 3, 5, 'AYACUCHO', 'HUANTA', 'LURICOCHA'),
(465, 5, 3, 7, 'AYACUCHO', 'HUANTA', 'SANTILLANA'),
(466, 5, 3, 8, 'AYACUCHO', 'HUANTA', 'SIVIA'),
(467, 5, 3, 9, 'AYACUCHO', 'HUANTA', 'LLOCHEGUA'),
(468, 5, 4, 1, 'AYACUCHO', 'LA MAR', 'SAN MIGUEL'),
(469, 5, 4, 2, 'AYACUCHO', 'LA MAR', 'ANCO'),
(470, 5, 4, 3, 'AYACUCHO', 'LA MAR', 'AYNA'),
(471, 5, 4, 4, 'AYACUCHO', 'LA MAR', 'CHILCAS'),
(472, 5, 4, 5, 'AYACUCHO', 'LA MAR', 'CHUNGUI'),
(473, 5, 4, 6, 'AYACUCHO', 'LA MAR', 'TAMBO'),
(474, 5, 4, 7, 'AYACUCHO', 'LA MAR', 'LUIS CARRANZA'),
(475, 5, 4, 8, 'AYACUCHO', 'LA MAR', 'SANTA ROSA'),
(476, 5, 5, 1, 'AYACUCHO', 'LUCANAS', 'PUQUIO'),
(477, 5, 5, 2, 'AYACUCHO', 'LUCANAS', 'AUCARA'),
(478, 5, 5, 3, 'AYACUCHO', 'LUCANAS', 'CABANA'),
(479, 5, 5, 4, 'AYACUCHO', 'LUCANAS', 'CARMEN SALCEDO'),
(480, 5, 5, 6, 'AYACUCHO', 'LUCANAS', 'CHAVIÑA'),
(481, 5, 5, 8, 'AYACUCHO', 'LUCANAS', 'CHIPAO'),
(482, 5, 5, 10, 'AYACUCHO', 'LUCANAS', 'HUAC-HUAS'),
(483, 5, 5, 11, 'AYACUCHO', 'LUCANAS', 'LARAMATE'),
(484, 5, 5, 12, 'AYACUCHO', 'LUCANAS', 'LEONCIO PRADO'),
(485, 5, 5, 13, 'AYACUCHO', 'LUCANAS', 'LUCANAS'),
(486, 5, 5, 14, 'AYACUCHO', 'LUCANAS', 'LLAUTA'),
(487, 5, 5, 16, 'AYACUCHO', 'LUCANAS', 'OCAÑA'),
(488, 5, 5, 17, 'AYACUCHO', 'LUCANAS', 'OTOCA'),
(489, 5, 5, 20, 'AYACUCHO', 'LUCANAS', 'SANCOS'),
(490, 5, 5, 21, 'AYACUCHO', 'LUCANAS', 'SAN JUAN'),
(491, 5, 5, 22, 'AYACUCHO', 'LUCANAS', 'SAN PEDRO'),
(492, 5, 5, 24, 'AYACUCHO', 'LUCANAS', 'STA ANA DE HUAYCAHUACHO'),
(493, 5, 5, 25, 'AYACUCHO', 'LUCANAS', 'SANTA LUCIA'),
(494, 5, 5, 29, 'AYACUCHO', 'LUCANAS', 'SAISA'),
(495, 5, 5, 31, 'AYACUCHO', 'LUCANAS', 'SAN PEDRO DE PALCO'),
(496, 5, 5, 32, 'AYACUCHO', 'LUCANAS', 'SAN CRISTOBAL'),
(497, 5, 6, 1, 'AYACUCHO', 'PARINACOCHAS', 'CORACORA'),
(498, 5, 6, 4, 'AYACUCHO', 'PARINACOCHAS', 'CORONEL CASTAÑEDA'),
(499, 5, 6, 5, 'AYACUCHO', 'PARINACOCHAS', 'CHUMPI'),
(500, 5, 6, 8, 'AYACUCHO', 'PARINACOCHAS', 'PACAPAUSA'),
(501, 5, 6, 11, 'AYACUCHO', 'PARINACOCHAS', 'PULLO'),
(502, 5, 6, 12, 'AYACUCHO', 'PARINACOCHAS', 'PUYUSCA'),
(503, 5, 6, 15, 'AYACUCHO', 'PARINACOCHAS', 'SAN FCO DE RAVACAYCO'),
(504, 5, 6, 16, 'AYACUCHO', 'PARINACOCHAS', 'UPAHUACHO'),
(505, 5, 7, 1, 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCAPI'),
(506, 5, 7, 2, 'AYACUCHO', 'VICTOR FAJARDO', 'ALCAMENCA'),
(507, 5, 7, 3, 'AYACUCHO', 'VICTOR FAJARDO', 'APONGO'),
(508, 5, 7, 4, 'AYACUCHO', 'VICTOR FAJARDO', 'CANARIA'),
(509, 5, 7, 6, 'AYACUCHO', 'VICTOR FAJARDO', 'CAYARA'),
(510, 5, 7, 7, 'AYACUCHO', 'VICTOR FAJARDO', 'COLCA'),
(511, 5, 7, 8, 'AYACUCHO', 'VICTOR FAJARDO', 'HUAYA'),
(512, 5, 7, 9, 'AYACUCHO', 'VICTOR FAJARDO', 'HUAMANQUIQUIA'),
(513, 5, 7, 10, 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCARAYLLA'),
(514, 5, 7, 13, 'AYACUCHO', 'VICTOR FAJARDO', 'SARHUA'),
(515, 5, 7, 14, 'AYACUCHO', 'VICTOR FAJARDO', 'VILCANCHOS'),
(516, 5, 7, 15, 'AYACUCHO', 'VICTOR FAJARDO', 'ASQUIPATA'),
(517, 5, 8, 1, 'AYACUCHO', 'HUANCA SANCOS', 'SANCOS'),
(518, 5, 8, 2, 'AYACUCHO', 'HUANCA SANCOS', 'SACSAMARCA'),
(519, 5, 8, 3, 'AYACUCHO', 'HUANCA SANCOS', 'SANTIAGO DE LUCANAMARCA'),
(520, 5, 8, 4, 'AYACUCHO', 'HUANCA SANCOS', 'CARAPO'),
(521, 5, 9, 1, 'AYACUCHO', 'VILCAS HUAMAN', 'VILCAS HUAMAN'),
(522, 5, 9, 2, 'AYACUCHO', 'VILCAS HUAMAN', 'VISCHONGO'),
(523, 5, 9, 3, 'AYACUCHO', 'VILCAS HUAMAN', 'ACCOMARCA'),
(524, 5, 9, 4, 'AYACUCHO', 'VILCAS HUAMAN', 'CARHUANCA'),
(525, 5, 9, 5, 'AYACUCHO', 'VILCAS HUAMAN', 'CONCEPCION'),
(526, 5, 9, 6, 'AYACUCHO', 'VILCAS HUAMAN', 'HUAMBALPA'),
(527, 5, 9, 7, 'AYACUCHO', 'VILCAS HUAMAN', 'SAURAMA'),
(528, 5, 9, 8, 'AYACUCHO', 'VILCAS HUAMAN', 'INDEPENDENCIA'),
(529, 5, 10, 1, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PAUSA'),
(530, 5, 10, 2, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'COLTA'),
(531, 5, 10, 3, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'CORCULLA'),
(532, 5, 10, 4, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'LAMPA'),
(533, 5, 10, 5, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'MARCABAMBA'),
(534, 5, 10, 6, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'OYOLO'),
(535, 5, 10, 7, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PARARCA'),
(536, 5, 10, 8, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JAVIER DE ALPABAMBA'),
(537, 5, 10, 9, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JOSE DE USHUA'),
(538, 5, 10, 10, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SARA SARA'),
(539, 5, 11, 1, 'AYACUCHO', 'SUCRE', 'QUEROBAMBA'),
(540, 5, 11, 2, 'AYACUCHO', 'SUCRE', 'BELEN'),
(541, 5, 11, 3, 'AYACUCHO', 'SUCRE', 'CHALCOS'),
(542, 5, 11, 4, 'AYACUCHO', 'SUCRE', 'SAN SALVADOR DE QUIJE'),
(543, 5, 11, 5, 'AYACUCHO', 'SUCRE', 'PAICO'),
(544, 5, 11, 6, 'AYACUCHO', 'SUCRE', 'SANTIAGO DE PAUCARAY'),
(545, 5, 11, 7, 'AYACUCHO', 'SUCRE', 'SAN PEDRO DE LARCAY'),
(546, 5, 11, 8, 'AYACUCHO', 'SUCRE', 'SORAS'),
(547, 5, 11, 9, 'AYACUCHO', 'SUCRE', 'HUACAÑA'),
(548, 5, 11, 10, 'AYACUCHO', 'SUCRE', 'CHILCAYOC'),
(549, 5, 11, 11, 'AYACUCHO', 'SUCRE', 'MORCOLLA'),
(550, 6, 1, 1, 'CAJAMARCA', 'CAJAMARCA', 'CAJAMARCA'),
(551, 6, 1, 2, 'CAJAMARCA', 'CAJAMARCA', 'ASUNCION'),
(552, 6, 1, 3, 'CAJAMARCA', 'CAJAMARCA', 'COSPAN'),
(553, 6, 1, 4, 'CAJAMARCA', 'CAJAMARCA', 'CHETILLA'),
(554, 6, 1, 5, 'CAJAMARCA', 'CAJAMARCA', 'ENCAÑADA'),
(555, 6, 1, 6, 'CAJAMARCA', 'CAJAMARCA', 'JESUS'),
(556, 6, 1, 7, 'CAJAMARCA', 'CAJAMARCA', 'LOS BAÑOS DEL INCA'),
(557, 6, 1, 8, 'CAJAMARCA', 'CAJAMARCA', 'LLACANORA'),
(558, 6, 1, 9, 'CAJAMARCA', 'CAJAMARCA', 'MAGDALENA'),
(559, 6, 1, 10, 'CAJAMARCA', 'CAJAMARCA', 'MATARA'),
(560, 6, 1, 11, 'CAJAMARCA', 'CAJAMARCA', 'NAMORA'),
(561, 6, 1, 12, 'CAJAMARCA', 'CAJAMARCA', 'SAN JUAN'),
(562, 6, 2, 1, 'CAJAMARCA', 'CAJABAMBA', 'CAJABAMBA'),
(563, 6, 2, 2, 'CAJAMARCA', 'CAJABAMBA', 'CACHACHI'),
(564, 6, 2, 3, 'CAJAMARCA', 'CAJABAMBA', 'CONDEBAMBA'),
(565, 6, 2, 5, 'CAJAMARCA', 'CAJABAMBA', 'SITACOCHA'),
(566, 6, 3, 1, 'CAJAMARCA', 'CELENDIN', 'CELENDIN'),
(567, 6, 3, 2, 'CAJAMARCA', 'CELENDIN', 'CORTEGANA'),
(568, 6, 3, 3, 'CAJAMARCA', 'CELENDIN', 'CHUMUCH'),
(569, 6, 3, 4, 'CAJAMARCA', 'CELENDIN', 'HUASMIN'),
(570, 6, 3, 5, 'CAJAMARCA', 'CELENDIN', 'JORGE CHAVEZ'),
(571, 6, 3, 6, 'CAJAMARCA', 'CELENDIN', 'JOSE GALVEZ'),
(572, 6, 3, 7, 'CAJAMARCA', 'CELENDIN', 'MIGUEL IGLESIAS'),
(573, 6, 3, 8, 'CAJAMARCA', 'CELENDIN', 'OXAMARCA'),
(574, 6, 3, 9, 'CAJAMARCA', 'CELENDIN', 'SOROCHUCO'),
(575, 6, 3, 10, 'CAJAMARCA', 'CELENDIN', 'SUCRE'),
(576, 6, 3, 11, 'CAJAMARCA', 'CELENDIN', 'UTCO'),
(577, 6, 3, 12, 'CAJAMARCA', 'CELENDIN', 'LA LIBERTAD DE PALLAN'),
(578, 6, 4, 1, 'CAJAMARCA', 'CONTUMAZA', 'CONTUMAZA'),
(579, 6, 4, 3, 'CAJAMARCA', 'CONTUMAZA', 'CHILETE'),
(580, 6, 4, 4, 'CAJAMARCA', 'CONTUMAZA', 'GUZMANGO'),
(581, 6, 4, 5, 'CAJAMARCA', 'CONTUMAZA', 'SAN BENITO'),
(582, 6, 4, 6, 'CAJAMARCA', 'CONTUMAZA', 'CUPISNIQUE'),
(583, 6, 4, 7, 'CAJAMARCA', 'CONTUMAZA', 'TANTARICA'),
(584, 6, 4, 8, 'CAJAMARCA', 'CONTUMAZA', 'YONAN'),
(585, 6, 4, 9, 'CAJAMARCA', 'CONTUMAZA', 'STA CRUZ DE TOLEDO'),
(586, 6, 5, 1, 'CAJAMARCA', 'CUTERVO', 'CUTERVO'),
(587, 6, 5, 2, 'CAJAMARCA', 'CUTERVO', 'CALLAYUC'),
(588, 6, 5, 3, 'CAJAMARCA', 'CUTERVO', 'CUJILLO'),
(589, 6, 5, 4, 'CAJAMARCA', 'CUTERVO', 'CHOROS'),
(590, 6, 5, 5, 'CAJAMARCA', 'CUTERVO', 'LA RAMADA'),
(591, 6, 5, 6, 'CAJAMARCA', 'CUTERVO', 'PIMPINGOS'),
(592, 6, 5, 7, 'CAJAMARCA', 'CUTERVO', 'QUEROCOTILLO'),
(593, 6, 5, 8, 'CAJAMARCA', 'CUTERVO', 'SAN ANDRES DE CUTERVO'),
(594, 6, 5, 9, 'CAJAMARCA', 'CUTERVO', 'SAN JUAN DE CUTERVO'),
(595, 6, 5, 10, 'CAJAMARCA', 'CUTERVO', 'SAN LUIS DE LUCMA'),
(596, 6, 5, 11, 'CAJAMARCA', 'CUTERVO', 'SANTA CRUZ'),
(597, 6, 5, 12, 'CAJAMARCA', 'CUTERVO', 'SANTO DOMINGO DE LA CAPILLA'),
(598, 6, 5, 13, 'CAJAMARCA', 'CUTERVO', 'SANTO TOMAS'),
(599, 6, 5, 14, 'CAJAMARCA', 'CUTERVO', 'SOCOTA'),
(600, 6, 5, 15, 'CAJAMARCA', 'CUTERVO', 'TORIBIO CASANOVA'),
(601, 6, 6, 1, 'CAJAMARCA', 'CHOTA', 'CHOTA'),
(602, 6, 6, 2, 'CAJAMARCA', 'CHOTA', 'ANGUIA'),
(603, 6, 6, 3, 'CAJAMARCA', 'CHOTA', 'COCHABAMBA'),
(604, 6, 6, 4, 'CAJAMARCA', 'CHOTA', 'CONCHAN'),
(605, 6, 6, 5, 'CAJAMARCA', 'CHOTA', 'CHADIN'),
(606, 6, 6, 6, 'CAJAMARCA', 'CHOTA', 'CHIGUIRIP'),
(607, 6, 6, 7, 'CAJAMARCA', 'CHOTA', 'CHIMBAN'),
(608, 6, 6, 8, 'CAJAMARCA', 'CHOTA', 'HUAMBOS'),
(609, 6, 6, 9, 'CAJAMARCA', 'CHOTA', 'LAJAS'),
(610, 6, 6, 10, 'CAJAMARCA', 'CHOTA', 'LLAMA'),
(611, 6, 6, 11, 'CAJAMARCA', 'CHOTA', 'MIRACOSTA'),
(612, 6, 6, 12, 'CAJAMARCA', 'CHOTA', 'PACCHA'),
(613, 6, 6, 13, 'CAJAMARCA', 'CHOTA', 'PION'),
(614, 6, 6, 14, 'CAJAMARCA', 'CHOTA', 'QUEROCOTO'),
(615, 6, 6, 15, 'CAJAMARCA', 'CHOTA', 'TACABAMBA'),
(616, 6, 6, 16, 'CAJAMARCA', 'CHOTA', 'TOCMOCHE'),
(617, 6, 6, 17, 'CAJAMARCA', 'CHOTA', 'SAN JUAN DE LICUPIS'),
(618, 6, 6, 18, 'CAJAMARCA', 'CHOTA', 'CHOROPAMPA'),
(619, 6, 6, 19, 'CAJAMARCA', 'CHOTA', 'CHALAMARCA'),
(620, 6, 7, 1, 'CAJAMARCA', 'HUALGAYOC', 'BAMBAMARCA'),
(621, 6, 7, 2, 'CAJAMARCA', 'HUALGAYOC', 'CHUGUR'),
(622, 6, 7, 3, 'CAJAMARCA', 'HUALGAYOC', 'HUALGAYOC'),
(623, 6, 8, 1, 'CAJAMARCA', 'JAEN', 'JAEN'),
(624, 6, 8, 2, 'CAJAMARCA', 'JAEN', 'BELLAVISTA'),
(625, 6, 8, 3, 'CAJAMARCA', 'JAEN', 'COLASAY'),
(626, 6, 8, 4, 'CAJAMARCA', 'JAEN', 'CHONTALI'),
(627, 6, 8, 5, 'CAJAMARCA', 'JAEN', 'POMAHUACA'),
(628, 6, 8, 6, 'CAJAMARCA', 'JAEN', 'PUCARA'),
(629, 6, 8, 7, 'CAJAMARCA', 'JAEN', 'SALLIQUE'),
(630, 6, 8, 8, 'CAJAMARCA', 'JAEN', 'SAN FELIPE'),
(631, 6, 8, 9, 'CAJAMARCA', 'JAEN', 'SAN JOSE DEL ALTO'),
(632, 6, 8, 10, 'CAJAMARCA', 'JAEN', 'SANTA ROSA'),
(633, 6, 8, 11, 'CAJAMARCA', 'JAEN', 'LAS PIRIAS'),
(634, 6, 8, 12, 'CAJAMARCA', 'JAEN', 'HUABAL'),
(635, 6, 9, 1, 'CAJAMARCA', 'SANTA CRUZ', 'SANTA CRUZ'),
(636, 6, 9, 2, 'CAJAMARCA', 'SANTA CRUZ', 'CATACHE'),
(637, 6, 9, 3, 'CAJAMARCA', 'SANTA CRUZ', 'CHANCAIBAÑOS'),
(638, 6, 9, 4, 'CAJAMARCA', 'SANTA CRUZ', 'LA ESPERANZA'),
(639, 6, 9, 5, 'CAJAMARCA', 'SANTA CRUZ', 'NINABAMBA'),
(640, 6, 9, 6, 'CAJAMARCA', 'SANTA CRUZ', 'PULAN'),
(641, 6, 9, 7, 'CAJAMARCA', 'SANTA CRUZ', 'SEXI'),
(642, 6, 9, 8, 'CAJAMARCA', 'SANTA CRUZ', 'UTICYACU'),
(643, 6, 9, 9, 'CAJAMARCA', 'SANTA CRUZ', 'YAUYUCAN'),
(644, 6, 9, 10, 'CAJAMARCA', 'SANTA CRUZ', 'ANDABAMBA'),
(645, 6, 9, 11, 'CAJAMARCA', 'SANTA CRUZ', 'SAUCEPAMPA'),
(646, 6, 10, 1, 'CAJAMARCA', 'SAN MIGUEL', 'SAN MIGUEL'),
(647, 6, 10, 2, 'CAJAMARCA', 'SAN MIGUEL', 'CALQUIS'),
(648, 6, 10, 3, 'CAJAMARCA', 'SAN MIGUEL', 'LA FLORIDA'),
(649, 6, 10, 4, 'CAJAMARCA', 'SAN MIGUEL', 'LLAPA'),
(650, 6, 10, 5, 'CAJAMARCA', 'SAN MIGUEL', 'NANCHOC'),
(651, 6, 10, 6, 'CAJAMARCA', 'SAN MIGUEL', 'NIEPOS'),
(652, 6, 10, 7, 'CAJAMARCA', 'SAN MIGUEL', 'SAN GREGORIO'),
(653, 6, 10, 8, 'CAJAMARCA', 'SAN MIGUEL', 'SAN SILVESTRE DE COCHAN'),
(654, 6, 10, 9, 'CAJAMARCA', 'SAN MIGUEL', 'EL PRADO'),
(655, 6, 10, 10, 'CAJAMARCA', 'SAN MIGUEL', 'UNION AGUA BLANCA'),
(656, 6, 10, 11, 'CAJAMARCA', 'SAN MIGUEL', 'TONGOD'),
(657, 6, 10, 12, 'CAJAMARCA', 'SAN MIGUEL', 'CATILLUC'),
(658, 6, 10, 13, 'CAJAMARCA', 'SAN MIGUEL', 'BOLIVAR'),
(659, 6, 11, 1, 'CAJAMARCA', 'SAN IGNACIO', 'SAN IGNACIO'),
(660, 6, 11, 2, 'CAJAMARCA', 'SAN IGNACIO', 'CHIRINOS'),
(661, 6, 11, 3, 'CAJAMARCA', 'SAN IGNACIO', 'HUARANGO'),
(662, 6, 11, 4, 'CAJAMARCA', 'SAN IGNACIO', 'NAMBALLE'),
(663, 6, 11, 5, 'CAJAMARCA', 'SAN IGNACIO', 'LA COIPA'),
(664, 6, 11, 6, 'CAJAMARCA', 'SAN IGNACIO', 'SAN JOSE DE LOURDES'),
(665, 6, 11, 7, 'CAJAMARCA', 'SAN IGNACIO', 'TABACONAS'),
(666, 6, 12, 1, 'CAJAMARCA', 'SAN MARCOS', 'PEDRO GALVEZ'),
(667, 6, 12, 2, 'CAJAMARCA', 'SAN MARCOS', 'ICHOCAN'),
(668, 6, 12, 3, 'CAJAMARCA', 'SAN MARCOS', 'GREGORIO PITA'),
(669, 6, 12, 4, 'CAJAMARCA', 'SAN MARCOS', 'JOSE MANUEL QUIROZ'),
(670, 6, 12, 5, 'CAJAMARCA', 'SAN MARCOS', 'EDUARDO VILLANUEVA'),
(671, 6, 12, 6, 'CAJAMARCA', 'SAN MARCOS', 'JOSE SABOGAL'),
(672, 6, 12, 7, 'CAJAMARCA', 'SAN MARCOS', 'CHANCAY'),
(673, 6, 13, 1, 'CAJAMARCA', 'SAN PABLO', 'SAN PABLO'),
(674, 6, 13, 2, 'CAJAMARCA', 'SAN PABLO', 'SAN BERNARDINO'),
(675, 6, 13, 3, 'CAJAMARCA', 'SAN PABLO', 'SAN LUIS'),
(676, 6, 13, 4, 'CAJAMARCA', 'SAN PABLO', 'TUMBADEN'),
(677, 7, 1, 1, 'CUSCO', 'CUSCO', 'CUSCO'),
(678, 7, 1, 2, 'CUSCO', 'CUSCO', 'CCORCA'),
(679, 7, 1, 3, 'CUSCO', 'CUSCO', 'POROY'),
(680, 7, 1, 4, 'CUSCO', 'CUSCO', 'SAN JERONIMO'),
(681, 7, 1, 5, 'CUSCO', 'CUSCO', 'SAN SEBASTIAN'),
(682, 7, 1, 6, 'CUSCO', 'CUSCO', 'SANTIAGO'),
(683, 7, 1, 7, 'CUSCO', 'CUSCO', 'SAYLLA'),
(684, 7, 1, 8, 'CUSCO', 'CUSCO', 'WANCHAQ'),
(685, 7, 2, 1, 'CUSCO', 'ACOMAYO', 'ACOMAYO'),
(686, 7, 2, 2, 'CUSCO', 'ACOMAYO', 'ACOPIA'),
(687, 7, 2, 3, 'CUSCO', 'ACOMAYO', 'ACOS'),
(688, 7, 2, 4, 'CUSCO', 'ACOMAYO', 'POMACANCHI'),
(689, 7, 2, 5, 'CUSCO', 'ACOMAYO', 'RONDOCAN'),
(690, 7, 2, 6, 'CUSCO', 'ACOMAYO', 'SANGARARA'),
(691, 7, 2, 7, 'CUSCO', 'ACOMAYO', 'MOSOC LLACTA'),
(692, 7, 3, 1, 'CUSCO', 'ANTA', 'ANTA'),
(693, 7, 3, 2, 'CUSCO', 'ANTA', 'CHINCHAYPUJIO'),
(694, 7, 3, 3, 'CUSCO', 'ANTA', 'HUAROCONDO'),
(695, 7, 3, 4, 'CUSCO', 'ANTA', 'LIMATAMBO'),
(696, 7, 3, 5, 'CUSCO', 'ANTA', 'MOLLEPATA'),
(697, 7, 3, 6, 'CUSCO', 'ANTA', 'PUCYURA'),
(698, 7, 3, 7, 'CUSCO', 'ANTA', 'ZURITE'),
(699, 7, 3, 8, 'CUSCO', 'ANTA', 'CACHIMAYO'),
(700, 7, 3, 9, 'CUSCO', 'ANTA', 'ANCAHUASI'),
(701, 7, 4, 1, 'CUSCO', 'CALCA', 'CALCA'),
(702, 7, 4, 2, 'CUSCO', 'CALCA', 'COYA'),
(703, 7, 4, 3, 'CUSCO', 'CALCA', 'LAMAY'),
(704, 7, 4, 4, 'CUSCO', 'CALCA', 'LARES'),
(705, 7, 4, 5, 'CUSCO', 'CALCA', 'PISAC'),
(706, 7, 4, 6, 'CUSCO', 'CALCA', 'SAN SALVADOR'),
(707, 7, 4, 7, 'CUSCO', 'CALCA', 'TARAY'),
(708, 7, 4, 8, 'CUSCO', 'CALCA', 'YANATILE'),
(709, 7, 5, 1, 'CUSCO', 'CANAS', 'YANAOCA'),
(710, 7, 5, 2, 'CUSCO', 'CANAS', 'CHECCA'),
(711, 7, 5, 3, 'CUSCO', 'CANAS', 'KUNTURKANKI'),
(712, 7, 5, 4, 'CUSCO', 'CANAS', 'LANGUI'),
(713, 7, 5, 5, 'CUSCO', 'CANAS', 'LAYO'),
(714, 7, 5, 6, 'CUSCO', 'CANAS', 'PAMPAMARCA'),
(715, 7, 5, 7, 'CUSCO', 'CANAS', 'QUEHUE'),
(716, 7, 5, 8, 'CUSCO', 'CANAS', 'TUPAC AMARU'),
(717, 7, 6, 1, 'CUSCO', 'CANCHIS', 'SICUANI'),
(718, 7, 6, 2, 'CUSCO', 'CANCHIS', 'COMBAPATA'),
(719, 7, 6, 3, 'CUSCO', 'CANCHIS', 'CHECACUPE'),
(720, 7, 6, 4, 'CUSCO', 'CANCHIS', 'MARANGANI'),
(721, 7, 6, 5, 'CUSCO', 'CANCHIS', 'PITUMARCA'),
(722, 7, 6, 6, 'CUSCO', 'CANCHIS', 'SAN PABLO'),
(723, 7, 6, 7, 'CUSCO', 'CANCHIS', 'SAN PEDRO'),
(724, 7, 6, 8, 'CUSCO', 'CANCHIS', 'TINTA'),
(725, 7, 7, 1, 'CUSCO', 'CHUMBIVILCAS', 'SANTO TOMAS'),
(726, 7, 7, 2, 'CUSCO', 'CHUMBIVILCAS', 'CAPACMARCA'),
(727, 7, 7, 3, 'CUSCO', 'CHUMBIVILCAS', 'COLQUEMARCA'),
(728, 7, 7, 4, 'CUSCO', 'CHUMBIVILCAS', 'CHAMACA'),
(729, 7, 7, 5, 'CUSCO', 'CHUMBIVILCAS', 'LIVITACA'),
(730, 7, 7, 6, 'CUSCO', 'CHUMBIVILCAS', 'LLUSCO'),
(731, 7, 7, 7, 'CUSCO', 'CHUMBIVILCAS', 'QUIÑOTA'),
(732, 7, 7, 8, 'CUSCO', 'CHUMBIVILCAS', 'VELILLE'),
(733, 7, 8, 1, 'CUSCO', 'ESPINAR', 'ESPINAR'),
(734, 7, 8, 2, 'CUSCO', 'ESPINAR', 'CONDOROMA'),
(735, 7, 8, 3, 'CUSCO', 'ESPINAR', 'COPORAQUE'),
(736, 7, 8, 4, 'CUSCO', 'ESPINAR', 'OCORURO'),
(737, 7, 8, 5, 'CUSCO', 'ESPINAR', 'PALLPATA'),
(738, 7, 8, 6, 'CUSCO', 'ESPINAR', 'PICHIGUA'),
(739, 7, 8, 7, 'CUSCO', 'ESPINAR', 'SUYKUTAMBO'),
(740, 7, 8, 8, 'CUSCO', 'ESPINAR', 'ALTO PICHIGUA'),
(741, 7, 9, 1, 'CUSCO', 'LA CONVENCION', 'SANTA ANA'),
(742, 7, 9, 2, 'CUSCO', 'LA CONVENCION', 'ECHARATE'),
(743, 7, 9, 3, 'CUSCO', 'LA CONVENCION', 'HUAYOPATA'),
(744, 7, 9, 4, 'CUSCO', 'LA CONVENCION', 'MARANURA'),
(745, 7, 9, 5, 'CUSCO', 'LA CONVENCION', 'OCOBAMBA'),
(746, 7, 9, 6, 'CUSCO', 'LA CONVENCION', 'SANTA TERESA'),
(747, 7, 9, 7, 'CUSCO', 'LA CONVENCION', 'VILCABAMBA'),
(748, 7, 9, 8, 'CUSCO', 'LA CONVENCION', 'QUELLOUNO'),
(749, 7, 9, 9, 'CUSCO', 'LA CONVENCION', 'KIMBIRI'),
(750, 7, 9, 10, 'CUSCO', 'LA CONVENCION', 'PICHARI'),
(751, 7, 10, 1, 'CUSCO', 'PARURO', 'PARURO'),
(752, 7, 10, 2, 'CUSCO', 'PARURO', 'ACCHA'),
(753, 7, 10, 3, 'CUSCO', 'PARURO', 'CCAPI'),
(754, 7, 10, 4, 'CUSCO', 'PARURO', 'COLCHA'),
(755, 7, 10, 5, 'CUSCO', 'PARURO', 'HUANOQUITE'),
(756, 7, 10, 6, 'CUSCO', 'PARURO', 'OMACHA'),
(757, 7, 10, 7, 'CUSCO', 'PARURO', 'YAURISQUE'),
(758, 7, 10, 8, 'CUSCO', 'PARURO', 'PACCARITAMBO'),
(759, 7, 10, 9, 'CUSCO', 'PARURO', 'PILLPINTO'),
(760, 7, 11, 1, 'CUSCO', 'PAUCARTAMBO', 'PAUCARTAMBO'),
(761, 7, 11, 2, 'CUSCO', 'PAUCARTAMBO', 'CAICAY'),
(762, 7, 11, 3, 'CUSCO', 'PAUCARTAMBO', 'COLQUEPATA'),
(763, 7, 11, 4, 'CUSCO', 'PAUCARTAMBO', 'CHALLABAMBA'),
(764, 7, 11, 5, 'CUSCO', 'PAUCARTAMBO', 'COSÑIPATA'),
(765, 7, 11, 6, 'CUSCO', 'PAUCARTAMBO', 'HUANCARANI'),
(766, 7, 12, 1, 'CUSCO', 'QUISPICANCHI', 'URCOS'),
(767, 7, 12, 2, 'CUSCO', 'QUISPICANCHI', 'ANDAHUAYLILLAS'),
(768, 7, 12, 3, 'CUSCO', 'QUISPICANCHI', 'CAMANTI'),
(769, 7, 12, 4, 'CUSCO', 'QUISPICANCHI', 'CCARHUAYO'),
(770, 7, 12, 5, 'CUSCO', 'QUISPICANCHI', 'CCATCA'),
(771, 7, 12, 6, 'CUSCO', 'QUISPICANCHI', 'CUSIPATA'),
(772, 7, 12, 7, 'CUSCO', 'QUISPICANCHI', 'HUARO'),
(773, 7, 12, 8, 'CUSCO', 'QUISPICANCHI', 'LUCRE'),
(774, 7, 12, 9, 'CUSCO', 'QUISPICANCHI', 'MARCAPATA'),
(775, 7, 12, 10, 'CUSCO', 'QUISPICANCHI', 'OCONGATE'),
(776, 7, 12, 11, 'CUSCO', 'QUISPICANCHI', 'OROPESA'),
(777, 7, 12, 12, 'CUSCO', 'QUISPICANCHI', 'QUIQUIJANA'),
(778, 7, 13, 1, 'CUSCO', 'URUBAMBA', 'URUBAMBA'),
(779, 7, 13, 2, 'CUSCO', 'URUBAMBA', 'CHINCHERO'),
(780, 7, 13, 3, 'CUSCO', 'URUBAMBA', 'HUAYLLABAMBA'),
(781, 7, 13, 4, 'CUSCO', 'URUBAMBA', 'MACHUPICCHU'),
(782, 7, 13, 5, 'CUSCO', 'URUBAMBA', 'MARAS'),
(783, 7, 13, 6, 'CUSCO', 'URUBAMBA', 'OLLANTAYTAMBO'),
(784, 7, 13, 7, 'CUSCO', 'URUBAMBA', 'YUCAY'),
(785, 8, 1, 1, 'HUANCAVELICA', 'HUANCAVELICA', 'HUANCAVELICA'),
(786, 8, 1, 2, 'HUANCAVELICA', 'HUANCAVELICA', 'ACOBAMBILLA'),
(787, 8, 1, 3, 'HUANCAVELICA', 'HUANCAVELICA', 'ACORIA'),
(788, 8, 1, 4, 'HUANCAVELICA', 'HUANCAVELICA', 'CONAYCA'),
(789, 8, 1, 5, 'HUANCAVELICA', 'HUANCAVELICA', 'CUENCA'),
(790, 8, 1, 6, 'HUANCAVELICA', 'HUANCAVELICA', 'HUACHOCOLPA'),
(791, 8, 1, 8, 'HUANCAVELICA', 'HUANCAVELICA', 'HUAYLLAHUARA'),
(792, 8, 1, 9, 'HUANCAVELICA', 'HUANCAVELICA', 'IZCUCHACA'),
(793, 8, 1, 10, 'HUANCAVELICA', 'HUANCAVELICA', 'LARIA'),
(794, 8, 1, 11, 'HUANCAVELICA', 'HUANCAVELICA', 'MANTA'),
(795, 8, 1, 12, 'HUANCAVELICA', 'HUANCAVELICA', 'MARISCAL CACERES'),
(796, 8, 1, 13, 'HUANCAVELICA', 'HUANCAVELICA', 'MOYA'),
(797, 8, 1, 14, 'HUANCAVELICA', 'HUANCAVELICA', 'NUEVO OCCORO'),
(798, 8, 1, 15, 'HUANCAVELICA', 'HUANCAVELICA', 'PALCA'),
(799, 8, 1, 16, 'HUANCAVELICA', 'HUANCAVELICA', 'PILCHACA'),
(800, 8, 1, 17, 'HUANCAVELICA', 'HUANCAVELICA', 'VILCA'),
(801, 8, 1, 18, 'HUANCAVELICA', 'HUANCAVELICA', 'YAULI'),
(802, 8, 1, 19, 'HUANCAVELICA', 'HUANCAVELICA', 'ASCENSION'),
(803, 8, 1, 20, 'HUANCAVELICA', 'HUANCAVELICA', 'HUANDO'),
(804, 8, 2, 1, 'HUANCAVELICA', 'ACOBAMBA', 'ACOBAMBA'),
(805, 8, 2, 2, 'HUANCAVELICA', 'ACOBAMBA', 'ANTA'),
(806, 8, 2, 3, 'HUANCAVELICA', 'ACOBAMBA', 'ANDABAMBA'),
(807, 8, 2, 4, 'HUANCAVELICA', 'ACOBAMBA', 'CAJA'),
(808, 8, 2, 5, 'HUANCAVELICA', 'ACOBAMBA', 'MARCAS'),
(809, 8, 2, 6, 'HUANCAVELICA', 'ACOBAMBA', 'PAUCARA'),
(810, 8, 2, 7, 'HUANCAVELICA', 'ACOBAMBA', 'POMACOCHA'),
(811, 8, 2, 8, 'HUANCAVELICA', 'ACOBAMBA', 'ROSARIO'),
(812, 8, 3, 1, 'HUANCAVELICA', 'ANGARAES', 'LIRCAY'),
(813, 8, 3, 2, 'HUANCAVELICA', 'ANGARAES', 'ANCHONGA'),
(814, 8, 3, 3, 'HUANCAVELICA', 'ANGARAES', 'CALLANMARCA'),
(815, 8, 3, 4, 'HUANCAVELICA', 'ANGARAES', 'CONGALLA'),
(816, 8, 3, 5, 'HUANCAVELICA', 'ANGARAES', 'CHINCHO'),
(817, 8, 3, 6, 'HUANCAVELICA', 'ANGARAES', 'HUAYLLAY GRANDE'),
(818, 8, 3, 7, 'HUANCAVELICA', 'ANGARAES', 'HUANCA HUANCA'),
(819, 8, 3, 8, 'HUANCAVELICA', 'ANGARAES', 'JULCAMARCA'),
(820, 8, 3, 9, 'HUANCAVELICA', 'ANGARAES', 'SAN ANTONIO DE ANTAPARCO'),
(821, 8, 3, 10, 'HUANCAVELICA', 'ANGARAES', 'STO TOMAS DE PATA'),
(822, 8, 3, 11, 'HUANCAVELICA', 'ANGARAES', 'SECCLLA'),
(823, 8, 3, 12, 'HUANCAVELICA', 'ANGARAES', 'CCOCHACCASA'),
(824, 8, 4, 1, 'HUANCAVELICA', 'CASTROVIRREYNA', 'CASTROVIRREYNA'),
(825, 8, 4, 2, 'HUANCAVELICA', 'CASTROVIRREYNA', 'ARMA'),
(826, 8, 4, 3, 'HUANCAVELICA', 'CASTROVIRREYNA', 'AURAHUA'),
(827, 8, 4, 5, 'HUANCAVELICA', 'CASTROVIRREYNA', 'CAPILLAS'),
(828, 8, 4, 6, 'HUANCAVELICA', 'CASTROVIRREYNA', 'COCAS'),
(829, 8, 4, 8, 'HUANCAVELICA', 'CASTROVIRREYNA', 'CHUPAMARCA'),
(830, 8, 4, 9, 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUACHOS'),
(831, 8, 4, 10, 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUAMATAMBO'),
(832, 8, 4, 14, 'HUANCAVELICA', 'CASTROVIRREYNA', 'MOLLEPAMPA'),
(833, 8, 4, 22, 'HUANCAVELICA', 'CASTROVIRREYNA', 'SAN JUAN'),
(834, 8, 4, 27, 'HUANCAVELICA', 'CASTROVIRREYNA', 'TANTARA'),
(835, 8, 4, 28, 'HUANCAVELICA', 'CASTROVIRREYNA', 'TICRAPO'),
(836, 8, 4, 29, 'HUANCAVELICA', 'CASTROVIRREYNA', 'SANTA ANA'),
(837, 8, 5, 1, 'HUANCAVELICA', 'TAYACAJA', 'PAMPAS'),
(838, 8, 5, 2, 'HUANCAVELICA', 'TAYACAJA', 'ACOSTAMBO'),
(839, 8, 5, 3, 'HUANCAVELICA', 'TAYACAJA', 'ACRAQUIA'),
(840, 8, 5, 4, 'HUANCAVELICA', 'TAYACAJA', 'AHUAYCHA'),
(841, 8, 5, 6, 'HUANCAVELICA', 'TAYACAJA', 'COLCABAMBA'),
(842, 8, 5, 9, 'HUANCAVELICA', 'TAYACAJA', 'DANIEL HERNANDEZ'),
(843, 8, 5, 11, 'HUANCAVELICA', 'TAYACAJA', 'HUACHOCOLPA'),
(844, 8, 5, 12, 'HUANCAVELICA', 'TAYACAJA', 'HUARIBAMBA'),
(845, 8, 5, 15, 'HUANCAVELICA', 'TAYACAJA', 'ÑAHUIMPUQUIO'),
(846, 8, 5, 17, 'HUANCAVELICA', 'TAYACAJA', 'PAZOS'),
(847, 8, 5, 18, 'HUANCAVELICA', 'TAYACAJA', 'QUISHUAR'),
(848, 8, 5, 19, 'HUANCAVELICA', 'TAYACAJA', 'SALCABAMBA'),
(849, 8, 5, 20, 'HUANCAVELICA', 'TAYACAJA', 'SAN MARCOS DE ROCCHAC'),
(850, 8, 5, 23, 'HUANCAVELICA', 'TAYACAJA', 'SURCUBAMBA'),
(851, 8, 5, 25, 'HUANCAVELICA', 'TAYACAJA', 'TINTAY PUNCU'),
(852, 8, 5, 26, 'HUANCAVELICA', 'TAYACAJA', 'SALCAHUASI'),
(853, 8, 6, 1, 'HUANCAVELICA', 'HUAYTARA', 'AYAVI'),
(854, 8, 6, 2, 'HUANCAVELICA', 'HUAYTARA', 'CORDOVA'),
(855, 8, 6, 3, 'HUANCAVELICA', 'HUAYTARA', 'HUAYACUNDO ARMA'),
(856, 8, 6, 4, 'HUANCAVELICA', 'HUAYTARA', 'HUAYTARA'),
(857, 8, 6, 5, 'HUANCAVELICA', 'HUAYTARA', 'LARAMARCA'),
(858, 8, 6, 6, 'HUANCAVELICA', 'HUAYTARA', 'OCOYO'),
(859, 8, 6, 7, 'HUANCAVELICA', 'HUAYTARA', 'PILPICHACA'),
(860, 8, 6, 8, 'HUANCAVELICA', 'HUAYTARA', 'QUERCO'),
(861, 8, 6, 9, 'HUANCAVELICA', 'HUAYTARA', 'QUITO ARMA'),
(862, 8, 6, 10, 'HUANCAVELICA', 'HUAYTARA', 'SAN ANTONIO DE CUSICANCHA'),
(863, 8, 6, 11, 'HUANCAVELICA', 'HUAYTARA', 'SAN FRANCISCO DE SANGAYAICO'),
(864, 8, 6, 12, 'HUANCAVELICA', 'HUAYTARA', 'SAN ISIDRO'),
(865, 8, 6, 13, 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE CHOCORVOS'),
(866, 8, 6, 14, 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE QUIRAHUARA'),
(867, 8, 6, 15, 'HUANCAVELICA', 'HUAYTARA', 'SANTO DOMINGO DE CAPILLAS'),
(868, 8, 6, 16, 'HUANCAVELICA', 'HUAYTARA', 'TAMBO'),
(869, 8, 7, 1, 'HUANCAVELICA', 'CHURCAMPA', 'CHURCAMPA'),
(870, 8, 7, 2, 'HUANCAVELICA', 'CHURCAMPA', 'ANCO'),
(871, 8, 7, 3, 'HUANCAVELICA', 'CHURCAMPA', 'CHINCHIHUASI'),
(872, 8, 7, 4, 'HUANCAVELICA', 'CHURCAMPA', 'EL CARMEN'),
(873, 8, 7, 5, 'HUANCAVELICA', 'CHURCAMPA', 'LA MERCED'),
(874, 8, 7, 6, 'HUANCAVELICA', 'CHURCAMPA', 'LOCROJA'),
(875, 8, 7, 7, 'HUANCAVELICA', 'CHURCAMPA', 'PAUCARBAMBA'),
(876, 8, 7, 8, 'HUANCAVELICA', 'CHURCAMPA', 'SAN MIGUEL DE MAYOC'),
(877, 8, 7, 9, 'HUANCAVELICA', 'CHURCAMPA', 'SAN PEDRO DE CORIS'),
(878, 8, 7, 10, 'HUANCAVELICA', 'CHURCAMPA', 'PACHAMARCA'),
(879, 9, 1, 1, 'HUANUCO', 'HUANUCO', 'HUANUCO'),
(880, 9, 1, 2, 'HUANUCO', 'HUANUCO', 'CHINCHAO'),
(881, 9, 1, 3, 'HUANUCO', 'HUANUCO', 'CHURUBAMBA'),
(882, 9, 1, 4, 'HUANUCO', 'HUANUCO', 'MARGOS'),
(883, 9, 1, 5, 'HUANUCO', 'HUANUCO', 'QUISQUI'),
(884, 9, 1, 6, 'HUANUCO', 'HUANUCO', 'SAN FCO DE CAYRAN'),
(885, 9, 1, 7, 'HUANUCO', 'HUANUCO', 'SAN PEDRO DE CHAULAN'),
(886, 9, 1, 8, 'HUANUCO', 'HUANUCO', 'STA MARIA DEL VALLE'),
(887, 9, 1, 9, 'HUANUCO', 'HUANUCO', 'YARUMAYO'),
(888, 9, 1, 10, 'HUANUCO', 'HUANUCO', 'AMARILIS'),
(889, 9, 1, 11, 'HUANUCO', 'HUANUCO', 'PILLCO MARCA'),
(890, 9, 2, 1, 'HUANUCO', 'AMBO', 'AMBO'),
(891, 9, 2, 2, 'HUANUCO', 'AMBO', 'CAYNA'),
(892, 9, 2, 3, 'HUANUCO', 'AMBO', 'COLPAS'),
(893, 9, 2, 4, 'HUANUCO', 'AMBO', 'CONCHAMARCA'),
(894, 9, 2, 5, 'HUANUCO', 'AMBO', 'HUACAR'),
(895, 9, 2, 6, 'HUANUCO', 'AMBO', 'SAN FRANCISCO'),
(896, 9, 2, 7, 'HUANUCO', 'AMBO', 'SAN RAFAEL'),
(897, 9, 2, 8, 'HUANUCO', 'AMBO', 'TOMAY KICHWA'),
(898, 9, 3, 1, 'HUANUCO', 'DOS DE MAYO', 'LA UNION'),
(899, 9, 3, 7, 'HUANUCO', 'DOS DE MAYO', 'CHUQUIS'),
(900, 9, 3, 12, 'HUANUCO', 'DOS DE MAYO', 'MARIAS'),
(901, 9, 3, 14, 'HUANUCO', 'DOS DE MAYO', 'PACHAS'),
(902, 9, 3, 16, 'HUANUCO', 'DOS DE MAYO', 'QUIVILLA'),
(903, 9, 3, 17, 'HUANUCO', 'DOS DE MAYO', 'RIPAN'),
(904, 9, 3, 21, 'HUANUCO', 'DOS DE MAYO', 'SHUNQUI'),
(905, 9, 3, 22, 'HUANUCO', 'DOS DE MAYO', 'SILLAPATA'),
(906, 9, 3, 23, 'HUANUCO', 'DOS DE MAYO', 'YANAS'),
(907, 9, 4, 1, 'HUANUCO', 'HUAMALIES', 'LLATA'),
(908, 9, 4, 2, 'HUANUCO', 'HUAMALIES', 'ARANCAY'),
(909, 9, 4, 3, 'HUANUCO', 'HUAMALIES', 'CHAVIN DE PARIARCA'),
(910, 9, 4, 4, 'HUANUCO', 'HUAMALIES', 'JACAS GRANDE'),
(911, 9, 4, 5, 'HUANUCO', 'HUAMALIES', 'JIRCAN'),
(912, 9, 4, 6, 'HUANUCO', 'HUAMALIES', 'MIRAFLORES'),
(913, 9, 4, 7, 'HUANUCO', 'HUAMALIES', 'MONZON'),
(914, 9, 4, 8, 'HUANUCO', 'HUAMALIES', 'PUNCHAO'),
(915, 9, 4, 9, 'HUANUCO', 'HUAMALIES', 'PUÑOS'),
(916, 9, 4, 10, 'HUANUCO', 'HUAMALIES', 'SINGA'),
(917, 9, 4, 11, 'HUANUCO', 'HUAMALIES', 'TANTAMAYO'),
(918, 9, 5, 1, 'HUANUCO', 'MARA�ON', 'HUACRACHUCO'),
(919, 9, 5, 2, 'HUANUCO', 'MARA�ON', 'CHOLON'),
(920, 9, 5, 5, 'HUANUCO', 'MARA�ON', 'SAN BUENAVENTURA'),
(921, 9, 6, 1, 'HUANUCO', 'LEONCIO PRADO', 'RUPA RUPA'),
(922, 9, 6, 2, 'HUANUCO', 'LEONCIO PRADO', 'DANIEL ALOMIA ROBLES'),
(923, 9, 6, 3, 'HUANUCO', 'LEONCIO PRADO', 'HERMILIO VALDIZAN'),
(924, 9, 6, 4, 'HUANUCO', 'LEONCIO PRADO', 'LUYANDO'),
(925, 9, 6, 5, 'HUANUCO', 'LEONCIO PRADO', 'MARIANO DAMASO BERAUN'),
(926, 9, 6, 6, 'HUANUCO', 'LEONCIO PRADO', 'JOSE CRESPO Y CASTILLO'),
(927, 9, 7, 1, 'HUANUCO', 'PACHITEA', 'PANAO'),
(928, 9, 7, 2, 'HUANUCO', 'PACHITEA', 'CHAGLLA'),
(929, 9, 7, 4, 'HUANUCO', 'PACHITEA', 'MOLINO'),
(930, 9, 7, 6, 'HUANUCO', 'PACHITEA', 'UMARI'),
(931, 9, 8, 1, 'HUANUCO', 'PUERTO INCA', 'HONORIA'),
(932, 9, 8, 2, 'HUANUCO', 'PUERTO INCA', 'PUERTO INCA'),
(933, 9, 8, 3, 'HUANUCO', 'PUERTO INCA', 'CODO DEL POZUZO'),
(934, 9, 8, 4, 'HUANUCO', 'PUERTO INCA', 'TOURNAVISTA'),
(935, 9, 8, 5, 'HUANUCO', 'PUERTO INCA', 'YUYAPICHIS'),
(936, 9, 9, 1, 'HUANUCO', 'HUACAYBAMBA', 'HUACAYBAMBA'),
(937, 9, 9, 2, 'HUANUCO', 'HUACAYBAMBA', 'PINRA'),
(938, 9, 9, 3, 'HUANUCO', 'HUACAYBAMBA', 'CANCHABAMBA'),
(939, 9, 9, 4, 'HUANUCO', 'HUACAYBAMBA', 'COCHABAMBA'),
(940, 9, 10, 1, 'HUANUCO', 'LAURICOCHA', 'JESUS'),
(941, 9, 10, 2, 'HUANUCO', 'LAURICOCHA', 'BAÑOS'),
(942, 9, 10, 3, 'HUANUCO', 'LAURICOCHA', 'SAN FRANCISCO DE ASIS'),
(943, 9, 10, 4, 'HUANUCO', 'LAURICOCHA', 'QUEROPALCA'),
(944, 9, 10, 5, 'HUANUCO', 'LAURICOCHA', 'SAN MIGUEL DE CAURI'),
(945, 9, 10, 6, 'HUANUCO', 'LAURICOCHA', 'RONDOS'),
(946, 9, 10, 7, 'HUANUCO', 'LAURICOCHA', 'JIVIA'),
(947, 9, 11, 1, 'HUANUCO', 'YAROWILCA', 'CHAVINILLO'),
(948, 9, 11, 2, 'HUANUCO', 'YAROWILCA', 'APARICIO POMARES (CHUPAN)'),
(949, 9, 11, 3, 'HUANUCO', 'YAROWILCA', 'CAHUAC'),
(950, 9, 11, 4, 'HUANUCO', 'YAROWILCA', 'CHACABAMBA'),
(951, 9, 11, 5, 'HUANUCO', 'YAROWILCA', 'JACAS CHICO'),
(952, 9, 11, 6, 'HUANUCO', 'YAROWILCA', 'OBAS'),
(953, 9, 11, 7, 'HUANUCO', 'YAROWILCA', 'PAMPAMARCA'),
(954, 9, 11, 8, 'HUANUCO', 'YAROWILCA', 'CHORAS'),
(955, 10, 1, 1, 'ICA', 'ICA', 'ICA'),
(956, 10, 1, 2, 'ICA', 'ICA', 'LA TINGUI�A'),
(957, 10, 1, 3, 'ICA', 'ICA', 'LOS AQUIJES'),
(958, 10, 1, 4, 'ICA', 'ICA', 'PARCONA'),
(959, 10, 1, 5, 'ICA', 'ICA', 'PUEBLO NUEVO'),
(960, 10, 1, 6, 'ICA', 'ICA', 'SALAS'),
(961, 10, 1, 7, 'ICA', 'ICA', 'SAN JOSE DE LOS MOLINOS'),
(962, 10, 1, 8, 'ICA', 'ICA', 'SAN JUAN BAUTISTA'),
(963, 10, 1, 9, 'ICA', 'ICA', 'SANTIAGO'),
(964, 10, 1, 10, 'ICA', 'ICA', 'SUBTANJALLA'),
(965, 10, 1, 11, 'ICA', 'ICA', 'YAUCA DEL ROSARIO'),
(966, 10, 1, 12, 'ICA', 'ICA', 'TATE'),
(967, 10, 1, 13, 'ICA', 'ICA', 'PACHACUTEC');
INSERT INTO `ubigeo` (`id`, `codigo_dep`, `codigo_prov`, `codigo_dist`, `departamento`, `provincia`, `distrito`) VALUES
(968, 10, 1, 14, 'ICA', 'ICA', 'OCUCAJE'),
(969, 10, 2, 1, 'ICA', 'CHINCHA', 'CHINCHA ALTA'),
(970, 10, 2, 2, 'ICA', 'CHINCHA', 'CHAVIN'),
(971, 10, 2, 3, 'ICA', 'CHINCHA', 'CHINCHA BAJA'),
(972, 10, 2, 4, 'ICA', 'CHINCHA', 'EL CARMEN'),
(973, 10, 2, 5, 'ICA', 'CHINCHA', 'GROCIO PRADO'),
(974, 10, 2, 6, 'ICA', 'CHINCHA', 'SAN PEDRO DE HUACARPANA'),
(975, 10, 2, 7, 'ICA', 'CHINCHA', 'SUNAMPE'),
(976, 10, 2, 8, 'ICA', 'CHINCHA', 'TAMBO DE MORA'),
(977, 10, 2, 9, 'ICA', 'CHINCHA', 'ALTO LARAN'),
(978, 10, 2, 10, 'ICA', 'CHINCHA', 'PUEBLO NUEVO'),
(979, 10, 2, 11, 'ICA', 'CHINCHA', 'SAN JUAN DE YANAC'),
(980, 10, 3, 1, 'ICA', 'NAZCA', 'NAZCA'),
(981, 10, 3, 2, 'ICA', 'NAZCA', 'CHANGUILLO'),
(982, 10, 3, 3, 'ICA', 'NAZCA', 'EL INGENIO'),
(983, 10, 3, 4, 'ICA', 'NAZCA', 'MARCONA'),
(984, 10, 3, 5, 'ICA', 'NAZCA', 'VISTA ALEGRE'),
(985, 10, 4, 1, 'ICA', 'PISCO', 'PISCO'),
(986, 10, 4, 2, 'ICA', 'PISCO', 'HUANCANO'),
(987, 10, 4, 3, 'ICA', 'PISCO', 'HUMAY'),
(988, 10, 4, 4, 'ICA', 'PISCO', 'INDEPENDENCIA'),
(989, 10, 4, 5, 'ICA', 'PISCO', 'PARACAS'),
(990, 10, 4, 6, 'ICA', 'PISCO', 'SAN ANDRES'),
(991, 10, 4, 7, 'ICA', 'PISCO', 'SAN CLEMENTE'),
(992, 10, 4, 8, 'ICA', 'PISCO', 'TUPAC AMARU INCA'),
(993, 10, 5, 1, 'ICA', 'PALPA', 'PALPA'),
(994, 10, 5, 2, 'ICA', 'PALPA', 'LLIPATA'),
(995, 10, 5, 3, 'ICA', 'PALPA', 'RIO GRANDE'),
(996, 10, 5, 4, 'ICA', 'PALPA', 'SANTA CRUZ'),
(997, 10, 5, 5, 'ICA', 'PALPA', 'TIBILLO'),
(998, 11, 1, 1, 'JUNIN', 'HUANCAYO', 'HUANCAYO'),
(999, 11, 1, 3, 'JUNIN', 'HUANCAYO', 'CARHUACALLANGA'),
(1000, 11, 1, 4, 'JUNIN', 'HUANCAYO', 'COLCA'),
(1001, 11, 1, 5, 'JUNIN', 'HUANCAYO', 'CULLHUAS'),
(1002, 11, 1, 6, 'JUNIN', 'HUANCAYO', 'CHACAPAMPA'),
(1003, 11, 1, 7, 'JUNIN', 'HUANCAYO', 'CHICCHE'),
(1004, 11, 1, 8, 'JUNIN', 'HUANCAYO', 'CHILCA'),
(1005, 11, 1, 9, 'JUNIN', 'HUANCAYO', 'CHONGOS ALTO'),
(1006, 11, 1, 12, 'JUNIN', 'HUANCAYO', 'CHUPURO'),
(1007, 11, 1, 13, 'JUNIN', 'HUANCAYO', 'EL TAMBO'),
(1008, 11, 1, 14, 'JUNIN', 'HUANCAYO', 'HUACRAPUQUIO'),
(1009, 11, 1, 16, 'JUNIN', 'HUANCAYO', 'HUALHUAS'),
(1010, 11, 1, 18, 'JUNIN', 'HUANCAYO', 'HUANCAN'),
(1011, 11, 1, 19, 'JUNIN', 'HUANCAYO', 'HUASICANCHA'),
(1012, 11, 1, 20, 'JUNIN', 'HUANCAYO', 'HUAYUCACHI'),
(1013, 11, 1, 21, 'JUNIN', 'HUANCAYO', 'INGENIO'),
(1014, 11, 1, 22, 'JUNIN', 'HUANCAYO', 'PARIAHUANCA'),
(1015, 11, 1, 23, 'JUNIN', 'HUANCAYO', 'PILCOMAYO'),
(1016, 11, 1, 24, 'JUNIN', 'HUANCAYO', 'PUCARA'),
(1017, 11, 1, 25, 'JUNIN', 'HUANCAYO', 'QUICHUAY'),
(1018, 11, 1, 26, 'JUNIN', 'HUANCAYO', 'QUILCAS'),
(1019, 11, 1, 27, 'JUNIN', 'HUANCAYO', 'SAN AGUSTIN'),
(1020, 11, 1, 28, 'JUNIN', 'HUANCAYO', 'SAN JERONIMO DE TUNAN'),
(1021, 11, 1, 31, 'JUNIN', 'HUANCAYO', 'STO DOMINGO DE ACOBAMBA'),
(1022, 11, 1, 32, 'JUNIN', 'HUANCAYO', 'SAÑO'),
(1023, 11, 1, 33, 'JUNIN', 'HUANCAYO', 'SAPALLANGA'),
(1024, 11, 1, 34, 'JUNIN', 'HUANCAYO', 'SICAYA'),
(1025, 11, 1, 36, 'JUNIN', 'HUANCAYO', 'VIQUES'),
(1026, 11, 2, 1, 'JUNIN', 'CONCEPCION', 'CONCEPCION'),
(1027, 11, 2, 2, 'JUNIN', 'CONCEPCION', 'ACO'),
(1028, 11, 2, 3, 'JUNIN', 'CONCEPCION', 'ANDAMARCA'),
(1029, 11, 2, 4, 'JUNIN', 'CONCEPCION', 'COMAS'),
(1030, 11, 2, 5, 'JUNIN', 'CONCEPCION', 'COCHAS'),
(1031, 11, 2, 6, 'JUNIN', 'CONCEPCION', 'CHAMBARA'),
(1032, 11, 2, 7, 'JUNIN', 'CONCEPCION', 'HEROINAS TOLEDO'),
(1033, 11, 2, 8, 'JUNIN', 'CONCEPCION', 'MANZANARES'),
(1034, 11, 2, 9, 'JUNIN', 'CONCEPCION', 'MCAL CASTILLA'),
(1035, 11, 2, 10, 'JUNIN', 'CONCEPCION', 'MATAHUASI'),
(1036, 11, 2, 11, 'JUNIN', 'CONCEPCION', 'MITO'),
(1037, 11, 2, 12, 'JUNIN', 'CONCEPCION', 'NUEVE DE JULIO'),
(1038, 11, 2, 13, 'JUNIN', 'CONCEPCION', 'ORCOTUNA'),
(1039, 11, 2, 14, 'JUNIN', 'CONCEPCION', 'STA ROSA DE OCOPA'),
(1040, 11, 2, 15, 'JUNIN', 'CONCEPCION', 'SAN JOSE DE QUERO'),
(1041, 11, 3, 1, 'JUNIN', 'JAUJA', 'JAUJA'),
(1042, 11, 3, 2, 'JUNIN', 'JAUJA', 'ACOLLA'),
(1043, 11, 3, 3, 'JUNIN', 'JAUJA', 'APATA'),
(1044, 11, 3, 4, 'JUNIN', 'JAUJA', 'ATAURA'),
(1045, 11, 3, 5, 'JUNIN', 'JAUJA', 'CANCHAILLO'),
(1046, 11, 3, 6, 'JUNIN', 'JAUJA', 'EL MANTARO'),
(1047, 11, 3, 7, 'JUNIN', 'JAUJA', 'HUAMALI'),
(1048, 11, 3, 8, 'JUNIN', 'JAUJA', 'HUARIPAMPA'),
(1049, 11, 3, 9, 'JUNIN', 'JAUJA', 'HUERTAS'),
(1050, 11, 3, 10, 'JUNIN', 'JAUJA', 'JANJAILLO'),
(1051, 11, 3, 11, 'JUNIN', 'JAUJA', 'JULCAN'),
(1052, 11, 3, 12, 'JUNIN', 'JAUJA', 'LEONOR ORDO�EZ'),
(1053, 11, 3, 13, 'JUNIN', 'JAUJA', 'LLOCLLAPAMPA'),
(1054, 11, 3, 14, 'JUNIN', 'JAUJA', 'MARCO'),
(1055, 11, 3, 15, 'JUNIN', 'JAUJA', 'MASMA'),
(1056, 11, 3, 16, 'JUNIN', 'JAUJA', 'MOLINOS'),
(1057, 11, 3, 17, 'JUNIN', 'JAUJA', 'MONOBAMBA'),
(1058, 11, 3, 18, 'JUNIN', 'JAUJA', 'MUQUI'),
(1059, 11, 3, 19, 'JUNIN', 'JAUJA', 'MUQUIYAUYO'),
(1060, 11, 3, 20, 'JUNIN', 'JAUJA', 'PACA'),
(1061, 11, 3, 21, 'JUNIN', 'JAUJA', 'PACCHA'),
(1062, 11, 3, 22, 'JUNIN', 'JAUJA', 'PANCAN'),
(1063, 11, 3, 23, 'JUNIN', 'JAUJA', 'PARCO'),
(1064, 11, 3, 24, 'JUNIN', 'JAUJA', 'POMACANCHA'),
(1065, 11, 3, 25, 'JUNIN', 'JAUJA', 'RICRAN'),
(1066, 11, 3, 26, 'JUNIN', 'JAUJA', 'SAN LORENZO'),
(1067, 11, 3, 27, 'JUNIN', 'JAUJA', 'SAN PEDRO DE CHUNAN'),
(1068, 11, 3, 28, 'JUNIN', 'JAUJA', 'SINCOS'),
(1069, 11, 3, 29, 'JUNIN', 'JAUJA', 'TUNAN MARCA'),
(1070, 11, 3, 30, 'JUNIN', 'JAUJA', 'YAULI'),
(1071, 11, 3, 31, 'JUNIN', 'JAUJA', 'CURICACA'),
(1072, 11, 3, 32, 'JUNIN', 'JAUJA', 'MASMA CHICCHE'),
(1073, 11, 3, 33, 'JUNIN', 'JAUJA', 'SAUSA'),
(1074, 11, 3, 34, 'JUNIN', 'JAUJA', 'YAUYOS'),
(1075, 11, 4, 1, 'JUNIN', 'JUNIN', 'JUNIN'),
(1076, 11, 4, 2, 'JUNIN', 'JUNIN', 'CARHUAMAYO'),
(1077, 11, 4, 3, 'JUNIN', 'JUNIN', 'ONDORES'),
(1078, 11, 4, 4, 'JUNIN', 'JUNIN', 'ULCUMAYO'),
(1079, 11, 5, 1, 'JUNIN', 'TARMA', 'TARMA'),
(1080, 11, 5, 2, 'JUNIN', 'TARMA', 'ACOBAMBA'),
(1081, 11, 5, 3, 'JUNIN', 'TARMA', 'HUARICOLCA'),
(1082, 11, 5, 4, 'JUNIN', 'TARMA', 'HUASAHUASI'),
(1083, 11, 5, 5, 'JUNIN', 'TARMA', 'LA UNION'),
(1084, 11, 5, 6, 'JUNIN', 'TARMA', 'PALCA'),
(1085, 11, 5, 7, 'JUNIN', 'TARMA', 'PALCAMAYO'),
(1086, 11, 5, 8, 'JUNIN', 'TARMA', 'SAN PEDRO DE CAJAS'),
(1087, 11, 5, 9, 'JUNIN', 'TARMA', 'TAPO'),
(1088, 11, 6, 1, 'JUNIN', 'YAULI', 'LA OROYA'),
(1089, 11, 6, 2, 'JUNIN', 'YAULI', 'CHACAPALPA'),
(1090, 11, 6, 3, 'JUNIN', 'YAULI', 'HUAY HUAY'),
(1091, 11, 6, 4, 'JUNIN', 'YAULI', 'MARCAPOMACOCHA'),
(1092, 11, 6, 5, 'JUNIN', 'YAULI', 'MOROCOCHA'),
(1093, 11, 6, 6, 'JUNIN', 'YAULI', 'PACCHA'),
(1094, 11, 6, 7, 'JUNIN', 'YAULI', 'STA BARBARA DE CARHUACAYAN'),
(1095, 11, 6, 8, 'JUNIN', 'YAULI', 'SUITUCANCHA'),
(1096, 11, 6, 9, 'JUNIN', 'YAULI', 'YAULI'),
(1097, 11, 6, 10, 'JUNIN', 'YAULI', 'STA ROSA DE SACCO'),
(1098, 11, 7, 1, 'JUNIN', 'SATIPO', 'SATIPO'),
(1099, 11, 7, 2, 'JUNIN', 'SATIPO', 'COVIRIALI'),
(1100, 11, 7, 3, 'JUNIN', 'SATIPO', 'LLAYLLA'),
(1101, 11, 7, 4, 'JUNIN', 'SATIPO', 'MAZAMARI'),
(1102, 11, 7, 5, 'JUNIN', 'SATIPO', 'PAMPA HERMOSA'),
(1103, 11, 7, 6, 'JUNIN', 'SATIPO', 'PANGOA'),
(1104, 11, 7, 7, 'JUNIN', 'SATIPO', 'RIO NEGRO'),
(1105, 11, 7, 8, 'JUNIN', 'SATIPO', 'RIO TAMBO'),
(1106, 11, 8, 1, 'JUNIN', 'CHANCHAMAYO', 'CHANCHAMAYO'),
(1107, 11, 8, 2, 'JUNIN', 'CHANCHAMAYO', 'SAN RAMON'),
(1108, 11, 8, 3, 'JUNIN', 'CHANCHAMAYO', 'VITOC'),
(1109, 11, 8, 4, 'JUNIN', 'CHANCHAMAYO', 'SAN LUIS DE SHUARO'),
(1110, 11, 8, 5, 'JUNIN', 'CHANCHAMAYO', 'PICHANAQUI'),
(1111, 11, 8, 6, 'JUNIN', 'CHANCHAMAYO', 'PERENE'),
(1112, 11, 9, 1, 'JUNIN', 'CHUPACA', 'CHUPACA'),
(1113, 11, 9, 2, 'JUNIN', 'CHUPACA', 'AHUAC'),
(1114, 11, 9, 3, 'JUNIN', 'CHUPACA', 'CHONGOS BAJO'),
(1115, 11, 9, 4, 'JUNIN', 'CHUPACA', 'HUACHAC'),
(1116, 11, 9, 5, 'JUNIN', 'CHUPACA', 'HUAMANCACA CHICO'),
(1117, 11, 9, 6, 'JUNIN', 'CHUPACA', 'SAN JUAN DE ISCOS'),
(1118, 11, 9, 7, 'JUNIN', 'CHUPACA', 'SAN JUAN DE JARPA'),
(1119, 11, 9, 8, 'JUNIN', 'CHUPACA', 'TRES DE DICIEMBRE'),
(1120, 11, 9, 9, 'JUNIN', 'CHUPACA', 'YANACANCHA'),
(1121, 12, 1, 1, 'LA LIBERTAD', 'TRUJILLO', 'TRUJILLO'),
(1122, 12, 1, 2, 'LA LIBERTAD', 'TRUJILLO', 'HUANCHACO'),
(1123, 12, 1, 3, 'LA LIBERTAD', 'TRUJILLO', 'LAREDO'),
(1124, 12, 1, 4, 'LA LIBERTAD', 'TRUJILLO', 'MOCHE'),
(1125, 12, 1, 5, 'LA LIBERTAD', 'TRUJILLO', 'SALAVERRY'),
(1126, 12, 1, 6, 'LA LIBERTAD', 'TRUJILLO', 'SIMBAL'),
(1127, 12, 1, 7, 'LA LIBERTAD', 'TRUJILLO', 'VICTOR LARCO HERRERA'),
(1128, 12, 1, 9, 'LA LIBERTAD', 'TRUJILLO', 'POROTO'),
(1129, 12, 1, 10, 'LA LIBERTAD', 'TRUJILLO', 'EL PORVENIR'),
(1130, 12, 1, 11, 'LA LIBERTAD', 'TRUJILLO', 'LA ESPERANZA'),
(1131, 12, 1, 12, 'LA LIBERTAD', 'TRUJILLO', 'FLORENCIA DE MORA'),
(1132, 12, 2, 1, 'LA LIBERTAD', 'BOLIVAR', 'BOLIVAR'),
(1133, 12, 2, 2, 'LA LIBERTAD', 'BOLIVAR', 'BAMBAMARCA'),
(1134, 12, 2, 3, 'LA LIBERTAD', 'BOLIVAR', 'CONDORMARCA'),
(1135, 12, 2, 4, 'LA LIBERTAD', 'BOLIVAR', 'LONGOTEA'),
(1136, 12, 2, 5, 'LA LIBERTAD', 'BOLIVAR', 'UCUNCHA'),
(1137, 12, 2, 6, 'LA LIBERTAD', 'BOLIVAR', 'UCHUMARCA'),
(1138, 12, 3, 1, 'LA LIBERTAD', 'SANCHEZ CARRION', 'HUAMACHUCO'),
(1139, 12, 3, 2, 'LA LIBERTAD', 'SANCHEZ CARRION', 'COCHORCO'),
(1140, 12, 3, 3, 'LA LIBERTAD', 'SANCHEZ CARRION', 'CURGOS'),
(1141, 12, 3, 4, 'LA LIBERTAD', 'SANCHEZ CARRION', 'CHUGAY'),
(1142, 12, 3, 5, 'LA LIBERTAD', 'SANCHEZ CARRION', 'MARCABAL'),
(1143, 12, 3, 6, 'LA LIBERTAD', 'SANCHEZ CARRION', 'SANAGORAN'),
(1144, 12, 3, 7, 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARIN'),
(1145, 12, 3, 8, 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARTIMBAMBA'),
(1146, 12, 4, 1, 'LA LIBERTAD', 'OTUZCO', 'OTUZCO'),
(1147, 12, 4, 2, 'LA LIBERTAD', 'OTUZCO', 'AGALLPAMPA'),
(1148, 12, 4, 3, 'LA LIBERTAD', 'OTUZCO', 'CHARAT'),
(1149, 12, 4, 4, 'LA LIBERTAD', 'OTUZCO', 'HUARANCHAL'),
(1150, 12, 4, 5, 'LA LIBERTAD', 'OTUZCO', 'LA CUESTA'),
(1151, 12, 4, 8, 'LA LIBERTAD', 'OTUZCO', 'PARANDAY'),
(1152, 12, 4, 9, 'LA LIBERTAD', 'OTUZCO', 'SALPO'),
(1153, 12, 4, 10, 'LA LIBERTAD', 'OTUZCO', 'SINSICAP'),
(1154, 12, 4, 11, 'LA LIBERTAD', 'OTUZCO', 'USQUIL'),
(1155, 12, 4, 13, 'LA LIBERTAD', 'OTUZCO', 'MACHE'),
(1156, 12, 5, 1, 'LA LIBERTAD', 'PACASMAYO', 'SAN PEDRO DE LLOC'),
(1157, 12, 5, 3, 'LA LIBERTAD', 'PACASMAYO', 'GUADALUPE'),
(1158, 12, 5, 4, 'LA LIBERTAD', 'PACASMAYO', 'JEQUETEPEQUE'),
(1159, 12, 5, 6, 'LA LIBERTAD', 'PACASMAYO', 'PACASMAYO'),
(1160, 12, 5, 8, 'LA LIBERTAD', 'PACASMAYO', 'SAN JOSE'),
(1161, 12, 6, 1, 'LA LIBERTAD', 'PATAZ', 'TAYABAMBA'),
(1162, 12, 6, 2, 'LA LIBERTAD', 'PATAZ', 'BULDIBUYO'),
(1163, 12, 6, 3, 'LA LIBERTAD', 'PATAZ', 'CHILLIA'),
(1164, 12, 6, 4, 'LA LIBERTAD', 'PATAZ', 'HUAYLILLAS'),
(1165, 12, 6, 5, 'LA LIBERTAD', 'PATAZ', 'HUANCASPATA'),
(1166, 12, 6, 6, 'LA LIBERTAD', 'PATAZ', 'HUAYO'),
(1167, 12, 6, 7, 'LA LIBERTAD', 'PATAZ', 'ONGON'),
(1168, 12, 6, 8, 'LA LIBERTAD', 'PATAZ', 'PARCOY'),
(1169, 12, 6, 9, 'LA LIBERTAD', 'PATAZ', 'PATAZ'),
(1170, 12, 6, 10, 'LA LIBERTAD', 'PATAZ', 'PIAS'),
(1171, 12, 6, 11, 'LA LIBERTAD', 'PATAZ', 'TAURIJA'),
(1172, 12, 6, 12, 'LA LIBERTAD', 'PATAZ', 'URPAY'),
(1173, 12, 6, 13, 'LA LIBERTAD', 'PATAZ', 'SANTIAGO DE CHALLAS'),
(1174, 12, 7, 1, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTIAGO DE CHUCO'),
(1175, 12, 7, 2, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'CACHICADAN'),
(1176, 12, 7, 3, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEBAMBA'),
(1177, 12, 7, 4, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEPATA'),
(1178, 12, 7, 5, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'QUIRUVILCA'),
(1179, 12, 7, 6, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTA CRUZ DE CHUCA'),
(1180, 12, 7, 7, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SITABAMBA'),
(1181, 12, 7, 8, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'ANGASMARCA'),
(1182, 12, 8, 1, 'LA LIBERTAD', 'ASCOPE', 'ASCOPE'),
(1183, 12, 8, 2, 'LA LIBERTAD', 'ASCOPE', 'CHICAMA'),
(1184, 12, 8, 3, 'LA LIBERTAD', 'ASCOPE', 'CHOCOPE'),
(1185, 12, 8, 4, 'LA LIBERTAD', 'ASCOPE', 'SANTIAGO DE CAO'),
(1186, 12, 8, 5, 'LA LIBERTAD', 'ASCOPE', 'MAGDALENA DE CAO'),
(1187, 12, 8, 6, 'LA LIBERTAD', 'ASCOPE', 'PAIJAN'),
(1188, 12, 8, 7, 'LA LIBERTAD', 'ASCOPE', 'RAZURI'),
(1189, 12, 8, 8, 'LA LIBERTAD', 'ASCOPE', 'CASA GRANDE'),
(1190, 12, 9, 1, 'LA LIBERTAD', 'CHEPEN', 'CHEPEN'),
(1191, 12, 9, 2, 'LA LIBERTAD', 'CHEPEN', 'PACANGA'),
(1192, 12, 9, 3, 'LA LIBERTAD', 'CHEPEN', 'PUEBLO NUEVO'),
(1193, 12, 10, 1, 'LA LIBERTAD', 'JULCAN', 'JULCAN'),
(1194, 12, 10, 2, 'LA LIBERTAD', 'JULCAN', 'CARABAMBA'),
(1195, 12, 10, 3, 'LA LIBERTAD', 'JULCAN', 'CALAMARCA'),
(1196, 12, 10, 4, 'LA LIBERTAD', 'JULCAN', 'HUASO'),
(1197, 12, 11, 1, 'LA LIBERTAD', 'GRAN CHIMU', 'CASCAS'),
(1198, 12, 11, 2, 'LA LIBERTAD', 'GRAN CHIMU', 'LUCMA'),
(1199, 12, 11, 3, 'LA LIBERTAD', 'GRAN CHIMU', 'MARMOT'),
(1200, 12, 11, 4, 'LA LIBERTAD', 'GRAN CHIMU', 'SAYAPULLO'),
(1201, 12, 12, 1, 'LA LIBERTAD', 'VIRU', 'VIRU'),
(1202, 12, 12, 2, 'LA LIBERTAD', 'VIRU', 'CHAO'),
(1203, 12, 12, 3, 'LA LIBERTAD', 'VIRU', 'GUADALUPITO'),
(1204, 13, 1, 1, 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO'),
(1205, 13, 1, 2, 'LAMBAYEQUE', 'CHICLAYO', 'CHONGOYAPE'),
(1206, 13, 1, 3, 'LAMBAYEQUE', 'CHICLAYO', 'ETEN'),
(1207, 13, 1, 4, 'LAMBAYEQUE', 'CHICLAYO', 'ETEN PUERTO'),
(1208, 13, 1, 5, 'LAMBAYEQUE', 'CHICLAYO', 'LAGUNAS'),
(1209, 13, 1, 6, 'LAMBAYEQUE', 'CHICLAYO', 'MONSEFU'),
(1210, 13, 1, 7, 'LAMBAYEQUE', 'CHICLAYO', 'NUEVA ARICA'),
(1211, 13, 1, 8, 'LAMBAYEQUE', 'CHICLAYO', 'OYOTUN'),
(1212, 13, 1, 9, 'LAMBAYEQUE', 'CHICLAYO', 'PICSI'),
(1213, 13, 1, 10, 'LAMBAYEQUE', 'CHICLAYO', 'PIMENTEL'),
(1214, 13, 1, 11, 'LAMBAYEQUE', 'CHICLAYO', 'REQUE'),
(1215, 13, 1, 12, 'LAMBAYEQUE', 'CHICLAYO', 'JOSE LEONARDO ORTIZ'),
(1216, 13, 1, 13, 'LAMBAYEQUE', 'CHICLAYO', 'SANTA ROSA'),
(1217, 13, 1, 14, 'LAMBAYEQUE', 'CHICLAYO', 'SAÑA'),
(1218, 13, 1, 15, 'LAMBAYEQUE', 'CHICLAYO', 'LA VICTORIA'),
(1219, 13, 1, 16, 'LAMBAYEQUE', 'CHICLAYO', 'CAYALTI'),
(1220, 13, 1, 17, 'LAMBAYEQUE', 'CHICLAYO', 'PATAPO'),
(1221, 13, 1, 18, 'LAMBAYEQUE', 'CHICLAYO', 'POMALCA'),
(1222, 13, 1, 19, 'LAMBAYEQUE', 'CHICLAYO', 'PUCALA'),
(1223, 13, 1, 20, 'LAMBAYEQUE', 'CHICLAYO', 'TUMAN'),
(1224, 13, 2, 1, 'LAMBAYEQUE', 'FERRE�AFE', 'FERREÑAFE'),
(1225, 13, 2, 2, 'LAMBAYEQUE', 'FERRE�AFE', 'INCAHUASI'),
(1226, 13, 2, 3, 'LAMBAYEQUE', 'FERRE�AFE', 'CAÑARIS'),
(1227, 13, 2, 4, 'LAMBAYEQUE', 'FERRE�AFE', 'PITIPO'),
(1228, 13, 2, 5, 'LAMBAYEQUE', 'FERRE�AFE', 'PUEBLO NUEVO'),
(1229, 13, 2, 6, 'LAMBAYEQUE', 'FERRE�AFE', 'MANUEL ANTONIO MESONES MURO'),
(1230, 13, 3, 1, 'LAMBAYEQUE', 'LAMBAYEQUE', 'LAMBAYEQUE'),
(1231, 13, 3, 2, 'LAMBAYEQUE', 'LAMBAYEQUE', 'CHOCHOPE'),
(1232, 13, 3, 3, 'LAMBAYEQUE', 'LAMBAYEQUE', 'ILLIMO'),
(1233, 13, 3, 4, 'LAMBAYEQUE', 'LAMBAYEQUE', 'JAYANCA'),
(1234, 13, 3, 5, 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOCHUMI'),
(1235, 13, 3, 6, 'LAMBAYEQUE', 'LAMBAYEQUE', 'MORROPE'),
(1236, 13, 3, 7, 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOTUPE'),
(1237, 13, 3, 8, 'LAMBAYEQUE', 'LAMBAYEQUE', 'OLMOS'),
(1238, 13, 3, 9, 'LAMBAYEQUE', 'LAMBAYEQUE', 'PACORA'),
(1239, 13, 3, 10, 'LAMBAYEQUE', 'LAMBAYEQUE', 'SALAS'),
(1240, 13, 3, 11, 'LAMBAYEQUE', 'LAMBAYEQUE', 'SAN JOSE'),
(1241, 13, 3, 12, 'LAMBAYEQUE', 'LAMBAYEQUE', 'TUCUME'),
(1242, 14, 1, 1, 'LIMA', 'LIMA', 'LIMA'),
(1243, 14, 1, 2, 'LIMA', 'LIMA', 'ANCON'),
(1244, 14, 1, 3, 'LIMA', 'LIMA', 'ATE'),
(1245, 14, 1, 4, 'LIMA', 'LIMA', 'BREÑA'),
(1246, 14, 1, 5, 'LIMA', 'LIMA', 'CARABAYLLO'),
(1247, 14, 1, 6, 'LIMA', 'LIMA', 'COMAS'),
(1248, 14, 1, 7, 'LIMA', 'LIMA', 'CHACLACAYO'),
(1249, 14, 1, 8, 'LIMA', 'LIMA', 'CHORRILLOS'),
(1250, 14, 1, 9, 'LIMA', 'LIMA', 'LA VICTORIA'),
(1251, 14, 1, 10, 'LIMA', 'LIMA', 'LA MOLINA'),
(1252, 14, 1, 11, 'LIMA', 'LIMA', 'LINCE'),
(1253, 14, 1, 12, 'LIMA', 'LIMA', 'LURIGANCHO'),
(1254, 14, 1, 13, 'LIMA', 'LIMA', 'LURIN'),
(1255, 14, 1, 14, 'LIMA', 'LIMA', 'MAGDALENA DEL MAR'),
(1256, 14, 1, 15, 'LIMA', 'LIMA', 'MIRAFLORES'),
(1257, 14, 1, 16, 'LIMA', 'LIMA', 'PACHACAMAC'),
(1258, 14, 1, 17, 'LIMA', 'LIMA', 'PUEBLO LIBRE'),
(1259, 14, 1, 18, 'LIMA', 'LIMA', 'PUCUSANA'),
(1260, 14, 1, 19, 'LIMA', 'LIMA', 'PUENTE PIEDRA'),
(1261, 14, 1, 20, 'LIMA', 'LIMA', 'PUNTA HERMOSA'),
(1262, 14, 1, 21, 'LIMA', 'LIMA', 'PUNTA NEGRA'),
(1263, 14, 1, 22, 'LIMA', 'LIMA', 'RIMAC'),
(1264, 14, 1, 23, 'LIMA', 'LIMA', 'SAN BARTOLO'),
(1265, 14, 1, 24, 'LIMA', 'LIMA', 'SAN ISIDRO'),
(1266, 14, 1, 25, 'LIMA', 'LIMA', 'BARRANCO'),
(1267, 14, 1, 26, 'LIMA', 'LIMA', 'SAN MARTIN DE PORRES'),
(1268, 14, 1, 27, 'LIMA', 'LIMA', 'SAN MIGUEL'),
(1269, 14, 1, 28, 'LIMA', 'LIMA', 'STA MARIA DEL MAR'),
(1270, 14, 1, 29, 'LIMA', 'LIMA', 'SANTA ROSA'),
(1271, 14, 1, 30, 'LIMA', 'LIMA', 'SANTIAGO DE SURCO'),
(1272, 14, 1, 31, 'LIMA', 'LIMA', 'SURQUILLO'),
(1273, 14, 1, 32, 'LIMA', 'LIMA', 'VILLA MARIA DEL TRIUNFO'),
(1274, 14, 1, 33, 'LIMA', 'LIMA', 'JESUS MARIA'),
(1275, 14, 1, 34, 'LIMA', 'LIMA', 'INDEPENDENCIA'),
(1276, 14, 1, 35, 'LIMA', 'LIMA', 'EL AGUSTINO'),
(1277, 14, 1, 36, 'LIMA', 'LIMA', 'SAN JUAN DE MIRAFLORES'),
(1278, 14, 1, 37, 'LIMA', 'LIMA', 'SAN JUAN DE LURIGANCHO'),
(1279, 14, 1, 38, 'LIMA', 'LIMA', 'SAN LUIS'),
(1280, 14, 1, 39, 'LIMA', 'LIMA', 'CIENEGUILLA'),
(1281, 14, 1, 40, 'LIMA', 'LIMA', 'SAN BORJA'),
(1282, 14, 1, 41, 'LIMA', 'LIMA', 'VILLA EL SALVADOR'),
(1283, 14, 1, 42, 'LIMA', 'LIMA', 'LOS OLIVOS'),
(1284, 14, 1, 43, 'LIMA', 'LIMA', 'SANTA ANITA'),
(1285, 14, 2, 1, 'LIMA', 'CAJATAMBO', 'CAJATAMBO'),
(1286, 14, 2, 5, 'LIMA', 'CAJATAMBO', 'COPA'),
(1287, 14, 2, 6, 'LIMA', 'CAJATAMBO', 'GORGOR'),
(1288, 14, 2, 7, 'LIMA', 'CAJATAMBO', 'HUANCAPON'),
(1289, 14, 2, 8, 'LIMA', 'CAJATAMBO', 'MANAS'),
(1290, 14, 3, 1, 'LIMA', 'CANTA', 'CANTA'),
(1291, 14, 3, 2, 'LIMA', 'CANTA', 'ARAHUAY'),
(1292, 14, 3, 3, 'LIMA', 'CANTA', 'HUAMANTANGA'),
(1293, 14, 3, 4, 'LIMA', 'CANTA', 'HUAROS'),
(1294, 14, 3, 5, 'LIMA', 'CANTA', 'LACHAQUI'),
(1295, 14, 3, 6, 'LIMA', 'CANTA', 'SAN BUENAVENTURA'),
(1296, 14, 3, 7, 'LIMA', 'CANTA', 'SANTA ROSA DE QUIVES'),
(1297, 14, 4, 1, 'LIMA', 'CAÑETE', 'SAN VICENTE DE CAÑETE'),
(1298, 14, 4, 2, 'LIMA', 'CAÑETE', 'CALANGO'),
(1299, 14, 4, 3, 'LIMA', 'CAÑETE', 'CERRO AZUL'),
(1300, 14, 4, 4, 'LIMA', 'CAÑETE', 'COAYLLO'),
(1301, 14, 4, 5, 'LIMA', 'CAÑETE', 'CHILCA'),
(1302, 14, 4, 6, 'LIMA', 'CAÑETE', 'IMPERIAL'),
(1303, 14, 4, 7, 'LIMA', 'CAÑETE', 'LUNAHUANA'),
(1304, 14, 4, 8, 'LIMA', 'CAÑETE', 'MALA'),
(1305, 14, 4, 9, 'LIMA', 'CAÑETE', 'NUEVO IMPERIAL'),
(1306, 14, 4, 10, 'LIMA', 'CAÑETE', 'PACARAN'),
(1307, 14, 4, 11, 'LIMA', 'CAÑETE', 'QUILMANA'),
(1308, 14, 4, 12, 'LIMA', 'CAÑETE', 'SAN ANTONIO'),
(1309, 14, 4, 13, 'LIMA', 'CAÑETE', 'SAN LUIS'),
(1310, 14, 4, 14, 'LIMA', 'CAÑETE', 'SANTA CRUZ DE FLORES'),
(1311, 14, 4, 15, 'LIMA', 'CAÑETE', 'ZUÑIGA'),
(1312, 14, 4, 16, 'LIMA', 'CAÑETE', 'ASIA'),
(1313, 14, 5, 1, 'LIMA', 'HUAURA', 'HUACHO'),
(1314, 14, 5, 2, 'LIMA', 'HUAURA', 'AMBAR'),
(1315, 14, 5, 4, 'LIMA', 'HUAURA', 'CALETA DE CARQUIN'),
(1316, 14, 5, 5, 'LIMA', 'HUAURA', 'CHECRAS'),
(1317, 14, 5, 6, 'LIMA', 'HUAURA', 'HUALMAY'),
(1318, 14, 5, 7, 'LIMA', 'HUAURA', 'HUAURA'),
(1319, 14, 5, 8, 'LIMA', 'HUAURA', 'LEONCIO PRADO'),
(1320, 14, 5, 9, 'LIMA', 'HUAURA', 'PACCHO'),
(1321, 14, 5, 11, 'LIMA', 'HUAURA', 'SANTA LEONOR'),
(1322, 14, 5, 12, 'LIMA', 'HUAURA', 'SANTA MARIA'),
(1323, 14, 5, 13, 'LIMA', 'HUAURA', 'SAYAN'),
(1324, 14, 5, 16, 'LIMA', 'HUAURA', 'VEGUETA'),
(1325, 14, 6, 1, 'LIMA', 'HUAROCHIRI', 'MATUCANA'),
(1326, 14, 6, 2, 'LIMA', 'HUAROCHIRI', 'ANTIOQUIA'),
(1327, 14, 6, 3, 'LIMA', 'HUAROCHIRI', 'CALLAHUANCA'),
(1328, 14, 6, 4, 'LIMA', 'HUAROCHIRI', 'CARAMPOMA'),
(1329, 14, 6, 5, 'LIMA', 'HUAROCHIRI', 'CASTA'),
(1330, 14, 6, 6, 'LIMA', 'HUAROCHIRI', 'SAN JOSE DE LOS CHORRILLOS'),
(1331, 14, 6, 7, 'LIMA', 'HUAROCHIRI', 'CHICLA'),
(1332, 14, 6, 8, 'LIMA', 'HUAROCHIRI', 'HUANZA'),
(1333, 14, 6, 9, 'LIMA', 'HUAROCHIRI', 'HUAROCHIRI'),
(1334, 14, 6, 10, 'LIMA', 'HUAROCHIRI', 'LAHUAYTAMBO'),
(1335, 14, 6, 11, 'LIMA', 'HUAROCHIRI', 'LANGA'),
(1336, 14, 6, 12, 'LIMA', 'HUAROCHIRI', 'MARIATANA'),
(1337, 14, 6, 13, 'LIMA', 'HUAROCHIRI', 'RICARDO PALMA'),
(1338, 14, 6, 14, 'LIMA', 'HUAROCHIRI', 'SAN ANDRES DE TUPICOCHA'),
(1339, 14, 6, 15, 'LIMA', 'HUAROCHIRI', 'SAN ANTONIO'),
(1340, 14, 6, 16, 'LIMA', 'HUAROCHIRI', 'SAN BARTOLOME'),
(1341, 14, 6, 17, 'LIMA', 'HUAROCHIRI', 'SAN DAMIAN'),
(1342, 14, 6, 18, 'LIMA', 'HUAROCHIRI', 'SANGALLAYA'),
(1343, 14, 6, 19, 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE TANTARANCHE'),
(1344, 14, 6, 20, 'LIMA', 'HUAROCHIRI', 'SAN LORENZO DE QUINTI'),
(1345, 14, 6, 21, 'LIMA', 'HUAROCHIRI', 'SAN MATEO'),
(1346, 14, 6, 22, 'LIMA', 'HUAROCHIRI', 'SAN MATEO DE OTAO'),
(1347, 14, 6, 23, 'LIMA', 'HUAROCHIRI', 'SAN PEDRO DE HUANCAYRE'),
(1348, 14, 6, 24, 'LIMA', 'HUAROCHIRI', 'SANTA CRUZ DE COCACHACRA'),
(1349, 14, 6, 25, 'LIMA', 'HUAROCHIRI', 'SANTA EULALIA'),
(1350, 14, 6, 26, 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE ANCHUCAYA'),
(1351, 14, 6, 27, 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE TUNA'),
(1352, 14, 6, 28, 'LIMA', 'HUAROCHIRI', 'SANTO DOMINGO DE LOS OLLEROS'),
(1353, 14, 6, 29, 'LIMA', 'HUAROCHIRI', 'SURCO'),
(1354, 14, 6, 30, 'LIMA', 'HUAROCHIRI', 'HUACHUPAMPA'),
(1355, 14, 6, 31, 'LIMA', 'HUAROCHIRI', 'LARAOS'),
(1356, 14, 6, 32, 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE IRIS'),
(1357, 14, 7, 1, 'LIMA', 'YAUYOS', 'YAUYOS'),
(1358, 14, 7, 2, 'LIMA', 'YAUYOS', 'ALIS'),
(1359, 14, 7, 3, 'LIMA', 'YAUYOS', 'AYAUCA'),
(1360, 14, 7, 4, 'LIMA', 'YAUYOS', 'AYAVIRI'),
(1361, 14, 7, 5, 'LIMA', 'YAUYOS', 'AZANGARO'),
(1362, 14, 7, 6, 'LIMA', 'YAUYOS', 'CACRA'),
(1363, 14, 7, 7, 'LIMA', 'YAUYOS', 'CARANIA'),
(1364, 14, 7, 8, 'LIMA', 'YAUYOS', 'COCHAS'),
(1365, 14, 7, 9, 'LIMA', 'YAUYOS', 'COLONIA'),
(1366, 14, 7, 10, 'LIMA', 'YAUYOS', 'CHOCOS'),
(1367, 14, 7, 11, 'LIMA', 'YAUYOS', 'HUAMPARA'),
(1368, 14, 7, 12, 'LIMA', 'YAUYOS', 'HUANCAYA'),
(1369, 14, 7, 13, 'LIMA', 'YAUYOS', 'HUANGASCAR'),
(1370, 14, 7, 14, 'LIMA', 'YAUYOS', 'HUANTAN'),
(1371, 14, 7, 15, 'LIMA', 'YAUYOS', 'HUA�EC'),
(1372, 14, 7, 16, 'LIMA', 'YAUYOS', 'LARAOS'),
(1373, 14, 7, 17, 'LIMA', 'YAUYOS', 'LINCHA'),
(1374, 14, 7, 18, 'LIMA', 'YAUYOS', 'MIRAFLORES'),
(1375, 14, 7, 19, 'LIMA', 'YAUYOS', 'OMAS'),
(1376, 14, 7, 20, 'LIMA', 'YAUYOS', 'QUINCHES'),
(1377, 14, 7, 21, 'LIMA', 'YAUYOS', 'QUINOCAY'),
(1378, 14, 7, 22, 'LIMA', 'YAUYOS', 'SAN JOAQUIN'),
(1379, 14, 7, 23, 'LIMA', 'YAUYOS', 'SAN PEDRO DE PILAS'),
(1380, 14, 7, 24, 'LIMA', 'YAUYOS', 'TANTA'),
(1381, 14, 7, 25, 'LIMA', 'YAUYOS', 'TAURIPAMPA'),
(1382, 14, 7, 26, 'LIMA', 'YAUYOS', 'TUPE'),
(1383, 14, 7, 27, 'LIMA', 'YAUYOS', 'TOMAS'),
(1384, 14, 7, 28, 'LIMA', 'YAUYOS', 'VIÑAC'),
(1385, 14, 7, 29, 'LIMA', 'YAUYOS', 'VITIS'),
(1386, 14, 7, 30, 'LIMA', 'YAUYOS', 'HONGOS'),
(1387, 14, 7, 31, 'LIMA', 'YAUYOS', 'MADEAN'),
(1388, 14, 7, 32, 'LIMA', 'YAUYOS', 'PUTINZA'),
(1389, 14, 7, 33, 'LIMA', 'YAUYOS', 'CATAHUASI'),
(1390, 14, 8, 1, 'LIMA', 'HUARAL', 'HUARAL'),
(1391, 14, 8, 2, 'LIMA', 'HUARAL', 'ATAVILLOS ALTO'),
(1392, 14, 8, 3, 'LIMA', 'HUARAL', 'ATAVILLOS BAJO'),
(1393, 14, 8, 4, 'LIMA', 'HUARAL', 'AUCALLAMA'),
(1394, 14, 8, 5, 'LIMA', 'HUARAL', 'CHANCAY'),
(1395, 14, 8, 6, 'LIMA', 'HUARAL', 'IHUARI'),
(1396, 14, 8, 7, 'LIMA', 'HUARAL', 'LAMPIAN'),
(1397, 14, 8, 8, 'LIMA', 'HUARAL', 'PACARAOS'),
(1398, 14, 8, 9, 'LIMA', 'HUARAL', 'SAN MIGUEL DE ACOS'),
(1399, 14, 8, 10, 'LIMA', 'HUARAL', 'VEINTISIETE DE NOVIEMBRE'),
(1400, 14, 8, 11, 'LIMA', 'HUARAL', 'STA CRUZ DE ANDAMARCA'),
(1401, 14, 8, 12, 'LIMA', 'HUARAL', 'SUMBILCA'),
(1402, 14, 9, 1, 'LIMA', 'BARRANCA', 'BARRANCA'),
(1403, 14, 9, 2, 'LIMA', 'BARRANCA', 'PARAMONGA'),
(1404, 14, 9, 3, 'LIMA', 'BARRANCA', 'PATIVILCA'),
(1405, 14, 9, 4, 'LIMA', 'BARRANCA', 'SUPE'),
(1406, 14, 9, 5, 'LIMA', 'BARRANCA', 'SUPE PUERTO'),
(1407, 14, 10, 1, 'LIMA', 'OYON', 'OYON'),
(1408, 14, 10, 2, 'LIMA', 'OYON', 'NAVAN'),
(1409, 14, 10, 3, 'LIMA', 'OYON', 'CAUJUL'),
(1410, 14, 10, 4, 'LIMA', 'OYON', 'ANDAJES'),
(1411, 14, 10, 5, 'LIMA', 'OYON', 'PACHANGARA'),
(1412, 14, 10, 6, 'LIMA', 'OYON', 'COCHAMARCA'),
(1413, 15, 1, 1, 'LORETO', 'MAYNAS', 'IQUITOS'),
(1414, 15, 1, 2, 'LORETO', 'MAYNAS', 'ALTO NANAY'),
(1415, 15, 1, 3, 'LORETO', 'MAYNAS', 'FERNANDO LORES'),
(1416, 15, 1, 4, 'LORETO', 'MAYNAS', 'LAS AMAZONAS'),
(1417, 15, 1, 5, 'LORETO', 'MAYNAS', 'MAZAN'),
(1418, 15, 1, 6, 'LORETO', 'MAYNAS', 'NAPO'),
(1419, 15, 1, 7, 'LORETO', 'MAYNAS', 'PUTUMAYO'),
(1420, 15, 1, 8, 'LORETO', 'MAYNAS', 'TORRES CAUSANA'),
(1421, 15, 1, 10, 'LORETO', 'MAYNAS', 'INDIANA'),
(1422, 15, 1, 11, 'LORETO', 'MAYNAS', 'PUNCHANA'),
(1423, 15, 1, 12, 'LORETO', 'MAYNAS', 'BELEN'),
(1424, 15, 1, 13, 'LORETO', 'MAYNAS', 'SAN JUAN BAUTISTA'),
(1425, 15, 1, 14, 'LORETO', 'MAYNAS', 'TNTE MANUEL CLAVERO'),
(1426, 15, 2, 1, 'LORETO', 'ALTO AMAZONAS', 'YURIMAGUAS'),
(1427, 15, 2, 2, 'LORETO', 'ALTO AMAZONAS', 'BALSAPUERTO'),
(1428, 15, 2, 5, 'LORETO', 'ALTO AMAZONAS', 'JEBEROS'),
(1429, 15, 2, 6, 'LORETO', 'ALTO AMAZONAS', 'LAGUNAS'),
(1430, 15, 2, 10, 'LORETO', 'ALTO AMAZONAS', 'SANTA CRUZ'),
(1431, 15, 2, 11, 'LORETO', 'ALTO AMAZONAS', 'TNTE CESAR LOPEZ ROJAS'),
(1432, 15, 3, 1, 'LORETO', 'LORETO', 'NAUTA'),
(1433, 15, 3, 2, 'LORETO', 'LORETO', 'PARINARI'),
(1434, 15, 3, 3, 'LORETO', 'LORETO', 'TIGRE'),
(1435, 15, 3, 4, 'LORETO', 'LORETO', 'URARINAS'),
(1436, 15, 3, 5, 'LORETO', 'LORETO', 'TROMPETEROS'),
(1437, 15, 4, 1, 'LORETO', 'REQUENA', 'REQUENA'),
(1438, 15, 4, 2, 'LORETO', 'REQUENA', 'ALTO TAPICHE'),
(1439, 15, 4, 3, 'LORETO', 'REQUENA', 'CAPELO'),
(1440, 15, 4, 4, 'LORETO', 'REQUENA', 'EMILIO SAN MARTIN'),
(1441, 15, 4, 5, 'LORETO', 'REQUENA', 'MAQUIA'),
(1442, 15, 4, 6, 'LORETO', 'REQUENA', 'PUINAHUA'),
(1443, 15, 4, 7, 'LORETO', 'REQUENA', 'SAPUENA'),
(1444, 15, 4, 8, 'LORETO', 'REQUENA', 'SOPLIN'),
(1445, 15, 4, 9, 'LORETO', 'REQUENA', 'TAPICHE'),
(1446, 15, 4, 10, 'LORETO', 'REQUENA', 'JENARO HERRERA'),
(1447, 15, 4, 11, 'LORETO', 'REQUENA', 'YAQUERANA'),
(1448, 15, 5, 1, 'LORETO', 'UCAYALI', 'CONTAMANA'),
(1449, 15, 5, 2, 'LORETO', 'UCAYALI', 'VARGAS GUERRA'),
(1450, 15, 5, 3, 'LORETO', 'UCAYALI', 'PADRE MARQUEZ'),
(1451, 15, 5, 4, 'LORETO', 'UCAYALI', 'PAMPA HERMOZA'),
(1452, 15, 5, 5, 'LORETO', 'UCAYALI', 'SARAYACU'),
(1453, 15, 5, 6, 'LORETO', 'UCAYALI', 'INAHUAYA'),
(1454, 15, 6, 1, 'LORETO', 'MARISCAL RAMON CASTILLA', 'MARISCAL RAMON CASTILLA'),
(1455, 15, 6, 2, 'LORETO', 'MARISCAL RAMON CASTILLA', 'PEBAS'),
(1456, 15, 6, 3, 'LORETO', 'MARISCAL RAMON CASTILLA', 'YAVARI'),
(1457, 15, 6, 4, 'LORETO', 'MARISCAL RAMON CASTILLA', 'SAN PABLO'),
(1458, 15, 7, 1, 'LORETO', 'DATEM DEL MARA�ON', 'BARRANCA'),
(1459, 15, 7, 2, 'LORETO', 'DATEM DEL MARA�ON', 'ANDOAS'),
(1460, 15, 7, 3, 'LORETO', 'DATEM DEL MARA�ON', 'CAHUAPANAS'),
(1461, 15, 7, 4, 'LORETO', 'DATEM DEL MARA�ON', 'MANSERICHE'),
(1462, 15, 7, 5, 'LORETO', 'DATEM DEL MARA�ON', 'MORONA'),
(1463, 15, 7, 6, 'LORETO', 'DATEM DEL MARA�ON', 'PASTAZA'),
(1464, 16, 1, 1, 'MADRE DE DIOS', 'TAMBOPATA', 'TAMBOPATA'),
(1465, 16, 1, 2, 'MADRE DE DIOS', 'TAMBOPATA', 'INAMBARI'),
(1466, 16, 1, 3, 'MADRE DE DIOS', 'TAMBOPATA', 'LAS PIEDRAS'),
(1467, 16, 1, 4, 'MADRE DE DIOS', 'TAMBOPATA', 'LABERINTO'),
(1468, 16, 2, 1, 'MADRE DE DIOS', 'MANU', 'MANU'),
(1469, 16, 2, 2, 'MADRE DE DIOS', 'MANU', 'FITZCARRALD'),
(1470, 16, 2, 3, 'MADRE DE DIOS', 'MANU', 'MADRE DE DIOS'),
(1471, 16, 2, 4, 'MADRE DE DIOS', 'MANU', 'HUEPETUHE'),
(1472, 16, 3, 1, 'MADRE DE DIOS', 'TAHUAMANU', 'IÑAPARI'),
(1473, 16, 3, 2, 'MADRE DE DIOS', 'TAHUAMANU', 'IBERIA'),
(1474, 16, 3, 3, 'MADRE DE DIOS', 'TAHUAMANU', 'TAHUAMANU'),
(1475, 17, 1, 1, 'MOQUEGUA', 'MARISCAL NIETO', 'MOQUEGUA'),
(1476, 17, 1, 2, 'MOQUEGUA', 'MARISCAL NIETO', 'CARUMAS'),
(1477, 17, 1, 3, 'MOQUEGUA', 'MARISCAL NIETO', 'CUCHUMBAYA'),
(1478, 17, 1, 4, 'MOQUEGUA', 'MARISCAL NIETO', 'SAN CRISTOBAL'),
(1479, 17, 1, 5, 'MOQUEGUA', 'MARISCAL NIETO', 'TORATA'),
(1480, 17, 1, 6, 'MOQUEGUA', 'MARISCAL NIETO', 'SAMEGUA'),
(1481, 17, 2, 1, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'OMATE'),
(1482, 17, 2, 2, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'COALAQUE'),
(1483, 17, 2, 3, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'CHOJATA'),
(1484, 17, 2, 4, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'ICHU�A'),
(1485, 17, 2, 5, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LA CAPILLA'),
(1486, 17, 2, 6, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LLOQUE'),
(1487, 17, 2, 7, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'MATALAQUE'),
(1488, 17, 2, 8, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'PUQUINA'),
(1489, 17, 2, 9, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'QUINISTAQUILLAS'),
(1490, 17, 2, 10, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'UBINAS'),
(1491, 17, 2, 11, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'YUNGA'),
(1492, 17, 3, 1, 'MOQUEGUA', 'ILO', 'ILO'),
(1493, 17, 3, 2, 'MOQUEGUA', 'ILO', 'EL ALGARROBAL'),
(1494, 17, 3, 3, 'MOQUEGUA', 'ILO', 'PACOCHA'),
(1495, 18, 1, 1, 'PASCO', 'PASCO', 'CHAUPIMARCA'),
(1496, 18, 1, 3, 'PASCO', 'PASCO', 'HUACHON'),
(1497, 18, 1, 4, 'PASCO', 'PASCO', 'HUARIACA'),
(1498, 18, 1, 5, 'PASCO', 'PASCO', 'HUAYLLAY'),
(1499, 18, 1, 6, 'PASCO', 'PASCO', 'NINACACA'),
(1500, 18, 1, 7, 'PASCO', 'PASCO', 'PALLANCHACRA'),
(1501, 18, 1, 8, 'PASCO', 'PASCO', 'PAUCARTAMBO'),
(1502, 18, 1, 9, 'PASCO', 'PASCO', 'SAN FCO DE ASIS DE YARUSYACAN'),
(1503, 18, 1, 10, 'PASCO', 'PASCO', 'SIMON BOLIVAR'),
(1504, 18, 1, 11, 'PASCO', 'PASCO', 'TICLACAYAN'),
(1505, 18, 1, 12, 'PASCO', 'PASCO', 'TINYAHUARCO'),
(1506, 18, 1, 13, 'PASCO', 'PASCO', 'VICCO'),
(1507, 18, 1, 14, 'PASCO', 'PASCO', 'YANACANCHA'),
(1508, 18, 2, 1, 'PASCO', 'DANIEL ALCIDES CARRION', 'YANAHUANCA'),
(1509, 18, 2, 2, 'PASCO', 'DANIEL ALCIDES CARRION', 'CHACAYAN'),
(1510, 18, 2, 3, 'PASCO', 'DANIEL ALCIDES CARRION', 'GOYLLARISQUIZGA'),
(1511, 18, 2, 4, 'PASCO', 'DANIEL ALCIDES CARRION', 'PAUCAR'),
(1512, 18, 2, 5, 'PASCO', 'DANIEL ALCIDES CARRION', 'SAN PEDRO DE PILLAO'),
(1513, 18, 2, 6, 'PASCO', 'DANIEL ALCIDES CARRION', 'SANTA ANA DE TUSI'),
(1514, 18, 2, 7, 'PASCO', 'DANIEL ALCIDES CARRION', 'TAPUC'),
(1515, 18, 2, 8, 'PASCO', 'DANIEL ALCIDES CARRION', 'VILCABAMBA'),
(1516, 18, 3, 1, 'PASCO', 'OXAPAMPA', 'OXAPAMPA'),
(1517, 18, 3, 2, 'PASCO', 'OXAPAMPA', 'CHONTABAMBA'),
(1518, 18, 3, 3, 'PASCO', 'OXAPAMPA', 'HUANCABAMBA'),
(1519, 18, 3, 4, 'PASCO', 'OXAPAMPA', 'PUERTO BERMUDEZ'),
(1520, 18, 3, 5, 'PASCO', 'OXAPAMPA', 'VILLA RICA'),
(1521, 18, 3, 6, 'PASCO', 'OXAPAMPA', 'POZUZO'),
(1522, 18, 3, 7, 'PASCO', 'OXAPAMPA', 'PALCAZU'),
(1523, 19, 1, 1, 'PIURA', 'PIURA', 'PIURA'),
(1524, 19, 1, 3, 'PIURA', 'PIURA', 'CASTILLA'),
(1525, 19, 1, 4, 'PIURA', 'PIURA', 'CATACAOS'),
(1526, 19, 1, 5, 'PIURA', 'PIURA', 'LA ARENA'),
(1527, 19, 1, 6, 'PIURA', 'PIURA', 'LA UNION'),
(1528, 19, 1, 7, 'PIURA', 'PIURA', 'LAS LOMAS'),
(1529, 19, 1, 9, 'PIURA', 'PIURA', 'TAMBO GRANDE'),
(1530, 19, 1, 13, 'PIURA', 'PIURA', 'CURA MORI'),
(1531, 19, 1, 14, 'PIURA', 'PIURA', 'EL TALLAN'),
(1532, 19, 2, 1, 'PIURA', 'AYABACA', 'AYABACA'),
(1533, 19, 2, 2, 'PIURA', 'AYABACA', 'FRIAS'),
(1534, 19, 2, 3, 'PIURA', 'AYABACA', 'LAGUNAS'),
(1535, 19, 2, 4, 'PIURA', 'AYABACA', 'MONTERO'),
(1536, 19, 2, 5, 'PIURA', 'AYABACA', 'PACAIPAMPA'),
(1537, 19, 2, 6, 'PIURA', 'AYABACA', 'SAPILLICA'),
(1538, 19, 2, 7, 'PIURA', 'AYABACA', 'SICCHEZ'),
(1539, 19, 2, 8, 'PIURA', 'AYABACA', 'SUYO'),
(1540, 19, 2, 9, 'PIURA', 'AYABACA', 'JILILI'),
(1541, 19, 2, 10, 'PIURA', 'AYABACA', 'PAIMAS'),
(1542, 19, 3, 1, 'PIURA', 'HUANCABAMBA', 'HUANCABAMBA'),
(1543, 19, 3, 2, 'PIURA', 'HUANCABAMBA', 'CANCHAQUE'),
(1544, 19, 3, 3, 'PIURA', 'HUANCABAMBA', 'HUARMACA'),
(1545, 19, 3, 4, 'PIURA', 'HUANCABAMBA', 'SONDOR'),
(1546, 19, 3, 5, 'PIURA', 'HUANCABAMBA', 'SONDORILLO'),
(1547, 19, 3, 6, 'PIURA', 'HUANCABAMBA', 'EL CARMEN DE LA FRONTERA'),
(1548, 19, 3, 7, 'PIURA', 'HUANCABAMBA', 'SAN MIGUEL DE EL FAIQUE'),
(1549, 19, 3, 8, 'PIURA', 'HUANCABAMBA', 'LALAQUIZ'),
(1550, 19, 4, 1, 'PIURA', 'MORROPON', 'CHULUCANAS'),
(1551, 19, 4, 2, 'PIURA', 'MORROPON', 'BUENOS AIRES'),
(1552, 19, 4, 3, 'PIURA', 'MORROPON', 'CHALACO'),
(1553, 19, 4, 4, 'PIURA', 'MORROPON', 'MORROPON'),
(1554, 19, 4, 5, 'PIURA', 'MORROPON', 'SALITRAL'),
(1555, 19, 4, 6, 'PIURA', 'MORROPON', 'SANTA CATALINA DE MOSSA'),
(1556, 19, 4, 7, 'PIURA', 'MORROPON', 'SANTO DOMINGO'),
(1557, 19, 4, 8, 'PIURA', 'MORROPON', 'LA MATANZA'),
(1558, 19, 4, 9, 'PIURA', 'MORROPON', 'YAMANGO'),
(1559, 19, 4, 10, 'PIURA', 'MORROPON', 'SAN JUAN DE BIGOTE'),
(1560, 19, 5, 1, 'PIURA', 'PAITA', 'PAITA'),
(1561, 19, 5, 2, 'PIURA', 'PAITA', 'AMOTAPE'),
(1562, 19, 5, 3, 'PIURA', 'PAITA', 'ARENAL'),
(1563, 19, 5, 4, 'PIURA', 'PAITA', 'LA HUACA'),
(1564, 19, 5, 5, 'PIURA', 'PAITA', 'PUEBLO NUEVO DE COLAN'),
(1565, 19, 5, 6, 'PIURA', 'PAITA', 'TAMARINDO'),
(1566, 19, 5, 7, 'PIURA', 'PAITA', 'VICHAYAL'),
(1567, 19, 6, 1, 'PIURA', 'SULLANA', 'SULLANA'),
(1568, 19, 6, 2, 'PIURA', 'SULLANA', 'BELLAVISTA'),
(1569, 19, 6, 3, 'PIURA', 'SULLANA', 'LANCONES'),
(1570, 19, 6, 4, 'PIURA', 'SULLANA', 'MARCAVELICA'),
(1571, 19, 6, 5, 'PIURA', 'SULLANA', 'MIGUEL CHECA'),
(1572, 19, 6, 6, 'PIURA', 'SULLANA', 'QUERECOTILLO'),
(1573, 19, 6, 7, 'PIURA', 'SULLANA', 'SALITRAL'),
(1574, 19, 6, 8, 'PIURA', 'SULLANA', 'IGNACIO ESCUDERO'),
(1575, 19, 7, 1, 'PIURA', 'TALARA', 'PARIÑAS'),
(1576, 19, 7, 2, 'PIURA', 'TALARA', 'EL ALTO'),
(1577, 19, 7, 3, 'PIURA', 'TALARA', 'LA BREA'),
(1578, 19, 7, 4, 'PIURA', 'TALARA', 'LOBITOS'),
(1579, 19, 7, 5, 'PIURA', 'TALARA', 'MANCORA'),
(1580, 19, 7, 6, 'PIURA', 'TALARA', 'LOS ORGANOS'),
(1581, 19, 8, 1, 'PIURA', 'SECHURA', 'SECHURA'),
(1582, 19, 8, 2, 'PIURA', 'SECHURA', 'VICE'),
(1583, 19, 8, 3, 'PIURA', 'SECHURA', 'BERNAL'),
(1584, 19, 8, 4, 'PIURA', 'SECHURA', 'BELLAVISTA DE LA UNION'),
(1585, 19, 8, 5, 'PIURA', 'SECHURA', 'CRISTO NOS VALGA'),
(1586, 19, 8, 6, 'PIURA', 'SECHURA', 'RINCONADA LLICUAR'),
(1587, 20, 1, 1, 'PUNO', 'PUNO', 'PUNO'),
(1588, 20, 1, 2, 'PUNO', 'PUNO', 'ACORA'),
(1589, 20, 1, 3, 'PUNO', 'PUNO', 'ATUNCOLLA'),
(1590, 20, 1, 4, 'PUNO', 'PUNO', 'CAPACHICA'),
(1591, 20, 1, 5, 'PUNO', 'PUNO', 'COATA'),
(1592, 20, 1, 6, 'PUNO', 'PUNO', 'CHUCUITO'),
(1593, 20, 1, 7, 'PUNO', 'PUNO', 'HUATA'),
(1594, 20, 1, 8, 'PUNO', 'PUNO', 'MA�AZO'),
(1595, 20, 1, 9, 'PUNO', 'PUNO', 'PAUCARCOLLA'),
(1596, 20, 1, 10, 'PUNO', 'PUNO', 'PICHACANI'),
(1597, 20, 1, 11, 'PUNO', 'PUNO', 'SAN ANTONIO'),
(1598, 20, 1, 12, 'PUNO', 'PUNO', 'TIQUILLACA'),
(1599, 20, 1, 13, 'PUNO', 'PUNO', 'VILQUE'),
(1600, 20, 1, 14, 'PUNO', 'PUNO', 'PLATERIA'),
(1601, 20, 1, 15, 'PUNO', 'PUNO', 'AMANTANI'),
(1602, 20, 2, 1, 'PUNO', 'AZANGARO', 'AZANGARO'),
(1603, 20, 2, 2, 'PUNO', 'AZANGARO', 'ACHAYA'),
(1604, 20, 2, 3, 'PUNO', 'AZANGARO', 'ARAPA'),
(1605, 20, 2, 4, 'PUNO', 'AZANGARO', 'ASILLO'),
(1606, 20, 2, 5, 'PUNO', 'AZANGARO', 'CAMINACA'),
(1607, 20, 2, 6, 'PUNO', 'AZANGARO', 'CHUPA'),
(1608, 20, 2, 7, 'PUNO', 'AZANGARO', 'JOSE DOMINGO CHOQUEHUANCA'),
(1609, 20, 2, 8, 'PUNO', 'AZANGARO', 'MUÑANI'),
(1610, 20, 2, 10, 'PUNO', 'AZANGARO', 'POTONI'),
(1611, 20, 2, 12, 'PUNO', 'AZANGARO', 'SAMAN'),
(1612, 20, 2, 13, 'PUNO', 'AZANGARO', 'SAN ANTON'),
(1613, 20, 2, 14, 'PUNO', 'AZANGARO', 'SAN JOSE'),
(1614, 20, 2, 15, 'PUNO', 'AZANGARO', 'SAN JUAN DE SALINAS'),
(1615, 20, 2, 16, 'PUNO', 'AZANGARO', 'STGO DE PUPUJA'),
(1616, 20, 2, 17, 'PUNO', 'AZANGARO', 'TIRAPATA'),
(1617, 20, 3, 1, 'PUNO', 'CARABAYA', 'MACUSANI'),
(1618, 20, 3, 2, 'PUNO', 'CARABAYA', 'AJOYANI'),
(1619, 20, 3, 3, 'PUNO', 'CARABAYA', 'AYAPATA'),
(1620, 20, 3, 4, 'PUNO', 'CARABAYA', 'COASA'),
(1621, 20, 3, 5, 'PUNO', 'CARABAYA', 'CORANI'),
(1622, 20, 3, 6, 'PUNO', 'CARABAYA', 'CRUCERO'),
(1623, 20, 3, 7, 'PUNO', 'CARABAYA', 'ITUATA'),
(1624, 20, 3, 8, 'PUNO', 'CARABAYA', 'OLLACHEA'),
(1625, 20, 3, 9, 'PUNO', 'CARABAYA', 'SAN GABAN'),
(1626, 20, 3, 10, 'PUNO', 'CARABAYA', 'USICAYOS'),
(1627, 20, 4, 1, 'PUNO', 'CHUCUITO', 'JULI'),
(1628, 20, 4, 2, 'PUNO', 'CHUCUITO', 'DESAGUADERO'),
(1629, 20, 4, 3, 'PUNO', 'CHUCUITO', 'HUACULLANI'),
(1630, 20, 4, 6, 'PUNO', 'CHUCUITO', 'PISACOMA'),
(1631, 20, 4, 7, 'PUNO', 'CHUCUITO', 'POMATA'),
(1632, 20, 4, 10, 'PUNO', 'CHUCUITO', 'ZEPITA'),
(1633, 20, 4, 12, 'PUNO', 'CHUCUITO', 'KELLUYO'),
(1634, 20, 5, 1, 'PUNO', 'HUANCANE', 'HUANCANE'),
(1635, 20, 5, 2, 'PUNO', 'HUANCANE', 'COJATA'),
(1636, 20, 5, 4, 'PUNO', 'HUANCANE', 'INCHUPALLA'),
(1637, 20, 5, 6, 'PUNO', 'HUANCANE', 'PUSI'),
(1638, 20, 5, 7, 'PUNO', 'HUANCANE', 'ROSASPATA'),
(1639, 20, 5, 8, 'PUNO', 'HUANCANE', 'TARACO'),
(1640, 20, 5, 9, 'PUNO', 'HUANCANE', 'VILQUE CHICO'),
(1641, 20, 5, 11, 'PUNO', 'HUANCANE', 'HUATASANI'),
(1642, 20, 6, 1, 'PUNO', 'LAMPA', 'LAMPA'),
(1643, 20, 6, 2, 'PUNO', 'LAMPA', 'CABANILLA'),
(1644, 20, 6, 3, 'PUNO', 'LAMPA', 'CALAPUJA'),
(1645, 20, 6, 4, 'PUNO', 'LAMPA', 'NICASIO'),
(1646, 20, 6, 5, 'PUNO', 'LAMPA', 'OCUVIRI'),
(1647, 20, 6, 6, 'PUNO', 'LAMPA', 'PALCA'),
(1648, 20, 6, 7, 'PUNO', 'LAMPA', 'PARATIA'),
(1649, 20, 6, 8, 'PUNO', 'LAMPA', 'PUCARA'),
(1650, 20, 6, 9, 'PUNO', 'LAMPA', 'SANTA LUCIA'),
(1651, 20, 6, 10, 'PUNO', 'LAMPA', 'VILAVILA'),
(1652, 20, 7, 1, 'PUNO', 'MELGAR', 'AYAVIRI'),
(1653, 20, 7, 2, 'PUNO', 'MELGAR', 'ANTAUTA'),
(1654, 20, 7, 3, 'PUNO', 'MELGAR', 'CUPI'),
(1655, 20, 7, 4, 'PUNO', 'MELGAR', 'LLALLI'),
(1656, 20, 7, 5, 'PUNO', 'MELGAR', 'MACARI'),
(1657, 20, 7, 6, 'PUNO', 'MELGAR', 'NUÑOA'),
(1658, 20, 7, 7, 'PUNO', 'MELGAR', 'ORURILLO'),
(1659, 20, 7, 8, 'PUNO', 'MELGAR', 'SANTA ROSA'),
(1660, 20, 7, 9, 'PUNO', 'MELGAR', 'UMACHIRI'),
(1661, 20, 8, 1, 'PUNO', 'SANDIA', 'SANDIA'),
(1662, 20, 8, 3, 'PUNO', 'SANDIA', 'CUYOCUYO'),
(1663, 20, 8, 4, 'PUNO', 'SANDIA', 'LIMBANI'),
(1664, 20, 8, 5, 'PUNO', 'SANDIA', 'PHARA'),
(1665, 20, 8, 6, 'PUNO', 'SANDIA', 'PATAMBUCO'),
(1666, 20, 8, 7, 'PUNO', 'SANDIA', 'QUIACA'),
(1667, 20, 8, 8, 'PUNO', 'SANDIA', 'SAN JUAN DEL ORO'),
(1668, 20, 8, 10, 'PUNO', 'SANDIA', 'YANAHUAYA'),
(1669, 20, 8, 11, 'PUNO', 'SANDIA', 'ALTO INAMBARI'),
(1670, 20, 8, 12, 'PUNO', 'SANDIA', 'SAN PEDRO DE PUTINA PUNCO'),
(1671, 20, 9, 1, 'PUNO', 'SAN ROMAN', 'JULIACA'),
(1672, 20, 9, 2, 'PUNO', 'SAN ROMAN', 'CABANA'),
(1673, 20, 9, 3, 'PUNO', 'SAN ROMAN', 'CABANILLAS'),
(1674, 20, 9, 4, 'PUNO', 'SAN ROMAN', 'CARACOTO'),
(1675, 20, 10, 1, 'PUNO', 'YUNGUYO', 'YUNGUYO'),
(1676, 20, 10, 2, 'PUNO', 'YUNGUYO', 'UNICACHI'),
(1677, 20, 10, 3, 'PUNO', 'YUNGUYO', 'ANAPIA'),
(1678, 20, 10, 4, 'PUNO', 'YUNGUYO', 'COPANI'),
(1679, 20, 10, 5, 'PUNO', 'YUNGUYO', 'CUTURAPI'),
(1680, 20, 10, 6, 'PUNO', 'YUNGUYO', 'OLLARAYA'),
(1681, 20, 10, 7, 'PUNO', 'YUNGUYO', 'TINICACHI'),
(1682, 20, 11, 1, 'PUNO', 'SAN ANTONIO DE PUTINA', 'PUTINA'),
(1683, 20, 11, 2, 'PUNO', 'SAN ANTONIO DE PUTINA', 'PEDRO VILCA APAZA'),
(1684, 20, 11, 3, 'PUNO', 'SAN ANTONIO DE PUTINA', 'QUILCA PUNCU'),
(1685, 20, 11, 4, 'PUNO', 'SAN ANTONIO DE PUTINA', 'ANANEA'),
(1686, 20, 11, 5, 'PUNO', 'SAN ANTONIO DE PUTINA', 'SINA'),
(1687, 20, 12, 1, 'PUNO', 'EL COLLAO', 'ILAVE'),
(1688, 20, 12, 2, 'PUNO', 'EL COLLAO', 'PILCUYO'),
(1689, 20, 12, 3, 'PUNO', 'EL COLLAO', 'SANTA ROSA'),
(1690, 20, 12, 4, 'PUNO', 'EL COLLAO', 'CAPASO'),
(1691, 20, 12, 5, 'PUNO', 'EL COLLAO', 'CONDURIRI'),
(1692, 20, 13, 1, 'PUNO', 'MOHO', 'MOHO'),
(1693, 20, 13, 2, 'PUNO', 'MOHO', 'CONIMA'),
(1694, 20, 13, 3, 'PUNO', 'MOHO', 'TILALI'),
(1695, 20, 13, 4, 'PUNO', 'MOHO', 'HUAYRAPATA'),
(1696, 21, 1, 1, 'SAN MARTIN', 'MOYOBAMBA', 'MOYOBAMBA'),
(1697, 21, 1, 2, 'SAN MARTIN', 'MOYOBAMBA', 'CALZADA'),
(1698, 21, 1, 3, 'SAN MARTIN', 'MOYOBAMBA', 'HABANA'),
(1699, 21, 1, 4, 'SAN MARTIN', 'MOYOBAMBA', 'JEPELACIO'),
(1700, 21, 1, 5, 'SAN MARTIN', 'MOYOBAMBA', 'SORITOR'),
(1701, 21, 1, 6, 'SAN MARTIN', 'MOYOBAMBA', 'YANTALO'),
(1702, 21, 2, 1, 'SAN MARTIN', 'HUALLAGA', 'SAPOSOA'),
(1703, 21, 2, 2, 'SAN MARTIN', 'HUALLAGA', 'PISCOYACU'),
(1704, 21, 2, 3, 'SAN MARTIN', 'HUALLAGA', 'SACANCHE'),
(1705, 21, 2, 4, 'SAN MARTIN', 'HUALLAGA', 'TINGO DE SAPOSOA'),
(1706, 21, 2, 5, 'SAN MARTIN', 'HUALLAGA', 'ALTO SAPOSOA'),
(1707, 21, 2, 6, 'SAN MARTIN', 'HUALLAGA', 'EL ESLABON'),
(1708, 21, 3, 1, 'SAN MARTIN', 'LAMAS', 'LAMAS'),
(1709, 21, 3, 3, 'SAN MARTIN', 'LAMAS', 'BARRANQUITA'),
(1710, 21, 3, 4, 'SAN MARTIN', 'LAMAS', 'CAYNARACHI'),
(1711, 21, 3, 5, 'SAN MARTIN', 'LAMAS', 'CU�UMBUQUI'),
(1712, 21, 3, 6, 'SAN MARTIN', 'LAMAS', 'PINTO RECODO'),
(1713, 21, 3, 7, 'SAN MARTIN', 'LAMAS', 'RUMISAPA'),
(1714, 21, 3, 11, 'SAN MARTIN', 'LAMAS', 'SHANAO'),
(1715, 21, 3, 13, 'SAN MARTIN', 'LAMAS', 'TABALOSOS'),
(1716, 21, 3, 14, 'SAN MARTIN', 'LAMAS', 'ZAPATERO'),
(1717, 21, 3, 15, 'SAN MARTIN', 'LAMAS', 'ALONSO DE ALVARADO'),
(1718, 21, 3, 16, 'SAN MARTIN', 'LAMAS', 'SAN ROQUE DE CUMBAZA'),
(1719, 21, 4, 1, 'SAN MARTIN', 'MARISCAL CACERES', 'JUANJUI'),
(1720, 21, 4, 2, 'SAN MARTIN', 'MARISCAL CACERES', 'CAMPANILLA'),
(1721, 21, 4, 3, 'SAN MARTIN', 'MARISCAL CACERES', 'HUICUNGO'),
(1722, 21, 4, 4, 'SAN MARTIN', 'MARISCAL CACERES', 'PACHIZA'),
(1723, 21, 4, 5, 'SAN MARTIN', 'MARISCAL CACERES', 'PAJARILLO'),
(1724, 21, 5, 1, 'SAN MARTIN', 'RIOJA', 'RIOJA'),
(1725, 21, 5, 2, 'SAN MARTIN', 'RIOJA', 'POSIC'),
(1726, 21, 5, 3, 'SAN MARTIN', 'RIOJA', 'YORONGOS'),
(1727, 21, 5, 4, 'SAN MARTIN', 'RIOJA', 'YURACYACU'),
(1728, 21, 5, 5, 'SAN MARTIN', 'RIOJA', 'NUEVA CAJAMARCA'),
(1729, 21, 5, 6, 'SAN MARTIN', 'RIOJA', 'ELIAS SOPLIN'),
(1730, 21, 5, 7, 'SAN MARTIN', 'RIOJA', 'SAN FERNANDO'),
(1731, 21, 5, 8, 'SAN MARTIN', 'RIOJA', 'PARDO MIGUEL'),
(1732, 21, 5, 9, 'SAN MARTIN', 'RIOJA', 'AWAJUN'),
(1733, 21, 6, 1, 'SAN MARTIN', 'SAN MARTIN', 'TARAPOTO'),
(1734, 21, 6, 2, 'SAN MARTIN', 'SAN MARTIN', 'ALBERTO LEVEAU'),
(1735, 21, 6, 4, 'SAN MARTIN', 'SAN MARTIN', 'CACATACHI'),
(1736, 21, 6, 6, 'SAN MARTIN', 'SAN MARTIN', 'CHAZUTA'),
(1737, 21, 6, 7, 'SAN MARTIN', 'SAN MARTIN', 'CHIPURANA'),
(1738, 21, 6, 8, 'SAN MARTIN', 'SAN MARTIN', 'EL PORVENIR'),
(1739, 21, 6, 9, 'SAN MARTIN', 'SAN MARTIN', 'HUIMBAYOC'),
(1740, 21, 6, 10, 'SAN MARTIN', 'SAN MARTIN', 'JUAN GUERRA'),
(1741, 21, 6, 11, 'SAN MARTIN', 'SAN MARTIN', 'MORALES'),
(1742, 21, 6, 12, 'SAN MARTIN', 'SAN MARTIN', 'PAPAPLAYA'),
(1743, 21, 6, 16, 'SAN MARTIN', 'SAN MARTIN', 'SAN ANTONIO'),
(1744, 21, 6, 19, 'SAN MARTIN', 'SAN MARTIN', 'SAUCE'),
(1745, 21, 6, 20, 'SAN MARTIN', 'SAN MARTIN', 'SHAPAJA'),
(1746, 21, 6, 21, 'SAN MARTIN', 'SAN MARTIN', 'LA BANDA DE SHILCAYO'),
(1747, 21, 7, 1, 'SAN MARTIN', 'BELLAVISTA', 'BELLAVISTA'),
(1748, 21, 7, 2, 'SAN MARTIN', 'BELLAVISTA', 'SAN RAFAEL'),
(1749, 21, 7, 3, 'SAN MARTIN', 'BELLAVISTA', 'SAN PABLO'),
(1750, 21, 7, 4, 'SAN MARTIN', 'BELLAVISTA', 'ALTO BIAVO'),
(1751, 21, 7, 5, 'SAN MARTIN', 'BELLAVISTA', 'HUALLAGA'),
(1752, 21, 7, 6, 'SAN MARTIN', 'BELLAVISTA', 'BAJO BIAVO'),
(1753, 21, 8, 1, 'SAN MARTIN', 'TOCACHE', 'TOCACHE'),
(1754, 21, 8, 2, 'SAN MARTIN', 'TOCACHE', 'NUEVO PROGRESO'),
(1755, 21, 8, 3, 'SAN MARTIN', 'TOCACHE', 'POLVORA'),
(1756, 21, 8, 4, 'SAN MARTIN', 'TOCACHE', 'SHUNTE'),
(1757, 21, 8, 5, 'SAN MARTIN', 'TOCACHE', 'UCHIZA'),
(1758, 21, 9, 1, 'SAN MARTIN', 'PICOTA', 'PICOTA'),
(1759, 21, 9, 2, 'SAN MARTIN', 'PICOTA', 'BUENOS AIRES'),
(1760, 21, 9, 3, 'SAN MARTIN', 'PICOTA', 'CASPIZAPA'),
(1761, 21, 9, 4, 'SAN MARTIN', 'PICOTA', 'PILLUANA'),
(1762, 21, 9, 5, 'SAN MARTIN', 'PICOTA', 'PUCACACA'),
(1763, 21, 9, 6, 'SAN MARTIN', 'PICOTA', 'SAN CRISTOBAL'),
(1764, 21, 9, 7, 'SAN MARTIN', 'PICOTA', 'SAN HILARION'),
(1765, 21, 9, 8, 'SAN MARTIN', 'PICOTA', 'TINGO DE PONASA'),
(1766, 21, 9, 9, 'SAN MARTIN', 'PICOTA', 'TRES UNIDOS'),
(1767, 21, 9, 10, 'SAN MARTIN', 'PICOTA', 'SHAMBOYACU'),
(1768, 21, 10, 1, 'SAN MARTIN', 'EL DORADO', 'SAN JOSE DE SISA'),
(1769, 21, 10, 2, 'SAN MARTIN', 'EL DORADO', 'AGUA BLANCA'),
(1770, 21, 10, 3, 'SAN MARTIN', 'EL DORADO', 'SHATOJA'),
(1771, 21, 10, 4, 'SAN MARTIN', 'EL DORADO', 'SAN MARTIN'),
(1772, 21, 10, 5, 'SAN MARTIN', 'EL DORADO', 'SANTA ROSA'),
(1773, 22, 1, 1, 'TACNA', 'TACNA', 'TACNA'),
(1774, 22, 1, 2, 'TACNA', 'TACNA', 'CALANA'),
(1775, 22, 1, 4, 'TACNA', 'TACNA', 'INCLAN'),
(1776, 22, 1, 7, 'TACNA', 'TACNA', 'PACHIA'),
(1777, 22, 1, 8, 'TACNA', 'TACNA', 'PALCA'),
(1778, 22, 1, 9, 'TACNA', 'TACNA', 'POCOLLAY'),
(1779, 22, 1, 10, 'TACNA', 'TACNA', 'SAMA'),
(1780, 22, 1, 11, 'TACNA', 'TACNA', 'ALTO DE LA ALIANZA'),
(1781, 22, 1, 12, 'TACNA', 'TACNA', 'CIUDAD NUEVA'),
(1782, 22, 1, 13, 'TACNA', 'TACNA', 'CORONEL GREGORIO ALBARRACIN L.'),
(1783, 22, 2, 1, 'TACNA', 'TARATA', 'TARATA'),
(1784, 22, 2, 5, 'TACNA', 'TARATA', 'HEROES ALBARRACIN'),
(1785, 22, 2, 6, 'TACNA', 'TARATA', 'ESTIQUE'),
(1786, 22, 2, 7, 'TACNA', 'TARATA', 'ESTIQUE PAMPA'),
(1787, 22, 2, 10, 'TACNA', 'TARATA', 'SITAJARA'),
(1788, 22, 2, 11, 'TACNA', 'TARATA', 'SUSAPAYA'),
(1789, 22, 2, 12, 'TACNA', 'TARATA', 'TARUCACHI'),
(1790, 22, 2, 13, 'TACNA', 'TARATA', 'TICACO'),
(1791, 22, 3, 1, 'TACNA', 'JORGE BASADRE', 'LOCUMBA'),
(1792, 22, 3, 2, 'TACNA', 'JORGE BASADRE', 'ITE'),
(1793, 22, 3, 3, 'TACNA', 'JORGE BASADRE', 'ILABAYA'),
(1794, 22, 4, 1, 'TACNA', 'CANDARAVE', 'CANDARAVE'),
(1795, 22, 4, 2, 'TACNA', 'CANDARAVE', 'CAIRANI'),
(1796, 22, 4, 3, 'TACNA', 'CANDARAVE', 'CURIBAYA'),
(1797, 22, 4, 4, 'TACNA', 'CANDARAVE', 'HUANUARA'),
(1798, 22, 4, 5, 'TACNA', 'CANDARAVE', 'QUILAHUANI'),
(1799, 22, 4, 6, 'TACNA', 'CANDARAVE', 'CAMILACA'),
(1800, 23, 1, 1, 'TUMBES', 'TUMBES', 'TUMBES'),
(1801, 23, 1, 2, 'TUMBES', 'TUMBES', 'CORRALES'),
(1802, 23, 1, 3, 'TUMBES', 'TUMBES', 'LA CRUZ'),
(1803, 23, 1, 4, 'TUMBES', 'TUMBES', 'PAMPAS DE HOSPITAL'),
(1804, 23, 1, 5, 'TUMBES', 'TUMBES', 'SAN JACINTO'),
(1805, 23, 1, 6, 'TUMBES', 'TUMBES', 'SAN JUAN DE LA VIRGEN'),
(1806, 23, 2, 1, 'TUMBES', 'CONTRALMIRANTE VILLAR', 'ZORRITOS'),
(1807, 23, 2, 2, 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CASITAS'),
(1808, 23, 2, 3, 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CANOAS DE PUNTA SAL'),
(1809, 23, 3, 1, 'TUMBES', 'ZARUMILLA', 'ZARUMILLA'),
(1810, 23, 3, 2, 'TUMBES', 'ZARUMILLA', 'MATAPALO'),
(1811, 23, 3, 3, 'TUMBES', 'ZARUMILLA', 'PAPAYAL'),
(1812, 23, 3, 4, 'TUMBES', 'ZARUMILLA', 'AGUAS VERDES'),
(1813, 24, 1, 1, 'REGION CALLAO', 'CALLAO', 'CALLAO'),
(1814, 24, 1, 2, 'REGION CALLAO', 'CALLAO', 'BELLAVISTA'),
(1815, 24, 1, 3, 'REGION CALLAO', 'CALLAO', 'LA PUNTA'),
(1816, 24, 1, 4, 'REGION CALLAO', 'CALLAO', 'CARMEN DE LA LEGUA-REYNOSO'),
(1817, 24, 1, 5, 'REGION CALLAO', 'CALLAO', 'LA PERLA'),
(1818, 24, 1, 6, 'REGION CALLAO', 'CALLAO', 'VENTANILLA'),
(1819, 25, 1, 1, 'UCAYALI', 'CORONEL PORTILLO', 'CALLERIA'),
(1820, 25, 1, 2, 'UCAYALI', 'CORONEL PORTILLO', 'YARINACOCHA'),
(1821, 25, 1, 3, 'UCAYALI', 'CORONEL PORTILLO', 'MASISEA'),
(1822, 25, 1, 4, 'UCAYALI', 'CORONEL PORTILLO', 'CAMPOVERDE'),
(1823, 25, 1, 5, 'UCAYALI', 'CORONEL PORTILLO', 'IPARIA'),
(1824, 25, 1, 6, 'UCAYALI', 'CORONEL PORTILLO', 'NUEVA REQUENA'),
(1825, 25, 1, 7, 'UCAYALI', 'CORONEL PORTILLO', 'MANANTAY'),
(1826, 25, 2, 1, 'UCAYALI', 'PADRE ABAD', 'PADRE ABAD'),
(1827, 25, 2, 2, 'UCAYALI', 'PADRE ABAD', 'YRAZOLA'),
(1828, 25, 2, 3, 'UCAYALI', 'PADRE ABAD', 'CURIMANA'),
(1829, 25, 3, 1, 'UCAYALI', 'ATALAYA', 'RAIMONDI'),
(1830, 25, 3, 2, 'UCAYALI', 'ATALAYA', 'TAHUANIA'),
(1831, 25, 3, 3, 'UCAYALI', 'ATALAYA', 'YURUA'),
(1832, 25, 3, 4, 'UCAYALI', 'ATALAYA', 'SEPAHUA'),
(1833, 25, 4, 1, 'UCAYALI', 'PURUS', 'PURUS'),
(1834, 1, 2, 5, 'AMAZONAS', 'BAGUA', 'BAGUA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aclauditorias`
--
ALTER TABLE `aclauditorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aclauditorias_FKIndex1` (`aclusuarios_id`);

--
-- Indices de la tabla `aclcargos`
--
ALTER TABLE `aclcargos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aclcargos_aclempresas1_idx` (`aclempresas_id`);

--
-- Indices de la tabla `aclconfiguraciones`
--
ALTER TABLE `aclconfiguraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `acldatos`
--
ALTER TABLE `acldatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acldatos_filiaciones_idx` (`filiaciones_id`),
  ADD KEY `fk_acldatos_aclcargos1_idx` (`aclcargos_id`);

--
-- Indices de la tabla `aclempresas`
--
ALTER TABLE `aclempresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aclmenus`
--
ALTER TABLE `aclmenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aclmenus_FKIndex1` (`aclrecursos_id`);

--
-- Indices de la tabla `aclpermisos`
--
ALTER TABLE `aclpermisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aclpermisos_FKIndex1` (`aclrecursos_id`),
  ADD KEY `aclpermisos_FKIndex2` (`aclroles_id`);

--
-- Indices de la tabla `aclrecursos`
--
ALTER TABLE `aclrecursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aclroles`
--
ALTER TABLE `aclroles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aclubicaciones`
--
ALTER TABLE `aclubicaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aclusuarios`
--
ALTER TABLE `aclusuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aclusuarios_FKIndex1` (`aclroles_id`),
  ADD KEY `aclusuarios_FKIndex2` (`aclempresas_id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_enfermedades_filiaciones1_idx` (`filiaciones_id`),
  ADD KEY `fk_enfermedades_tipoenfermedad1_idx` (`tipoenfermedad_id`),
  ADD KEY `fk_enfermedades_patologicos1_idx` (`patologicos_id`),
  ADD KEY `fk_enfermedades_fisiologicos1_idx` (`fisiologicos_id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipos_aclcargos1_idx` (`aclcargos_id`),
  ADD KEY `fk_equipos_reporteoperatorio1_idx` (`reporteoperatorio_id`),
  ADD KEY `fk_equipos_acldatos1_idx` (`acldatos_id`);

--
-- Indices de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examenclinico`
--
ALTER TABLE `examenclinico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_examenclinico_enfermedades1_idx` (`enfermedades_id`),
  ADD KEY `fk_examenclinico_examenes1_idx` (`examenes_id`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_exmanes_tipoexamenes1_idx` (`tipoexamenes_id`),
  ADD KEY `fk_exmanes_medidas1_idx` (`medidas_id`);

--
-- Indices de la tabla `filiaciones`
--
ALTER TABLE `filiaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filiaciones_situacionservicios1_idx` (`situacionservicios_id`),
  ADD KEY `fk_filiaciones_estadocivil1_idx` (`estadocivil_id`),
  ADD KEY `fk_filiaciones_gradoinstruccion1_idx` (`gradoinstruccion_id`),
  ADD KEY `fk_filiaciones_sexos1_idx` (`sexos_id`);

--
-- Indices de la tabla `fisiologicos`
--
ALTER TABLE `fisiologicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gradoinstruccion`
--
ALTER TABLE `gradoinstruccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patologicos`
--
ALTER TABLE `patologicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporteoperatorio`
--
ALTER TABLE `reporteoperatorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reporteoperatorio_filiaciones1_idx` (`filiaciones_id`);

--
-- Indices de la tabla `situacionservicios`
--
ALTER TABLE `situacionservicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoenfermedad`
--
ALTER TABLE `tipoenfermedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoexamenes`
--
ALTER TABLE `tipoexamenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipoexamenes_tipoexamenes1_idx` (`tipoexamenes_id`);

--
-- Indices de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aclauditorias`
--
ALTER TABLE `aclauditorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aclcargos`
--
ALTER TABLE `aclcargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aclconfiguraciones`
--
ALTER TABLE `aclconfiguraciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `acldatos`
--
ALTER TABLE `acldatos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `aclempresas`
--
ALTER TABLE `aclempresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `aclmenus`
--
ALTER TABLE `aclmenus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;
--
-- AUTO_INCREMENT de la tabla `aclpermisos`
--
ALTER TABLE `aclpermisos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10578;
--
-- AUTO_INCREMENT de la tabla `aclrecursos`
--
ALTER TABLE `aclrecursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT de la tabla `aclroles`
--
ALTER TABLE `aclroles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `aclubicaciones`
--
ALTER TABLE `aclubicaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aclusuarios`
--
ALTER TABLE `aclusuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `examenclinico`
--
ALTER TABLE `examenclinico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `filiaciones`
--
ALTER TABLE `filiaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fisiologicos`
--
ALTER TABLE `fisiologicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `gradoinstruccion`
--
ALTER TABLE `gradoinstruccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `patologicos`
--
ALTER TABLE `patologicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `reporteoperatorio`
--
ALTER TABLE `reporteoperatorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `situacionservicios`
--
ALTER TABLE `situacionservicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipoenfermedad`
--
ALTER TABLE `tipoenfermedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipoexamenes`
--
ALTER TABLE `tipoexamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ubigeo`
--
ALTER TABLE `ubigeo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1835;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aclcargos`
--
ALTER TABLE `aclcargos`
  ADD CONSTRAINT `fk_aclcargos_aclempresas1` FOREIGN KEY (`aclempresas_id`) REFERENCES `aclempresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `acldatos`
--
ALTER TABLE `acldatos`
  ADD CONSTRAINT `fk_acldatos_aclcargos1` FOREIGN KEY (`aclcargos_id`) REFERENCES `aclcargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acldatos_filiaciones` FOREIGN KEY (`filiaciones_id`) REFERENCES `filiaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD CONSTRAINT `fk_enfermedades_filiaciones1` FOREIGN KEY (`filiaciones_id`) REFERENCES `filiaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enfermedades_fisiologicos1` FOREIGN KEY (`fisiologicos_id`) REFERENCES `fisiologicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enfermedades_patologicos1` FOREIGN KEY (`patologicos_id`) REFERENCES `patologicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enfermedades_tipoenfermedad1` FOREIGN KEY (`tipoenfermedad_id`) REFERENCES `tipoenfermedad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `fk_equipos_aclcargos1` FOREIGN KEY (`aclcargos_id`) REFERENCES `aclcargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipos_acldatos1` FOREIGN KEY (`acldatos_id`) REFERENCES `acldatos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipos_reporteoperatorio1` FOREIGN KEY (`reporteoperatorio_id`) REFERENCES `reporteoperatorio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `examenclinico`
--
ALTER TABLE `examenclinico`
  ADD CONSTRAINT `fk_examenclinico_enfermedades1` FOREIGN KEY (`enfermedades_id`) REFERENCES `enfermedades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_examenclinico_examenes1` FOREIGN KEY (`examenes_id`) REFERENCES `examenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD CONSTRAINT `fk_exmanes_medidas1` FOREIGN KEY (`medidas_id`) REFERENCES `medidas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_exmanes_tipoexamenes1` FOREIGN KEY (`tipoexamenes_id`) REFERENCES `tipoexamenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `filiaciones`
--
ALTER TABLE `filiaciones`
  ADD CONSTRAINT `fk_filiaciones_estadocivil1` FOREIGN KEY (`estadocivil_id`) REFERENCES `estadocivil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_filiaciones_gradoinstruccion1` FOREIGN KEY (`gradoinstruccion_id`) REFERENCES `gradoinstruccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_filiaciones_sexos1` FOREIGN KEY (`sexos_id`) REFERENCES `generos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_filiaciones_situacionservicios1` FOREIGN KEY (`situacionservicios_id`) REFERENCES `situacionservicios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporteoperatorio`
--
ALTER TABLE `reporteoperatorio`
  ADD CONSTRAINT `fk_reporteoperatorio_filiaciones1` FOREIGN KEY (`filiaciones_id`) REFERENCES `filiaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipoexamenes`
--
ALTER TABLE `tipoexamenes`
  ADD CONSTRAINT `fk_tipoexamenes_tipoexamenes1` FOREIGN KEY (`tipoexamenes_id`) REFERENCES `tipoexamenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
