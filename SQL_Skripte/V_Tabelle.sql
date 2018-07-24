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
-- Structure for view `V_Tabelle`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`captaindoerk_de`@`%` SQL SECURITY DEFINER VIEW `V_Tabelle` AS select `T`.`ID` AS `ID`,`T`.`Jahr` AS `Jahr`,`T`.`Platz` AS `Platz`,`N`.`Name` AS `TeamName`,`T`.`TeamID` AS `TeamID`,`N_one`.`Vorname` AS `Sp1Vor`,`N_one`.`Nickname` AS `Sp1Nic`,`N_one`.`Name` AS `Sp1Nac`,`T`.`Spieler1` AS `Spieler1`,`N_two`.`Vorname` AS `Sp2Vor`,`N_two`.`Nickname` AS `Sp2Nic`,`N_two`.`Name` AS `Sp2Nac`,`T`.`Spieler2` AS `Spieler2`,`N_thr`.`Vorname` AS `Sp3Vor`,`N_thr`.`Nickname` AS `Sp3Nic`,`N_thr`.`Name` AS `Sp3Nac`,`T`.`Spieler3` AS `Spieler3`,`T`.`Spiele` AS `Spiele`,`T`.`Siege` AS `S`,`T`.`Unentschieden` AS `U`,`T`.`Niederlagen` AS `N`,`T`.`Punkte` AS `Punkte`,`T`.`ToreP` AS `ToreP`,`T`.`ToreM` AS `ToreM` from ((((`Tabelle` `T` join `Teams` `N` on((`N`.`TeamID` = `T`.`TeamID`))) left join `Spieler` `N_one` on((`N_one`.`SpielerID` = `T`.`Spieler1`))) left join `Spieler` `N_two` on((`N_two`.`SpielerID` = `T`.`Spieler2`))) left join `Spieler` `N_thr` on((`N_thr`.`SpielerID` = `T`.`Spieler3`))) order by `T`.`ID`;

--
-- VIEW  `V_Tabelle`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
