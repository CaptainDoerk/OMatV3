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
-- Table structure for table `Spieler`
--

CREATE TABLE IF NOT EXISTS `Spieler` (
  `SpielerID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Vorname` varchar(30) NOT NULL DEFAULT '',
  `Nickname` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`SpielerID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=149 ;

--
-- Dumping data for table `Spieler`
--

INSERT INTO `Spieler` (`SpielerID`, `Name`, `Vorname`, `Nickname`) VALUES
(1, 'Scheike', 'Jochen', 'StA'),
(2, 'Malas', 'Dirk', 'Captain Doerk'),
(3, 'Z&auml;hringer', 'Matthias', 'Mad Maz'),
(4, 'Wildner', 'Dominic', 'Domme'),
(5, 'Wichmann', 'Alexander', 'Mystique'),
(6, 'Wichmann', 'Gernot', ''),
(7, 'Rohloff', 'Thorsten', ''),
(8, 'Engelhardt', 'Rainer', ''),
(9, 'Maierhofer', 'Bernd', ''),
(10, 'Mildenberger', 'Pascal', ''),
(11, 'L&uuml;cke', 'Dirk', ''),
(12, 'Piesch', 'Timo', ''),
(13, 'Encke', 'Timo', ''),
(14, 'Tessaro', 'Nico', ''),
(15, 'Niederberger', 'Jens', ''),
(16, 'Hildebrandt', 'Ingo', 'Inge'),
(17, 'Lorenz', 'Nadine', ''),
(18, 'Kurrle', 'Markus', ''),
(19, 'de Noni', 'Sven', 'Mahony'),
(20, 'Zowe', 'Jochen', 'Shooter'),
(21, 'Emhardt', 'Steffen', 'Emre'),
(22, 'Scheike', 'Thomas', ''),
(23, 'Marder', 'Patrick', ''),
(24, 'Dehm', 'Alexander', ''),
(25, 'Wolf', 'Martin', 'Tha Man'),
(26, 'Benzler', 'Claus', 'Tha Diva'),
(27, 'Schibilski', 'Marco', ''),
(28, 'Hahn', 'Frederic', 'Fraggy'),
(29, 'Organzidis', 'Thomas', ''),
(30, 'Weller', 'Oliver', ''),
(31, 'Hahn', 'Oliver', 'H&uuml;hny'),
(32, 'He&szlig;', 'Stefan', 'Theo'),
(33, 'Pfuderer', 'Tobias', 'Pfudi'),
(34, 'L&uuml;cke', 'Jens', ''),
(35, 'Enge', 'Sebastian', 'Buzz-T'),
(36, '', 'Gregor', ''),
(37, 'Reiff', 'Christoph', ''),
(38, 'Benz', 'Eric', ''),
(39, 'K&auml;sser', 'Andreas', 'Vesper-Willi'),
(40, 'Hertler', 'Timo', 'Didi'),
(41, 'Lindacher', 'Holger', 'Wolli'),
(42, 'Schenk', 'Benjamin', 'Ben vom Berg'),
(43, 'Forch', 'Sebastian', ''),
(44, '', '', 'Goran'),
(45, 'Gr&uuml;ner', 'Axel', ''),
(46, 'Gomez', 'Alex', 'Raul Gomez'),
(47, 'Schmiedel', 'Sebastian', ''),
(48, 'Benzler', 'Steffen', 'Steven'),
(49, 'K&uuml;pper', 'Andreas', ''),
(50, 'Starkloff', 'Timo', ''),
(51, 'Drexler', 'Markus', ''),
(52, 'Utz', 'Benjamin', 'Benny_Wave'),
(53, 'Moll', 'Daniel', 'Doktor Molli'),
(54, 'Keiper', 'Benjamin', 'Ailton'),
(55, 'Buck', 'Michael', ''),
(56, 'Schnell', 'Markus', 'Schnelle'),
(57, '', '', 'Yil'),
(58, 'Jakob', 'Sabine', ''),
(59, 'Bj&ouml;rn', 'Bischof', ''),
(60, 'Schenk', 'David', 'Dave vom Berg'),
(61, 'Jung', 'Marcus', 'Eurus'),
(62, 'Tessaro', 'Florian', 'Flo Tessaro'),
(63, 'Baral', 'Matthias', 'Tha Baral'),
(64, 'Schneider', 'Jan', ''),
(65, '', 'Joseph', 'Joe'),
(66, 'Kasper', 'Bj&ouml;rn', 'Bj&ouml;&ouml;n'),
(67, 'K&uuml;rbis', 'Dennis', 'K&uuml;rbis'),
(68, 'Jakob', 'Philipp', 'Fips'),
(69, 'Forisch', 'Timo', 'Schlampe'),
(70, '', 'Marco', 'Mack-O'),
(71, 'W&uuml;rz', 'Rainer', ''),
(72, 'H&auml;fner', 'Bastian', 'Heif'),
(73, 'Eisenmann', 'Frank', 'Eise F.'),
(74, 'Michalski', 'Marco', 'Mekko'),
(75, 'Kaiser', 'Otto', 'Otto K.'),
(76, 'Krenn', 'Christian', 'Christian K.'),
(77, '', 'Tobias', 'Tobi'),
(78, 'Klotz', 'Sven', 'El &Ouml;'),
(79, 'Kirschner', 'Fabian', 'Buunsch'),
(80, 'Boese', 'Lars', ''),
(81, 'Fai&szlig;t', 'Daniel', 'Nachbar vom Berg'),
(82, 'Neumann', 'Marc', 'Nb. vom Nachbar'),
(83, 'Schmidt', 'Markus', 'Schmiddi'),
(84, 'Oberknapp', 'Dirk', ''),
(85, 'Hytrek', 'Florian', 'Flo vom Berg'),
(86, 'Wagner', 'Dennis', 'Ratch'),
(87, 'Ullmann', 'Sascha', 'Ullmann'),
(88, 'Petry', 'Andreas', 'Andy'),
(89, 'Erny', 'Thomas', ''),
(90, 'Koch', 'Andreas', ''),
(91, 'M&uuml;ller', 'Markus', ''),
(92, 'Teufel', 'Marc', ''),
(93, 'Zilles', 'Tina', 'die Hippe'),
(94, 'Schmalz', 'Alexander', 'Alex Schmalz'),
(95, 'Schanz', 'Oliver', 'Oli Schanz'),
(96, 'Wagenhals', 'Armin', 'Oarmin'),
(97, 'Gebhardt', 'Philipp', 'Phantastic Phil'),
(98, 'Kluge', 'Matthias', 'Mehr Maz'),
(99, 'Wedertz', 'Benjamin', 'Ben vom Wald'),
(100, 'Weirich', 'Mario', 'Mario vom Wald'),
(101, 'Hees', 'Volker', ''),
(102, 'Ilg', 'Rainer', ''),
(103, 'Weng', 'Andreas', 'Wengi'),
(104, 'Zilles', 'Lisa', 'Lotte'),
(105, 'Zwicker', 'Michael', 'Zwuckel'),
(106, 'Pignalosa', 'Daniele', 'Luca T.'),
(107, 'Geilke', 'Michael', 'Fjen'),
(108, '', '', 'Masmo'),
(109, 'Rucci', 'Giovanni', ''),
(110, 'Moser', 'Simon', ''),
(111, 'Traub', 'Matthias', 'Maggi Tee'),
(112, 'Wengert', 'Nicolai', 'Nietzsche'),
(113, 'S.', 'W.', 'Wieland'),
(114, 'Biesinger', 'Lars', ''),
(115, 'Schmidt', 'Markus', ''),
(116, 'Benzler', 'Matthias', 'Matze vom Berg'),
(117, 'Ljubicic', 'Marko', '''s Richard'),
(118, 'Wannhoff', 'Jens', 'Rio'),
(119, 'Zander', 'Sebastian', 'der Jupp'),
(120, 'Kobbe', 'Christian', 'der neue Rio'),
(121, 'Zowe', 'Moritz', 'Moritz'),
(122, 'Rinker', 'Sina', ''),
(123, 'Heilmeier', 'Daniel', 'Blondi'),
(124, 'Layer', 'Matthias', 'Maggi Layer'),
(125, 'Hofmann', 'Marc', 'Dolschewida'),
(126, 'Paletzki', 'Thomas', 'Jet-Ski'),
(127, '', '', 'Mausi'),
(128, 'Piesch', 'Falko', ''),
(129, 'Wilhelm', 'Christian', ''),
(130, 'Schmitz', 'Marvin', 'Marvel'),
(131, 'Weirich', 'Mirko', 'Erich'),
(132, 'Malas', 'Nadine', ''),
(133, 'Franke', 'Jochen K.', 'Franke N. Stein'),
(134, '', 'Raphael', ''),
(135, 'Hess', 'Oliver', ''),
(136, 'H&ouml;rning', 'Andreas', 'Horny Andy'),
(137, 'Merz', 'Andreas', 'Mösy'),
(138, '', 'Uwe', 'Druwe'),
(139, 'Kisser', 'Thomas', 'Thoums'),
(140, 'Renz', 'Christopher Kurt', 'Kurt'),
(141, '', '', 'Steffi'),
(142, 'Schmid', 'Andreas', ''),
(143, 'Gaffel2', 'Alex', 'Ivan'),
(144, 'Wellems', 'Peter', 'Forest Pete'),
(145, 'Strobel', 'Andreas', 'Terence'),
(146, 'Nagel', 'Nico', 'Bud'),
(147, 'Strobel', 'Felix', ''),
(148, 'Sauffpark2', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
