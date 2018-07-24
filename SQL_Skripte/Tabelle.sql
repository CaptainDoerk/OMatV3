-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: 10.246.16.53:3306
-- Generation Time: Feb 03, 2014 at 05:33 PM
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
-- Table structure for table `Tabelle`
--

CREATE TABLE IF NOT EXISTS `Tabelle` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Jahr` int(4) NOT NULL DEFAULT '0',
  `Platz` int(2) NOT NULL DEFAULT '0',
  `TeamID` int(3) NOT NULL DEFAULT '0',
  `Spieler1` int(3) NOT NULL DEFAULT '0',
  `Spieler2` int(3) NOT NULL DEFAULT '0',
  `Spieler3` int(3) DEFAULT '0',
  `Spiele` int(3) NOT NULL DEFAULT '0',
  `Siege` int(3) NOT NULL DEFAULT '0',
  `Unentschieden` int(3) NOT NULL DEFAULT '0',
  `Niederlagen` int(3) NOT NULL DEFAULT '0',
  `Punkte` int(3) NOT NULL DEFAULT '0',
  `ToreP` int(3) NOT NULL DEFAULT '0',
  `ToreM` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=209 ;

--
-- Dumping data for table `Tabelle`
--

INSERT INTO `Tabelle` (`ID`, `Jahr`, `Platz`, `TeamID`, `Spieler1`, `Spieler2`, `Spieler3`, `Spiele`, `Siege`, `Unentschieden`, `Niederlagen`, `Punkte`, `ToreP`, `ToreM`) VALUES
(1, 2000, 1, 5, 17, 18, NULL, 7, 6, 1, 0, 19, 53, 26),
(2, 2000, 2, 6, 9, 10, 22, 7, 5, 0, 2, 15, 45, 38),
(3, 2000, 3, 1, 1, 2, NULL, 6, 4, 1, 1, 13, 44, 30),
(4, 2000, 4, 9, 15, 16, NULL, 6, 4, 0, 2, 12, 51, 35),
(5, 2000, 5, 2, 3, 4, NULL, 5, 2, 0, 3, 6, 30, 33),
(6, 2000, 6, 8, 13, 14, NULL, 5, 1, 1, 3, 4, 36, 40),
(7, 2000, 7, 10, 19, 20, NULL, 5, 1, 1, 3, 4, 26, 38),
(8, 2000, 8, 4, 7, 8, NULL, 5, 1, 0, 4, 3, 23, 34),
(9, 2000, 9, 3, 5, 6, NULL, 5, 1, 0, 4, 3, 18, 41),
(10, 2000, 10, 7, 11, 12, NULL, 5, 1, 0, 4, 3, 22, 33),
(11, 2001, 1, 11, 23, 24, NULL, 8, 8, 0, 0, 24, 80, 30),
(12, 2001, 2, 15, 30, 31, NULL, 8, 6, 0, 2, 18, 67, 41),
(13, 2001, 3, 1, 1, 22, NULL, 7, 3, 1, 3, 10, 48, 56),
(14, 2001, 4, 16, 32, 33, NULL, 7, 6, 0, 1, 18, 48, 32),
(15, 2001, 5, 12, 25, 26, NULL, 6, 4, 0, 2, 12, 56, 33),
(16, 2001, 6, 2, 3, 4, NULL, 6, 3, 0, 3, 9, 40, 38),
(17, 2001, 7, 8, 13, 14, NULL, 6, 2, 0, 4, 6, 30, 40),
(18, 2001, 8, 10, 19, 20, NULL, 6, 1, 1, 4, 4, 36, 41),
(19, 2001, 9, 9, 15, 16, NULL, 5, 1, 1, 3, 4, 30, 34),
(20, 2001, 10, 13, 2, 27, NULL, 5, 1, 0, 4, 3, 16, 46),
(21, 2001, 11, 7, 11, 12, NULL, 5, 0, 1, 4, 1, 19, 42),
(22, 2001, 12, 14, 28, 29, NULL, 5, 0, 0, 5, 0, 12, 49),
(23, 2002, 1, 19, 22, 40, NULL, 7, 6, 1, 0, 19, 67, 40),
(24, 2002, 2, 14, 28, 36, NULL, 7, 5, 1, 1, 16, 63, 44),
(25, 2002, 3, 18, 1, 21, NULL, 6, 5, 0, 1, 15, 45, 31),
(26, 2002, 4, 12, 25, 26, NULL, 6, 4, 0, 2, 12, 54, 37),
(27, 2002, 5, 8, 13, 14, NULL, 5, 2, 0, 3, 6, 30, 31),
(28, 2002, 6, 10, 19, 20, NULL, 5, 1, 1, 3, 4, 38, 38),
(29, 2002, 7, 7, 11, 12, NULL, 5, 1, 1, 3, 4, 30, 34),
(30, 2002, 8, 2, 3, 37, NULL, 5, 1, 0, 4, 3, 30, 34),
(31, 2002, 9, 11, 38, 39, NULL, 5, 1, 0, 4, 3, 10, 44),
(32, 2002, 10, 17, 34, 35, NULL, 5, 0, 0, 5, 0, 9, 45),
(33, 2003, 1, 12, 25, 41, NULL, 7, 6, 0, 1, 18, 52, 25),
(34, 2003, 2, 11, 45, 46, NULL, 7, 4, 1, 2, 13, 39, 39),
(35, 2003, 3, 2, 3, 22, NULL, 6, 4, 0, 2, 12, 36, 31),
(36, 2003, 4, 8, 13, 14, NULL, 6, 3, 1, 2, 10, 30, 35),
(37, 2003, 5, 13, 2, 31, NULL, 5, 3, 0, 2, 9, 24, 29),
(38, 2003, 6, 20, 42, 43, NULL, 5, 2, 0, 3, 6, 38, 24),
(39, 2003, 7, 10, 19, 44, NULL, 5, 2, 0, 3, 6, 27, 29),
(40, 2003, 8, 21, 21, 47, NULL, 5, 1, 2, 2, 5, 22, 28),
(41, 2003, 9, 7, 11, 12, NULL, 5, 1, 0, 4, 3, 21, 36),
(42, 2003, 10, 22, 48, 49, NULL, 5, 0, 0, 5, 0, 26, 38),
(43, 2004, 1, 12, 25, 63, NULL, 6, 5, 0, 1, 15, 46, 29),
(44, 2004, 2, 2, 3, 22, NULL, 7, 6, 0, 1, 18, 57, 27),
(45, 2004, 3, 8, 13, 14, NULL, 6, 5, 0, 1, 15, 45, 29),
(46, 2004, 4, 23, 56, 57, NULL, 5, 4, 0, 1, 12, 37, 29),
(47, 2004, 5, 22, 48, 51, NULL, 5, 2, 0, 3, 6, 37, 39),
(48, 2004, 6, 9, 16, 54, NULL, 5, 2, 0, 3, 6, 23, 26),
(49, 2004, 7, 24, 52, 53, NULL, 4, 4, 0, 0, 12, 38, 16),
(50, 2004, 8, 20, 42, 51, NULL, 4, 2, 0, 2, 6, 28, 26),
(51, 2004, 9, 25, 2, 21, NULL, 4, 1, 1, 2, 4, 23, 22),
(52, 2004, 10, 10, 19, 20, NULL, 4, 1, 1, 2, 4, 22, 29),
(53, 2004, 11, 26, 58, 59, NULL, 4, 0, 1, 3, 1, 18, 35),
(54, 2004, 12, 27, 50, 60, NULL, 4, 0, 0, 4, 0, 13, 30),
(55, 2004, 13, 28, 61, 62, NULL, 4, 0, 0, 4, 0, 14, 35),
(56, 2004, 14, 17, 34, 35, 55, 4, 0, 0, 4, 0, 12, 37),
(57, 2004, 15, 29, 64, 65, NULL, 3, 2, 0, 1, 6, 14, 20),
(58, 2004, 16, 11, 45, 46, NULL, 3, 1, 1, 1, 4, 14, 12),
(59, 2005, 1, 12, 25, 41, NULL, 8, 8, 0, 0, 24, 68, 33),
(60, 2005, 2, 24, 52, 53, NULL, 8, 6, 0, 2, 18, 66, 44),
(61, 2005, 3, 25, 2, 21, NULL, 7, 5, 0, 2, 15, 53, 36),
(62, 2005, 4, 30, 68, 69, NULL, 7, 4, 0, 3, 12, 45, 41),
(63, 2005, 5, 23, 56, 80, NULL, 6, 5, 0, 1, 15, 48, 27),
(64, 2005, 6, 31, 78, 79, NULL, 6, 4, 1, 1, 13, 40, 37),
(65, 2005, 7, 32, 42, 60, NULL, 6, 4, 0, 2, 12, 46, 31),
(66, 2005, 8, 33, 71, 72, NULL, 6, 3, 1, 2, 10, 40, 41),
(67, 2005, 9, 14, 28, 70, NULL, 5, 3, 0, 2, 9, 35, 28),
(68, 2005, 10, 11, 45, 77, NULL, 5, 2, 1, 2, 7, 41, 31),
(69, 2005, 11, 2, 3, 22, NULL, 5, 2, 1, 2, 7, 39, 43),
(70, 2005, 12, 34, 81, 82, NULL, 5, 1, 1, 3, 4, 28, 36),
(71, 2005, 13, 22, 48, 51, NULL, 5, 1, 0, 4, 3, 28, 37),
(72, 2005, 14, 9, 16, 54, NULL, 5, 1, 0, 4, 3, 26, 37),
(73, 2005, 15, 35, 73, 74, NULL, 5, 1, 0, 4, 3, 26, 41),
(74, 2005, 16, 7, 11, 12, NULL, 5, 1, 0, 4, 3, 18, 36),
(75, 2005, 17, 10, 19, 20, NULL, 4, 1, 0, 3, 3, 15, 30),
(76, 2005, 18, 36, 66, 67, NULL, 4, 0, 1, 3, 1, 17, 34),
(77, 2005, 19, 17, 34, 35, NULL, 4, 0, 0, 4, 0, 14, 29),
(78, 2005, 20, 37, 75, 76, NULL, 4, 0, 0, 4, 0, 16, 37),
(79, 2006, 1, 38, 83, 53, NULL, 8, 8, 0, 0, 24, 68, 41),
(80, 2006, 2, 23, 56, 84, NULL, 8, 6, 0, 2, 18, 64, 44),
(81, 2006, 3, 32, 60, 85, NULL, 7, 6, 0, 1, 18, 65, 38),
(82, 2006, 4, 25, 2, 21, NULL, 7, 3, 1, 3, 10, 40, 46),
(83, 2006, 5, 2, 3, 22, NULL, 6, 3, 0, 3, 9, 48, 40),
(84, 2006, 6, 30, 68, 69, NULL, 6, 3, 0, 3, 9, 38, 37),
(85, 2006, 7, 35, 78, 74, NULL, 6, 3, 0, 3, 9, 37, 42),
(86, 2006, 8, 9, 16, 54, NULL, 6, 2, 0, 4, 6, 32, 46),
(87, 2006, 9, 10, 19, 20, NULL, 5, 1, 0, 4, 3, 30, 40),
(88, 2006, 10, 36, 66, 67, NULL, 5, 0, 1, 4, 1, 18, 42),
(89, 2006, 11, 17, 34, 35, NULL, 5, 0, 0, 5, 0, 31, 34),
(90, 2006, 12, 7, 11, 12, NULL, 5, 0, 0, 5, 0, 20, 39),
(91, 2007, 1, 32, 60, 85, NULL, 7, 7, 0, 0, 21, 49, 34),
(92, 2007, 2, 2, 3, 22, NULL, 7, 5, 0, 2, 15, 54, 40),
(93, 2007, 3, 24, 52, 53, NULL, 6, 4, 0, 2, 12, 51, 32),
(94, 2007, 4, 17, 34, 35, NULL, 6, 2, 1, 3, 7, 35, 38),
(95, 2007, 5, 25, 2, 21, NULL, 5, 2, 1, 2, 7, 23, 37),
(96, 2007, 6, 12, 25, 28, NULL, 5, 2, 0, 3, 6, 32, 37),
(97, 2007, 7, 9, 16, 89, NULL, 5, 2, 0, 3, 6, 26, 37),
(98, 2007, 8, 39, 90, 91, NULL, 5, 1, 0, 4, 3, 29, 35),
(99, 2007, 9, 10, 19, 20, 93, 5, 2, 0, 3, 6, 19, 38),
(100, 2007, 10, 23, 56, 92, NULL, 5, 0, 0, 5, 0, 21, 42),
(101, 2008, 1, 23, 56, 84, NULL, 9, 6, 2, 1, 20, 73, 44),
(102, 2008, 2, 30, 68, 69, NULL, 9, 7, 0, 2, 21, 50, 40),
(103, 2008, 3, 32, 60, 85, NULL, 8, 6, 0, 2, 18, 62, 38),
(104, 2008, 4, 44, 83, 103, NULL, 8, 3, 0, 5, 9, 42, 45),
(105, 2008, 5, 14, 28, 78, NULL, 7, 5, 0, 2, 15, 48, 29),
(106, 2008, 6, 25, 2, 21, NULL, 7, 4, 1, 2, 13, 43, 40),
(107, 2008, 7, 41, 94, 95, 96, 7, 4, 0, 3, 12, 47, 41),
(108, 2008, 8, 42, 73, 97, 103, 7, 3, 0, 4, 9, 40, 55),
(109, 2008, 9, 24, 52, 53, NULL, 6, 5, 0, 1, 15, 44, 31),
(110, 2008, 10, 12, 25, 42, NULL, 6, 4, 0, 2, 12, 44, 31),
(111, 2008, 11, 36, 99, 100, NULL, 6, 3, 0, 3, 9, 42, 43),
(112, 2008, 12, 7, 11, 101, NULL, 6, 2, 1, 3, 7, 35, 30),
(113, 2008, 13, 40, 71, 79, NULL, 6, 2, 0, 4, 6, 41, 44),
(114, 2008, 14, 9, 16, 54, NULL, 6, 2, 0, 4, 6, 31, 41),
(115, 2008, 15, 2, 3, 98, NULL, 6, 1, 1, 4, 4, 34, 49),
(116, 2008, 16, 17, 34, 35, NULL, 6, 0, 1, 5, 1, 26, 43),
(117, 2008, 17, 43, 91, 102, NULL, 6, 1, 0, 5, 3, 26, 48),
(118, 2008, 18, 10, 19, 20, NULL, 6, 0, 0, 6, 0, 20, 52),
(119, 2009, 1, 32, 85, 113, NULL, 9, 6, 0, 3, 18, 65, 53),
(120, 2009, 2, 48, 116, 117, NULL, 9, 5, 0, 4, 15, 63, 56),
(121, 2009, 3, 36, 99, 100, NULL, 8, 6, 0, 2, 18, 66, 43),
(122, 2009, 4, 25, 2, 21, NULL, 8, 4, 0, 4, 12, 60, 60),
(123, 2009, 5, 45, 109, 110, NULL, 7, 6, 0, 1, 18, 61, 49),
(124, 2009, 6, 23, 56, 84, NULL, 7, 5, 0, 2, 15, 57, 32),
(125, 2009, 7, 39, 90, 32, NULL, 7, 4, 0, 3, 12, 50, 38),
(126, 2009, 8, 46, 111, 112, NULL, 7, 4, 0, 3, 12, 47, 41),
(127, 2009, 9, 14, 28, 73, 107, 6, 5, 0, 1, 15, 53, 27),
(128, 2009, 10, 9, 16, 105, NULL, 6, 4, 0, 2, 12, 33, 35),
(129, 2009, 11, 12, 25, 42, NULL, 6, 3, 0, 3, 9, 41, 37),
(130, 2009, 12, 2, 3, 106, NULL, 6, 1, 2, 3, 8, 28, 41),
(131, 2009, 13, 44, 83, 108, NULL, 6, 2, 1, 3, 7, 36, 37),
(132, 2009, 14, 10, 19, 20, NULL, 6, 2, 0, 4, 6, 34, 49),
(133, 2009, 15, 17, 34, 35, NULL, 6, 1, 0, 5, 3, 28, 48),
(134, 2009, 16, 47, 114, 115, NULL, 6, 1, 0, 5, 3, 41, 46),
(135, 2009, 17, 7, 11, 12, NULL, 6, 0, 1, 5, 1, 29, 46),
(136, 2009, 18, 49, 118, 119, NULL, 6, 0, 0, 6, 0, 6, 60),
(137, 2010, 1, 51, 43, 122, 123, 9, 6, 0, 3, 18, 57, 47),
(138, 2010, 2, 12, 25, 42, NULL, 9, 6, 1, 2, 19, 63, 50),
(139, 2010, 3, 39, 32, 90, NULL, 8, 6, 0, 2, 18, 63, 43),
(140, 2010, 4, 14, 28, 113, NULL, 8, 4, 1, 3, 13, 41, 37),
(141, 2010, 5, 46, 112, 124, NULL, 7, 6, 0, 1, 18, 54, 25),
(142, 2010, 6, 30, 68, 69, NULL, 7, 5, 1, 1, 16, 41, 25),
(143, 2010, 7, 23, 84, 127, 121, 7, 5, 0, 2, 15, 60, 35),
(144, 2010, 8, 50, 125, 126, NULL, 7, 2, 1, 4, 7, 41, 38),
(145, 2010, 9, 32, 60, 85, NULL, 6, 4, 0, 2, 12, 51, 32),
(146, 2010, 10, 36, 99, 100, NULL, 6, 4, 0, 2, 12, 49, 35),
(147, 2010, 11, 2, 3, 106, NULL, 6, 3, 0, 3, 9, 39, 24),
(148, 2010, 12, 25, 2, 21, 93, 6, 2, 2, 2, 8, 27, 28),
(149, 2010, 13, 17, 34, 35, NULL, 6, 1, 0, 5, 3, 24, 51),
(150, 2010, 14, 42, 73, 97, 104, 6, 1, 0, 5, 3, 28, 50),
(151, 2010, 15, 49, 119, 120, NULL, 6, 2, 0, 4, 6, 31, 45),
(152, 2010, 16, 10, 19, 20, NULL, 6, 0, 0, 6, 0, 21, 53),
(153, 2010, 17, 7, 11, 12, NULL, 6, 1, 0, 5, 3, 23, 50),
(154, 2010, 18, 9, 16, 107, NULL, 6, 0, 0, 6, 0, 15, 60),
(155, 2011, 1, 32, 85, 60, NULL, 9, 7, 1, 1, 22, 67, 39),
(156, 2011, 2, 30, 68, 69, NULL, 9, 6, 1, 2, 19, 50, 44),
(157, 2011, 3, 44, 83, 103, NULL, 8, 7, 0, 1, 21, 50, 29),
(158, 2011, 4, 24, 52, 53, NULL, 8, 5, 1, 2, 16, 56, 61),
(159, 2011, 5, 39, 32, 90, NULL, 7, 4, 2, 1, 14, 43, 32),
(160, 2011, 6, 25, 2, 21, 132, 7, 3, 2, 2, 11, 42, 35),
(161, 2011, 7, 7, 12, 128, NULL, 7, 3, 0, 4, 9, 37, 42),
(162, 2011, 8, 12, 25, 42, NULL, 7, 2, 2, 3, 8, 44, 35),
(163, 2011, 9, 23, 56, 127, NULL, 6, 4, 1, 1, 13, 40, 28),
(164, 2011, 10, 46, 111, 112, NULL, 6, 4, 0, 2, 12, 33, 36),
(165, 2011, 11, 36, 99, 100, NULL, 6, 3, 1, 2, 10, 44, 39),
(166, 2011, 12, 50, 125, 129, NULL, 6, 3, 0, 3, 9, 38, 26),
(167, 2011, 13, 2, 3, 106, NULL, 6, 1, 1, 4, 4, 33, 38),
(168, 2011, 14, 52, 130, 131, NULL, 6, 1, 0, 5, 3, 28, 44),
(169, 2011, 15, 9, 16, 72, NULL, 6, 0, 1, 5, 1, 26, 46),
(170, 2011, 16, 10, 19, 20, NULL, 6, 0, 1, 5, 1, 27, 52),
(171, 2011, 17, 49, 119, 104, NULL, 6, 1, 0, 5, 3, 28, 51),
(172, 2011, 18, 17, 34, 28, NULL, 6, 0, 0, 6, 0, 21, 53),
(173, 2012, 1, 25, 2, 21, NULL, 9, 6, 0, 3, 18, 60, 52),
(174, 2012, 2, 30, 68, 69, NULL, 9, 7, 0, 2, 21, 52, 36),
(175, 2012, 3, 53, 85, 138, NULL, 9, 5, 1, 3, 16, 66, 50),
(176, 2012, 4, 12, 42, 140, 25, 9, 5, 0, 4, 15, 56, 47),
(177, 2012, 5, 14, 28, 40, NULL, 7, 6, 0, 1, 18, 56, 38),
(178, 2012, 6, 39, 32, 90, NULL, 7, 5, 0, 2, 15, 45, 31),
(179, 2012, 7, 36, 100, 136, NULL, 7, 4, 0, 3, 12, 50, 37),
(180, 2012, 8, 7, 11, 12, NULL, 7, 1, 1, 5, 4, 30, 64),
(181, 2012, 9, 44, 83, 103, NULL, 6, 4, 1, 1, 13, 46, 30),
(182, 2012, 10, 54, 116, 139, NULL, 6, 4, 0, 2, 12, 37, 35),
(183, 2012, 11, 50, 125, 133, NULL, 6, 3, 0, 3, 9, 37, 27),
(184, 2012, 12, 2, 3, 106, NULL, 6, 3, 0, 3, 9, 44, 44),
(185, 2012, 13, 32, 60, 137, NULL, 6, 2, 1, 3, 7, 47, 44),
(186, 2012, 14, 10, 19, 20, NULL, 6, 2, 0, 4, 6, 35, 48),
(187, 2012, 15, 9, 16, 135, NULL, 6, 1, 0, 5, 3, 25, 39),
(188, 2012, 16, 17, 34, 35, NULL, 6, 1, 0, 5, 3, 28, 45),
(189, 2012, 17, 49, 119, 134, NULL, 6, 1, 0, 5, 3, 25, 51),
(190, 2012, 18, 42, 97, 104, NULL, 6, 0, 0, 6, 0, 23, 45),
(191, 2013, 1, 25, 2, 21, 19, 9, 6, 3, 0, 21, 54, 40),
(192, 2013, 2, 14, 28, 40, NULL, 9, 6, 1, 2, 16, 56, 38),
(193, 2013, 3, 12, 25, 42, NULL, 8, 6, 0, 2, 18, 50, 37),
(194, 2013, 4, 32, 60, 137, NULL, 8, 6, 0, 2, 18, 64, 43),
(195, 2013, 5, 30, 68, 69, NULL, 7, 5, 1, 1, 16, 50, 32),
(196, 2013, 6, 50, 125, 133, NULL, 7, 4, 1, 2, 13, 41, 25),
(197, 2013, 7, 46, 111, 112, NULL, 7, 2, 2, 3, 8, 37, 40),
(198, 2013, 8, 10, 19, 148, 20, 7, 2, 0, 5, 6, 32, 49),
(199, 2013, 9, 36, 100, 136, NULL, 6, 5, 0, 1, 15, 46, 27),
(200, 2013, 10, 53, 85, 138, NULL, 6, 3, 1, 2, 10, 36, 36),
(201, 2013, 11, 56, 145, 146, 147, 6, 3, 0, 3, 9, 45, 35),
(202, 2013, 12, 39, 32, 90, NULL, 6, 3, 0, 3, 9, 34, 32),
(203, 2013, 13, 55, 144, 139, NULL, 6, 2, 0, 4, 6, 34, 44),
(204, 2013, 14, 2, 3, 106, NULL, 6, 2, 0, 4, 6, 32, 42),
(205, 2013, 15, 17, 34, 142, NULL, 6, 1, 0, 5, 3, 32, 43),
(206, 2013, 16, 9, 16, 135, NULL, 6, 0, 1, 5, 1, 23, 51),
(207, 2013, 17, 49, 134, 143, NULL, 6, 1, 0, 5, 3, 35, 49),
(208, 2013, 18, 7, 11, 12, NULL, 6, 0, 0, 6, 0, 19, 57);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;