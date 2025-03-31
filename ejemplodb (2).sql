-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2025 a las 00:57:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemplodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `coste` float NOT NULL DEFAULT 0,
  `precio` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `coste`, `precio`) VALUES
(1, 'Producto A', 5, 8000),
(2, 'Producto B', 2, 4000),
(3, 'Producto C', 40, 8000),
(4, 'Mouse inalámbrico', 2000, 12000),
(5, 'Teclado mecánico', 4500, 6000),
(6, 'Monitor 24\"', 8000, 5000),
(7, 'Impresora láser', 12000, 9000);

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `actualizarPrecioProductoS` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
    IF NEW.coste <> OLD.coste THEN
        SET NEW.precio = NEW.coste * 2;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aplicar_descuento` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
    IF NEW.precio <= 7000 THEN
        SET NEW.precio = NEW.precio * 0.95; -- Descuento del 10%
    ELSEIF NEW.precio <= 12000 THEN
        SET NEW.precio = NEW.precio * 0.90; -- Descuento del 15%
    ELSEIF NEW.precio <= 25000 THEN
        SET NEW.precio = NEW.precio * 0.85; -- Descuento del 15%
    END IF;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
