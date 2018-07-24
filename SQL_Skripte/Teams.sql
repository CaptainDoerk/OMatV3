-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: 10.246.16.53:3306
-- Generation Time: Feb 03, 2014 at 05:37 PM
-- Server version: 5.1.72-2
-- PHP Version: 5.3.3-7+squeeze15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `captaindoerk_de`
--

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE IF NOT EXISTS `Teams` (
  `TeamID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`TeamID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `Teams`
--

INSERT INTO `Teams` (`TeamID`, `Name`) VALUES
(1, 'Dom K&ouml;lsch'),
(2, 'Porsche'),
(3, 'AC Milan'),
(4, 'Volleyball'),
(5, 'FSG Abi 2000'),
(6, 'Porsche2'),
(7, 'Tesa Power'),
(8, 'Becks'),
(9, 'Deportivo'),
(10, 'Sauffpark'),
(11, 'Gold Ochsen'),
(12, 'Wolfbr&auml;u'),
(13, 'K&uuml;ppers K&ouml;lsch'),
(14, 'Rothaus'),
(15, 'Gastrupp'),
(16, 'FC Marbach'),
(17, 'Ensinger'),
(18, 'Fr&uuml;h K&ouml;lsch'),
(19, 'TNT'),
(20, 'Malteser'),
(21, 'Captain Choc'),
(22, 'Augustiner'),
(23, 'Condom Kickers'),
(24, 'Mollutz'),
(25, 'Sion K&ouml;lsch'),
(26, 'ABBA'),
(27, 'Air Combats'),
(28, 'Tipp Kick'),
(29, 'Lange Glieder'),
(30, 'Sparda Orange'),
(31, 'Zechpreller'),
(32, 'Bergmacht'),
(33, 'Streuwagen'),
(34, 'KSK'),
(35, 'Extinguishers'),
(36, 'Waldmeister'),
(37, 'K und K'),
(38, 'Schmoll'),
(39, 'Olympiakos'),
(40, 'Lok Prellbock'),
(41, 'die drei Fragez.'),
(42, 'dynam. Duo'),
(43, 'Hack Men Group'),
(44, 'Hulaboys'),
(45, 'D&uuml;rres Duo'),
(46, 'Maggi&Nietzsche'),
(47, 'Juventus'),
(48, 'Sambuca'),
(49, 'Gaffel K&ouml;lsch'),
(50, 'die wilden Kerle'),
(51, 'Oransina'),
(52, 'Galatasaray'),
(53, 'Condor'),
(54, 'Merci-Benzler'),
(55, 'Audi Sport'),
(56, 'Interessierte Hinterhand');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
