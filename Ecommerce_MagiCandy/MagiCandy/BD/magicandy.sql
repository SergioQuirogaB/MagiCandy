-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3310
-- Tiempo de generación: 11-09-2023 a las 03:18:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `magicandy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `pkid_actividad` int(11) NOT NULL,
  `titulo_actividad` varchar(30) NOT NULL,
  `descripcion_actividad` text NOT NULL,
  `tipo_actividad` varchar(15) NOT NULL,
  `fecha_inicio_actividad` date NOT NULL,
  `fecha_fin_actividad` date DEFAULT NULL,
  `estadoActividad_pkid_estado_actividad` int(11) NOT NULL,
  `responsableActividad_pkid_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`pkid_actividad`, `titulo_actividad`, `descripcion_actividad`, `tipo_actividad`, `fecha_inicio_actividad`, `fecha_fin_actividad`, `estadoActividad_pkid_estado_actividad`, `responsableActividad_pkid_responsable`) VALUES
(1, 'Producir gomas', 'en proceso', 'produccion', '2023-09-12', '2023-09-03', 1, 1051064634);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoactividad`
--

CREATE TABLE `estadoactividad` (
  `pkid_estado_actividad` int(11) NOT NULL,
  `nombre_estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estadoactividad`
--

INSERT INTO `estadoactividad` (`pkid_estado_actividad`, `nombre_estado`) VALUES
(1, 'Creado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadonovedad`
--

