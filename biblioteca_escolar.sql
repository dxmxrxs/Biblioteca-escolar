-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2025 a las 23:46:19
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
-- Base de datos: `biblioteca_escolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos_ip`
--

CREATE TABLE `intentos_ip` (
  `id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `intentos` int(11) NOT NULL DEFAULT 0,
  `ultimo_intento` datetime NOT NULL,
  `bloqueado_hasta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `anio` year(4) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `cantidad_disponible` int(10) UNSIGNED NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `estado` enum('activo','anulado') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `anio`, `descripcion`, `imagen`, `cantidad_disponible`, `fecha_registro`, `estado`) VALUES
(1, 'HARRY POTTER Y LA PIEDRA FILOSOFAL', 'J.K. ROWLING', '1997', 'Harry descubre que es un mago el día que cumple once años y es invitado a estudiar en hogwarts, donde hace amigos y enfrenta al mago tenebroso que mató a sus padres.', 'libro_686caab951e9a8.74912599.jpg', 20, '2025-07-07 23:20:57', 'activo'),
(2, 'HARRY POTTER Y LA CÁMARA SECRETA', 'J.K. ROWLING', '1998', 'En su segundo año en hogwarts, harry investiga una serie de ataques misteriosos y descubre la existencia de una cámara secreta oculta en la escuela.', 'libro_686cab07bad6e0.71369847.jpg', 20, '2025-07-07 23:22:15', 'activo'),
(3, 'HARRY POTTER Y EL PRISIONERO DE AZKABÁN', 'J.K. ROWLING', '1999', 'Harry se entera de que sirius black, un prisionero fugitivo, aparentemente lo persigue, pero descubre secretos de su pasado y de sus padres.', 'libro_686cab59c2b442.41819855.jpg', 20, '2025-07-07 23:23:37', 'activo'),
(4, 'HARRY POTTER Y EL CÁLIZ DE FUEGO', 'J.K. ROWLING', '2000', 'Harry participa en el torneo de los tres magos, una competencia peligrosa entre escuelas, mientras lord voldemort planea su regreso al poder.', 'libro_686cab880c9950.72975600.jpg', 19, '2025-07-07 23:24:24', 'activo'),
(5, 'HARRY POTTER Y LA ORDEN DEL FÉNIX', 'J.K. ROWLING', '2003', 'Harry forma un grupo secreto de defensa contra las artes oscuras, mientras el ministerio de magia niega el regreso de voldemort y lo desacredita.', 'libro_686cabb42622f1.96353058.jpg', 20, '2025-07-07 23:25:08', 'activo'),
(6, 'HARRY POTTER Y EL MISTERIO DEL PRÍNCIPE', 'J.K. ROWLING', '2005', 'Harry descubre un antiguo libro de pociones que perteneció al \"príncipe mestizo\" y junto a dumbledore explora el pasado de voldemort para entender cómo vencerlo.', 'libro_686cabe8486202.15597332.jpg', 20, '2025-07-07 23:26:00', 'activo'),
(7, 'HARRY POTTER Y LAS RELIQUIAS DE LA MUERTE', 'J.K. ROWLING', '2007', 'Harry, ron y hermione abandonan hogwarts para destruir los horrocruxes de voldemort. la historia culmina en una épica batalla por el destino del mundo mágico.', 'libro_686cac1328fbd4.16810306.jpg', 20, '2025-07-07 23:26:43', 'activo'),
(8, 'INTRODUCCIÓN AJAX', 'HERBERT SCHILDT', '2014', '', 'libro_686caca388d7f4.93448574.jpg', 8, '2025-07-07 23:29:07', 'activo'),
(9, 'HTML5 Y CSS3', 'CHRISTOPHE AUBRY', '2014', '', 'libro_686cacee161416.72053264.jpg', 3, '2025-07-07 23:30:22', 'activo'),
(10, 'PHP 6 Y MySQL', 'SUEHRING,CONVERSE Y OTROS', '2009', '', 'libro_686cad44b09a62.81048818.jpg', 12, '2025-07-07 23:31:48', 'activo'),
(11, 'JQUERY', 'CHRISTOPHE AUBRY Y LUC VAN LANCKER', '2014', '', 'libro_686cad8ba22d10.77369186.jpg', 16, '2025-07-07 23:32:59', 'activo'),
(12, 'ASP.NET', 'SANTIAGO AGUIRRE', '2024', '', 'libro_686cade7796009.17326837.jpg', 2, '2025-07-07 23:34:31', 'activo'),
(13, 'INTRODUCCIÓN AJAX', 'JAVIER EGUILUZ PÉREZ', '2008', '', 'libro_686cae22b27d21.61761295.jpg', 18, '2025-07-07 23:35:30', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL DEFAULT curdate(),
  `fecha_devolucion` date NOT NULL,
  `fecha_devolucion_real` date DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `estado` enum('activo','devuelto','anulado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_usuario` enum('estudiante','profesor','administrador') NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `tipo_usuario`, `creado_en`, `estado`, `ultimo_acceso`) VALUES
(1, 'ADMINSTRADOR', 'sauceslmabel@gmail.com', '$2y$10$.a52M14V/qGoUWuYov30XeroW04138b4UhdjKathg0o7oDvmzoaOS', 'administrador', '2025-07-16 18:24:33', 'activo', '2025-07-16 12:29:51'),
(8, 'Damaris Mabel Garcia Saucedo', 'saucedodamaris804@gmail.com', '$2y$10$o7ZuVq0QHQ1YNIVWzqSLAerUIODOGjwWkBfDS3GUuhWZ2VFfhF/ZO', 'estudiante', '2025-07-16 18:44:11', 'activo', '2025-07-16 13:25:54'),
(19, 'Zoe Trinidad Bojorquez Angulo', 'carnicerialablanca31@gmail.com', '$2y$10$OULxE9UFDMCVH1jwou89MOuAtMpwtAgclZoZeSi8y9fxgFTiD3C/a', 'estudiante', '2025-07-16 21:08:54', 'activo', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `intentos_ip`
--
ALTER TABLE `intentos_ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `intentos_ip`
--
ALTER TABLE `intentos_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_prestamos_libro` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prestamos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
