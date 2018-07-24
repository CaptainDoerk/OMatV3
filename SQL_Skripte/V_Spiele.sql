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
-- Structure for view `V_Spiele`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`captaindoerk_de`@`%` SQL SECURITY DEFINER VIEW `V_Spiele` AS select `S`.`SpielID` AS `SpielID`,`S`.`Jahr` AS `Jahr`,`S`.`Art` AS `Art`,`T_one`.`Name` AS `Team1Nm`,`S`.`Team1` AS `Team1ID`,`T_two`.`Name` AS `Team2Nm`,`S`.`Team2` AS `Team2ID`,`S`.`Tore1` AS `Tore1`,`S`.`Tore2` AS `Tore2`,`N_one`.`Vorname` AS `Team1Sp1Vor`,`N_one`.`Nickname` AS `Team1Sp1Nic`,`N_one`.`Name` AS `Team1Sp1Nac`,`S`.`Team1Sp1` AS `Team1Sp1`,`N_two`.`Vorname` AS `Team1Sp2Vor`,`N_two`.`Nickname` AS `Team1Sp2Nic`,`N_two`.`Name` AS `Team1Sp2Nac`,`S`.`Team1Sp2` AS `Team1Sp2`,`N_thr`.`Vorname` AS `Team2Sp1Vor`,`N_thr`.`Nickname` AS `Team2Sp1Nic`,`N_thr`.`Name` AS `Team2Sp1Nac`,`S`.`Team2Sp1` AS `Team2Sp1`,`N_fou`.`Vorname` AS `Team2Sp2Vor`,`N_fou`.`Nickname` AS `Team2Sp2Nic`,`N_fou`.`Name` AS `Team2Sp2Nac`,`S`.`Team2Sp2` AS `Team2Sp2`,`S`.`Kommentar` AS `Kommentar` from ((((((`Spiele` `S` join `Teams` `T_one` on((`T_one`.`TeamID` = `S`.`Team1`))) join `Teams` `T_two` on((`T_two`.`TeamID` = `S`.`Team2`))) join `Spieler` `N_one` on((`N_one`.`SpielerID` = `S`.`Team1Sp1`))) join `Spieler` `N_two` on((`N_two`.`SpielerID` = `S`.`Team1Sp2`))) join `Spieler` `N_thr` on((`N_thr`.`SpielerID` = `S`.`Team2Sp1`))) join `Spieler` `N_fou` on((`N_fou`.`SpielerID` = `S`.`Team2Sp2`)));

--
-- VIEW  `V_Spiele`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