CREATE TABLE `estadonovedad` (
  `pkid_estado_novedad` int(11) NOT NULL,
  `nombre_estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `pkid_estado_pedido` int(11) NOT NULL,
  `nombre_estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoproduccion`
--

CREATE TABLE `estadoproduccion` (
  `pkid_estado_produccion` int(11) NOT NULL,
  `nombre_estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `estadoproduccion`
--

INSERT INTO `estadoproduccion` (`pkid_estado_produccion`, `nombre_estado`) VALUES
(1, 'Ejecutando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `pkid_ingredientes` int(11) NOT NULL,
  `cantidad_apartada` int(11) NOT NULL,
  `unidad` varchar(15) NOT NULL,
  `produccion_pkid_produccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `pkid_insumo` int(11) NOT NULL,
  `nombre_insumo` varchar(30) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `cantidad_insumo` int(11) NOT NULL,
  `unidad` varchar(15) NOT NULL,
  `inventario_pkid_inventario` int(11) NOT NULL,
  `ingredientes_pkid_ingredientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `pkid_inventario` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `cantidad_entrada` int(11) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `cantidad_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `pkid_novedad` int(11) NOT NULL,
  `asunto` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `comentario` text NOT NULL,
  `produccion_pkid_produccion` int(11) NOT NULL,
  `estadoNovedad_pkid_estado_novedad` int(11) NOT NULL,
  `remitente_pkid_remitente` int(11) NOT NULL,
  `remitido_pkid_remitido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `pkid_solicitud` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `valor_pedido` int(11) NOT NULL,
  `cantidad_pedido` int(11) NOT NULL,
  `detalle_pedido` text NOT NULL,
  `usuario_pk_identificacion` int(11) NOT NULL,
  `estadoPedido_pkid_estado_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `pkid_produccion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `producto_producir` varchar(30) NOT NULL,
  `cantidad_producir` int(11) NOT NULL,
  `lote` varchar(8) NOT NULL,
  `calidad_producto` varchar(15) NOT NULL,
  `observaciones` text NOT NULL,
  `estadoProduccion_pkid_estado_produccion` int(11) NOT NULL,
  `actividad_pkid_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`pkid_produccion`, `fecha_inicio`, `fecha_fin`, `producto_producir`, `cantidad_producir`, `lote`, `calidad_producto`, `observaciones`, `estadoProduccion_pkid_estado_produccion`, `actividad_pkid_actividad`) VALUES
(20, '2023-08-28', '2023-09-17', 'Refrescos', 12, '45', 'Muy buena', 'Solo de fresa', 1, 1),
(23, '2023-09-03', '2023-08-27', 'Gomas', 850, '6', 'Muy buena', 'Solo de Mora', 1, 1),
(24, '2023-09-03', '2023-09-05', 'Gomas', 10, '7', 'Muy buena', 'Hacer sandia y melocoton', 1, 1),
(25, '2023-08-29', '2023-09-03', 'Gomas', 22, '8', 'Muy buena', 'Solo de uva', 1, 1),
(26, '2023-09-04', '2023-09-24', 'Gomas', 68, '45', 'Muy buena', 'En formas de carros y motos', 1, 1),
(27, '2023-08-28', '2023-09-03', 'Refrescos', 90, '1', 'Media', 'Solo de Mora', 1, 1),
(28, '2023-09-05', '2023-09-17', 'Gelatina', 100, '200', 'Muy buena', 'Solo de sabor chicle', 1, 1),
(29, '2023-09-05', '2023-09-11', 'Refrecos', 67, '99', 'Muy buena', 'Solo de piña y limón', 1, 1),
(30, '2023-09-03', '2023-09-11', 'Gomas', 55, '2', 'Muy buena', 'Solo haz de sabor maracuyá ', 1, 1),
(31, '2023-09-12', '2023-09-12', 'Gomas', 32, '45', 'Muy buena', 'solo de sabor naranja', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `pkid_producto` int(11) NOT NULL,
  `nombre_producto` varchar(30) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `imagen_producto` blob DEFAULT NULL,
  `pedido_pkid_solicitud` int(11) NOT NULL,
  `inventario_pkid_inventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitente`
--

CREATE TABLE `remitente` (
  `pkid_remitente` int(11) NOT NULL,
  `nombre_remitente` varchar(30) NOT NULL,
  `apellido_remitente` varchar(30) NOT NULL,
  `rol_remitente` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitido`
--

CREATE TABLE `remitido` (
  `pkid_remitido` int(11) NOT NULL,
  `nombre_remitido` varchar(30) NOT NULL,
  `apellido_remitido` varchar(30) NOT NULL,
  `rol_remitido` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsableactividad`
--

CREATE TABLE `responsableactividad` (
  `pkid_responsable` int(11) NOT NULL,
  `nombre_responsable` varchar(30) NOT NULL,
  `apellido_responsable` varchar(30) NOT NULL,
  `rol_responsable` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `responsableactividad`
--

INSERT INTO `responsableactividad` (`pkid_responsable`, `nombre_responsable`, `apellido_responsable`, `rol_responsable`) VALUES
(1051064634, 'sergio', 'quiroga', 'quimico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `pkid_rol` int(11) NOT NULL,
  `nombre_rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`pkid_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Empacador'),
(3, 'Quimico'),
(4, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_inventario`
--

CREATE TABLE `salida_inventario` (
  `pkid_salida` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `descripcion_salida` text NOT NULL,
  `cantidad_salida` int(11) NOT NULL,
  `inventario_pkid_inventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `pk_identificacion` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varchar(40) NOT NULL,
  `rol_pkid_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`pk_identificacion`, `nombre`, `apellidos`, `direccion`, `telefono`, `email`, `contraseña`, `rol_pkid_rol`) VALUES
(33366779, 'Lina', 'Baez', 'Calle 102 # 75', '3124197656', 'linamaria@gmail.com', 'Homero123.', 4),
(1051064634, 'Sergio', 'Quiroga', 'Calle 81', '3133813154', 'sergioquirogab@gmail.com', 'Murcielago123.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `pkid_venta` int(11) NOT NULL,
  `comprobante` blob NOT NULL,
  `valor_venta` int(11) NOT NULL,
  `cantidad_entregada` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `hora_venta` time NOT NULL,
  `detalle_venta` text NOT NULL,
  `pedido_pkid_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`pkid_actividad`),
  ADD KEY `fk_actividad_estadoActividad1` (`estadoActividad_pkid_estado_actividad`),
  ADD KEY `fk_actividad_responsableActividad1` (`responsableActividad_pkid_responsable`);

--
-- Indices de la tabla `estadoactividad`
--
ALTER TABLE `estadoactividad`
  ADD PRIMARY KEY (`pkid_estado_actividad`);

--
-- Indices de la tabla `estadonovedad`
--
ALTER TABLE `estadonovedad`
  ADD PRIMARY KEY (`pkid_estado_novedad`);

--
-- Indices de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  ADD PRIMARY KEY (`pkid_estado_pedido`);

--
-- Indices de la tabla `estadoproduccion`
--
ALTER TABLE `estadoproduccion`
  ADD PRIMARY KEY (`pkid_estado_produccion`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`pkid_ingredientes`),
  ADD KEY `fk_ingredientes_produccion1` (`produccion_pkid_produccion`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`pkid_insumo`),
  ADD KEY `fk_insumo_inventario1` (`inventario_pkid_inventario`),
  ADD KEY `fk_insumo_ingredientes1` (`ingredientes_pkid_ingredientes`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`pkid_inventario`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`pkid_novedad`),
  ADD KEY `fk_novedad_produccion1` (`produccion_pkid_produccion`),
  ADD KEY `fk_novedad_estadoNovedad1` (`estadoNovedad_pkid_estado_novedad`),
  ADD KEY `fk_novedad_remitente1` (`remitente_pkid_remitente`),
  ADD KEY `fk_novedad_remitido1` (`remitido_pkid_remitido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`pkid_solicitud`),
  ADD KEY `fk_pedido_usuario1` (`usuario_pk_identificacion`),
  ADD KEY `fk_pedido_estadoPedido1` (`estadoPedido_pkid_estado_pedido`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`pkid_produccion`),
  ADD KEY `fk_produccion_estadoProduccion1` (`estadoProduccion_pkid_estado_produccion`),
  ADD KEY `fk_produccion_actividad1` (`actividad_pkid_actividad`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`pkid_producto`),
  ADD KEY `fk_producto_pedido1` (`pedido_pkid_solicitud`),
  ADD KEY `fk_producto_inventario1` (`inventario_pkid_inventario`);

--
-- Indices de la tabla `remitente`
--
ALTER TABLE `remitente`
  ADD PRIMARY KEY (`pkid_remitente`);

--
-- Indices de la tabla `remitido`
--
ALTER TABLE `remitido`
  ADD PRIMARY KEY (`pkid_remitido`);

--
-- Indices de la tabla `responsableactividad`
--
ALTER TABLE `responsableactividad`
  ADD PRIMARY KEY (`pkid_responsable`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`pkid_rol`);

--
-- Indices de la tabla `salida_inventario`
--
ALTER TABLE `salida_inventario`
  ADD PRIMARY KEY (`pkid_salida`),
  ADD KEY `fk_salida_inventario_inventario1` (`inventario_pkid_inventario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`pk_identificacion`),
  ADD KEY `fk_usuario_rol` (`rol_pkid_rol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`pkid_venta`),
  ADD KEY `fk_venta_pedido1` (`pedido_pkid_solicitud`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `pkid_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_actividad_estadoActividad1` FOREIGN KEY (`estadoActividad_pkid_estado_actividad`) REFERENCES `estadoactividad` (`pkid_estado_actividad`),
  ADD CONSTRAINT `fk_actividad_responsableActividad1` FOREIGN KEY (`responsableActividad_pkid_responsable`) REFERENCES `responsableactividad` (`pkid_responsable`);

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD CONSTRAINT `fk_ingredientes_produccion1` FOREIGN KEY (`produccion_pkid_produccion`) REFERENCES `produccion` (`pkid_produccion`);

--
-- Filtros para la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD CONSTRAINT `fk_insumo_ingredientes1` FOREIGN KEY (`ingredientes_pkid_ingredientes`) REFERENCES `ingredientes` (`pkid_ingredientes`),
  ADD CONSTRAINT `fk_insumo_inventario1` FOREIGN KEY (`inventario_pkid_inventario`) REFERENCES `inventario` (`pkid_inventario`);

--
-- Filtros para la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD CONSTRAINT `fk_novedad_estadoNovedad1` FOREIGN KEY (`estadoNovedad_pkid_estado_novedad`) REFERENCES `estadonovedad` (`pkid_estado_novedad`),
  ADD CONSTRAINT `fk_novedad_produccion1` FOREIGN KEY (`produccion_pkid_produccion`) REFERENCES `produccion` (`pkid_produccion`),
  ADD CONSTRAINT `fk_novedad_remitente1` FOREIGN KEY (`remitente_pkid_remitente`) REFERENCES `remitente` (`pkid_remitente`),
  ADD CONSTRAINT `fk_novedad_remitido1` FOREIGN KEY (`remitido_pkid_remitido`) REFERENCES `remitido` (`pkid_remitido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_estadoPedido1` FOREIGN KEY (`estadoPedido_pkid_estado_pedido`) REFERENCES `estadopedido` (`pkid_estado_pedido`),
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_pk_identificacion`) REFERENCES `usuario` (`pk_identificacion`);

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `fk_produccion_actividad1` FOREIGN KEY (`actividad_pkid_actividad`) REFERENCES `actividad` (`pkid_actividad`),
  ADD CONSTRAINT `fk_produccion_estadoProduccion1` FOREIGN KEY (`estadoProduccion_pkid_estado_produccion`) REFERENCES `estadoproduccion` (`pkid_estado_produccion`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_inventario1` FOREIGN KEY (`inventario_pkid_inventario`) REFERENCES `inventario` (`pkid_inventario`),
  ADD CONSTRAINT `fk_producto_pedido1` FOREIGN KEY (`pedido_pkid_solicitud`) REFERENCES `pedido` (`pkid_solicitud`);

--
-- Filtros para la tabla `salida_inventario`
--
ALTER TABLE `salida_inventario`
  ADD CONSTRAINT `fk_salida_inventario_inventario1` FOREIGN KEY (`inventario_pkid_inventario`) REFERENCES `inventario` (`pkid_inventario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_pkid_rol`) REFERENCES `rol` (`pkid_rol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_pedido1` FOREIGN KEY (`pedido_pkid_solicitud`) REFERENCES `pedido` (`pkid_solicitud`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
