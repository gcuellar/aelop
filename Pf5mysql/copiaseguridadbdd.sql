-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2019 a las 23:37:49
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `musica`
--
CREATE DATABASE IF NOT EXISTS `musica` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `musica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `nombre`) VALUES
(1, 'La Unión'),
(2, 'Gary Moore'),
(3, 'Alejandro Sanz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion`
--

CREATE TABLE `cancion` (
  `id_cancion` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_disco` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `letra` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cancion`
--

INSERT INTO `cancion` (`id_cancion`, `nombre`, `id_disco`, `numero`, `letra`) VALUES
(1, 'Tentación', 1, 1, NULL),
(2, 'Fueron los celos', 1, 2, NULL),
(3, 'Ella es un volcán', 1, 3, NULL),
(4, 'Si tú quisieras', 1, 4, NULL),
(5, 'Dámelo ya', 1, 5, NULL),
(6, 'Llámame', 1, 6, NULL),
(7, 'Revolución', 1, 7, NULL),
(8, 'Más dura será la caída', 1, 8, NULL),
(9, 'Nana', 1, 9, NULL),
(10, 'Santa María', 1, 10, NULL),
(11, 'Berlín', 1, 11, NULL),
(12, 'Moving on', 2, 1, NULL),
(13, 'Oh pretty woman', 2, 2, NULL),
(14, 'Walking by myself', 2, 3, 'You know I love you.\r\nYou know it\'s true.\r\nGive you all my love, babe.\r\nWhat more can I do?\r\nWalking by myself,\r\nI hope you\'ll understand.\r\nI just want to be your lovin\' man.\r\nI love ya, yes I love you\r\nwith my heart and soul.\r\nI wouldn\'t mistreat you\r\nfor my weight in gold.\r\nYou know I love you.\r\nYou know it\'s true.\r\nGive you all my love, babe.\r\nWhat more can I do?\r\nWalking by myself,\r\nI hope you\'ll understand.\r\nI just want to be your lovin\' man.\r\nHere we go!\r\nKeep on walkin\'!\r\nYou know I love you.\r\nYou know it\'s true.\r\nI give you all my, babe.\r\nWhat more can I do?\r\nI\'m walking by myself,\r\nI hope you\'ll understand.\r\nI just want to be your lovin\' man.\r\nI said I\'m walking by myself,\r\nI hope you\'ll understand.\r\nI just want to be your lovin\',\r\nI just want to be your lovin\',\r\nI just want to be your lovin\' man.\r\nThat\'s right.'),
(15, 'Still got the blues', 2, 4, NULL),
(16, 'Texas strut', 2, 5, NULL),
(17, 'Too tired', 2, 6, NULL),
(18, 'King of the blues', 2, 7, NULL),
(19, 'As the years go passing by', 2, 8, NULL),
(20, 'Midnight blues', 2, 9, NULL),
(21, 'That kind of woman', 2, 10, NULL),
(22, 'All your love', 2, 11, NULL),
(23, 'Stop messin’ around', 2, 12, NULL),
(25, 'Cold Day in Hell', 3, 1, NULL),
(26, 'Don\'t You Lie to Me (I Get Evil)', 3, 2, NULL),
(27, 'Story of the Blues', 3, 3, NULL),
(28, 'Since I Met You Baby', 3, 4, NULL),
(29, 'Separate Ways', 3, 5, NULL),
(30, 'Only Fool in Town', 3, 6, NULL),
(31, 'Key to Love', 3, 7, NULL),
(32, 'Jumpin\' at Shadows', 3, 8, NULL),
(33, 'The Blues Is Alright', 3, 9, NULL),
(34, 'The Hurt Inside', 3, 10, NULL),
(35, 'Nothing\'s the Same', 3, 11, NULL),
(36, 'Los chulos son pa\' cuidarlos', 4, 1, NULL),
(37, 'Tomasa', 4, 2, NULL),
(38, 'El apartamento', 4, 3, NULL),
(39, 'Se busca un lío', 4, 4, NULL),
(40, 'Doña Marina', 4, 5, NULL),
(41, 'Tom Sawyer', 4, 6, NULL),
(42, 'Señor papá', 4, 7, NULL),
(43, 'Cuando navegamos', 4, 8, NULL),
(44, 'Micaela', 4, 9, NULL),
(45, 'Ajaulilí', 4, 10, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboracion`
--

CREATE TABLE `colaboracion` (
  `id_colaboracion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_disco` int(11) NOT NULL,
  `id_cancion` int(11) DEFAULT NULL,
  `rol` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `colaboracion`
--

INSERT INTO `colaboracion` (`id_colaboracion`, `id_persona`, `id_disco`, `id_cancion`, `rol`) VALUES
(1, 3, 1, 9, 'Arreglos'),
(2, 3, 1, 2, 'Arreglos'),
(3, 3, 1, 4, 'Arreglos'),
(4, 3, 1, 11, 'Arreglos'),
(5, 21, 1, 2, 'Compuestas, arregladas y preproducidas'),
(6, 21, 1, 4, 'Compuestas, arregladas y preproducidas'),
(7, 21, 1, 11, 'Compuestas, arregladas y preproducidas'),
(8, 22, 1, 2, 'Compuestas, arregladas y preproducidas'),
(9, 22, 1, 4, 'Compuestas, arregladas y preproducidas'),
(10, 22, 1, 11, 'Compuestas, arregladas y preproducidas'),
(11, 23, 1, 2, 'Compuestas, arregladas y preproducidas'),
(12, 23, 1, 4, 'Compuestas, arregladas y preproducidas'),
(13, 23, 1, 11, 'Compuestas, arregladas y preproducidas'),
(14, 3, 1, NULL, 'Piano y teclados'),
(15, 4, 1, NULL, 'Arreglos de cuerda'),
(16, 5, 1, NULL, 'Instrumentos'),
(17, 6, 1, NULL, 'Violín'),
(18, 7, 1, NULL, 'Violín'),
(19, 8, 1, NULL, 'Viola'),
(20, 9, 1, NULL, 'Violonchelo'),
(21, 10, 1, NULL, 'Viento-metal'),
(22, 11, 1, NULL, 'Trompeta'),
(23, 12, 1, NULL, 'Trombón'),
(24, 13, 1, NULL, 'Saxo tenor'),
(25, 14, 1, NULL, 'Coros'),
(26, 15, 1, NULL, 'Coros'),
(27, 16, 1, NULL, 'Batería'),
(28, 17, 1, NULL, 'Ingeniero sonido y mezclas'),
(29, 18, 1, NULL, 'Ingeniero sonido'),
(30, 19, 1, NULL, 'Asistente ingeniero'),
(31, 20, 2, NULL, 'Engineered and mixed'),
(32, 24, 2, NULL, 'Assistance'),
(33, 25, 2, NULL, 'Assistance'),
(34, 26, 2, NULL, 'Assistance'),
(35, 27, 2, NULL, 'Assistance'),
(36, 28, 2, NULL, 'Assistance'),
(37, 29, 2, NULL, 'Assistance'),
(38, 77, 2, NULL, 'Strings conducted'),
(39, 30, 2, NULL, 'All horns arranged'),
(40, 77, 2, NULL, 'All horns arranged'),
(41, 30, 2, 15, 'String arranged'),
(42, 77, 2, 15, 'String arranged'),
(43, 30, 2, 20, 'String arranged'),
(44, 77, 2, 20, 'String arranged'),
(45, 30, 2, 12, 'Written'),
(46, 31, 2, 13, 'Written'),
(47, 32, 2, 14, 'Written'),
(48, 30, 2, 15, 'Written'),
(49, 30, 2, 16, 'Written'),
(50, 33, 2, 17, 'Written'),
(51, 34, 2, 17, 'Written'),
(52, 35, 2, 17, 'Written'),
(53, 30, 2, 18, 'Written'),
(54, 36, 2, 19, 'Written'),
(55, 30, 2, 20, 'Written'),
(56, 37, 2, 21, 'Written'),
(57, 38, 2, 22, 'Written'),
(58, 39, 2, 23, 'Written'),
(60, 30, 2, 12, 'Guitar/Vocals'),
(61, 40, 2, 12, 'Piano'),
(62, 41, 2, 12, 'Bass'),
(63, 42, 2, 12, 'Drums'),
(64, 30, 2, 13, 'Guitar/Vocals'),
(65, 77, 2, 13, 'Guitar'),
(66, 77, 2, 13, 'Hammond Organ'),
(67, 41, 2, 13, 'Bass'),
(68, 42, 2, 13, 'Drums'),
(69, 43, 2, 13, 'Trumpet'),
(70, 44, 2, 13, 'Alto/Tenor Saxes'),
(71, 45, 2, 13, 'Tenor Sax'),
(72, 46, 2, 13, 'Baritone Sax'),
(73, 30, 2, 14, 'Guitar/Vocals'),
(74, 40, 2, 14, 'Piano'),
(75, 41, 2, 14, 'Bass'),
(76, 42, 2, 14, 'Drums'),
(77, 44, 2, 14, 'Harmonica'),
(78, 30, 2, 15, 'Guitar/Vocals'),
(79, 77, 2, 15, 'Keyboards'),
(80, 47, 2, 15, 'Piano'),
(81, 41, 2, 15, 'Bass'),
(82, 42, 2, 15, 'Drums'),
(83, 48, 2, 15, 'String section led'),
(84, 30, 2, 16, 'Guitar/Vocals'),
(85, 77, 2, 16, 'Keyboards'),
(86, 49, 2, 16, 'Bass'),
(87, 50, 2, 16, 'Drums'),
(88, 30, 2, 17, 'Guitar/Vocals'),
(89, 51, 2, 17, 'Guitar'),
(90, 77, 2, 17, 'Piano'),
(91, 41, 2, 17, 'Bass'),
(92, 42, 2, 17, 'Drums'),
(93, 52, 2, 17, 'Trumpet'),
(94, 44, 2, 17, 'Alto Sax'),
(95, 53, 2, 17, 'Tenor Sax'),
(96, 46, 2, 17, 'Baritone Sax'),
(97, 30, 2, 18, 'Guitar/Vocals'),
(98, 77, 2, 18, 'Hammond Organ'),
(99, 41, 2, 18, 'Bass'),
(100, 50, 2, 18, 'Drums'),
(101, 43, 2, 18, 'Trumpet'),
(102, 44, 2, 18, 'Alto/Tenor Saxes'),
(103, 45, 2, 18, 'Tenor Sax'),
(104, 46, 2, 18, 'Baritone Sax'),
(105, 30, 2, 19, 'Guitar/Vocals'),
(106, 77, 2, 19, 'Hammond Organ'),
(107, 47, 2, 19, 'Piano'),
(108, 49, 2, 19, 'Bass'),
(109, 50, 2, 19, 'Drums'),
(110, 44, 2, 19, 'Alto Sax'),
(111, 46, 2, 19, 'Baritone Sax'),
(112, 30, 2, 20, 'Guitar/Vocals'),
(113, 40, 2, 20, 'Electric Piano'),
(114, 41, 2, 20, 'Bass'),
(115, 42, 2, 20, 'Drums'),
(116, 48, 2, 20, 'String section led'),
(117, 30, 2, 21, 'Guitar/Vocals'),
(118, 37, 2, 21, 'Slide and Rhythm Guitar/Backing Vocals'),
(119, 47, 2, 21, 'Piano'),
(120, 49, 2, 21, 'Bass'),
(121, 42, 2, 21, 'Drums'),
(122, 54, 2, 21, 'Trumpet'),
(123, 44, 2, 21, 'Alto Sax'),
(124, 45, 2, 21, 'Tenor Sax'),
(125, 46, 2, 21, 'Baritone Sax'),
(126, 30, 2, 22, 'Guitar/Vocals'),
(127, 40, 2, 22, 'Hammond Organ'),
(128, 41, 2, 22, 'Bass'),
(129, 42, 2, 22, 'Drums'),
(130, 30, 2, 23, 'Guitar/Vocals'),
(131, 40, 2, 23, 'Piano'),
(132, 41, 2, 23, 'Bass'),
(133, 42, 2, 23, 'Drums'),
(134, 44, 2, 23, 'Saxes'),
(138, 20, 3, NULL, 'Engineered'),
(139, 56, 3, NULL, 'Engineered'),
(140, 29, 3, NULL, 'Engineered'),
(141, 57, 3, NULL, 'Assisted'),
(142, 24, 3, NULL, 'Assisted'),
(143, 58, 3, NULL, 'Assisted'),
(144, 59, 3, NULL, 'Assisted'),
(145, 60, 3, NULL, 'Assisted'),
(146, 61, 3, NULL, 'Assisted'),
(147, 62, 3, NULL, 'Assisted'),
(148, 30, 3, NULL, 'Brass & string arrangements'),
(149, 63, 3, NULL, 'Brass & string arrangements'),
(150, 48, 3, NULL, 'String section led'),
(151, 63, 3, NULL, 'Keyboards'),
(152, 69, 3, NULL, 'Bass'),
(153, 49, 3, NULL, 'Bass'),
(154, 70, 3, NULL, 'Bass'),
(155, 42, 3, NULL, 'Drums'),
(156, 71, 3, NULL, 'Drums'),
(157, 54, 3, NULL, 'Horns'),
(158, 44, 3, NULL, 'Horns'),
(159, 45, 3, NULL, 'Horns'),
(160, 46, 3, NULL, 'Horns'),
(161, 72, 3, NULL, 'The Memphis Horns'),
(162, 73, 3, NULL, 'The Memphis Horns'),
(163, 74, 3, NULL, 'Backing vocals'),
(164, 75, 3, NULL, 'Backing vocals'),
(165, 76, 3, NULL, 'Oboe'),
(166, 20, 3, 25, 'Mixed'),
(167, 20, 3, 26, 'Mixed'),
(168, 55, 3, 27, 'Mixed'),
(169, 20, 3, 28, 'Mixed'),
(170, 20, 3, 29, 'Mixed'),
(171, 20, 3, 30, 'Mixed'),
(172, 20, 3, 31, 'Mixed'),
(173, 20, 3, 32, 'Mixed'),
(174, 20, 3, 33, 'Mixed'),
(175, 20, 3, 34, 'Mixed'),
(176, 20, 3, 35, 'Mixed'),
(177, 30, 3, 25, 'Written'),
(178, 65, 3, 26, 'Written'),
(179, 30, 3, 27, 'Written'),
(180, 30, 3, 28, 'Written'),
(181, 30, 3, 29, 'Written'),
(182, 30, 3, 30, 'Written'),
(183, 66, 3, 31, 'Written'),
(184, 67, 3, 32, 'Written'),
(185, 68, 3, 33, 'Written'),
(186, 30, 3, 34, 'Written'),
(187, 30, 3, 35, 'Written'),
(188, 64, 3, 28, 'Special guests'),
(189, 51, 3, 33, 'Special guests');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disco`
--

CREATE TABLE `disco` (
  `id_disco` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_autor` int(11) NOT NULL,
  `anyo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `disco`
--

INSERT INTO `disco` (`id_disco`, `nombre`, `id_autor`, `anyo`) VALUES
(1, 'Tentación', 1, 1990),
(2, 'Still got the blues', 2, 1990),
(3, 'After hours', 2, 1992),
(4, 'Los chulos son pa\' cuidarlos', 3, 1900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`) VALUES
(1, 'Miguel Ángel Arenas'),
(2, 'Mike Howlett'),
(3, 'Antonio Cortés'),
(4, 'Ben Hoffnung'),
(5, 'Spencer Quartet of London'),
(6, 'Robert Atchison'),
(7, 'Roland Roberts'),
(8, 'Ian Rowbotham'),
(9, 'Erica Simpson'),
(10, 'alive and kickin’ horns'),
(11, 'Noel Langley'),
(12, 'Dennis Rollins'),
(13, 'Scott Garland'),
(14, 'Marco Ricci'),
(15, 'Ingrid Schroeder'),
(16, 'Geoff Dunn'),
(17, 'Geoff Hunt'),
(18, 'John Palmer'),
(19, 'Yan Memnis'),
(20, 'Ian Taylor'),
(21, 'Rafael Sánchez'),
(22, 'Luis Bolín'),
(23, 'Mario Martínez'),
(24, 'Steve Fitzmaurice'),
(25, 'Noel Harris'),
(26, 'Stuart Day'),
(27, 'Marcus Draws'),
(28, 'Greg Muden'),
(29, 'Hayden Bendall'),
(30, 'Gary Moore'),
(31, 'Williams'),
(32, 'Jimmy Rodgers'),
(33, 'Johnny “Guitar” Watson'),
(34, 'Maxwell Davies'),
(35, 'Saul Bihari'),
(36, 'Dan Malone'),
(37, 'George Harrison'),
(38, 'Rush'),
(39, 'Peter Green'),
(40, 'Mick Weaver'),
(41, 'Andy Pyle'),
(42, 'Graham Walker'),
(43, 'Raoul D’Olivera'),
(44, 'Frank Mead'),
(45, 'Nick Pentelow'),
(46, 'Nick Payn'),
(47, 'Nicky Hopkins'),
(48, 'Gavin Wright'),
(49, 'Bob Daisley'),
(50, 'Brian Downey'),
(51, 'Albert Collins'),
(52, 'Stuart Brooks'),
(53, 'Andrew Hamilton'),
(54, 'Martin Drover'),
(55, 'Gregg Jackman'),
(56, 'Peter Hodgson'),
(57, 'Robin Barclay'),
(58, 'Matt Lane'),
(59, 'Ed Goldberg'),
(60, 'Ellen Fitton'),
(61, 'Alec Firla'),
(62, 'Andy Baker'),
(63, 'Tommy Eyre'),
(64, 'B.B. King'),
(65, 'Hudson Whittaker'),
(66, 'John Mayall'),
(67, 'D. Bennett'),
(68, 'Milton Campbell'),
(69, 'Will Lee'),
(70, 'Johnny B. Gaydon'),
(71, 'Anton Fig'),
(72, 'Andrew Love'),
(73, 'Wayne Jackson'),
(74, 'Carol Kenyon'),
(75, 'Linda Taylor'),
(76, 'Richard Morgan'),
(77, 'Don Airey'),
(78, 'Albert King');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id_produccion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_disco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id_produccion`, `id_persona`, `id_disco`) VALUES
(1, 2, 1),
(2, 30, 2),
(3, 20, 2),
(4, 30, 3),
(5, 20, 3),
(6, 1, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`id_cancion`),
  ADD KEY `disco_cancion_FK` (`id_disco`);

--
-- Indices de la tabla `colaboracion`
--
ALTER TABLE `colaboracion`
  ADD PRIMARY KEY (`id_colaboracion`),
  ADD KEY `persona_colaboracion_FK` (`id_persona`),
  ADD KEY `disco_colaboracion_FK` (`id_disco`),
  ADD KEY `cancion_colaboracion_FK` (`id_cancion`);

--
-- Indices de la tabla `disco`
--
ALTER TABLE `disco`
  ADD PRIMARY KEY (`id_disco`),
  ADD KEY `autor_disco_FK` (`id_autor`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id_produccion`),
  ADD KEY `persona_produccion_FK` (`id_persona`),
  ADD KEY `disco_produccion_FK` (`id_disco`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cancion`
--
ALTER TABLE `cancion`
  MODIFY `id_cancion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `colaboracion`
--
ALTER TABLE `colaboracion`
  MODIFY `id_colaboracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT de la tabla `disco`
--
ALTER TABLE `disco`
  MODIFY `id_disco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD CONSTRAINT `disco_cancion_FK` FOREIGN KEY (`id_disco`) REFERENCES `disco` (`id_disco`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `colaboracion`
--
ALTER TABLE `colaboracion`
  ADD CONSTRAINT `cancion_colaboracion_FK` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disco_colaboracion_FK` FOREIGN KEY (`id_disco`) REFERENCES `disco` (`id_disco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_colaboracion_FK` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `disco`
--
ALTER TABLE `disco`
  ADD CONSTRAINT `autor_disco_FK` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `disco_produccion_FK` FOREIGN KEY (`id_disco`) REFERENCES `disco` (`id_disco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_produccion_FK` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
