-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-10-2023 a las 16:27:39
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id17892702_purina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `producto_comprado` varchar(30) NOT NULL,
  `cantidad_comprada` int(11) NOT NULL,
  `ganancia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `producto_comprado`, `cantidad_comprada`, `ganancia`) VALUES
(1, 'Juan Perez', 'Alimento para cerdo', 2, 1000),
(2, 'Kevin Izquierdo', 'Veneno', 2, 200),
(3, 'Carlos Castillo', 'Alimento para pollos', 5, 75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(30) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion`, `precio_unitario`, `stock`, `categoria`) VALUES
(1, 'Alimento para cerdo', 'Alimento para cerdo', 500, 120, 'Alimentos'),
(2, 'Alimento para pollos - ponedor', 'Alimento para pollos - ponedora', 15, 12, 'Alimentos'),
(3, 'Alimento para vaca', 'Alimento para vaca', 600, 15, 'Alimentos'),
(4, 'Alimento para pavos', 'Alimento para pavos', 350, 10, 'Alimentos'),
(5, 'Alimento para perro', 'Alimento para perro', 25, 222, 'Alimentos'),
(6, 'Alimento para gato', 'Alimento para gato', 20, 7, 'Alimentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `Nombre_empresa` varchar(50) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `cantidad_adquirida` int(11) NOT NULL,
  `producto_suministrado` varchar(50) NOT NULL,
  `precio_unitario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `Nombre_empresa`, `telefono`, `direccion`, `correo`, `cantidad_adquirida`, `producto_suministrado`, `precio_unitario`) VALUES
(1, 'Campi', 9988446824, 'AV. LOPEZ PORTILLO ENTRE AV NICHUPTE Y EL PEDREGAL', 'campi@contacto.com', 10, 'Bulto de limento para cerdo', 400),
(2, 'Campi', 9988446824, 'AV. LOPEZ PORTILLO ENTRE AV NICHUPTE Y EL PEDREGAL', 'campi@contacto.com', 20, 'Bulto de limento para pollo', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `producto_vendido` varchar(30) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha_venta`, `producto_vendido`, `cantidad`, `precio_unitario`) VALUES
(2, '2023-09-11', 'Alimento para cerdo', 200, 500),
(3, '2023-09-14', 'Alimento para pollo', 60, 15),
(4, '2023-09-20', 'Croquetas Pedigree', 10, 35),
(5, '2023-09-24', 'Alimento para vaca', 5, 600);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
