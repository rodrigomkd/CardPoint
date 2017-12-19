-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: mariadb-091.wc1:3306
-- Tiempo de generación: 19-12-2017 a las 01:13:31
-- Versión del servidor: 10.1.26-MariaDB-1~jessie
-- Versión de PHP: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `341109_realcenter`
--
CREATE DATABASE IF NOT EXISTS `341109_realcenter` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `341109_realcenter`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`clientid` int(11) NOT NULL,
  `credential_number` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `birthdate` date NOT NULL,
  `register_date` date NOT NULL,
  `colony` varchar(40) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `gender` char(1) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'N',
  `password` varchar(30) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `verification_date` date DEFAULT NULL,
  `referenceid` varchar(14) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5233 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`commentsid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `comments_date` date NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `commerce`
--

CREATE TABLE IF NOT EXISTS `commerce` (
`commerceid` int(11) NOT NULL,
  `commercetypeid` int(11) NOT NULL,
  `commerce_name` varchar(30) NOT NULL,
  `commerce_number` char(10) DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `commerce_type`
--

CREATE TABLE IF NOT EXISTS `commerce_type` (
`commercetypeid` int(11) NOT NULL,
  `description` varchar(30) NOT NULL,
  `limited` smallint(6) DEFAULT NULL,
  `percent` smallint(6) DEFAULT NULL,
  `points` smallint(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

CREATE TABLE IF NOT EXISTS `config` (
`configid` smallint(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `points`
--

CREATE TABLE IF NOT EXISTS `points` (
`pointsid` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `buy_date` date NOT NULL,
  `register_date` date NOT NULL,
  `commerceid` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `ticket_number` varchar(40) NOT NULL,
  `percent` char(4) DEFAULT NULL,
  `points` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14319 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`userid` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` char(1) NOT NULL,
  `active` char(1) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`clientid`), ADD KEY `user_client_fk` (`userid`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`commentsid`), ADD KEY `client_comments_fk` (`clientid`);

--
-- Indices de la tabla `commerce`
--
ALTER TABLE `commerce`
 ADD PRIMARY KEY (`commerceid`), ADD KEY `commerce_type_commerce_fk` (`commercetypeid`);

--
-- Indices de la tabla `commerce_type`
--
ALTER TABLE `commerce_type`
 ADD PRIMARY KEY (`commercetypeid`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`configid`);

--
-- Indices de la tabla `points`
--
ALTER TABLE `points`
 ADD PRIMARY KEY (`pointsid`), ADD KEY `commerce_points_fk` (`commerceid`), ADD KEY `client_points_fk` (`clientid`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
MODIFY `clientid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5233;
--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
MODIFY `commentsid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `commerce`
--
ALTER TABLE `commerce`
MODIFY `commerceid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT de la tabla `commerce_type`
--
ALTER TABLE `commerce_type`
MODIFY `commercetypeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
MODIFY `configid` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `points`
--
ALTER TABLE `points`
MODIFY `pointsid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14319;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
ADD CONSTRAINT `user_client_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `client_comments_fk` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `commerce`
--
ALTER TABLE `commerce`
ADD CONSTRAINT `commerce_type_commerce_fk` FOREIGN KEY (`commercetypeid`) REFERENCES `commerce_type` (`commercetypeid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `points`
--
ALTER TABLE `points`
ADD CONSTRAINT `client_points_fk` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `commerce_points_fk` FOREIGN KEY (`commerceid`) REFERENCES `commerce` (`commerceid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
