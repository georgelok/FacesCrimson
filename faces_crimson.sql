-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2015 at 09:51 PM
-- Server version: 5.5.41
-- PHP Version: 5.3.10-1ubuntu3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `faces_crimson`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE IF NOT EXISTS `boards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board` char(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `board` (`board`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `board`) VALUES
(2, 'Arts'),
(1, 'Big Three'),
(5, 'Blog'),
(4, 'Business'),
(6, 'Design'),
(3, 'Editorial'),
(7, 'FM'),
(8, 'Multimedia'),
(9, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `editors`
--

CREATE TABLE IF NOT EXISTS `editors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` char(100) NOT NULL,
  `middle_initial` char(1) DEFAULT NULL,
  `last_name` char(100) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `board` int(11) NOT NULL,
  `position` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
