-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2024 a las 20:00:21
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
-- Base de datos: `sistema_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `EXISTENCIA` int(11) DEFAULT NULL,
  `NOMBREPRODUCTO` varchar(255) DEFAULT NULL,
  `PRECIOCOMPRA` int(11) DEFAULT NULL,
  `PRECIOVENTA` int(11) DEFAULT NULL,
  `UTILIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `EXISTENCIA`, `NOMBREPRODUCTO`, `PRECIOCOMPRA`, `PRECIOVENTA`, `UTILIDAD`) VALUES
(1, 12, 'Palomitas', 1000, 1600, 600),
(2, 24, 'rizadas', 1300, 2000, 700),
(3, 12, 'Maduritos', 600, 1000, 400),
(4, 10, 'Tosti limon', 800, 1200, 400),
(5, 12, 'Tozinetas', 1200, 2000, 800),
(6, 7, 'Golpe con todo', 1800, 2500, 700),
(51, 30, 'Pastelitos', 300, 500, 200),
(52, 12, 'Galleta Oreo', 800, 1500, 700),
(53, 24, 'Pin Pop', 250, 700, 450),
(54, 30, 'Gusanitos', 50, 100, 50),
(55, 30, 'Panelitas', 50, 100, 50),
(56, 10, 'Vasito Arequipe', 300, 600, 300),
(57, 20, 'Chocolatina Jet', 600, 1000, 400),
(58, 24, 'Trident', 150, 300, 150),
(59, 24, 'Galleta Muu', 300, 600, 300),
(202, 15, 'Rosquita', 800, 1200, 400);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
