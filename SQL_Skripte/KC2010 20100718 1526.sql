-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.42-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema kc
--

CREATE DATABASE IF NOT EXISTS kc;
USE kc;

--
-- Temporary table structure for view `foxcup_v_spl`
--
DROP TABLE IF EXISTS `foxcup_v_spl`;
DROP VIEW IF EXISTS `foxcup_v_spl`;
CREATE TABLE `foxcup_v_spl` (
  `TeamA` varchar(30),
  `TeamB` varchar(30),
  `SpielID` int(10) unsigned,
  `Team1` varchar(45),
  `Team2` varchar(45),
  `Tore1` int(10) unsigned,
  `Tore2` int(10) unsigned,
  `X` int(10) unsigned,
  `Art` varchar(1)
);

--
-- Temporary table structure for view `foxcup_v_tbl`
--
DROP TABLE IF EXISTS `foxcup_v_tbl`;
DROP VIEW IF EXISTS `foxcup_v_tbl`;
CREATE TABLE `foxcup_v_tbl` (
  `TeamID` varchar(3),
  `TeamName` varchar(30),
  `Gruppe` varchar(1),
  `S` int(3) unsigned,
  `U` int(3) unsigned,
  `N` int(3) unsigned,
  `ToreP` int(4) unsigned,
  `ToreM` int(4) unsigned,
  `Punkte` int(3) unsigned,
  `Status` int(1) unsigned zerofill
);

--
-- Temporary table structure for view `kc2010_v_spl`
--
DROP TABLE IF EXISTS `kc2010_v_spl`;
DROP VIEW IF EXISTS `kc2010_v_spl`;
CREATE TABLE `kc2010_v_spl` (
  `TeamA` varchar(30),
  `TeamB` varchar(30),
  `SpielID` int(10) unsigned,
  `Team1` varchar(3),
  `Team2` varchar(3),
  `Tore1` int(10) unsigned,
  `Tore2` int(10) unsigned,
  `X` int(10) unsigned,
  `Gruppe` varchar(3)
);

--
-- Temporary table structure for view `kc2010_v_tbl`
--
DROP TABLE IF EXISTS `kc2010_v_tbl`;
DROP VIEW IF EXISTS `kc2010_v_tbl`;
CREATE TABLE `kc2010_v_tbl` (
  `TeamID` varchar(3),
  `TeamName` varchar(30),
  `Team1` varchar(45),
  `Gruppe` varchar(3),
  `Spiele` int(3) unsigned,
  `S` int(3) unsigned,
  `U` int(3) unsigned,
  `N` int(3) unsigned,
  `ToreP` int(4) unsigned,
  `ToreM` int(4) unsigned,
  `Punkte` int(3) unsigned,
  `Status` int(3) unsigned
);

--
-- Temporary table structure for view `soccercup2010_v_spl`
--
DROP TABLE IF EXISTS `soccercup2010_v_spl`;
DROP VIEW IF EXISTS `soccercup2010_v_spl`;
CREATE TABLE `soccercup2010_v_spl` (
  `TeamA` varchar(30),
  `TeamB` varchar(30),
  `SpielID` int(10) unsigned,
  `Team1` varchar(45),
  `Team2` varchar(45),
  `Tore1` int(10) unsigned,
  `Tore2` int(10) unsigned,
  `X` int(10) unsigned,
  `Gruppe` varchar(1)
);

--
-- Temporary table structure for view `soccercup2010_v_tbl`
--
DROP TABLE IF EXISTS `soccercup2010_v_tbl`;
DROP VIEW IF EXISTS `soccercup2010_v_tbl`;
CREATE TABLE `soccercup2010_v_tbl` (
  `TeamID` varchar(3),
  `TeamName` varchar(30),
  `Gruppe` varchar(1),
  `S` int(3) unsigned,
  `U` int(3) unsigned,
  `N` int(3) unsigned,
  `ToreP` int(4) unsigned,
  `ToreM` int(4) unsigned,
  `Punkte` int(3) unsigned,
  `Status` int(1) unsigned zerofill
);

--
-- Temporary table structure for view `view_kc09_spiele`
--
DROP TABLE IF EXISTS `view_kc09_spiele`;
DROP VIEW IF EXISTS `view_kc09_spiele`;
CREATE TABLE `view_kc09_spiele` (
  `TeamA` varchar(45),
  `TeamB` varchar(45),
  `SpielID` int(10) unsigned,
  `Team1` int(3) unsigned,
  `Team2` int(3) unsigned,
  `Tore1` int(10) unsigned,
  `Tore2` int(10) unsigned,
  `X` int(10) unsigned,
  `Art` varchar(1)
);

--
-- Definition of table `_tpl_spielbericht`
--

DROP TABLE IF EXISTS `_tpl_spielbericht`;
CREATE TABLE `_tpl_spielbericht` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_tpl_spielbericht`
--

/*!40000 ALTER TABLE `_tpl_spielbericht` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tpl_spielbericht` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan`
--

DROP TABLE IF EXISTS `_tpl_spielplan`;
CREATE TABLE `_tpl_spielplan` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(3) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(3) CHARACTER SET latin1 NOT NULL,
  `Tore1` int(10) unsigned DEFAULT NULL,
  `Tore2` int(10) unsigned DEFAULT NULL,
  `X` int(10) unsigned NOT NULL DEFAULT '0',
  `Gruppe` varchar(3) NOT NULL,
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `_tpl_spielplan`
--

/*!40000 ALTER TABLE `_tpl_spielplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tpl_spielplan` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x3`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x3`;
CREATE TABLE `_tpl_spielplan_1x3` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x3`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x3` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x3` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'3','1',2),
 (3,'2','3',3);
/*!40000 ALTER TABLE `_tpl_spielplan_1x3` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x4`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x4`;
CREATE TABLE `_tpl_spielplan_1x4` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x4`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x4` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x4` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'3','4',1),
 (3,'1','3',2),
 (4,'2','4',2),
 (5,'4','1',3),
 (6,'2','3',3);
/*!40000 ALTER TABLE `_tpl_spielplan_1x4` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x5`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x5`;
CREATE TABLE `_tpl_spielplan_1x5` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x5`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x5` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x5` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'3','4',1),
 (3,'5','1',2),
 (4,'3','2',2),
 (5,'4','5',3),
 (6,'1','3',3),
 (7,'2','5',4),
 (8,'4','1',4),
 (9,'5','3',5),
 (10,'2','4',5);
/*!40000 ALTER TABLE `_tpl_spielplan_1x5` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x6`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x6`;
CREATE TABLE `_tpl_spielplan_1x6` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x6`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x6` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x6` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'2','4',1),
 (3,'5','6',1),
 (4,'1','3',2),
 (5,'2','5',2),
 (6,'6','4',2),
 (7,'3','2',3),
 (8,'5','4',3),
 (9,'1','6',3),
 (10,'3','5',4),
 (11,'2','6',4),
 (12,'4','1',4),
 (13,'6','3',5),
 (14,'1','5',5),
 (15,'4','2',5);
/*!40000 ALTER TABLE `_tpl_spielplan_1x6` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x7`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x7`;
CREATE TABLE `_tpl_spielplan_1x7` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x7`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x7` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x7` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'3','4',1),
 (3,'5','6',1),
 (4,'7','1',2),
 (5,'2','3',2),
 (6,'4','5',2),
 (7,'6','7',3),
 (8,'1','3',3),
 (9,'5','2',3),
 (10,'7','4',4),
 (11,'6','1',4),
 (12,'3','5',4),
 (13,'2','7',5),
 (14,'4','6',5),
 (15,'1','5',5),
 (16,'7','3',6),
 (17,'6','2',6),
 (18,'4','1',6),
 (19,'5','7',7),
 (20,'3','6',7),
 (21,'2','4',7);
/*!40000 ALTER TABLE `_tpl_spielplan_1x7` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x8`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x8`;
CREATE TABLE `_tpl_spielplan_1x8` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x8`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x8` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x8` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'3','4',1),
 (3,'5','6',1),
 (4,'7','8',1),
 (5,'1','3',2),
 (6,'2','5',2),
 (7,'4','7',2),
 (8,'6','8',2),
 (9,'5','1',3),
 (10,'3','7',3),
 (11,'8','2',3),
 (12,'4','6',3),
 (13,'1','7',4),
 (14,'5','8',4),
 (15,'6','3',4),
 (16,'2','4',4),
 (17,'8','1',5),
 (18,'7','6',5),
 (19,'4','5',5),
 (20,'3','2',5),
 (21,'1','6',6),
 (22,'8','4',6),
 (23,'2','7',6),
 (24,'5','3',6),
 (25,'4','1',7),
 (26,'6','2',7),
 (27,'3','8',7),
 (28,'7','5',7);
/*!40000 ALTER TABLE `_tpl_spielplan_1x8` ENABLE KEYS */;


--
-- Definition of table `_tpl_spielplan_1x9`
--

DROP TABLE IF EXISTS `_tpl_spielplan_1x9`;
CREATE TABLE `_tpl_spielplan_1x9` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Runde` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `_tpl_spielplan_1x9`
--

/*!40000 ALTER TABLE `_tpl_spielplan_1x9` DISABLE KEYS */;
INSERT INTO `_tpl_spielplan_1x9` (`SpielID`,`Team1`,`Team2`,`Runde`) VALUES 
 (1,'1','2',1),
 (2,'3','4',1),
 (3,'5','6',1),
 (4,'7','8',1),
 (5,'9','1',2),
 (6,'2','3',2),
 (7,'4','5',2),
 (8,'6','7',2),
 (9,'8','9',3),
 (10,'1','3',3),
 (11,'5','2',3),
 (12,'7','4',3),
 (13,'9','6',4),
 (14,'8','1',4),
 (15,'3','5',4),
 (16,'2','7',4),
 (17,'4','9',5),
 (18,'6','8',5),
 (19,'1','5',5),
 (20,'7','3',5),
 (21,'9','2',6),
 (22,'8','4',6),
 (23,'6','1',6),
 (24,'5','7',6),
 (25,'3','9',7),
 (26,'2','8',7),
 (27,'4','6',7),
 (28,'1','7',7),
 (29,'9','5',8),
 (30,'8','3',8),
 (31,'6','2',8),
 (32,'4','1',8),
 (33,'7','9',9),
 (34,'5','8',9),
 (35,'3','6',9),
 (36,'2','4',9);
/*!40000 ALTER TABLE `_tpl_spielplan_1x9` ENABLE KEYS */;


--
-- Definition of table `_tpl_tabelle`
--

DROP TABLE IF EXISTS `_tpl_tabelle`;
CREATE TABLE `_tpl_tabelle` (
  `TeamID` int(3) unsigned NOT NULL,
  `Spieler1` int(3) DEFAULT NULL,
  `Spieler2` int(3) DEFAULT NULL,
  `Spieler3` int(3) unsigned DEFAULT '0',
  `Spieler4` int(3) unsigned DEFAULT '0',
  `Spiele` int(3) unsigned DEFAULT '0',
  `S` int(3) unsigned DEFAULT '0',
  `U` int(3) unsigned DEFAULT '0',
  `N` int(3) unsigned DEFAULT '0',
  `ToreP` int(4) unsigned DEFAULT '0',
  `ToreM` int(4) unsigned DEFAULT '0',
  `Punkte` int(3) unsigned DEFAULT '0',
  `Gruppe` varchar(3) DEFAULT NULL,
  `Status` int(3) unsigned DEFAULT '1',
  `Team1` varchar(45) NOT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `_tpl_tabelle`
--

/*!40000 ALTER TABLE `_tpl_tabelle` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tpl_tabelle` ENABLE KEYS */;


--
-- Definition of table `_tpl_teams`
--

DROP TABLE IF EXISTS `_tpl_teams`;
CREATE TABLE `_tpl_teams` (
  `TeamID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Gruppe` int(10) unsigned NOT NULL,
  `Team` int(10) unsigned NOT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_tpl_teams`
--

/*!40000 ALTER TABLE `_tpl_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tpl_teams` ENABLE KEYS */;


--
-- Definition of table `_tpl_tore`
--

DROP TABLE IF EXISTS `_tpl_tore`;
CREATE TABLE `_tpl_tore` (
  `Spieler` varchar(30) NOT NULL,
  `Team` varchar(30) NOT NULL,
  `Tore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Spieler`,`Team`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_tpl_tore`
--

/*!40000 ALTER TABLE `_tpl_tore` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tpl_tore` ENABLE KEYS */;


--
-- Definition of table `foxcup_spl`
--

DROP TABLE IF EXISTS `foxcup_spl`;
CREATE TABLE `foxcup_spl` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Tore1` int(10) unsigned DEFAULT NULL,
  `Tore2` int(10) unsigned DEFAULT NULL,
  `X` int(10) unsigned NOT NULL DEFAULT '0',
  `Art` varchar(1) NOT NULL,
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `foxcup_spl`
--

/*!40000 ALTER TABLE `foxcup_spl` DISABLE KEYS */;
INSERT INTO `foxcup_spl` (`SpielID`,`Team1`,`Team2`,`Tore1`,`Tore2`,`X`,`Art`) VALUES 
 (1,'1','29',NULL,NULL,0,'4'),
 (2,'25','42',NULL,NULL,0,'4'),
 (3,'2','28',NULL,NULL,0,'4'),
 (4,'33','22',NULL,NULL,0,'4'),
 (5,'1','29',NULL,NULL,0,'4'),
 (6,'25','42',NULL,NULL,0,'4'),
 (7,'2','28',NULL,NULL,0,'4'),
 (8,'33','22',NULL,NULL,0,'4');
/*!40000 ALTER TABLE `foxcup_spl` ENABLE KEYS */;


--
-- Definition of table `foxcup_tbl`
--

DROP TABLE IF EXISTS `foxcup_tbl`;
CREATE TABLE `foxcup_tbl` (
  `TeamID` int(3) unsigned NOT NULL,
  `Spieler1` int(3) DEFAULT NULL,
  `Spieler2` int(3) DEFAULT NULL,
  `Spieler3` int(3) unsigned DEFAULT '0',
  `Spieler4` int(3) unsigned DEFAULT '0',
  `Spiele` int(3) unsigned DEFAULT '0',
  `S` int(3) unsigned DEFAULT '0',
  `U` int(3) unsigned DEFAULT '0',
  `N` int(3) unsigned DEFAULT '0',
  `ToreP` int(4) unsigned DEFAULT '0',
  `ToreM` int(4) unsigned DEFAULT '0',
  `Punkte` int(3) unsigned DEFAULT '0',
  `Gruppe` varchar(1) DEFAULT NULL,
  `Status` int(1) unsigned zerofill DEFAULT '1',
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `foxcup_tbl`
--

/*!40000 ALTER TABLE `foxcup_tbl` DISABLE KEYS */;
INSERT INTO `foxcup_tbl` (`TeamID`,`Spieler1`,`Spieler2`,`Spieler3`,`Spieler4`,`Spiele`,`S`,`U`,`N`,`ToreP`,`ToreM`,`Punkte`,`Gruppe`,`Status`) VALUES 
 (1,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (2,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (22,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (25,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (28,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (29,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (33,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1),
 (42,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,1);
/*!40000 ALTER TABLE `foxcup_tbl` ENABLE KEYS */;


--
-- Definition of table `kc09_spiele`
--

DROP TABLE IF EXISTS `kc09_spiele`;
CREATE TABLE `kc09_spiele` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` int(3) unsigned NOT NULL,
  `Team2` int(3) unsigned NOT NULL,
  `Tore1` int(10) unsigned DEFAULT NULL,
  `Tore2` int(10) unsigned DEFAULT NULL,
  `X` int(10) unsigned NOT NULL DEFAULT '0',
  `Art` varchar(1) NOT NULL,
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 PACK_KEYS=1;

--
-- Dumping data for table `kc09_spiele`
--

/*!40000 ALTER TABLE `kc09_spiele` DISABLE KEYS */;
INSERT INTO `kc09_spiele` (`SpielID`,`Team1`,`Team2`,`Tore1`,`Tore2`,`X`,`Art`) VALUES 
 (1,1,2,0,1,8,'a'),
 (2,3,4,0,0,8,'a'),
 (3,5,6,0,0,8,'a'),
 (4,7,8,NULL,NULL,0,'b'),
 (5,9,10,0,0,8,'b'),
 (6,11,12,NULL,NULL,0,'b'),
 (7,13,14,0,0,8,'c'),
 (8,15,16,0,0,8,'c'),
 (9,17,18,NULL,NULL,0,'c'),
 (10,3,1,NULL,NULL,0,'a'),
 (11,4,5,NULL,NULL,0,'a'),
 (12,6,2,NULL,NULL,0,'a'),
 (13,9,7,NULL,NULL,0,'b'),
 (14,10,11,NULL,NULL,0,'b'),
 (15,12,8,NULL,NULL,0,'b'),
 (16,15,13,NULL,NULL,0,'c'),
 (17,16,17,NULL,NULL,0,'c'),
 (18,18,14,NULL,NULL,0,'c'),
 (19,1,4,NULL,NULL,0,'a'),
 (20,5,2,NULL,NULL,0,'a'),
 (21,3,6,NULL,NULL,0,'a'),
 (22,7,10,NULL,NULL,0,'b'),
 (23,11,8,NULL,NULL,0,'b'),
 (24,9,12,NULL,NULL,0,'b'),
 (25,13,16,NULL,NULL,0,'c'),
 (26,17,14,NULL,NULL,0,'c'),
 (27,15,18,NULL,NULL,0,'c'),
 (28,1,5,NULL,NULL,0,'a'),
 (29,4,6,NULL,NULL,0,'a'),
 (30,2,3,NULL,NULL,0,'a'),
 (31,7,11,NULL,NULL,0,'b'),
 (32,10,12,NULL,NULL,0,'b'),
 (33,8,9,NULL,NULL,0,'b'),
 (34,13,17,NULL,NULL,0,'c'),
 (35,16,18,NULL,NULL,0,'c'),
 (36,14,15,NULL,NULL,0,'c'),
 (37,6,1,NULL,NULL,0,'a'),
 (38,2,4,NULL,NULL,0,'a'),
 (39,3,5,NULL,NULL,0,'a'),
 (40,12,7,NULL,NULL,0,'b'),
 (41,8,10,NULL,NULL,0,'b'),
 (42,9,11,NULL,NULL,0,'b'),
 (43,18,13,NULL,NULL,0,'c'),
 (44,14,16,NULL,NULL,0,'c'),
 (45,15,17,NULL,NULL,0,'c');
/*!40000 ALTER TABLE `kc09_spiele` ENABLE KEYS */;


--
-- Definition of table `kc2010_01_100200_deportivo_vs_dynamisches_duo`
--

DROP TABLE IF EXISTS `kc2010_01_100200_deportivo_vs_dynamisches_duo`;
CREATE TABLE `kc2010_01_100200_deportivo_vs_dynamisches_duo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_01_100200_deportivo_vs_dynamisches_duo`
--

/*!40000 ALTER TABLE `kc2010_01_100200_deportivo_vs_dynamisches_duo` DISABLE KEYS */;
INSERT INTO `kc2010_01_100200_deportivo_vs_dynamisches_duo` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:35',0,1,'Dynamisches Duo','Phantastic Phil',NULL),
 (2,'01:10',0,2,'Dynamisches Duo','Eise',NULL),
 (3,'02:47',1,2,'Deportivo','Fjen',NULL),
 (4,'03:09',1,3,'Dynamisches Duo','Eise',NULL),
 (5,'04:55',1,4,'Dynamisches Duo','Phantastic Phil',NULL),
 (6,'05:49',1,5,'Dynamisches Duo','Phantastic Phil',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'06:12',1,6,'Dynamisches Duo','Eise',NULL),
 (9,'06:29',1,7,'Dynamisches Duo','Phantastic Phil',NULL),
 (10,'08:34',2,7,'Deportivo','Inge',NULL),
 (11,'08:46',2,8,'Dynamisches Duo','Eise',NULL),
 (12,'09:37',2,9,'Dynamisches Duo','Phantastic Phil',NULL),
 (13,'09:52',2,10,'Dynamisches Duo','Phantastic Phil',NULL);
/*!40000 ALTER TABLE `kc2010_01_100200_deportivo_vs_dynamisches_duo` ENABLE KEYS */;


--
-- Definition of table `kc2010_02_101439_olympiakos_vs_gaffel_kölsch`
--

DROP TABLE IF EXISTS `kc2010_02_101439_olympiakos_vs_gaffel_kölsch`;
CREATE TABLE `kc2010_02_101439_olympiakos_vs_gaffel_kölsch` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_02_101439_olympiakos_vs_gaffel_kölsch`
--

/*!40000 ALTER TABLE `kc2010_02_101439_olympiakos_vs_gaffel_kölsch` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_02_101439_olympiakos_vs_gaffel_kölsch` ENABLE KEYS */;


--
-- Definition of table `kc2010_02_101551_olympiakos_vs_gaffel_kölsch`
--

DROP TABLE IF EXISTS `kc2010_02_101551_olympiakos_vs_gaffel_kölsch`;
CREATE TABLE `kc2010_02_101551_olympiakos_vs_gaffel_kölsch` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_02_101551_olympiakos_vs_gaffel_kölsch`
--

/*!40000 ALTER TABLE `kc2010_02_101551_olympiakos_vs_gaffel_kölsch` DISABLE KEYS */;
INSERT INTO `kc2010_02_101551_olympiakos_vs_gaffel_kölsch` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:13',1,0,'Olympiakos','Andreas K.',NULL),
 (2,'02:33',2,0,'Olympiakos','Andreas K.',NULL),
 (3,'02:54',3,0,'Olympiakos','Theo',NULL),
 (4,'04:29',3,1,'Gaffel Kölsch','Rio',NULL),
 (5,'04:56',3,2,'Gaffel Kölsch','Der Jupp',NULL),
 (6,'06:09',4,2,'Olympiakos','Andreas K.',NULL),
 (7,'06:29',5,2,'Olympiakos','Theo',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'07:18',6,2,'Olympiakos','Theo',NULL),
 (10,'07:42',7,2,'Olympiakos','Andreas K.',NULL),
 (11,'08:24',8,2,'Olympiakos','Theo',NULL),
 (12,'09:20',9,2,'Olympiakos','Andreas K.',NULL),
 (13,'09:37',10,2,'Olympiakos','Theo',NULL);
/*!40000 ALTER TABLE `kc2010_02_101551_olympiakos_vs_gaffel_kölsch` ENABLE KEYS */;


--
-- Definition of table `kc2010_03_101449_condom_kickers_vs_bergmacht`
--

DROP TABLE IF EXISTS `kc2010_03_101449_condom_kickers_vs_bergmacht`;
CREATE TABLE `kc2010_03_101449_condom_kickers_vs_bergmacht` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_03_101449_condom_kickers_vs_bergmacht`
--

/*!40000 ALTER TABLE `kc2010_03_101449_condom_kickers_vs_bergmacht` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_03_101449_condom_kickers_vs_bergmacht` ENABLE KEYS */;


--
-- Definition of table `kc2010_03_102604_condom_kickers_vs_bergmacht`
--

DROP TABLE IF EXISTS `kc2010_03_102604_condom_kickers_vs_bergmacht`;
CREATE TABLE `kc2010_03_102604_condom_kickers_vs_bergmacht` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_03_102604_condom_kickers_vs_bergmacht`
--

/*!40000 ALTER TABLE `kc2010_03_102604_condom_kickers_vs_bergmacht` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_03_102604_condom_kickers_vs_bergmacht` ENABLE KEYS */;


--
-- Definition of table `kc2010_03_102717_condom_kickers_vs_bergmacht`
--

DROP TABLE IF EXISTS `kc2010_03_102717_condom_kickers_vs_bergmacht`;
CREATE TABLE `kc2010_03_102717_condom_kickers_vs_bergmacht` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_03_102717_condom_kickers_vs_bergmacht`
--

/*!40000 ALTER TABLE `kc2010_03_102717_condom_kickers_vs_bergmacht` DISABLE KEYS */;
INSERT INTO `kc2010_03_102717_condom_kickers_vs_bergmacht` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:07',0,1,'Bergmacht','Dave vom Berg',NULL),
 (2,'00:38',0,2,'Bergmacht','Dave vom Berg',NULL),
 (3,'01:58',1,2,'Condom Kickers','Moritz',NULL),
 (4,'02:31',1,3,'Bergmacht','Flo vom Berg',NULL),
 (5,'03:49',2,3,'Condom Kickers','Moritz',NULL),
 (6,'04:04',3,3,'Condom Kickers','Shorty',NULL),
 (7,'04:36',3,4,'Bergmacht','Flo vom Berg',NULL),
 (8,'04:55',3,5,'Bergmacht','Flo vom Berg',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'05:39',3,6,'Bergmacht','Flo vom Berg',NULL),
 (11,'05:46',4,6,'Condom Kickers','Shorty',NULL),
 (12,'07:12',5,6,'Condom Kickers','Mausi',NULL),
 (13,'07:25',6,6,'Condom Kickers','Mausi',NULL),
 (14,'07:42',6,7,'Bergmacht','Flo vom Berg',NULL),
 (15,'07:55',6,8,'Bergmacht','Flo vom Berg',NULL),
 (16,'08:06',7,8,'Condom Kickers','Shorty',NULL),
 (17,'09:18',7,9,'Bergmacht','Flo vom Berg',NULL),
 (18,'09:33',8,9,'Condom Kickers','Shorty',NULL),
 (19,'10:01',8,10,'Bergmacht','Flo vom Berg',NULL);
/*!40000 ALTER TABLE `kc2010_03_102717_condom_kickers_vs_bergmacht` ENABLE KEYS */;


--
-- Definition of table `kc2010_04_104217_ensinger_vs_tesa_power`
--

DROP TABLE IF EXISTS `kc2010_04_104217_ensinger_vs_tesa_power`;
CREATE TABLE `kc2010_04_104217_ensinger_vs_tesa_power` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_04_104217_ensinger_vs_tesa_power`
--

/*!40000 ALTER TABLE `kc2010_04_104217_ensinger_vs_tesa_power` DISABLE KEYS */;
INSERT INTO `kc2010_04_104217_ensinger_vs_tesa_power` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:46',1,0,'Ensinger','Jens L.',NULL),
 (2,'01:34',1,1,'Tesa Power','Dirk L.',NULL),
 (3,'02:32',2,1,'Ensinger','Jens L.',NULL),
 (4,'03:42',3,2,'Tesa Power','Dirk L.',NULL),
 (5,'04:37',4,2,'Ensinger','Buzz-T',NULL),
 (6,'05:57',4,3,'Tesa Power','Timo P.',NULL),
 (7,'08:00',5,3,'Ensinger','Buzz-T',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'08:20',5,4,'Tesa Power','Dirk L.',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'08:34',6,4,'Ensinger','Buzz-T',NULL),
 (12,'09:06',6,5,'Tesa Power','Dirk L.',NULL),
 (13,'09:09',7,5,'Ensinger','Jens L.',NULL);
/*!40000 ALTER TABLE `kc2010_04_104217_ensinger_vs_tesa_power` ENABLE KEYS */;


--
-- Definition of table `kc2010_05_105615_oransina_vs_porsche`
--

DROP TABLE IF EXISTS `kc2010_05_105615_oransina_vs_porsche`;
CREATE TABLE `kc2010_05_105615_oransina_vs_porsche` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_05_105615_oransina_vs_porsche`
--

/*!40000 ALTER TABLE `kc2010_05_105615_oransina_vs_porsche` DISABLE KEYS */;
INSERT INTO `kc2010_05_105615_oransina_vs_porsche` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:44',0,1,'Porsche','Luca T.',NULL),
 (2,'02:03',0,2,'Porsche','Luca T.',NULL),
 (3,'04:19',1,2,'Oransina','Sina',NULL),
 (4,'05:10',1,3,'Porsche','Mad Maz',NULL),
 (5,'05:40',2,3,'Oransina','Seba',NULL),
 (6,'06:12',2,4,'Porsche','Luca T.',NULL),
 (7,'09:00',2,5,'Porsche','Luca T.',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--');
/*!40000 ALTER TABLE `kc2010_05_105615_oransina_vs_porsche` ENABLE KEYS */;


--
-- Definition of table `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle`
--

DROP TABLE IF EXISTS `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle`;
CREATE TABLE `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle`
--

/*!40000 ALTER TABLE `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle` DISABLE KEYS */;
INSERT INTO `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:38',1,0,'Sion Kölsch','Emre',NULL),
 (2,'03:25',2,1,'die wilden Kerle','Jet-Ski',NULL),
 (3,'04:21',2,2,'die wilden Kerle','Jet-Ski',NULL),
 (4,'05:48',3,2,'Sion Kölsch','Emre',NULL),
 (5,'06:00',4,2,'Sion Kölsch','Emre',NULL),
 (6,'06:32',5,2,'Sion Kölsch','Emre',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'07:40',5,3,'die wilden Kerle','Dolschewida',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'08:47',6,3,'Sion Kölsch','Captain Doerk',NULL),
 (11,'09:54',7,3,'Sion Kölsch','Captain Doerk',NULL);
/*!40000 ALTER TABLE `kc2010_07_112015_sion_kölsch_vs_die_wilden_kerle` ENABLE KEYS */;


--
-- Definition of table `kc2010_08_113423_sparda_orange_vs_wolfbräu`
--

DROP TABLE IF EXISTS `kc2010_08_113423_sparda_orange_vs_wolfbräu`;
CREATE TABLE `kc2010_08_113423_sparda_orange_vs_wolfbräu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_08_113423_sparda_orange_vs_wolfbräu`
--

/*!40000 ALTER TABLE `kc2010_08_113423_sparda_orange_vs_wolfbräu` DISABLE KEYS */;
INSERT INTO `kc2010_08_113423_sparda_orange_vs_wolfbräu` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:48',1,0,'Sparda Orange','Fips',NULL),
 (2,'00:58',1,1,'Wolfbräu','Ben vom Berg',NULL),
 (3,'01:53',1,2,'Wolfbräu','Tha Man',NULL),
 (4,'02:32',2,2,'Sparda Orange','Schlampe',NULL),
 (5,'04:01',2,3,'Wolfbräu','Ben vom Berg',NULL),
 (6,'05:50',3,3,'Sparda Orange','Schlampe',NULL),
 (7,'09:23',6,4,'Sparda Orange','Schlampe',NULL);
/*!40000 ALTER TABLE `kc2010_08_113423_sparda_orange_vs_wolfbräu` ENABLE KEYS */;


--
-- Definition of table `kc2010_09_114556_rothaus_vs_sauffpark`
--

DROP TABLE IF EXISTS `kc2010_09_114556_rothaus_vs_sauffpark`;
CREATE TABLE `kc2010_09_114556_rothaus_vs_sauffpark` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_09_114556_rothaus_vs_sauffpark`
--

/*!40000 ALTER TABLE `kc2010_09_114556_rothaus_vs_sauffpark` DISABLE KEYS */;
INSERT INTO `kc2010_09_114556_rothaus_vs_sauffpark` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:04',1,0,'Rothaus','Wieland',NULL),
 (2,'02:40',2,0,'Rothaus','Wieland',NULL),
 (3,'03:58',2,1,'Sauffpark','Mahony',NULL),
 (4,'04:22',3,1,'Rothaus','Wieland',NULL),
 (5,'04:49',3,2,'Sauffpark','Mahony',NULL),
 (6,'05:31',4,2,'Rothaus','Fraggy',NULL),
 (7,'05:53',5,2,'Rothaus','Fraggy',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'06:23',5,3,'Sauffpark','Shooter',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'06:39',6,3,'Rothaus','Wieland',NULL),
 (12,'07:47',6,4,'Sauffpark','Mahony',NULL),
 (13,'08:20',7,4,'Rothaus','Fraggy',NULL);
/*!40000 ALTER TABLE `kc2010_09_114556_rothaus_vs_sauffpark` ENABLE KEYS */;


--
-- Definition of table `kc2010_10_121333_deportivo_vs_olympiakos`
--

DROP TABLE IF EXISTS `kc2010_10_121333_deportivo_vs_olympiakos`;
CREATE TABLE `kc2010_10_121333_deportivo_vs_olympiakos` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_10_121333_deportivo_vs_olympiakos`
--

/*!40000 ALTER TABLE `kc2010_10_121333_deportivo_vs_olympiakos` DISABLE KEYS */;
INSERT INTO `kc2010_10_121333_deportivo_vs_olympiakos` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:43',0,1,'Olympiakos','Andreas K.',NULL),
 (2,'01:48',0,2,'Olympiakos','Theo',NULL),
 (3,'02:46',0,3,'Olympiakos','Theo',NULL),
 (4,'03:04',0,4,'Olympiakos','Theo',NULL),
 (5,'03:18',1,4,'Deportivo','Fjen',NULL),
 (6,'03:31',1,5,'Olympiakos','Theo',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'04:53',1,6,'Olympiakos','Theo',NULL),
 (9,'05:44',1,7,'Olympiakos','Andreas K.',NULL),
 (10,'06:04',2,7,'Deportivo','Fjen',NULL),
 (11,'06:23',3,7,'Deportivo','Inge',NULL),
 (12,'06:45',3,8,'Olympiakos','Andreas K.',NULL),
 (13,'06:54',3,9,'Olympiakos','Theo',NULL),
 (14,'07:20',3,10,'Olympiakos','Theo',NULL);
/*!40000 ALTER TABLE `kc2010_10_121333_deportivo_vs_olympiakos` ENABLE KEYS */;


--
-- Definition of table `kc2010_11_122241_condom_kickers_vs_dynamisches_duo`
--

DROP TABLE IF EXISTS `kc2010_11_122241_condom_kickers_vs_dynamisches_duo`;
CREATE TABLE `kc2010_11_122241_condom_kickers_vs_dynamisches_duo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_11_122241_condom_kickers_vs_dynamisches_duo`
--

/*!40000 ALTER TABLE `kc2010_11_122241_condom_kickers_vs_dynamisches_duo` DISABLE KEYS */;
INSERT INTO `kc2010_11_122241_condom_kickers_vs_dynamisches_duo` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:58',1,0,'Condom Kickers','Shorty',NULL),
 (2,'01:50',1,1,'Dynamisches Duo','Eise',NULL),
 (3,'02:28',2,1,'Condom Kickers','Mausi',NULL),
 (4,'02:34',2,2,'Dynamisches Duo','Eise',NULL),
 (5,'03:17',2,3,'Dynamisches Duo','Eise',NULL),
 (6,'03:24',3,3,'Condom Kickers','Mausi',NULL),
 (7,'05:21',3,4,'Dynamisches Duo','Eise',NULL),
 (8,'07:03',4,5,'Dynamisches Duo','Eise',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'07:07',5,5,'Condom Kickers','Mausi',NULL),
 (11,'07:57',6,5,'Condom Kickers','Shorty',NULL),
 (12,'08:26',7,5,'Condom Kickers','Shorty',NULL),
 (13,'08:59',8,5,'Condom Kickers','Mausi',NULL),
 (14,'09:32',9,5,'Condom Kickers','Shorty',NULL),
 (15,'09:59',10,5,'Condom Kickers','Shorty',NULL);
/*!40000 ALTER TABLE `kc2010_11_122241_condom_kickers_vs_dynamisches_duo` ENABLE KEYS */;


--
-- Definition of table `kc2010_12_123405_bergmacht_vs_gaffel_kölsch`
--

DROP TABLE IF EXISTS `kc2010_12_123405_bergmacht_vs_gaffel_kölsch`;
CREATE TABLE `kc2010_12_123405_bergmacht_vs_gaffel_kölsch` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_12_123405_bergmacht_vs_gaffel_kölsch`
--

/*!40000 ALTER TABLE `kc2010_12_123405_bergmacht_vs_gaffel_kölsch` DISABLE KEYS */;
INSERT INTO `kc2010_12_123405_bergmacht_vs_gaffel_kölsch` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:00',1,0,'Bergmacht','Dave vom Berg',NULL),
 (2,'01:42',2,0,'Bergmacht','Dave vom Berg',NULL),
 (3,'02:07',3,0,'Bergmacht','Flo vom Berg',NULL),
 (4,'03:25',4,0,'Bergmacht','Flo vom Berg',NULL),
 (5,'04:44',5,0,'Bergmacht','Dave vom Berg',NULL),
 (6,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (7,'05:31',6,0,'Bergmacht','Dave vom Berg',NULL),
 (8,'05:59',6,1,'Gaffel Kölsch','Rio',NULL),
 (9,'06:14',7,1,'Bergmacht','Flo vom Berg',NULL),
 (10,'06:59',8,1,'Bergmacht','Dave vom Berg',NULL),
 (11,'07:26',9,1,'Bergmacht','Flo vom Berg',NULL),
 (12,'07:47',10,1,'Bergmacht','Dave vom Berg',NULL);
/*!40000 ALTER TABLE `kc2010_12_123405_bergmacht_vs_gaffel_kölsch` ENABLE KEYS */;


--
-- Definition of table `kc2010_13_124403_ensinger_vs_oransina`
--

DROP TABLE IF EXISTS `kc2010_13_124403_ensinger_vs_oransina`;
CREATE TABLE `kc2010_13_124403_ensinger_vs_oransina` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_13_124403_ensinger_vs_oransina`
--

/*!40000 ALTER TABLE `kc2010_13_124403_ensinger_vs_oransina` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_13_124403_ensinger_vs_oransina` ENABLE KEYS */;


--
-- Definition of table `kc2010_13_124602_ensinger_vs_oransina`
--

DROP TABLE IF EXISTS `kc2010_13_124602_ensinger_vs_oransina`;
CREATE TABLE `kc2010_13_124602_ensinger_vs_oransina` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_13_124602_ensinger_vs_oransina`
--

/*!40000 ALTER TABLE `kc2010_13_124602_ensinger_vs_oransina` DISABLE KEYS */;
INSERT INTO `kc2010_13_124602_ensinger_vs_oransina` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:39',0,1,'Oransina','Seba',NULL),
 (2,'01:17',1,1,'Ensinger','Buzz-T',NULL),
 (3,'01:58',2,1,'Ensinger','Buzz-T',NULL),
 (4,'04:04',2,3,'Oransina','Seba',NULL),
 (5,'04:34',2,4,'Oransina','Seba',NULL),
 (6,'05:24',2,5,'Oransina','Sina',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'06:34',2,6,'Oransina','Sina',NULL),
 (9,'07:32',2,7,'Oransina','Seba',NULL),
 (10,'08:44',3,7,'Ensinger','Jens L.',NULL);
/*!40000 ALTER TABLE `kc2010_13_124602_ensinger_vs_oransina` ENABLE KEYS */;


--
-- Definition of table `kc2010_14_125830_waldmeister_vs_tesa_power`
--

DROP TABLE IF EXISTS `kc2010_14_125830_waldmeister_vs_tesa_power`;
CREATE TABLE `kc2010_14_125830_waldmeister_vs_tesa_power` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_14_125830_waldmeister_vs_tesa_power`
--

/*!40000 ALTER TABLE `kc2010_14_125830_waldmeister_vs_tesa_power` DISABLE KEYS */;
INSERT INTO `kc2010_14_125830_waldmeister_vs_tesa_power` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:43',1,0,'Waldmeister','Mario vom Wald',NULL),
 (2,'00:55',1,1,'Tesa Power','Timo P.',NULL),
 (3,'01:09',2,1,'Waldmeister','Mario vom Wald',NULL),
 (4,'01:23',3,1,'Waldmeister','Mario vom Wald',NULL),
 (5,'01:37',4,1,'Waldmeister','Ben vom Wald',NULL),
 (6,'02:07',5,1,'Waldmeister','Ben vom Wald',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'02:43',6,1,'Waldmeister','Mario vom Wald',NULL),
 (9,'02:56',7,1,'Waldmeister','Mario vom Wald',NULL),
 (10,'05:22',8,1,'Waldmeister','Mario vom Wald',NULL),
 (11,'05:30',9,1,'Waldmeister','Ben vom Wald',NULL),
 (12,'05:37',10,1,'Waldmeister','Ben vom Wald',NULL);
/*!40000 ALTER TABLE `kc2010_14_125830_waldmeister_vs_tesa_power` ENABLE KEYS */;


--
-- Definition of table `kc2010_16_132022_sion_kölsch_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_16_132022_sion_kölsch_vs_sparda_orange`;
CREATE TABLE `kc2010_16_132022_sion_kölsch_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_16_132022_sion_kölsch_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_16_132022_sion_kölsch_vs_sparda_orange` DISABLE KEYS */;
INSERT INTO `kc2010_16_132022_sion_kölsch_vs_sparda_orange` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'05:30',1,0,'Sion Kölsch','Emre',NULL),
 (2,'06:26',1,1,'Sparda Orange','Fips',NULL);
/*!40000 ALTER TABLE `kc2010_16_132022_sion_kölsch_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_17_134349_rothaus_vs_die_wilden_kerle`
--

DROP TABLE IF EXISTS `kc2010_17_134349_rothaus_vs_die_wilden_kerle`;
CREATE TABLE `kc2010_17_134349_rothaus_vs_die_wilden_kerle` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_17_134349_rothaus_vs_die_wilden_kerle`
--

/*!40000 ALTER TABLE `kc2010_17_134349_rothaus_vs_die_wilden_kerle` DISABLE KEYS */;
INSERT INTO `kc2010_17_134349_rothaus_vs_die_wilden_kerle` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:17',0,1,'die wilden Kerle','Dolschewida',NULL),
 (2,'02:45',0,2,'die wilden Kerle','Jet-Ski',NULL),
 (3,'03:29',0,3,'die wilden Kerle','Jet-Ski',NULL),
 (4,'03:45',1,3,'Rothaus','Fraggy',NULL),
 (5,'03:57',1,4,'die wilden Kerle','Jet-Ski',NULL),
 (6,'05:13',2,4,'Rothaus','Wieland',NULL),
 (7,'05:35',3,4,'Rothaus','Wieland',NULL),
 (8,'06:24',3,5,'die wilden Kerle','Dolschewida',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'06:40',4,5,'Rothaus','Wieland',NULL),
 (11,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (12,'07:06',5,5,'Rothaus','Wieland',NULL);
/*!40000 ALTER TABLE `kc2010_17_134349_rothaus_vs_die_wilden_kerle` ENABLE KEYS */;


--
-- Definition of table `kc2010_18_140001_sauffpark_vs_wolfbräu`
--

DROP TABLE IF EXISTS `kc2010_18_140001_sauffpark_vs_wolfbräu`;
CREATE TABLE `kc2010_18_140001_sauffpark_vs_wolfbräu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_18_140001_sauffpark_vs_wolfbräu`
--

/*!40000 ALTER TABLE `kc2010_18_140001_sauffpark_vs_wolfbräu` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_18_140001_sauffpark_vs_wolfbräu` ENABLE KEYS */;


--
-- Definition of table `kc2010_18_140018_sauffpark_vs_wolfbräu`
--

DROP TABLE IF EXISTS `kc2010_18_140018_sauffpark_vs_wolfbräu`;
CREATE TABLE `kc2010_18_140018_sauffpark_vs_wolfbräu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_18_140018_sauffpark_vs_wolfbräu`
--

/*!40000 ALTER TABLE `kc2010_18_140018_sauffpark_vs_wolfbräu` DISABLE KEYS */;
INSERT INTO `kc2010_18_140018_sauffpark_vs_wolfbräu` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:29',0,1,'Wolfbräu','Tha Man',NULL),
 (2,'01:26',0,2,'Wolfbräu','Tha Man',NULL),
 (3,'02:47',1,2,'Sauffpark','Mahony',NULL),
 (4,'04:09',2,2,'Sauffpark','Mahony',NULL),
 (5,'04:16',2,3,'Wolfbräu','Tha Man',NULL),
 (6,'04:24',3,3,'Sauffpark','Mahony',NULL),
 (7,'05:18',4,3,'Sauffpark','Mahony',NULL),
 (8,'05:59',4,4,'Wolfbräu','Tha Man',NULL),
 (9,'06:11',4,5,'Wolfbräu','Tha Man',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'07:14',5,5,'Sauffpark','Mahony',NULL),
 (12,'07:31',5,6,'Wolfbräu','Ben vom Berg',NULL),
 (13,'09:22',5,7,'Wolfbräu','Ben vom Berg',NULL),
 (14,'09:31',5,8,'Wolfbräu','Ben vom Berg',NULL);
/*!40000 ALTER TABLE `kc2010_18_140018_sauffpark_vs_wolfbräu` ENABLE KEYS */;


--
-- Definition of table `kc2010_19_141209_deportivo_vs_condom_kickers`
--

DROP TABLE IF EXISTS `kc2010_19_141209_deportivo_vs_condom_kickers`;
CREATE TABLE `kc2010_19_141209_deportivo_vs_condom_kickers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_19_141209_deportivo_vs_condom_kickers`
--

/*!40000 ALTER TABLE `kc2010_19_141209_deportivo_vs_condom_kickers` DISABLE KEYS */;
INSERT INTO `kc2010_19_141209_deportivo_vs_condom_kickers` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:57',0,1,'Condom Kickers','Shorty',NULL),
 (2,'03:34',0,3,'Condom Kickers','Shorty',NULL),
 (3,'05:28',0,4,'Condom Kickers','Shorty',NULL),
 (4,'05:57',0,5,'Condom Kickers','Mausi',NULL),
 (5,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (6,'06:39',0,6,'Condom Kickers','Moritz',NULL),
 (7,'07:21',0,7,'Condom Kickers','Mausi',NULL),
 (8,'07:34',0,8,'Condom Kickers','Mausi',NULL),
 (9,'08:20',0,9,'Condom Kickers','Mausi',NULL),
 (10,'08:42',0,10,'Condom Kickers','Mausi',NULL);
/*!40000 ALTER TABLE `kc2010_19_141209_deportivo_vs_condom_kickers` ENABLE KEYS */;


--
-- Definition of table `kc2010_20_143624_bergmacht_vs_olympiakos`
--

DROP TABLE IF EXISTS `kc2010_20_143624_bergmacht_vs_olympiakos`;
CREATE TABLE `kc2010_20_143624_bergmacht_vs_olympiakos` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_20_143624_bergmacht_vs_olympiakos`
--

/*!40000 ALTER TABLE `kc2010_20_143624_bergmacht_vs_olympiakos` DISABLE KEYS */;
INSERT INTO `kc2010_20_143624_bergmacht_vs_olympiakos` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:06',0,1,'Olympiakos','Andreas K.',NULL),
 (2,'00:37',1,1,'Bergmacht','Flo vom Berg',NULL),
 (3,'00:43',1,2,'Olympiakos','Theo',NULL),
 (4,'01:33',1,3,'Olympiakos','Theo',NULL),
 (5,'01:51',2,3,'Bergmacht','Flo vom Berg',NULL),
 (6,'02:52',2,4,'Olympiakos','Andreas K.',NULL),
 (7,'03:34',2,5,'Olympiakos','Theo',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'03:34',2,5,'Olympiakos','Theo',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'04:42',2,6,'Olympiakos','Andreas K.',NULL),
 (12,'05:25',2,7,'Olympiakos','Theo',NULL),
 (13,'05:37',3,7,'Bergmacht','Flo vom Berg',NULL),
 (14,'05:53',4,7,'Bergmacht','Flo vom Berg',NULL),
 (15,'06:38',4,8,'Olympiakos','Theo',NULL),
 (16,'07:07',5,8,'Bergmacht','Flo vom Berg',NULL),
 (17,'07:17',5,9,'Olympiakos','Andreas K.',NULL),
 (18,'07:49',6,9,'Bergmacht','Flo vom Berg',NULL),
 (19,'08:48',7,9,'Bergmacht','Dave vom Berg',NULL),
 (20,'09:01',7,10,'Olympiakos','Theo',NULL);
/*!40000 ALTER TABLE `kc2010_20_143624_bergmacht_vs_olympiakos` ENABLE KEYS */;


--
-- Definition of table `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo`
--

DROP TABLE IF EXISTS `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo`;
CREATE TABLE `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo`
--

/*!40000 ALTER TABLE `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo` DISABLE KEYS */;
INSERT INTO `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:44',0,1,'Dynamisches Duo','Phantastic Phil',NULL),
 (2,'01:55',1,1,'Gaffel Kölsch','Rio',NULL),
 (3,'02:17',2,1,'Gaffel Kölsch','Rio',NULL),
 (4,'02:50',3,1,'Gaffel Kölsch','Rio',NULL),
 (5,'03:02',4,1,'Gaffel Kölsch','Rio',NULL),
 (6,'03:21',5,1,'Gaffel Kölsch','Rio',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'04:15',5,2,'Dynamisches Duo','Phantastic Phil',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'04:33',6,2,'Gaffel Kölsch','Rio',NULL),
 (11,'04:52',6,3,'Dynamisches Duo','Phantastic Phil',NULL),
 (12,'07:14',7,3,'Gaffel Kölsch','Rio',NULL),
 (13,'08:28',7,4,'Dynamisches Duo','Phantastic Phil',NULL),
 (14,'09:07',8,4,'Gaffel Kölsch','Rio',NULL);
/*!40000 ALTER TABLE `kc2010_21_151648_gaffel_kölsch_vs_dynamisches_duo` ENABLE KEYS */;


--
-- Definition of table `kc2010_22_145030_ensinger_vs_waldmeister`
--

DROP TABLE IF EXISTS `kc2010_22_145030_ensinger_vs_waldmeister`;
CREATE TABLE `kc2010_22_145030_ensinger_vs_waldmeister` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_22_145030_ensinger_vs_waldmeister`
--

/*!40000 ALTER TABLE `kc2010_22_145030_ensinger_vs_waldmeister` DISABLE KEYS */;
INSERT INTO `kc2010_22_145030_ensinger_vs_waldmeister` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'02:21',0,1,'Waldmeister','Ben vom Wald',NULL),
 (2,'02:39',0,2,'Waldmeister','Ben vom Wald',NULL),
 (3,'03:01',0,3,'Waldmeister','Mario vom Wald',NULL),
 (4,'03:42',1,3,'Ensinger','Jens L.',NULL),
 (5,'03:57',1,4,'Waldmeister','Mario vom Wald',NULL),
 (6,'04:10',1,5,'Waldmeister','Mario vom Wald',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'04:26',1,6,'Waldmeister','Mario vom Wald',NULL),
 (9,'05:39',1,7,'Waldmeister','Mario vom Wald',NULL),
 (10,'05:45',2,7,'Ensinger','Jens L.',NULL),
 (11,'06:11',2,8,'Waldmeister','Mario vom Wald',NULL),
 (12,'06:43',3,8,'Ensinger','Buzz-T',NULL),
 (13,'07:15',3,9,'Waldmeister','Ben vom Wald',NULL),
 (14,'09:05',4,9,'Ensinger','Jens L.',NULL);
/*!40000 ALTER TABLE `kc2010_22_145030_ensinger_vs_waldmeister` ENABLE KEYS */;


--
-- Definition of table `kc2010_24_152851_porsche_vs_tesa_power`
--

DROP TABLE IF EXISTS `kc2010_24_152851_porsche_vs_tesa_power`;
CREATE TABLE `kc2010_24_152851_porsche_vs_tesa_power` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_24_152851_porsche_vs_tesa_power`
--

/*!40000 ALTER TABLE `kc2010_24_152851_porsche_vs_tesa_power` DISABLE KEYS */;
INSERT INTO `kc2010_24_152851_porsche_vs_tesa_power` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:04',1,0,'Porsche','Luca T.',NULL),
 (2,'00:19',2,0,'Porsche','Mad Maz',NULL),
 (3,'00:45',3,0,'Porsche','Luca T.',NULL),
 (4,'01:48',4,0,'Porsche','Mad Maz',NULL),
 (5,'02:17',5,0,'Porsche','Mad Maz',NULL),
 (6,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (7,'03:27',6,0,'Porsche','Luca T.',NULL),
 (8,'03:52',7,0,'Porsche','Luca T.',NULL),
 (9,'04:25',8,0,'Porsche','Luca T.',NULL),
 (10,'05:01',9,0,'Porsche','Mad Maz',NULL),
 (11,'05:59',10,0,'Porsche','Luca T.',NULL);
/*!40000 ALTER TABLE `kc2010_24_152851_porsche_vs_tesa_power` ENABLE KEYS */;


--
-- Definition of table `kc2010_25_153815_sion_kölsch_vs_rothaus`
--

DROP TABLE IF EXISTS `kc2010_25_153815_sion_kölsch_vs_rothaus`;
CREATE TABLE `kc2010_25_153815_sion_kölsch_vs_rothaus` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_25_153815_sion_kölsch_vs_rothaus`
--

/*!40000 ALTER TABLE `kc2010_25_153815_sion_kölsch_vs_rothaus` DISABLE KEYS */;
INSERT INTO `kc2010_25_153815_sion_kölsch_vs_rothaus` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:34',1,0,'Sion Kölsch','Captain Doerk',NULL),
 (2,'01:03',1,1,'Rothaus','Wieland',NULL),
 (3,'04:27',1,2,'Rothaus','Fraggy',NULL),
 (4,'05:46',1,3,'Rothaus','Wieland',NULL),
 (5,'07:07',2,3,'Sion Kölsch','Emre',NULL);
/*!40000 ALTER TABLE `kc2010_25_153815_sion_kölsch_vs_rothaus` ENABLE KEYS */;


--
-- Definition of table `kc2010_26_155018_sauffpark_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_26_155018_sauffpark_vs_sparda_orange`;
CREATE TABLE `kc2010_26_155018_sauffpark_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_26_155018_sauffpark_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_26_155018_sauffpark_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_26_155018_sauffpark_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_26_155024_sauffpark_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_26_155024_sauffpark_vs_sparda_orange`;
CREATE TABLE `kc2010_26_155024_sauffpark_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_26_155024_sauffpark_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_26_155024_sauffpark_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_26_155024_sauffpark_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_26_155029_sauffpark_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_26_155029_sauffpark_vs_sparda_orange`;
CREATE TABLE `kc2010_26_155029_sauffpark_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_26_155029_sauffpark_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_26_155029_sauffpark_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_26_155029_sauffpark_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_26_155056_sauffpark_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_26_155056_sauffpark_vs_sparda_orange`;
CREATE TABLE `kc2010_26_155056_sauffpark_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_26_155056_sauffpark_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_26_155056_sauffpark_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_26_155056_sauffpark_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_26_155113_sauffpark_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_26_155113_sauffpark_vs_sparda_orange`;
CREATE TABLE `kc2010_26_155113_sauffpark_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_26_155113_sauffpark_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_26_155113_sauffpark_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_26_155113_sauffpark_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_26_155123_sauffpark_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_26_155123_sauffpark_vs_sparda_orange`;
CREATE TABLE `kc2010_26_155123_sauffpark_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_26_155123_sauffpark_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_26_155123_sauffpark_vs_sparda_orange` DISABLE KEYS */;
INSERT INTO `kc2010_26_155123_sauffpark_vs_sparda_orange` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:43',0,1,'Sparda Orange','Schlampe',NULL),
 (2,'02:16',0,2,'Sparda Orange','Fips',NULL),
 (3,'03:33',0,4,'Sparda Orange','Fips',NULL),
 (4,'03:58',0,5,'Sparda Orange','Fips',NULL),
 (5,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (6,'04:33',1,5,'Sauffpark','Mahony',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'06:25',2,5,'Sauffpark','Mahony',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'06:40',2,6,'Sparda Orange','Fips',NULL),
 (11,'07:09',2,7,'Sparda Orange','Fips',NULL),
 (12,'07:46',2,8,'Sparda Orange','Fips',NULL),
 (13,'08:02',2,9,'Sparda Orange','Schlampe',NULL),
 (14,'08:18',2,10,'Sparda Orange','Fips',NULL);
/*!40000 ALTER TABLE `kc2010_26_155123_sauffpark_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle`
--

DROP TABLE IF EXISTS `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle`;
CREATE TABLE `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle`
--

/*!40000 ALTER TABLE `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle` DISABLE KEYS */;
INSERT INTO `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:09',1,0,'Wolfbräu','Ben vom Berg',NULL),
 (2,'01:31',1,1,'die wilden Kerle','Jet-Ski',NULL),
 (3,'01:39',2,1,'Wolfbräu','Ben vom Berg',NULL),
 (4,'04:00',3,1,'Wolfbräu','Tha Man',NULL),
 (5,'05:23',4,1,'Wolfbräu','Tha Man',NULL),
 (6,'06:26',5,1,'Wolfbräu','Ben vom Berg',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'08:03',5,2,'die wilden Kerle','Jet-Ski',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'08:27',6,2,'Wolfbräu','Tha Man',NULL),
 (11,'09:21',7,2,'Wolfbräu','Tha Man',NULL);
/*!40000 ALTER TABLE `kc2010_27_161422_wolfbräu_vs_die_wilden_kerle` ENABLE KEYS */;


--
-- Definition of table `kc2010_28_160552_deportivo_vs_bergmacht`
--

DROP TABLE IF EXISTS `kc2010_28_160552_deportivo_vs_bergmacht`;
CREATE TABLE `kc2010_28_160552_deportivo_vs_bergmacht` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_28_160552_deportivo_vs_bergmacht`
--

/*!40000 ALTER TABLE `kc2010_28_160552_deportivo_vs_bergmacht` DISABLE KEYS */;
INSERT INTO `kc2010_28_160552_deportivo_vs_bergmacht` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:03',0,1,'Bergmacht','Flo vom Berg',NULL),
 (2,'01:28',1,1,'Deportivo','Fjen',NULL),
 (3,'01:38',1,2,'Bergmacht','Flo vom Berg',NULL),
 (4,'02:01',2,2,'Deportivo','Fjen',NULL),
 (5,'03:01',2,3,'Bergmacht','Dave vom Berg',NULL),
 (6,'03:34',2,4,'Bergmacht','Dave vom Berg',NULL),
 (7,'04:09',3,4,'Deportivo','Fjen',NULL),
 (8,'04:19',3,5,'Bergmacht','Dave vom Berg',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'05:13',3,6,'Bergmacht','Flo vom Berg',NULL),
 (11,'05:31',3,7,'Bergmacht','Dave vom Berg',NULL),
 (12,'05:53',4,7,'Deportivo','Fjen',NULL),
 (13,'06:03',4,8,'Bergmacht','Dave vom Berg',NULL),
 (14,'06:21',5,8,'Deportivo','Fjen',NULL),
 (15,'06:39',5,9,'Bergmacht','Flo vom Berg',NULL),
 (16,'06:53',5,10,'Bergmacht','Flo vom Berg',NULL);
/*!40000 ALTER TABLE `kc2010_28_160552_deportivo_vs_bergmacht` ENABLE KEYS */;


--
-- Definition of table `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers`
--

DROP TABLE IF EXISTS `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers`;
CREATE TABLE `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers`
--

/*!40000 ALTER TABLE `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers` DISABLE KEYS */;
INSERT INTO `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:09',0,1,'Condom Kickers','Mausi',NULL),
 (2,'01:28',1,1,'Gaffel Kölsch','Rio',NULL),
 (3,'01:39',1,2,'Condom Kickers','Shorty',NULL),
 (4,'02:40',2,2,'Gaffel Kölsch','Der Jupp',NULL),
 (5,'03:30',2,3,'Condom Kickers','Mausi',NULL),
 (6,'03:45',3,3,'Gaffel Kölsch','Rio',NULL),
 (7,'04:23',3,4,'Condom Kickers','Shorty',NULL),
 (8,'04:41',3,5,'Condom Kickers','Shorty',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'05:57',4,5,'Gaffel Kölsch','Der Jupp',NULL),
 (11,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (12,'06:29',4,6,'Condom Kickers','Mausi',NULL),
 (13,'06:47',4,7,'Condom Kickers','Mausi',NULL),
 (14,'07:26',5,7,'Gaffel Kölsch','Rio',NULL),
 (15,'08:48',6,8,'Condom Kickers','Shorty',NULL),
 (16,'09:08',6,9,'Condom Kickers','Shorty',NULL),
 (17,'09:42',7,9,'Gaffel Kölsch','Der Jupp',NULL);
/*!40000 ALTER TABLE `kc2010_29_162723_gaffel_kölsch_vs_condom_kickers` ENABLE KEYS */;


--
-- Definition of table `kc2010_30_163922_dynamisches_duo_vs_olympiakos`
--

DROP TABLE IF EXISTS `kc2010_30_163922_dynamisches_duo_vs_olympiakos`;
CREATE TABLE `kc2010_30_163922_dynamisches_duo_vs_olympiakos` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_30_163922_dynamisches_duo_vs_olympiakos`
--

/*!40000 ALTER TABLE `kc2010_30_163922_dynamisches_duo_vs_olympiakos` DISABLE KEYS */;
INSERT INTO `kc2010_30_163922_dynamisches_duo_vs_olympiakos` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:39',0,2,'Olympiakos','Andreas K.',NULL),
 (2,'01:13',0,3,'Olympiakos','Andreas K.',NULL),
 (3,'01:27',1,3,'Dynamisches Duo','Phantastic Phil',NULL),
 (4,'01:43',1,4,'Olympiakos','Andreas K.',NULL),
 (5,'02:03',1,5,'Olympiakos','Theo',NULL),
 (6,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (7,'02:33',2,5,'Dynamisches Duo','Lotte',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'02:53',2,6,'Olympiakos','Andreas K.',NULL),
 (10,'04:14',2,7,'Olympiakos','Andreas K.',NULL),
 (11,'04:48',3,7,'Dynamisches Duo','Phantastic Phil',NULL),
 (12,'05:14',3,8,'Olympiakos','Theo',NULL),
 (13,'05:49',3,9,'Olympiakos','Andreas K.',NULL),
 (14,'06:32',4,9,'Dynamisches Duo','Lotte',NULL),
 (15,'06:43',4,10,'Olympiakos','Andreas K.',NULL);
/*!40000 ALTER TABLE `kc2010_30_163922_dynamisches_duo_vs_olympiakos` ENABLE KEYS */;


--
-- Definition of table `kc2010_32_165849_porsche_vs_waldmeister`
--

DROP TABLE IF EXISTS `kc2010_32_165849_porsche_vs_waldmeister`;
CREATE TABLE `kc2010_32_165849_porsche_vs_waldmeister` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_32_165849_porsche_vs_waldmeister`
--

/*!40000 ALTER TABLE `kc2010_32_165849_porsche_vs_waldmeister` DISABLE KEYS */;
INSERT INTO `kc2010_32_165849_porsche_vs_waldmeister` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:19',0,1,'Waldmeister','Ben vom Wald',NULL),
 (2,'00:26',1,1,'Porsche','Luca T.',NULL),
 (3,'00:39',1,2,'Waldmeister','Ben vom Wald',NULL),
 (4,'00:49',2,2,'Porsche','Mad Maz',NULL),
 (5,'02:00',3,2,'Porsche','Mad Maz',NULL),
 (6,'02:26',3,3,'Waldmeister','Ben vom Wald',NULL),
 (7,'02:44',4,3,'Porsche','Mad Maz',NULL),
 (8,'02:50',4,4,'Waldmeister','Ben vom Wald',NULL),
 (9,'04:11',4,5,'Waldmeister','Mario vom Wald',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'04:32',4,6,'Waldmeister','Ben vom Wald',NULL),
 (12,'05:13',5,6,'Porsche','Luca T.',NULL),
 (13,'05:38',5,7,'Waldmeister','Mario vom Wald',NULL),
 (14,'06:01',5,8,'Waldmeister','Ben vom Wald',NULL),
 (15,'06:16',5,9,'Waldmeister','Mario vom Wald',NULL),
 (16,'06:59',6,9,'Porsche','Mad Maz',NULL),
 (17,'07:30',6,10,'Waldmeister','Ben vom Wald',NULL);
/*!40000 ALTER TABLE `kc2010_32_165849_porsche_vs_waldmeister` ENABLE KEYS */;


--
-- Definition of table `kc2010_33_170938_tesa_power_vs_oransina`
--

DROP TABLE IF EXISTS `kc2010_33_170938_tesa_power_vs_oransina`;
CREATE TABLE `kc2010_33_170938_tesa_power_vs_oransina` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_33_170938_tesa_power_vs_oransina`
--

/*!40000 ALTER TABLE `kc2010_33_170938_tesa_power_vs_oransina` DISABLE KEYS */;
INSERT INTO `kc2010_33_170938_tesa_power_vs_oransina` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:51',0,1,'Oransina','Seba',NULL),
 (2,'03:00',0,2,'Oransina','Seba',NULL),
 (3,'03:12',1,2,'Tesa Power','Timo P.',NULL),
 (4,'03:25',1,3,'Oransina','Seba',NULL),
 (5,'04:09',1,4,'Oransina','Sina',NULL),
 (6,'04:34',1,5,'Oransina','Seba',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'04:57',2,5,'Tesa Power','Dirk L.',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'05:17',3,5,'Tesa Power','Dirk L.',NULL),
 (11,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (12,'05:59',4,5,'Tesa Power','Dirk L.',NULL),
 (13,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (14,'06:26',4,6,'Oransina','Sina',NULL),
 (15,'07:34',4,7,'Oransina','Sina',NULL),
 (16,'07:40',5,7,'Tesa Power','Dirk L.',NULL),
 (17,'08:14',6,7,'Tesa Power','Timo P.',NULL),
 (18,'08:41',6,8,'Oransina','Sina',NULL),
 (19,'09:24',7,8,'Tesa Power','Dirk L.',NULL),
 (20,'09:35',7,9,'Oransina','Seba',NULL);
/*!40000 ALTER TABLE `kc2010_33_170938_tesa_power_vs_oransina` ENABLE KEYS */;


--
-- Definition of table `kc2010_34_172123_sion_kölsch_vs_sauffpark`
--

DROP TABLE IF EXISTS `kc2010_34_172123_sion_kölsch_vs_sauffpark`;
CREATE TABLE `kc2010_34_172123_sion_kölsch_vs_sauffpark` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_34_172123_sion_kölsch_vs_sauffpark`
--

/*!40000 ALTER TABLE `kc2010_34_172123_sion_kölsch_vs_sauffpark` DISABLE KEYS */;
INSERT INTO `kc2010_34_172123_sion_kölsch_vs_sauffpark` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:33',1,0,'Sion Kölsch','Emre',NULL),
 (2,'00:55',1,1,'Sauffpark','Mahony',NULL),
 (3,'02:47',2,1,'Sion Kölsch','Emre',NULL),
 (4,'03:42',2,2,'Sauffpark','Shooter',NULL),
 (5,'04:00',3,2,'Sion Kölsch','Emre',NULL),
 (6,'05:30',4,2,'Sion Kölsch','Emre',NULL),
 (7,'05:48',5,2,'Sion Kölsch','Emre',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'06:00',6,2,'Sion Kölsch','Emre',NULL),
 (10,'06:18',6,3,'Sauffpark','Shooter',NULL),
 (11,'06:53',6,4,'Sauffpark','Shooter',NULL),
 (12,'07:48',6,5,'Sauffpark','Shooter',NULL),
 (13,'08:26',7,5,'Sion Kölsch','Emre',NULL),
 (14,'08:46',7,6,'Sauffpark','Mahony',NULL),
 (15,'09:16',8,6,'Sion Kölsch','Emre',NULL),
 (16,'09:29',8,7,'Sauffpark','Shooter',NULL);
/*!40000 ALTER TABLE `kc2010_34_172123_sion_kölsch_vs_sauffpark` ENABLE KEYS */;


--
-- Definition of table `kc2010_35_173936_wolfbräu_vs_rothaus`
--

DROP TABLE IF EXISTS `kc2010_35_173936_wolfbräu_vs_rothaus`;
CREATE TABLE `kc2010_35_173936_wolfbräu_vs_rothaus` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_35_173936_wolfbräu_vs_rothaus`
--

/*!40000 ALTER TABLE `kc2010_35_173936_wolfbräu_vs_rothaus` DISABLE KEYS */;
INSERT INTO `kc2010_35_173936_wolfbräu_vs_rothaus` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:40',1,0,'Wolfbräu','Tha Man',NULL),
 (2,'02:01',2,0,'Wolfbräu','Tha Man',NULL),
 (3,'02:29',3,0,'Wolfbräu','Tha Man',NULL),
 (4,'03:31',3,1,'Rothaus','Fraggy',NULL),
 (5,'04:18',3,2,'Rothaus','Wieland',NULL),
 (6,'04:23',4,2,'Wolfbräu','Tha Man',NULL),
 (7,'06:02',4,3,'Rothaus','Fraggy',NULL),
 (8,'07:00',5,3,'Wolfbräu','Tha Man',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'07:28',6,3,'Wolfbräu','Tha Man',NULL),
 (11,'07:48',7,3,'Wolfbräu','Tha Man',NULL),
 (12,'08:57',8,3,'Wolfbräu','Tha Man',NULL);
/*!40000 ALTER TABLE `kc2010_35_173936_wolfbräu_vs_rothaus` ENABLE KEYS */;


--
-- Definition of table `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange`;
CREATE TABLE `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange` DISABLE KEYS */;
INSERT INTO `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:20',0,1,'Sparda Orange','Fips',NULL),
 (2,'01:05',1,1,'die wilden Kerle','Dolschewida',NULL),
 (3,'01:52',1,2,'Sparda Orange','Fips',NULL),
 (4,'03:22',1,3,'Sparda Orange','Fips',NULL),
 (5,'04:02',1,4,'Sparda Orange','Schlampe',NULL),
 (6,'04:22',2,4,'die wilden Kerle','Jet-Ski',NULL),
 (7,'06:05',3,4,'die wilden Kerle','Jet-Ski',NULL),
 (8,'06:44',4,4,'die wilden Kerle','Jet-Ski',NULL),
 (9,'07:04',4,5,'Sparda Orange','Fips',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'08:00',5,5,'die wilden Kerle','Jet-Ski',NULL),
 (12,'08:13',5,6,'Sparda Orange','Fips',NULL),
 (13,'09:57',5,7,'Sparda Orange','Fips',NULL);
/*!40000 ALTER TABLE `kc2010_36_175254_die_wilden_kerle_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_37_180345_deportivo_vs_gaffel_kölsch`
--

DROP TABLE IF EXISTS `kc2010_37_180345_deportivo_vs_gaffel_kölsch`;
CREATE TABLE `kc2010_37_180345_deportivo_vs_gaffel_kölsch` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_37_180345_deportivo_vs_gaffel_kölsch`
--

/*!40000 ALTER TABLE `kc2010_37_180345_deportivo_vs_gaffel_kölsch` DISABLE KEYS */;
INSERT INTO `kc2010_37_180345_deportivo_vs_gaffel_kölsch` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:17',1,0,'Deportivo','Inge',NULL),
 (2,'01:29',1,1,'Gaffel Kölsch','Rio',NULL),
 (3,'01:52',1,2,'Gaffel Kölsch','Der Jupp',NULL),
 (4,'02:19',1,3,'Gaffel Kölsch','Rio',NULL),
 (5,'02:45',1,4,'Gaffel Kölsch','Der Jupp',NULL),
 (6,'02:56',1,5,'Gaffel Kölsch','Rio',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'03:05',2,5,'Deportivo','Inge',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'03:28',2,6,'Gaffel Kölsch','Rio',NULL),
 (11,'04:35',2,7,'Gaffel Kölsch','Rio',NULL),
 (12,'06:13',2,8,'Gaffel Kölsch','Der Jupp',NULL),
 (13,'06:52',2,9,'Gaffel Kölsch','Rio',NULL),
 (14,'07:12',2,10,'Gaffel Kölsch','Rio',NULL);
/*!40000 ALTER TABLE `kc2010_37_180345_deportivo_vs_gaffel_kölsch` ENABLE KEYS */;


--
-- Definition of table `kc2010_38_181520_dynamisches_duo_vs_bergmacht`
--

DROP TABLE IF EXISTS `kc2010_38_181520_dynamisches_duo_vs_bergmacht`;
CREATE TABLE `kc2010_38_181520_dynamisches_duo_vs_bergmacht` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_38_181520_dynamisches_duo_vs_bergmacht`
--

/*!40000 ALTER TABLE `kc2010_38_181520_dynamisches_duo_vs_bergmacht` DISABLE KEYS */;
INSERT INTO `kc2010_38_181520_dynamisches_duo_vs_bergmacht` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:26',0,1,'Bergmacht','Flo vom Berg',NULL),
 (2,'00:46',1,1,'Dynamisches Duo','Lotte',NULL),
 (3,'00:59',1,2,'Bergmacht','Flo vom Berg',NULL),
 (4,'01:24',1,3,'Bergmacht','Flo vom Berg',NULL),
 (5,'01:58',1,4,'Bergmacht','Flo vom Berg',NULL),
 (6,'02:12',1,5,'Bergmacht','Flo vom Berg',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'03:06',2,6,'Dynamisches Duo','Phantastic Phil',NULL),
 (9,'03:15',2,7,'Bergmacht','Flo vom Berg',NULL),
 (10,'04:25',2,8,'Bergmacht','Flo vom Berg',NULL),
 (11,'05:08',3,8,'Dynamisches Duo','Phantastic Phil',NULL),
 (12,'07:22',3,10,'Bergmacht','Flo vom Berg',NULL);
/*!40000 ALTER TABLE `kc2010_38_181520_dynamisches_duo_vs_bergmacht` ENABLE KEYS */;


--
-- Definition of table `kc2010_39_182506_olympiakos_vs_condom_kickers`
--

DROP TABLE IF EXISTS `kc2010_39_182506_olympiakos_vs_condom_kickers`;
CREATE TABLE `kc2010_39_182506_olympiakos_vs_condom_kickers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_39_182506_olympiakos_vs_condom_kickers`
--

/*!40000 ALTER TABLE `kc2010_39_182506_olympiakos_vs_condom_kickers` DISABLE KEYS */;
INSERT INTO `kc2010_39_182506_olympiakos_vs_condom_kickers` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'01:59',0,1,'Condom Kickers','Shorty',NULL),
 (2,'02:03',0,2,'Condom Kickers','Shorty',NULL),
 (3,'02:24',0,3,'Condom Kickers','Shorty',NULL),
 (4,'03:18',0,4,'Condom Kickers','Mausi',NULL),
 (5,'04:31',0,5,'Condom Kickers','Mausi',NULL),
 (6,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (7,'06:04',0,6,'Condom Kickers','Mausi',NULL),
 (8,'06:31',0,7,'Condom Kickers','Shorty',NULL),
 (9,'06:57',0,8,'Condom Kickers','Shorty',NULL),
 (10,'07:24',0,9,'Condom Kickers','Shorty',NULL),
 (11,'07:51',0,10,'Condom Kickers','Shorty',NULL);
/*!40000 ALTER TABLE `kc2010_39_182506_olympiakos_vs_condom_kickers` ENABLE KEYS */;


--
-- Definition of table `kc2010_40_183356_ensinger_vs_porsche`
--

DROP TABLE IF EXISTS `kc2010_40_183356_ensinger_vs_porsche`;
CREATE TABLE `kc2010_40_183356_ensinger_vs_porsche` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_40_183356_ensinger_vs_porsche`
--

/*!40000 ALTER TABLE `kc2010_40_183356_ensinger_vs_porsche` DISABLE KEYS */;
INSERT INTO `kc2010_40_183356_ensinger_vs_porsche` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:16',0,1,'Porsche','Luca T.',NULL),
 (2,'00:31',0,2,'Porsche','Luca T.',NULL),
 (3,'00:51',0,3,'Porsche','Mad Maz',NULL),
 (4,'01:23',0,4,'Porsche','Luca T.',NULL),
 (5,'01:50',0,5,'Porsche','Luca T.',NULL),
 (6,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (7,'03:41',0,6,'Porsche','Luca T.',NULL),
 (8,'03:53',0,7,'Porsche','Luca T.',NULL),
 (9,'06:15',0,8,'Porsche','Luca T.',NULL),
 (10,'06:38',0,9,'Porsche','Luca T.',NULL),
 (11,'07:01',0,10,'Porsche','Luca T.',NULL);
/*!40000 ALTER TABLE `kc2010_40_183356_ensinger_vs_porsche` ENABLE KEYS */;


--
-- Definition of table `kc2010_42_185908_oransina_vs_waldmeister`
--

DROP TABLE IF EXISTS `kc2010_42_185908_oransina_vs_waldmeister`;
CREATE TABLE `kc2010_42_185908_oransina_vs_waldmeister` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_42_185908_oransina_vs_waldmeister`
--

/*!40000 ALTER TABLE `kc2010_42_185908_oransina_vs_waldmeister` DISABLE KEYS */;
INSERT INTO `kc2010_42_185908_oransina_vs_waldmeister` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:51',1,1,'Oransina','Sina',NULL),
 (2,'01:30',1,2,'Waldmeister','Mario vom Wald',NULL),
 (3,'01:46',2,2,'Oransina','Sina',NULL),
 (4,'02:01',3,2,'Oransina','Sina',NULL),
 (5,'02:33',3,3,'Waldmeister','Ben vom Wald',NULL),
 (6,'02:44',3,4,'Waldmeister','Ben vom Wald',NULL),
 (7,'03:03',3,5,'Waldmeister','Mario vom Wald',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'04:45',3,6,'Waldmeister','Ben vom Wald',NULL),
 (10,'05:02',3,7,'Waldmeister','Mario vom Wald',NULL),
 (11,'06:07',4,7,'Oransina','Seba',NULL),
 (12,'07:23',5,7,'Oransina','Seba',NULL),
 (13,'08:48',5,8,'Waldmeister','Mario vom Wald',NULL),
 (14,'09:04',6,8,'Oransina','Seba',NULL),
 (15,'09:18',6,9,'Waldmeister','Mario vom Wald',NULL),
 (16,'09:55',6,10,'Waldmeister','Mario vom Wald',NULL);
/*!40000 ALTER TABLE `kc2010_42_185908_oransina_vs_waldmeister` ENABLE KEYS */;


--
-- Definition of table `kc2010_43_191108_sion_kölsch_vs_wolfbräu`
--

DROP TABLE IF EXISTS `kc2010_43_191108_sion_kölsch_vs_wolfbräu`;
CREATE TABLE `kc2010_43_191108_sion_kölsch_vs_wolfbräu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_43_191108_sion_kölsch_vs_wolfbräu`
--

/*!40000 ALTER TABLE `kc2010_43_191108_sion_kölsch_vs_wolfbräu` DISABLE KEYS */;
INSERT INTO `kc2010_43_191108_sion_kölsch_vs_wolfbräu` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:18',0,1,'Wolfbräu','Ben vom Berg',NULL),
 (2,'00:32',1,1,'Sion Kölsch','Emre',NULL),
 (3,'01:09',1,2,'Wolfbräu','Tha Man',NULL),
 (4,'02:03',1,3,'Wolfbräu','Tha Man',NULL),
 (5,'02:49',2,3,'Sion Kölsch','Emre',NULL),
 (6,'03:11',2,4,'Wolfbräu','Tha Man',NULL),
 (7,'03:45',3,4,'Sion Kölsch','die Hippe',NULL),
 (8,'04:05',4,4,'Sion Kölsch','Emre',NULL),
 (9,'04:47',4,5,'Wolfbräu','Tha Man',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (11,'07:19',5,5,'Sion Kölsch','Emre',NULL),
 (12,'07:36',6,5,'Sion Kölsch','Emre',NULL),
 (13,'07:58',7,5,'Sion Kölsch','die Hippe',NULL),
 (14,'08:57',7,6,'Wolfbräu','Tha Man',NULL),
 (15,'09:23',7,7,'Wolfbräu','Tha Man',NULL);
/*!40000 ALTER TABLE `kc2010_43_191108_sion_kölsch_vs_wolfbräu` ENABLE KEYS */;


--
-- Definition of table `kc2010_44_192234_die_wilden_kerle_vs_sauffpark`
--

DROP TABLE IF EXISTS `kc2010_44_192234_die_wilden_kerle_vs_sauffpark`;
CREATE TABLE `kc2010_44_192234_die_wilden_kerle_vs_sauffpark` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_44_192234_die_wilden_kerle_vs_sauffpark`
--

/*!40000 ALTER TABLE `kc2010_44_192234_die_wilden_kerle_vs_sauffpark` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_44_192234_die_wilden_kerle_vs_sauffpark` ENABLE KEYS */;


--
-- Definition of table `kc2010_44_192307_die_wilden_kerle_vs_sauffpark`
--

DROP TABLE IF EXISTS `kc2010_44_192307_die_wilden_kerle_vs_sauffpark`;
CREATE TABLE `kc2010_44_192307_die_wilden_kerle_vs_sauffpark` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_44_192307_die_wilden_kerle_vs_sauffpark`
--

/*!40000 ALTER TABLE `kc2010_44_192307_die_wilden_kerle_vs_sauffpark` DISABLE KEYS */;
INSERT INTO `kc2010_44_192307_die_wilden_kerle_vs_sauffpark` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:52',1,0,'die wilden Kerle','Dolschewida',NULL),
 (2,'01:51',2,0,'die wilden Kerle','Jet-Ski',NULL),
 (3,'02:06',3,0,'die wilden Kerle','Jet-Ski',NULL),
 (4,'03:52',4,0,'die wilden Kerle','Dolschewida',NULL),
 (5,'04:40',5,0,'die wilden Kerle','Dolschewida',NULL),
 (6,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (7,'05:24',6,0,'die wilden Kerle','Jet-Ski',NULL),
 (8,'05:53',7,0,'die wilden Kerle','Jet-Ski',NULL),
 (9,'07:02',7,1,'Sauffpark','Mahony',NULL),
 (10,'08:05',8,1,'die wilden Kerle','Jet-Ski',NULL),
 (11,'08:30',9,1,'die wilden Kerle','Jet-Ski',NULL),
 (12,'08:52',10,1,'die wilden Kerle','Dolschewida',NULL);
/*!40000 ALTER TABLE `kc2010_44_192307_die_wilden_kerle_vs_sauffpark` ENABLE KEYS */;


--
-- Definition of table `kc2010_45_193730_sparda_orange_vs_rothaus`
--

DROP TABLE IF EXISTS `kc2010_45_193730_sparda_orange_vs_rothaus`;
CREATE TABLE `kc2010_45_193730_sparda_orange_vs_rothaus` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_45_193730_sparda_orange_vs_rothaus`
--

/*!40000 ALTER TABLE `kc2010_45_193730_sparda_orange_vs_rothaus` DISABLE KEYS */;
INSERT INTO `kc2010_45_193730_sparda_orange_vs_rothaus` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:35',1,0,'Sparda Orange','Schlampe',NULL),
 (2,'01:00',2,0,'Sparda Orange','Schlampe',NULL),
 (3,'02:08',3,0,'Sparda Orange','Fips',NULL),
 (4,'03:41',3,1,'Rothaus','Wieland',NULL),
 (5,'06:57',3,2,'Rothaus','Wieland',NULL),
 (6,'07:18',4,2,'Sparda Orange','Schlampe',NULL),
 (7,'07:54',5,2,'Sparda Orange','Fips',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'09:44',5,3,'Rothaus','Wieland',NULL),
 (10,NULL,NULL,NULL,'-----','-----','--Halbzeit--');
/*!40000 ALTER TABLE `kc2010_45_193730_sparda_orange_vs_rothaus` ENABLE KEYS */;


--
-- Definition of table `kc2010_46_200759_deportivo_vs_tesa_power`
--

DROP TABLE IF EXISTS `kc2010_46_200759_deportivo_vs_tesa_power`;
CREATE TABLE `kc2010_46_200759_deportivo_vs_tesa_power` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_46_200759_deportivo_vs_tesa_power`
--

/*!40000 ALTER TABLE `kc2010_46_200759_deportivo_vs_tesa_power` DISABLE KEYS */;
INSERT INTO `kc2010_46_200759_deportivo_vs_tesa_power` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:27',1,0,'Deportivo','Fjen',NULL),
 (2,'00:44',1,1,'Tesa Power','Jens L.',NULL),
 (3,'02:10',1,2,'Tesa Power','Dirk L.',NULL),
 (4,'02:28',1,3,'Tesa Power','Jens L.',NULL),
 (5,'02:41',2,3,'Deportivo','Fjen',NULL),
 (6,'03:28',2,4,'Tesa Power','Dirk L.',NULL),
 (7,'04:04',2,5,'Tesa Power','Jens L.',NULL),
 (8,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (9,'04:42',2,6,'Tesa Power','Dirk L.',NULL),
 (10,'05:11',2,7,'Tesa Power','Jens L.',NULL),
 (11,'05:25',2,8,'Tesa Power','Dirk L.',NULL),
 (12,'07:11',3,8,'Deportivo','Fjen',NULL),
 (13,'07:48',3,9,'Tesa Power','Dirk L.',NULL),
 (14,'08:16',3,10,'Tesa Power','Jens L.',NULL);
/*!40000 ALTER TABLE `kc2010_46_200759_deportivo_vs_tesa_power` ENABLE KEYS */;


--
-- Definition of table `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle`
--

DROP TABLE IF EXISTS `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle`;
CREATE TABLE `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle`
--

/*!40000 ALTER TABLE `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle` DISABLE KEYS */;
INSERT INTO `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:26',0,1,'die wilden Kerle','Jet-Ski',NULL),
 (2,'01:03',0,2,'die wilden Kerle','Dolschewida',NULL),
 (3,'01:22',1,2,'Dynamisches Duo','Phantastic Phil',NULL),
 (4,'01:49',1,3,'die wilden Kerle','Dolschewida',NULL),
 (5,'03:00',1,4,'die wilden Kerle','Jet-Ski',NULL),
 (6,'05:53',1,5,'die wilden Kerle','Jet-Ski',NULL),
 (7,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (8,'05:56',2,5,'Dynamisches Duo','Phantastic Phil',NULL),
 (9,NULL,NULL,NULL,'-----','-----','--Halbzeit--'),
 (10,'06:11',2,6,'die wilden Kerle','Jet-Ski',NULL),
 (11,'06:28',2,7,'die wilden Kerle','Dolschewida',NULL),
 (12,'07:23',2,8,'die wilden Kerle','Dolschewida',NULL),
 (13,'08:20',2,9,'die wilden Kerle','Dolschewida',NULL),
 (14,'09:11',2,10,'die wilden Kerle','Jet-Ski',NULL);
/*!40000 ALTER TABLE `kc2010_47_203209_dynamisches_duo_vs_die_wilden_kerle` ENABLE KEYS */;


--
-- Definition of table `kc2010_48_150956_gaffel_kölsch_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_48_150956_gaffel_kölsch_vs_sparda_orange`;
CREATE TABLE `kc2010_48_150956_gaffel_kölsch_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_48_150956_gaffel_kölsch_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_48_150956_gaffel_kölsch_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_48_150956_gaffel_kölsch_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_49_151019_olympiakos_vs_sauffpark`
--

DROP TABLE IF EXISTS `kc2010_49_151019_olympiakos_vs_sauffpark`;
CREATE TABLE `kc2010_49_151019_olympiakos_vs_sauffpark` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_49_151019_olympiakos_vs_sauffpark`
--

/*!40000 ALTER TABLE `kc2010_49_151019_olympiakos_vs_sauffpark` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_49_151019_olympiakos_vs_sauffpark` ENABLE KEYS */;


--
-- Definition of table `kc2010_51_151252_condom_kickers_vs_waldmeister`
--

DROP TABLE IF EXISTS `kc2010_51_151252_condom_kickers_vs_waldmeister`;
CREATE TABLE `kc2010_51_151252_condom_kickers_vs_waldmeister` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_51_151252_condom_kickers_vs_waldmeister`
--

/*!40000 ALTER TABLE `kc2010_51_151252_condom_kickers_vs_waldmeister` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_51_151252_condom_kickers_vs_waldmeister` ENABLE KEYS */;


--
-- Definition of table `kc2010_52_151313_porsche_vs_wolfbräu`
--

DROP TABLE IF EXISTS `kc2010_52_151313_porsche_vs_wolfbräu`;
CREATE TABLE `kc2010_52_151313_porsche_vs_wolfbräu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_52_151313_porsche_vs_wolfbräu`
--

/*!40000 ALTER TABLE `kc2010_52_151313_porsche_vs_wolfbräu` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_52_151313_porsche_vs_wolfbräu` ENABLE KEYS */;


--
-- Definition of table `kc2010_53_202040_oransina_vs_sion_kölsch`
--

DROP TABLE IF EXISTS `kc2010_53_202040_oransina_vs_sion_kölsch`;
CREATE TABLE `kc2010_53_202040_oransina_vs_sion_kölsch` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_53_202040_oransina_vs_sion_kölsch`
--

/*!40000 ALTER TABLE `kc2010_53_202040_oransina_vs_sion_kölsch` DISABLE KEYS */;
INSERT INTO `kc2010_53_202040_oransina_vs_sion_kölsch` (`ID`,`SpielZeit`,`ToreA`,`ToreB`,`Team`,`Spieler`,`Event`) VALUES 
 (1,'00:33',1,0,'Oransina','Seba',NULL),
 (2,'02:44',3,1,'Sion Kölsch','Emre',NULL),
 (3,'09:04',6,2,'Sion Kölsch','die Hippe',NULL);
/*!40000 ALTER TABLE `kc2010_53_202040_oransina_vs_sion_kölsch` ENABLE KEYS */;


--
-- Definition of table `kc2010_54_151330_ensinger_vs_rothaus`
--

DROP TABLE IF EXISTS `kc2010_54_151330_ensinger_vs_rothaus`;
CREATE TABLE `kc2010_54_151330_ensinger_vs_rothaus` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_54_151330_ensinger_vs_rothaus`
--

/*!40000 ALTER TABLE `kc2010_54_151330_ensinger_vs_rothaus` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_54_151330_ensinger_vs_rothaus` ENABLE KEYS */;


--
-- Definition of table `kc2010_55_151549_condom_kickers_vs_oransina`
--

DROP TABLE IF EXISTS `kc2010_55_151549_condom_kickers_vs_oransina`;
CREATE TABLE `kc2010_55_151549_condom_kickers_vs_oransina` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_55_151549_condom_kickers_vs_oransina`
--

/*!40000 ALTER TABLE `kc2010_55_151549_condom_kickers_vs_oransina` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_55_151549_condom_kickers_vs_oransina` ENABLE KEYS */;


--
-- Definition of table `kc2010_57_151647_rothaus_vs_sparda_orange`
--

DROP TABLE IF EXISTS `kc2010_57_151647_rothaus_vs_sparda_orange`;
CREATE TABLE `kc2010_57_151647_rothaus_vs_sparda_orange` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_57_151647_rothaus_vs_sparda_orange`
--

/*!40000 ALTER TABLE `kc2010_57_151647_rothaus_vs_sparda_orange` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_57_151647_rothaus_vs_sparda_orange` ENABLE KEYS */;


--
-- Definition of table `kc2010_58_151721_die_wilden_kerle_vs_wolfbräu`
--

DROP TABLE IF EXISTS `kc2010_58_151721_die_wilden_kerle_vs_wolfbräu`;
CREATE TABLE `kc2010_58_151721_die_wilden_kerle_vs_wolfbräu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_58_151721_die_wilden_kerle_vs_wolfbräu`
--

/*!40000 ALTER TABLE `kc2010_58_151721_die_wilden_kerle_vs_wolfbräu` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_58_151721_die_wilden_kerle_vs_wolfbräu` ENABLE KEYS */;


--
-- Definition of table `kc2010_59_151848_wolfbräu_vs_olympiakos`
--

DROP TABLE IF EXISTS `kc2010_59_151848_wolfbräu_vs_olympiakos`;
CREATE TABLE `kc2010_59_151848_wolfbräu_vs_olympiakos` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_59_151848_wolfbräu_vs_olympiakos`
--

/*!40000 ALTER TABLE `kc2010_59_151848_wolfbräu_vs_olympiakos` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_59_151848_wolfbräu_vs_olympiakos` ENABLE KEYS */;


--
-- Definition of table `kc2010_60_151934_rothaus_vs_oransina`
--

DROP TABLE IF EXISTS `kc2010_60_151934_rothaus_vs_oransina`;
CREATE TABLE `kc2010_60_151934_rothaus_vs_oransina` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_60_151934_rothaus_vs_oransina`
--

/*!40000 ALTER TABLE `kc2010_60_151934_rothaus_vs_oransina` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_60_151934_rothaus_vs_oransina` ENABLE KEYS */;


--
-- Definition of table `kc2010_61_152040_wolfbräu_vs_oransina`
--

DROP TABLE IF EXISTS `kc2010_61_152040_wolfbräu_vs_oransina`;
CREATE TABLE `kc2010_61_152040_wolfbräu_vs_oransina` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpielZeit` varchar(5) DEFAULT NULL,
  `ToreA` int(3) unsigned DEFAULT NULL,
  `ToreB` int(3) unsigned DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Spieler` varchar(45) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_61_152040_wolfbräu_vs_oransina`
--

/*!40000 ALTER TABLE `kc2010_61_152040_wolfbräu_vs_oransina` DISABLE KEYS */;
/*!40000 ALTER TABLE `kc2010_61_152040_wolfbräu_vs_oransina` ENABLE KEYS */;


--
-- Definition of table `kc2010_spl`
--

DROP TABLE IF EXISTS `kc2010_spl`;
CREATE TABLE `kc2010_spl` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(3) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(3) CHARACTER SET latin1 NOT NULL,
  `Tore1` int(10) unsigned DEFAULT NULL,
  `Tore2` int(10) unsigned DEFAULT NULL,
  `X` int(10) unsigned NOT NULL DEFAULT '0',
  `Gruppe` varchar(3) NOT NULL,
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 PACK_KEYS=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kc2010_spl`
--

/*!40000 ALTER TABLE `kc2010_spl` DISABLE KEYS */;
INSERT INTO `kc2010_spl` (`SpielID`,`Team1`,`Team2`,`Tore1`,`Tore2`,`X`,`Gruppe`) VALUES 
 (1,'a1','a2',2,10,8,'a'),
 (2,'a3','a4',10,2,8,'a'),
 (3,'a5','a6',8,10,8,'a'),
 (4,'b1','b2',8,5,8,'b'),
 (5,'b3','b4',2,5,8,'b'),
 (6,'b5','b6',6,9,8,'b'),
 (7,'c1','c2',7,3,8,'c'),
 (8,'c3','c4',6,4,8,'c'),
 (9,'c5','c6',7,4,8,'c'),
 (10,'a1','a3',3,10,8,'a'),
 (11,'a5','a2',10,5,8,'a'),
 (12,'a6','a4',10,1,8,'a'),
 (13,'b1','b3',3,7,8,'b'),
 (14,'b5','b2',10,1,8,'b'),
 (15,'b6','b4',5,3,8,'b'),
 (16,'c1','c3',1,1,8,'c'),
 (17,'c5','c2',5,5,8,'c'),
 (18,'c6','c4',5,8,8,'c'),
 (19,'a1','a5',0,10,8,'a'),
 (20,'a6','a3',7,10,8,'a'),
 (21,'a4','a2',8,4,8,'a'),
 (22,'b1','b5',4,9,8,'b'),
 (23,'b6','b3',10,3,8,'b'),
 (24,'b4','b2',10,0,8,'b'),
 (25,'c1','c5',2,3,8,'c'),
 (26,'c6','c3',2,10,8,'c'),
 (27,'c4','c2',7,2,8,'c'),
 (28,'a1','a6',5,10,8,'a'),
 (29,'a4','a5',7,9,8,'a'),
 (30,'a2','a3',4,10,8,'a'),
 (31,'b1','b6',3,10,8,'b'),
 (32,'b4','b5',6,10,8,'b'),
 (33,'b2','b3',7,9,8,'b'),
 (34,'c1','c6',8,7,8,'c'),
 (35,'c4','c5',8,3,8,'c'),
 (36,'c2','c3',5,7,8,'c'),
 (37,'a1','a4',2,10,8,'a'),
 (38,'a2','a6',3,10,8,'a'),
 (39,'a3','a5',0,10,8,'a'),
 (40,'b1','b4',0,10,8,'b'),
 (41,'b2','b6',0,10,8,'b'),
 (42,'b3','b5',6,10,8,'b'),
 (43,'c1','c4',7,7,8,'c'),
 (44,'c2','c6',10,1,8,'c'),
 (45,'c3','c5',5,3,8,'c'),
 (46,'a1','b2',3,10,8,'16'),
 (47,'a2','c2',2,10,8,'16'),
 (48,'a4','c3',3,10,8,'16'),
 (49,'a3','c6',10,2,8,'16'),
 (50,'a6','b6',4,5,8,'16'),
 (51,'a5','b5',9,4,8,'16'),
 (52,'b4','c4',5,7,8,'16'),
 (53,'b3','c1',7,2,8,'16'),
 (54,'b1','c5',6,10,8,'16'),
 (55,'a5','b3',4,9,8,'16'),
 (56,'b6','a3',5,6,8,'16'),
 (57,'c5','c3',7,2,8,'16'),
 (58,'c2','c4',6,9,8,'16'),
 (59,'c4','a3',10,7,8,'16'),
 (60,'c5','b3',3,5,8,'16'),
 (61,'c4','b3',3,9,8,'16');
/*!40000 ALTER TABLE `kc2010_spl` ENABLE KEYS */;


--
-- Definition of table `kc2010_tbl`
--

DROP TABLE IF EXISTS `kc2010_tbl`;
CREATE TABLE `kc2010_tbl` (
  `TeamID` varchar(3) NOT NULL,
  `Spieler1` int(3) DEFAULT NULL,
  `Spieler2` int(3) DEFAULT NULL,
  `Spieler3` int(3) unsigned DEFAULT '0',
  `Spieler4` int(3) unsigned DEFAULT '0',
  `Spiele` int(3) unsigned DEFAULT '0',
  `S` int(3) unsigned DEFAULT '0',
  `U` int(3) unsigned DEFAULT '0',
  `N` int(3) unsigned DEFAULT '0',
  `ToreP` int(4) unsigned DEFAULT '0',
  `ToreM` int(4) unsigned DEFAULT '0',
  `Punkte` int(3) unsigned DEFAULT '0',
  `Gruppe` varchar(3) DEFAULT NULL,
  `Status` int(3) unsigned DEFAULT '1',
  `Team1` varchar(45) DEFAULT 'a',
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kc2010_tbl`
--

/*!40000 ALTER TABLE `kc2010_tbl` DISABLE KEYS */;
INSERT INTO `kc2010_tbl` (`TeamID`,`Spieler1`,`Spieler2`,`Spieler3`,`Spieler4`,`Spiele`,`S`,`U`,`N`,`ToreP`,`ToreM`,`Punkte`,`Gruppe`,`Status`,`Team1`) VALUES 
 ('a1',NULL,NULL,0,0,5,0,0,6,15,60,0,'a',1,'a1'),
 ('a2',NULL,NULL,0,0,6,1,0,5,28,50,3,'a',1,'a2'),
 ('a3',NULL,NULL,0,0,8,6,0,2,63,43,18,'a',1,'a3'),
 ('a4',NULL,NULL,0,0,6,2,0,4,31,45,6,'a',1,'a4'),
 ('a5',NULL,NULL,0,0,7,5,0,2,60,35,15,'a',1,'a5'),
 ('a6',NULL,NULL,0,0,5,4,0,2,51,32,12,'a',1,'a6'),
 ('b1',NULL,NULL,0,0,6,1,0,5,24,51,3,'b',1,'b1'),
 ('b2',NULL,NULL,0,0,6,1,0,5,23,50,3,'b',1,'b2'),
 ('b3',NULL,NULL,0,0,9,6,0,3,57,47,18,'b',1,'b3'),
 ('b4',NULL,NULL,0,0,6,3,0,3,39,24,9,'b',1,'b4'),
 ('b5',NULL,NULL,0,0,6,4,0,2,49,35,12,'b',1,'b5'),
 ('b6',NULL,NULL,0,0,7,6,0,1,54,25,18,'b',1,'b6'),
 ('c1',NULL,NULL,0,0,5,2,1,2,26,27,7,'c',1,'c1'),
 ('c2',NULL,NULL,0,0,7,2,1,4,41,38,7,'c',1,'c2'),
 ('c3',NULL,NULL,0,0,6,5,0,1,40,24,15,'c',1,'c3'),
 ('c4',NULL,NULL,0,0,9,6,1,2,63,50,19,'c',1,'c4'),
 ('c5',NULL,NULL,0,0,7,3,1,3,34,33,10,'c',1,'c5'),
 ('c6',NULL,NULL,0,0,5,0,0,5,17,46,0,'c',1,'c6');
/*!40000 ALTER TABLE `kc2010_tbl` ENABLE KEYS */;


--
-- Definition of table `kc2010_tor`
--

DROP TABLE IF EXISTS `kc2010_tor`;
CREATE TABLE `kc2010_tor` (
  `Spieler` varchar(30) NOT NULL,
  `Team` varchar(30) NOT NULL,
  `Tore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Spieler`,`Team`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kc2010_tor`
--

/*!40000 ALTER TABLE `kc2010_tor` DISABLE KEYS */;
INSERT INTO `kc2010_tor` (`Spieler`,`Team`,`Tore`) VALUES 
 ('Andreas K.','Olympiakos',19),
 ('Ben vom Berg','Wolfbräu',9),
 ('Ben vom Wald','Waldmeister',20),
 ('Buzz-T','Ensinger',8),
 ('Captain Doerk','Sion Kölsch',3),
 ('Dave vom Berg','Bergmacht',14),
 ('Der Jupp','Gaffel Kölsch',7),
 ('die Hippe','Sion Kölsch',3),
 ('Dirk L.','Tesa Power',14),
 ('Dolschewida','die wilden Kerle',13),
 ('Eise','Dynamisches Duo',9),
 ('Emre','Sion Kölsch',20),
 ('Fips','Sparda Orange',17),
 ('Fjen','Deportivo',11),
 ('Flo vom Berg','Bergmacht',31),
 ('Fraggy','Rothaus',7),
 ('Inge','Deportivo',4),
 ('Jens L.','Ensinger',8),
 ('Jens L.','Tesa Power',5),
 ('Jet-Ski','die wilden Kerle',22),
 ('Lotte','Dynamisches Duo',3),
 ('Luca T.','Porsche',23),
 ('Mad Maz','Porsche',11),
 ('Maggi','Maggi & Nietzsche',21),
 ('Mahony','Sauffpark',13),
 ('Mario vom Wald','Waldmeister',24),
 ('Mausi','Condom Kickers',18),
 ('Moritz','Condom Kickers',3),
 ('Nietzsche','Maggi & Nietzsche',23),
 ('Phantastic Phil','Dynamisches Duo',16),
 ('Rio','Gaffel Kölsch',20),
 ('Schlampe','Sparda Orange',9),
 ('Seba','Oransina',17),
 ('Shooter','Sauffpark',6),
 ('Shorty','Condom Kickers',24),
 ('Sina','Oransina',10),
 ('Tha Man','Wolfbräu',24),
 ('Theo','Olympiakos',21),
 ('Timo P.','Tesa Power',4),
 ('Wieland','Rothaus',14);
/*!40000 ALTER TABLE `kc2010_tor` ENABLE KEYS */;


--
-- Definition of table `soccercup2010_spl`
--

DROP TABLE IF EXISTS `soccercup2010_spl`;
CREATE TABLE `soccercup2010_spl` (
  `SpielID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Team1` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Team2` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Tore1` int(10) unsigned DEFAULT NULL,
  `Tore2` int(10) unsigned DEFAULT NULL,
  `X` int(10) unsigned NOT NULL DEFAULT '0',
  `Gruppe` varchar(1) NOT NULL,
  PRIMARY KEY (`SpielID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 PACK_KEYS=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `soccercup2010_spl`
--

/*!40000 ALTER TABLE `soccercup2010_spl` DISABLE KEYS */;
INSERT INTO `soccercup2010_spl` (`SpielID`,`Team1`,`Team2`,`Tore1`,`Tore2`,`X`,`Gruppe`) VALUES 
 (1,'h1','h2',2,5,8,'1'),
 (2,'h3','h4',1,6,8,'1'),
 (3,'h5','h1',2,5,8,'1'),
 (4,'h3','h2',1,8,8,'1'),
 (5,'h4','h5',6,3,8,'1'),
 (6,'h1','h3',3,1,8,'1'),
 (7,'h2','h5',5,3,8,'1'),
 (8,'h4','h1',4,1,8,'1'),
 (9,'h5','h3',5,2,8,'1'),
 (10,'h2','h4',2,1,8,'1');
/*!40000 ALTER TABLE `soccercup2010_spl` ENABLE KEYS */;


--
-- Definition of table `soccercup2010_tbl`
--

DROP TABLE IF EXISTS `soccercup2010_tbl`;
CREATE TABLE `soccercup2010_tbl` (
  `TeamID` varchar(3) NOT NULL,
  `Spieler1` int(3) DEFAULT NULL,
  `Spieler2` int(3) DEFAULT NULL,
  `Spieler3` int(3) unsigned DEFAULT '0',
  `Spieler4` int(3) unsigned DEFAULT '0',
  `Spiele` int(3) unsigned DEFAULT '0',
  `S` int(3) unsigned DEFAULT '0',
  `U` int(3) unsigned DEFAULT '0',
  `N` int(3) unsigned DEFAULT '0',
  `ToreP` int(4) unsigned DEFAULT '0',
  `ToreM` int(4) unsigned DEFAULT '0',
  `Punkte` int(3) unsigned DEFAULT '0',
  `Gruppe` varchar(1) DEFAULT NULL,
  `Status` int(1) unsigned zerofill DEFAULT '1',
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `soccercup2010_tbl`
--

/*!40000 ALTER TABLE `soccercup2010_tbl` DISABLE KEYS */;
INSERT INTO `soccercup2010_tbl` (`TeamID`,`Spieler1`,`Spieler2`,`Spieler3`,`Spieler4`,`Spiele`,`S`,`U`,`N`,`ToreP`,`ToreM`,`Punkte`,`Gruppe`,`Status`) VALUES 
 ('h1',NULL,NULL,0,0,4,2,0,2,11,12,6,'a',1),
 ('h2',NULL,NULL,0,0,4,4,0,0,20,7,12,'a',1),
 ('h3',NULL,NULL,0,0,4,0,0,4,5,22,0,'a',1),
 ('h4',NULL,NULL,0,0,4,3,0,1,17,7,9,'a',1),
 ('h5',NULL,NULL,0,0,4,1,0,3,13,18,3,'a',1);
/*!40000 ALTER TABLE `soccercup2010_tbl` ENABLE KEYS */;


--
-- Definition of table `spieler`
--

DROP TABLE IF EXISTS `spieler`;
CREATE TABLE `spieler` (
  `SpielerName` varchar(30) NOT NULL,
  `SpielerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SpielerID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spieler`
--

/*!40000 ALTER TABLE `spieler` DISABLE KEYS */;
INSERT INTO `spieler` (`SpielerName`,`SpielerID`) VALUES 
 ('Andreas',1),
 ('Ben vom Berg',2),
 ('Ben vom Wald',3),
 ('Buzz-T',4),
 ('Captain Doerk',5),
 ('Der Jupp',6),
 ('Dirk',7),
 ('Eise',8),
 ('Emre',9),
 ('Flo vom Berg',10),
 ('Fraggy',11),
 ('Inge',12),
 ('Jens',13),
 ('Luca T.',14),
 ('Mad Maz',15),
 ('Maggi',16),
 ('Mahony',17),
 ('Marc',18),
 ('Mario vom Wald',19),
 ('Masmo',20),
 ('Matze vom Berg',21),
 ('Nietzsche',22),
 ('Phantastic Phil',23),
 ('Quicky',24),
 ('Richard',25),
 ('Rio',26),
 ('Schmiddi',27),
 ('Shooter',28),
 ('Shorty',29),
 ('Tha Baral',30),
 ('Tha Man',31),
 ('Thomas',32),
 ('Timo',33),
 ('Wieland',34),
 ('Zwuckel',35),
 ('_Eigentor',36),
 ('_unbekannt',37);
/*!40000 ALTER TABLE `spieler` ENABLE KEYS */;


--
-- Definition of table `t_spieler`
--

DROP TABLE IF EXISTS `t_spieler`;
CREATE TABLE `t_spieler` (
  `SpielerID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Vorname` varchar(30) NOT NULL DEFAULT '',
  `Nickname` varchar(30) NOT NULL DEFAULT '',
  `TeamID` int(3) DEFAULT NULL,
  `Image100` blob,
  PRIMARY KEY (`SpielerID`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_spieler`
--

/*!40000 ALTER TABLE `t_spieler` DISABLE KEYS */;
INSERT INTO `t_spieler` (`SpielerID`,`Name`,`Vorname`,`Nickname`,`TeamID`,`Image100`) VALUES 
 (1,'scheike','jochen','StA',0,NULL),
 (2,'malas','dirk','Captain Doerk',25,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E00000007010101010000000000000000000005060708090A030B0402FFC40037100002020201030303020404050500000001020304050611071221000813142231094115235161163233A117253442B14352717281FFC4001E0100010402030100000000000000000000060405070803090001020AFFC4003B110002020103030301060305080300000001020311040512210613310022410714325161719108152325425281B1243334367273A1D17493C3FFDA000C03010002110311003F00D7FB58AF292CE240401C86079078E1B86F040E470091CFE402079F5C8344DF7452C8BF904372141FFEDC1F1CF1F9E4FF007E4FAED476570CA27549179F21D14F927924103F05BC9041FB80FC1E3D28172D87605A78FCB303C41F629E7C90C9C1503FB8FC71C1078F271DE11318CACA54FDDE55D472091B765FCF9BF9F3C7A17EDBBA875ED58A0D5B958D573C96BE38F1567C5F1E89040CB5D9E3B01DD4AF82E00E5B9F00F6A92C083C704782491C81EBF55ACCA07132965240327710781C72072DDA480411CF27FBFA377B1829195EB0313F7F734730468645047E4823EEFC8F0BFB93F93E7F3B77537A6FD3AD4B2FB66F393C4EB9ABE06A3DFCAE5723343569D58A3E1417776432BCAC443057883D8B33C9157AF14B3488871CF998F0C2F2CC36A805DE47558C46A002589DDB428166F81E6CF8AE4714CCE02AD8F00596DC4D0DA0816493C50FF21E41F9E7C955C740D6AC5D8EAD782369A79E6B095E28615FF3BCAF2BA46A880FDCEDE17CF91E3D30D7FDF27B66D472E71399EA9E24CF1DA7A525BC48C86630F5EEA1ED920B7B263295DC054B103F315982DE4A178652219FE39088CE487F548FD4713DCAF552D60FA4E6D45D34D5926C6E105EBB3D3C5DBB067EE9F3AD859648EACD92B889F0C2D95A174D4A8DF1435EA4C67B162A931DD44D9D21EDFE3982826915565558E2862675F27E56AD0D29873DC4F746FCB330202F0A7D0165755CA642D898F1B43BC84925DE24916E84805108A4D900AF3C51E4906185D35DF851F2A7931D996CC4231B90502033332D96047B4A820100F22BD7A47E99EF2BA03B9490B61BA9581BB4E568218EF95B35F1930B33CB56B59AB979EBC58BBD567B5567892DD2B73D52B14D37CAB5E19674537537DCDF457A593C35B70EA6E071B90BBCA52C3A32DFBB764ED0E6BD582A2CAD3DBEC6E4D6571376F2FF0012A063EBCDAABF5E723A9DD856AEDF9269ABC1909E5A187B73D4C7545BB4EDD4BB6A4B772FFC1599E2B3277D98A2165C98CC85479280EA5FBD5EADECB7ECE720DDB618E0FA4A18FB8F3DDB13DAB35D098E4AF35E8EC3CF32DD69ACDAB30CCA912C9248AD0C5148D19F49D4934D1A76F1C2C8CBB8B306D9542A8907CB020372BE45D8378A5E9CECC857ED6AF183446D1DCE68D81F7450A2C09B02CF03EEFA6774C7DC8746FAA77E2C6EA9BA413E6670D157C35A66C6E42D3AA49238828CD23C92031A193B9414EDE4160EACA2412D79AC8EC2D34062E42BACA1D5C30F2AC17F3CF27C9F3FEFC795AF497DF16D5A46D98ACB4395CC4597C6DA8A48EFC397C8D3C941324E92896BCD464ACC640E85878EC25CA761E14AEDA7F4C9FD6034BF72234FE8B6F951F07D54BB5EB6330F76FE4CC94774BB5A83CF61EB4CF5C2D4CCD886ACF725C4C8218997BC63FE56535D5C34ED61F248832221165313DB540CE920009254951F740B21BCDD8B167D60CDD0DA084E5624DF6B8105CE4055783C7B8A872CE9C72C17DA4535837EAFBD6098327CD287542A1081C313C004BF93CF3E79FC8E49F3FD3ED05BCFFF003E3F3FB7E3FF003F9FF63C782687395A5745EE04B28EEF8819429F00FF009477003F0395E3D1AC76619016575201208278208FEA0F0471CF9E471CF8E4FE7D38C923F1B97E0F81639DBC7CD9B1F9F3C01F8342203CAB015C007CF817E6AFCD7C73F3F27935585D8B3431BB124966F24F279FCF779FEDC7238F03D0F5D8CF083C19235FEC5873C1F23F3C1FC7A1EBC77CFC820F1C7BB8FBBF9FE9FB7EB5CED9F871FE447FEFF4FDBD41C8678DB8E0A9E493C82791E7C9F00F8F03F03FDC8F5C2CAC96B218AAF1E564C7C4CF7E475132C42C1868CB2450B9743DE0CAA38442A4B301F920067E6CF674BA40B7B195A568CCAB145466927312B223BA99F20819119D15A4FA7650CC8381DC17D36BD47DBB65C1D0AF6A3CF6461765BEB1CD529639DEA94A6EC248CAE3A67889FC2BB3B927EDE393CFA6FD4FAA74E38F22E1B644929A08DDB558C36E07DCC5830E3CD2FC11E4F2AB0B4F99668DB211047BBDC3716256A8D2AA9524137CB50A07E2FD4C9B8B2D3AE2D5C6482AB3DC6499E445510D19E4AD3CD29E42451ACD0CBFEA329EC52EC02F8F58C6FD57BF53BCBF5F779CAF473A5995969745B46C85B89ADD3B1D8DBD65284CF5DB64BB3AB003153049D356A0929418F957377FB6CDCAF5A95BAFBE1FD4022F6F5ED47AF7ACD4CDE7B3DD57DCBA33AD60B51397B952FD3C6D9DD367DB309B4ED864BB928A6A4F53019F82FC51E2A81B13642BD176AD0D48DACC782DDB373CCE7A4B95F1D0CF309E62F91BAA4136ADDB90B3464B3B2298A3EE812146E5FE5B1185117262146D7F33A9259B04C060C2D3E40B2CA48299B926472AA54246C21C58D23720DAC934A9E7B6D4FD8FA6C1A7BAE6160F2CAA1B1E3009115816F76DB8B1BDA4D0416CB4C17D3A39BEA5DD7B16992289EBCAC7BED46A05740858082B39633D876E7BA4B123F713C773C602A14F8EA7E492B2C22BCC3E50B1C5144F28133B72C04648333BF254AAC4394E58B48BDAAE4E70DD1CDB0E02AE63218BB762CDEF963C6549CBAA15AB4E1BF6E49431ED820A34EDD079258BB0BCD723861FE676C7EBB657A4F97D7CD7B59298C373E1FA8BB52A56024AEB212B0D74EEE1A391D95897217B3B1E4940601BD6369B011846F2C65AC2EDB1B8B2A83454727F02D540F17BAFD3F269FAB4A9DC549154A6E626C0D8F55CB100D9F705E40003104004A324CC5CB2D5E1BB12418E8A46BD7F1AF2C85A7982170D7C4656495DBB61F8E1698305F8A45288B249E8A26D8E4BD2DE78E38E2C7D6AB627B10451482392D9AF6BE91A35954CD2CFF52CAC1DDCB7C49CB9629170B1B5A8DD582036F1D668C7213F454D9654B7759C7323BC72113334CA0F73C84388C7DDD808EE7B7A7BEDDF37B76385DB345E8E35184FC45148924E482B11EE07EE47E1628FB3904162AFCFC8171646A5A7E2C4D34D3AA229A277F05AEB801896700503CD10013C57ACF8DA16A99532411412BC8FB5C828410A76852C686C520F8A16A41DBEEF507F0D62F433B6612E44D6AE64A46482D29569048D35863CB1658DC154584B9ED1216EC2A7C8B23F693D60CC74AFAA7D36EA3EBD95AB5F67D1B6FD736DA546F589564BF670B95AB7DE8CC5A486392B646A46F4A77EE858D4B52AC638957946673D97E7A8DAAF90B3058871B92025C5CA5C44A2D9926135695635901EF5F80D259143D8919A2E5798BE62AD9742BBD3EB98685D235B11D7F98D7C87C911B143E664190C7CA55C4C209A3712D6EE69AAC88F2444405426287A9B0259F19F07362392ACB2C7545418F9D84D8DD55B645F69F9B007A714E98D5302195B3B108C7AEDCAACD618300093F1EF56255BDC181F83607A7F7453AFFAE759BA67A7754751C8C7263772D7B1D98F88CF4EEDAC55DB9523932188B762B34A8B7F1371E6A3751580162BB91CA153E9CF3B1DAE032DF6989FFB5FFBB03E3C9E3FA823823F7E7F06887F409C5EE5BD7B3CCA66F299B8E1D7EA752F60C360295A33DE92A3D3C7E224C9F64E275ECA53DC9CCD0C46B806592C4F13B24DE6F267D033423EE87378500FE3E6393857EEE383C458FB2DC11E7C0E7C73E7D1F45AF688CA8B36743064055EF473464EC6DA0942E232084248DC18EEFC4F371B67695958B9591145019E1576113C6DCB293ED2537D86DBF7851008A00703D1BA6D938501EC2F3FB77F73903F61CB293C7F63F8FE9E87A414FA9E5EBC8639B6CD4ABBFE7E397219A8DC0E4AF3DAD8453C72A473C71C83E7D0F4A86AFD3BC13AEE8E09A241CA8948BA3441160F9B07904FE5E900C5CE15FD9D99FF00D6C7FC3F22857F90E2F81EA97B65F7C5A1EABB6EB91EEDD2AD9B03BADFC77F09C5D69F63E90CF77F86E64D4CA595F8E0EB21F871B24B89AF29C9DA86BD46FA55712C3F23427BE6FDDCE91B6C30549342CCDB464B44247BA746A1F8BE5E601F314EB2CFE5A3E486543CF8E42A928647F4F7A47ABE675C9B31BE60301633B16465A7585688DAFA3C754A7462A94DAD5B8639279A322579248A28A16327F2A35E0FA6FBAC14F54E9FEB994C96AFAAE164CAD5AD249496D54865479E305A3568CA769462A03772904120A11C0F51564E7E6C72B4298584763BD376A9482DB801FD53CADB17219817B20720FA2548A011AC924D2D900900A9F23E085166A88AE7F21C5D34FEAAD85D5BAEBED9F7DD8F51E9E6DB8AEA074BF5CC65DA165F63D0B2B8FF00F0853CBD6C8666114F11BA65ED5E0D8CA77A65FE0B05DB159E9936AAC35E5F965C92F4F88C86D7AEE32D11F4F1DF882571DBCCD249615ACCF2F8E3E49A62A885BF9AD1A423ED4501B787ABF5E3A67D5EABBA6A795CE6AFA2E4B61D6E4D3F3BACEE1A955A757E92E41928247C66705B86A179E2CCDB8A3ECB172668CC3FC98668838C6D63BDB36C3D2BEBBE0B4DCDD8C7E725AB9AAB1E3B3580BF065301B1519B2B355832589C8C4C63B1158F807C840596AD849A9D98639E078829D2B2258B2B260CD1878ED3C49978B14642B3B0320C865463647FBB7DD5B7DCC4F827D2F870A4C811CD8B1E44F0453C693CA519E28BB8EA210F228DA85F61001E58AD8F06EEFF0007D25D6733A5EB9764A11D6BF5B071550400CA2BDCB789C8DC42AC087FAB7C4D08E5664E7E18C2C6557EDF499B7EDEB03919ED4E71D05A9E6B10CE7E68226F8FE9E2558563EE0DC812F7583DC0B1B0DF20E3B10AC85CD66719AAD4AD46767AF8CC554816C08E2FBEC7C1120E212CABC162183090A73CAA9FB803EA39ED9EF2B17A809E4A3A258BD8C8D8012B4F56BD83C72391359B102927CB0442E780BC02A48111E74F9D973CE71E4720CB2280A554905C7991994005AB68BDD65B8E7D590D3E1D331608C66848CA431970632C376D02C2AA3126870768A1566E87A218BDA3457F61193B78F8A51F647190A8ECF01E5A405DC711F7B703B63007C6A57EEF9242D2B757E89C38FA30E2EAE3634122AA92C231DA3C2AB17760788DBCAAA862AA5800547022D68DEFEB5DDA6F47546BB77193A4DDB0473451CDD92BC60B44D2D499C793DACA4C2ABC30F2CBE7D3F9B67B95CB74FF00194763D8B116AA62AFC4D263E5FA193E49D5543AAC4AA3925E373F19F2BE08F1D80FA12D4CEB113A6265A4E0B111C11B786268AAA95620B122EBC8B26FF02DC11A3CB177F0DA1601774AC5180238B2E0AA90401C9A1E2D471E9E4CBF456BDCC04584C9D44C8526E1A48910B057887747F14B0F649149048892C52295649235910AC91A32D617EA15D3AC0699D1CD6F6D27B72985DCBF85E3E7955165B34F258DC9CF669CC515048B2C98E8A60ACBDC6587BB8FE64A1A56E8FF00A97E1EEDA4A7068793B756591EBBE4321153851471C70B5DAC2CE490587014B82A07616E786E7DE96125F76DD35D2354D1453C06433FD67E9E631A5CE598B1F88C50CF4B98D766C9E56EC9208A8E2294F9686FE42C33168A95799D4391F1377D3B85ABE1754E84B92CF8D164EA988B2F724458D126916390B90D4A0A1A7DD54BE49507D37EBF369D9FD3BAD9C6DB3BC38192519227BDF1A1914A968C16D8C370DB66FC793EA5C7E8ABD52F7CBD29F6D1524E936A9166340DD333B56EBAFE1776D2366B783DA1E86730DAB65ADE036BACB88892759EB5E86C47473B7956C62A4F9716B21B33C7A1AD0FDEE75AECAC153AA9ED7369C6482378AC65743DA3059CACCEF1B224E711B13602C568636F2513317240AA39321623D447E81E47A7FD03E8974B3A29AA75E357182E96E9F83D6B1F1B6E7AE59A162D632A2D3C8E68626C64ACD2AF6B37926BD95B8B1C4C8D6B21624FBC48CCCFB637DCC6371462AF3ECFD21DBEA46B0764D91CCEB504F22F77C4499696C78EFB81E1DFBAAF1DA494121ED4F53C6ABA1ACFA849938B9028CCEEAE3327405770DA5E01276240502EEDD1D824D15B61EAB526BB86D8E71E4D270642A8B1F7CACA99276AEDEE34CAE83B86F735A300D5C10A07AB34C27BB1E8966691BD6F2D94C3D869E48A6C66C5AB6C38ECA54921091C914B151A395A53AFC81985AA97EC579DCB989CA007D0F55E39AF707D07B96A296F45D3EC959152BC735AC6663171D27954319FE05977BA127C7F3B4AC85EAC6C63642C39E781EB9FCDB381DBB0351ADC34DC860D440DC1848A083C1B007FE07A6F18984DEE0932834428D43168035407F48F817F27C7CFCFEF4FCEBBE06FBD8EC47392918409C91123D0C7B900B7DC472C5CB1E39E7F0392A23B7582F0C9C1660E54AB06403F2072ADE3CF1CB7E4786E381F8F511B27EFDE961E2B38CD7BA67B2E56799C4A65C9E67138D5622B430AB491D08329F18ED81476461B8423B99DB92CC46DDEF6B64B8252FD26ED63215006D93C841F87E42793AC20E140E09E479E14007F2683A5759966791708AA924A6F9F19370DDC36D69D5803E6CD7E7E0FA109357C04408D38DC02861DA9585802C1222606AAC806947177CFA697A8BA8CDFF10AD57A5667A51C98D9AD95ABF1209ECC752FAD313B98A49046B6921EE5478D980E198F1C88DB5B4BC1E53A87D32D2F178BB962FE9902EC7B2E4CC35FE822B15AACAD66A075736178CC5CAF3C724C91C3208E10515DD1838B0FBAAA190EA8C7FC7F59AF80B991D4368FE1F4ACE565B62CCF0EADB3CB558F763AA15F92C45D85C43249104EE8D0BF8F4F6F4F7198BD871582EA6E20B53836AC6E5ED4F5DD7B4DC8D619E90ACD1958A7596B5AABDF3394749DA18E7115732FDD1EF5643361EA18B436CDA646D8F9A11C376726633498C8D2AEE56057B86458DDCDC6B1BEDAA13E7D2F5AE9ED5E2CDC775C5D6E28B3F489D92BED630FBB8D31008EEAC71483D81D115CB9652CA4B021DA7A6F5F7DAF2D7B17AC409377C6D2D5711CB1A292AC50763B121F8E14A1040E5BEE3E2117503F4F4C4E52679A4AFB666DA5B905DAD9A873558DDA9F0C8CDF0D6FAE674AC9286EC9228AA48CE4426354688324F3196B584B305591F949259544A3C18D3E56ED24700A8E187E7F3C103B473DCEB62377D769D66176EC04A850C25E016FB0F730EE25783CF210281C291E49F3197DBB3F4C7932B0E77C77DC46E001BE14B29BF00F37FA9AB1C7A9730B43D1F5E438D9F1AB10A0BC4C095729406E00AD91E2EC05E6ACDD569E23DA5E2B5FD971B9F4C2C18364A98BC7C74EB4AD2578A3C5455AB56B1377471996F18AAB9B731697E692599DFF0098DDFEA7DF59FA0F86EB3F45B5CC7D870B3E1ADA62D64AE4C5D95B23032456418C2F6309605AE495EE8D2C33C463902B06AF7EEB1EB136D5592C64E9E2B038C82DDA96FD87856ADA9EB189A4AD14F2910997B6612FC7DC2421646501558891BA17BA4E83CBA364284BB063EC56C8D12F5275B50B77CB12A98668E64661F324E5CC6F1962EC1500EEEE25164BE46A3A60D46669DF2619C490C85598AB464953C8634E430164D800F83409B4AD3F49C097234A8E281629E00ACA0A8635B5142A924A855F9056F904D9E6B7352FD34EA52D8B2F0DAA3B605CC48DF4D254C8D2FE1B8859AD4735B971FF00F43388AC98208C476E3BF056AE658BB0FCF2B99863DB66BBD3AFF0269F6B2B91B386A9B5E0F60D866B32D8B375F1FAE5A195B9057F811EC3D9B55A898788F9705D9E2E5C76BBF3D3EF7158DB82EE2B3621AD9AC5CC6B5A88BA00AEBCF64B1B3B3298E78CACD1B00AA55D08FC9F49AEA2CD4FAAF8DDDB1F887B0CF36B3771126468CF2436B1DFE22A590A53CD4EDD69229EADD1596515EDC0565AFCB3C4CB288E446D4D5F57D6758D15669A4C878F2B1CA44CA81694A50202F2A05312C5C802F9B24A5C9E9ED23A7747D6322165C688E166E5E41859EC32E3B309141766BDC17B6142804F00716B0D5F47F6D5B1DC6AD93CE67F03052A12587C866F29B6E2AB5C97EA20820A507D54B5DDAC76D896D772C613E0AD2866EF3116EF374B7D935C8B1A721D6ED7429B561ADC63AAD92AC512366302CAB1671580E02B70CC10827B830F02B5AEFB2296333226F1D4B89463A39995B7ADA1D002581015B24DCA92002A49E5558313C91EA1CEC7EC63A78367BDABE5F69CC507B7AEE42FD564BB4E6BD2DB8AEE2C47163D6EABB35878A5B4CEEC26F8E38E4631F86616156482356965CA68238D0BB3BC7B995506E67621A3A551EE66AA500EE200DC294112D8A412D902C9A2492000050248BF8E09340DF074238CE9EFB1D314C6CF59F4C67FAA97E3EEEA65A6E21210C6015CC905402782598FF7238F43D66FF0BD14C5E1E8C74B4FD13A896B0A87BA3BB7F6BC4602C5E9CA22CD70E3B2F2D5BC89376218E492BC292A80D1204ED247A4126AFA523B29D6A152AC410D24208208E08FB4922B8F26F817CD0F522E2FD1AFABB9B8D065E27D33EB8C9C5C98D26C7C883A535C9219A1902B472C522E01578DD4AB23A92ACAC0824137B7FB9D3AD16D622C634EAB82AD5A44EE31D2C7D7A24347DE62659292432AB46DC32F6BA8040E7F007AE39D83115E8A2BD2AA562800F91EBC2CC7850A09241773F8FEA59CFE093EAC237BF6B5A3EC5AD6C5168F6727D3CDDF2149FF0080EDF4EF5DD96AE0F350F63D2C94BA6ED96F33A66623EE896BDD8321849659E94B3AD7B352DFC17214D754F45E87F4EBA4BB3755BAA5ABD7AF5BA71D3CC9ECFB94584C8E5197BB0987394CB263E1AB2616BDFBB2D8825AD899FE831AF6649A148E1A892FC5148F91A2C59498F262EA2F364BCBD8386D8922E4190AC7DB65D934892C523931C6CAE65122912411AB44D2440990D11956684471AA777ED025568822F0E1AD5191D5577302366C20ABB30655CED7BBAE93746F2B9FE98759376D18EC1B1E95B14B86C455A9937C355CAE2B358CCAC526036248AB594C86225B165A5F8E3856F413CF20A76A38ACDB86CB6755E8ED183D43A89530B43594BFA63D98F57C0AC9061B18D95B8D6A54AF40F96B91E363AF15CB53358B37AD492DC678858FA689D2F6F3D57E907EA17D625E8F67A797A2ED88DA21EA56A9AA4D9D3B0E53A8FA2E164BB6463752CD498DA745B60AA62AE9B1D7BB5BEB2A6285BCA632B64FE8E75AB3A3DEF742709A3693A3EC7D2ED7A0C66A1D35D729E9B95D7B131CB28C46B30492C98BCB10EF35BBAB15BB5621CC5EB1358BB3D992959B72CD259B56626DFA85F4CFABFA570355C6D7B05F4DCDC47C7CD8F4B291CAF2614D0EC9751EFE3BC90C88AF248BFD392568DA2C8EE765E36524FF004CFADB48D5756D24E26A4F958390B99838F9232268F1E19A4DC461B43298CA1C8902928EAAAC5A3716194FAA5DDD5A396290795304CA7B81285D04826460DCB111B28561C7F987DA7F078881D4BCBE571AB264E29ED3628CA23B9353EE77AF0246CF376C688ECD2B2AB2C4AC197FEE2AC4046927BD652093E515664912C2B3D1759018E6808694D3EE53DBDF172D2536E489226F8BCF60EE8E1536568F29251B9047671F64872B63821DE26255C0900E1959983201DC58FF00ED6E4575C885BB0C5577BAB233C52721E3561BD478D84A81F906520120FAB2D8991DBCDD865642C1D1655FEEB3D1174390ADE6EAAC5102C7A47DDEACF44F6CD321C15ABF8135A587EEAF9067C85A627BC2C9669C50CCC67F9786769A385C10C38400F049D2BC4F40356D92A6C343372666D456458835FA7AF5CBD150B9F3473436E1A6D2C5046F1D95796235BE62640AD127728F4E2E7A8E666592E6978FACB912E50C7055F81E5763F62B9811BE462ADCF3287461DC7B141202A745C7FBA69258D64C2D6C4E21D3E2B36E9A55AB7E6ABC0EFF0094D38AB5801D4BA904872392482CFCF5364E147872AC59993891104498E72A24E686E55DF8E7B808E06D1BB9E0791EA42D174DD2E72D91A9BCD265C48BB1E38E460C000C0AC8925202DEE6DD441ABAA1645B567ABEE9D52C665748AFB06369B475A9E76ECB89CB6131D7C484C53410D7CAD3A8CD7B1AA3EA49559104224AF2CB238510D837B76C660F198BD9F2F98D8D29B2C55EB263ED5EA156B5C9E4A72AB6426FAB2B3CC69C32CB05758A58EBA35C999E177588A45FDEF39360F0D5D7271C748D47924B37A611C26289147D4CCAAEC1D55D2363CB73F7152C4062433CFD6B126AD61E8565A76AD5DB74E0C848B11924C7C27B25B304C0970E660F42231FFA4F4EDBAFDC23900F74AEA1830EB5FCC268A47C3C1C79BECE855673264D6E81A490089106E6B52CA0C743682CA3D656E90D7BAF753C2FA7FD2F90D16ABD599631E4CB7676874CE9FC7D936B7AA6685F70C3C6C6231DA8ABE46464C18A85649D4FAB19EB0F58342D78DDC6E2727166F2871D0D378F192A3D2A93043F20B3943DD599A1EE1DD0D217244955A29E3818314AE3D8B6FC74F969F2D1D58DB292C52C5F5DC77CB145230F9628647E5A349B80D3AC6D12CFC03229E17D31F3EEF25D98C4B37732A348A198962A8007009ED2481CF3C02493CB70083EBE58F3915CF91524FE6051205FC3320215CFE403DBE090A38E78E7F7015750F5167EB12A194AC7043BFB304236A22B80AE492773960299A462383B42D903631F45FF00857FA45F49A0C5CDC3D263EA5EA9409DDEA8EA28E0CDCC4C850ACCDA5623A1C2D1D03D988E2C4730210B3E76491B8AC2DEC9625999CCACA4F2380411E19BFA927FB71FD00F43D37F2D98A47666720FE382478007E3FF003E7CF3F9E7CFA1E8644A7E493CDDF02ECA9F1C7FA0F8FCBD59CE2FC9F3C55557155CFE9FB0FC0FAF415E897BDDF6FDD6ED2EE6D9ADEE0B8AB784458B6CD176A8860BA89A8E4DC88971794D52C3B5FB53CF6D968D29B0C3254F217DD29D1B33DBEF8119AFD4836CCB5BFD3CFDC967EC6BD9AD2F29634B4C3C78CD99B03264C54C8EEF82D7D5EEAEBB9AD8317257CA54B5F515920CA496BE8ED471DB8AADA12D68DDEF70BD0BA1D439BA73D51D770F0D8EAAF42372ADD48D2E0AD151AF6771868D696BEC7D3ABB7ED2A88696E98867C7C369E40B8DCBC58AC8BC73C156C55B11F7F55911CFFA7F7B88C77F123569B61F4CBD88BB2B01241351EA8E933CB8AB5F2376FF002E58D6278A46FF004A4507943CFAD906971F4F65752F4BCDA44195891E6752E9AB93839B96B99369889A962010C19290E22E6413C52991279F163954C6D8E77342F9395F249A836A9168FADA66C914CF069199D9C882130265B3624C4C9244D24FD896375D8638E6646DC25142458A1C0CBF50773D2B6BC16DDA1DFB9AAF517A77B352DB354BB8FB2D0DAC2ED34E58E78EBE3ECA952709B9455D63AACC162873F4AAD4B243DE8626D627B77FD543A23EE6759E9D623359E931FD56DEF5016361D4361C2C74F59BD9B10BE3B64D570B93FA58F1B7D726D5AC64B1D87C8358C8B4371F15259BB7A031364F77FC0C997C45ADA71F0119DD5BF959AC6C6E23392C04D2AC39CA0CEAACE0089A1CA626E2A99295EAD52DC1D9342AF1A134CB56A3B792A58EB52ADF175366C5DAA72C95278F331A57BD66FE39A1656A8760A2F4766AA90C8D343978F2D5D195EAF62EC6FEA17D35D1FAEE3C6835569A2CBC78A66D373F1C43BC2CF194306424B1B89F0A578C364636E89CCD8E9DA962124AD254EE95EB0CEE9B8A77C211BC06588E66349DC3B1A3746EF44C8CA629C2B878656EE276DE557495C232DF9FBDCF6F17FA65924DF7A6296721D2FDAA7B36ABE390C93CBADE44F75AB1874908793F9404D3E3FE47362D5447910CD6A9641A5A97CE7501AB4CF24EC1254747E67ED8A55943284EC3C94E24E3B41504485FB9589E39D157B28EABE0FDDDFB6C9307BCFC77F315E34D33A915D3E34B55B60AD5D27C1EE744791566CD555AB9A8264863AB16720CBD08E192BD1911AA3BDD5FB5E9FA7BBCE6B55CE5448EE5597EAE964AB57786AE731167BE4C7E66AAF2004B91A959C23CBF4D762B94A7769EACA4E9CBEAE741CBF4E3AAB3B13270DCE94D9B26390A2FEC194A4130866003E2CE87BF87213EE858282404AD947D2DEB51D73A163565FF006BC1869206239D4712854A431B19303FF4B296F975EE72C5CFA8E5AD7BA78F0108AF3C50C1663650B2984BFC8C013C33A83CA1E18F2EBDCA4720F903D3C988F7BF5E1615A349A632701EB574795D9FCAA88D6251DC5DBCAA92491D84A91DC3D4513D1A82490B7D437D8E47C6E81D98AFE390549E3C793CFF004FC28E3D3EFD36E8EEBF86B1473397A61EBBDEA15D610D56BD89BE7B514527D2B5AED89AC7C3F2B568E4E44B3AA276B93EA17D530FA6F21788A6123B2A8447ED82EE4004B1463B0016C05D03C57CCDDA4E6EB58CB2BE4E608B1218CCD393186648A18CBB8525956E909DC4F8FEE9F1EBE1EA9E4FA93D58A992D872BAEE6307D39C5478DB796CA97A94E306FD9FF945296292532E425CB4904B13C55A196AC5F0C8F334A2A5D4464F29B3D6C976502916149AECF52993C558AAC4ACB5A1AC6341DC8424680346ADF2480CDDAAFF0021995EE5BDC262BA83D38E9874C753C7DFC2EAFABCB97BB645FE23B590AB42CD8C6EB62DC7DCF2A4B8BC1C12A1695E4925B37ADABB3FC6AC6B2766B6F6720F3B3346D01578FB0F12428CEBC04F078091F1C0656079084105BD31644385018B0B01523C68F732140559E43B4BCB217B91CB1DAA1999BDA014A079BFBFC28749CFA6745667D4AD5B1CB6BBD71377705B25477F07A4609163D270212D6204CA64C8D5A431AA8CA6C8C69250C238C21FC9959F1B97C14ECE5639B24B4AC0240F3604B519189E47995E26FD81ED079FE86B364E4C66CD868CC85127BD352279E15A29E23F1823CFFEA276F91CFC8A5FF1F96D33F9194D2AE6C1E2CD5C8D2BB14DDA7E0B2B05A85DA589B9250F67FD4404F7A1208E620AE555B6CAFF00C6F509D7B809333551FF0023EE8CAB31E4723878D89038FB581FCF2786C962DCF0EFAB65C888FE076206079AB3EE3F0479146ABD5BD833AA3CDEDB313049A64E80FDE5334C60915801C71106279B0C482579F4ECBCFDAF20241E5D88F3C8009E401C91C0FDF81C8F3CF3E7803D10D9133CF2104A80C54005FF00009E3F047EDF8FEDC79E3D0F4D210D0A635C57B57F2AFF0041FB7EE58D2B066001FBC7E40F95FDAFF5F91CF1C7A7F58AD18B32571DCB190CE855B8789D53E45689C0E55837E0F9FF0073CD75FEA858CAB9AFD3F7DCDA5E5668F2DA057FAF8A321629E6C7EE9ADFC16BE32ACB1DA608A259E308CE1471DA473E87A1EAFE74CFFCC5A17E7ACE937F9DE6E3937FA902FF0041F87AF948D6C91A36AC41A3FCB73B91FF00C697D79F4E8196BF766C7ADAB124DF539ACCEA374BB1637F1356ABB556B9C9226B9000112CF0A5A2E63956446605B5C5DB9F0DBFEAF0517F8E34C96CF8950C3B88A782CB60EE62D3F61DD50EC39AAC8FC72D5321340E182C4D18F43D6DEE4663068AC5896DF0FB8924FBA4C6DDC9E7DDB9AFF1DCD7E4DD165555CED4D55542F6324ED000168999B0D015EDA1B7FC342AA87ABB8FD2DB6ECC6A3EF41BA7D889225D4FAA181CFD0DA3153AC8F0B3E13097F6CC4E468AC72C295F258FC854B156B58952C2478DCB65AA887BACC7341735FA80F4F356CCF435373BB449D8B50D83138DC4E42365494E333F7055C863AE131B359A9DE62B9590B24956E40AF0C8B14F721B43D0F5AEFF00E33A080E76B24C3112FD2F8190C7B696D3A4F3224EC6ADA654445590DBAAA2A86014016CBF8649A60DA0D4B20AD75A115230A8A4583B910A3C46FBDF7A7DD6DEDB81DC6E8CB0BA8E167CA3992191877290A641DABC941E0767F43C02792381C1E7CFA9BFD25E9D6A791D13A95B85BC70973BA15AD625D6AC990FC74DB22D6F1B7BBA0E3E295AC437C3998A8B10CB4EA9AD34119B915B1E87AD6868C03E6C9B806D9839CE9B85EC74824D8EB77B59686D6145685115EAFEF52B347D3FA81425093021284A928D9702B212289565254AF82090451F54CDD73CB5ECC752F72C85F904B6ECE6ACA4D2850A5D5AE1461E3F05BEE766FF003348EEC49EE23D44DD87C64B2A07E163E17FB0F853C0FDB8FF00F39E7CF3C81C0F43D37CBFF1CDF9A484FE67B9E7FF0003F61EB713D0E891FD34E8F48D15117A6FA742A2285551FC931CD2AA8000BE680ABE7D1266FF009BA85991C02E950CC8DC0E565AE5846EBCF20376F2AC40FB94B29FB491E977993F2C1A8CAFE5DB278C627CFE5A06278F3E3F7E3F7F27C9F43D0F48B2491D9A247FB44FE3FED0FF00D0FD87A2CC0E66C8BE77693A5937CD91952513F8916689F166BC9F4A5C9D878ADBA2F1C700F96907925B9FF2BA8FF6E7FBFA1E87A1E9B17C2FE8BFFE7E8CDFEFB7FD47FD7D7FFFD9),
 (3,'z&auml;hringer','matthias','Mad Maz',2,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001F0000000602030100000000000000000000000406070809050A01030B02FFC4003110000202020201030400050305010000000102030405110612070013210814223109152332412442510A1633526162FFC4001E01000202020301010000000000000000000506030407080102090A00FFC4003511000202010205030205030207000000000102031121041200052231410613510732142342617108819133F01524256273C1D1FFDA000C03010002110311003F00D13AB5C65FC580EA4321257ABF504E98807F223B686C9075F20EC9F5CCD5C218DFB48448A25466529DD4BF52C8C013F2E194F5274509D9DFC17902AC9D900552180236CC76DD431D6B64FC7C103A81F24EF7E8D2C32A968E46EC50811A3F663D482CA14ECED344900375D9FF008D1F519031902C5E319C647EDFB63E7F88CEDEE3F6BFE01181DB38FF007638C852B512CB5DA55937113A283B4924D210AA586C1551F1B653D9574403B3A5436432205AC7C4EB685D592278DD5A5B8A53A3288D613EF28FDAE94746FC987C2EFD26A961E4B15E7B914F0A4F58990536472F27F90D1B2A3C7D81D92AE53F104A82BF3E965C470F96E57CC38FE1E4AE72991E437EAE171B0579A3A625C9E49531F8BF7268A3FC561B72D56B119D332028644ECCEB136D2D40AE066C90430DA40CF8EE5896A1819CF1C1556B6A2D55D359240057E320F918CE4FC2D7C3FE1CE63E5ECF41C3F82F1BCBF27CF4C1CAD3C6549E568AB472461ADDB214C74A957EE3EEADDD78ABC2ABDA695175EAE0FC69FC1DADCB421BFCEFCCB88C765A6FB636703C7B8BD9CD54C7CB2750F03E66C6630F1C92C3B01BDAA0232639144AC0AB7A98BF47BE02C2F847876738FF0006BCDC9391E46F7DA72EE5505496B439CBF4C29486B4E25FF4D80C7B4CC6AD679D9A77792D4DFD5942C338B17E3CBD3AA59E5197731A02CD8FA331AD5838F90C4D7293991482D19F73624DB9662149EEF38806C558B728B779177B1242921236B01476248DC706C7DBC31F2EE4B148A64D49697DCA1ED872AA95FF0072B593605906AE80F93535CABF836E4A2AF259E07E5BC5E52F9FC850E57C7EEE0EAF75F9558EF63321C95E48D87CB6F1E8A076DB15240AA8FA8EFA72F2A782731FF6E790F885EC63D97EF8AC94256F603375AA81DE5C3656AA9AB22ECEE680986F5546892CD4ACE747715C297A51470D68EF1A9107559AD3ABCA57A81A5560AE030EA34E19B7F23FFBD5CA38F710E758A9711CCF8CE1F93620FF00564C7723C2D5CB52062262161EADFAF6228CA9708960C6ACAD2284752C37147AC8A4915751082000A2485444E28EE140ED46AABDA555B1F759B36B55E98D2489EE69D9B4F28A64DCCED1136B4086B61600B3783DF771A567098B34719FCBA9A474695BB0E49304104B6AC47068C02D968A560134A11FB44AEDDD8AA990FA76A7F27F2FE2186E3F8CC6E5AC59AF85B93DB99BF9455816835FA70D6B38D8AB974AF6A59E1F7E34B4C95ED33C65D6462ED2B5FB7997F87D7887C8F89C9D8F19F16AFE26E6B416C0C065F8F151C6332482638B2B892F692BC136FA1B556A4790C6CECB2A8BB5626A6D411F503E3D87C4F98C871DE496F9356F2754BD17F3CE397E5867C7D15A934B0D530DFAF8FC7C579ED5674CAD5B7023577AD7227135894B3FAA3ACD269E7915D6A688CA1957DAA91252080F215326D051980903EC0C02B1C8408DCC793EA3433A36A63496198FE5B2A1910B95ADAE694A305BB2F54288DDC7D62F9FDFB30DEE438DC75182DD37165BF985535E959650EB0C762A4110A933D96922859C2492C131795A41134F62276725C8B86F98381672CF38C7AF0FF2355143338CCCE32C25FE417D23AD056C94D530106368C9062522AFD207B3999EDBBBB069CC51A1289F0D6578FF0025C44F82CCE571FC767AC6ED9B96F31EDD6B33C17DA5F662C364E2812D60CCFD8C2F69E492BCD34E11445EF442660731CB26C372DB54F86723E434F8ED9B3AAE96ECD812D781EFEA6ACCD1992B5FA452B2CD1BAC53D7B5599525592412071D1C55248903C8B2E9D831DCF23FE59D8A54B6D6421F69214A11B722EC8218401E59238D4C52C6CAC8DD401515496451DCA320A91575542E4BC1C3395D0A58E87895AC75FC53E3EACC6CDECC88676B9226ECA9AF1D968EB7560A1A15487ACBEE33C4B23BB30F4DAD1CF71DACB6226A51F20716E776C8D6F6E185C484491AA43EC111030B472FB6B1D758CCBD056AE07B4A3D08683525989566B62776D9F3641BFF0059459BF0AA2C8E90091C40CBA9DC6915B3F71892CF6C9EB02CD0BC01DF032388191AC3D826F69B6EBB5EA4A9FF00D4E86B4C00D16D9D1D0DEFD1D301ECE260E2400146D860620BF8B7EC330FFE0EBD7E17AFC7C1E591616895D55D6232828EAADD09F82547E8866D7EB647F737C6F45A79A2958968B449D680D6BFCF52A154920281AEDFB1A00E87A7DB276E0D003B5FC8C7F6AEE4FEFE6C36024E05F8BEE7B1071835DBE3C9CF6E3A994475142CCEEE241234676B1ED400AC3F31B71D8A10CBF0BB2364FA901F4B586B1C9BCCBC331E5049051B56F2E22555F99E9519E7490694B190CD0C0175F01BF25D7F9682BD0AD2D532A332C813B2C663E8E491A6D282E594B02137FDC77B1F97A995F473E3FE690F90EC734C0631A29B8F71EC864E3BD34533E3E8C96BDBC589ED0AD5EDFB094A3BEF79E3784CA56155543D8EB9502892A696C92CBB47800138BF82DE38E6360CC141258BA8A23B9B5BAC0ED58CD782462AEB784E4391F8EEAC11CB96CAE3A8E661BCB8FC63D89CDCCB652182248E0C7E2C2B4A5A28E51189FDAFCDB4598FB65C3CF81F3379257231D0BB638EE12058904389BA2E66F937B7D42C665C06221BB912C24D977FE9C8E9F2E88C580808FF00541F4FDE3B967B1CC393720E7DCEA4ACF1F20ADC2AD8B393CA5B0FEEB419AE6B1DA4AB80C7F6095E3C1708B92ABC30C4D99E41986964A75DB0E41FC52797E3E17C27873C4FC3780E216422B4F7207CADD25B61E5922AC68D1F7A4621A592482C3B49F93BB13D850D44BA6924666B634015896BEDA05BDC3B558D1157BD4EE2422E470DBA5D545A4450A5E4DB8A5625779D9DC81669B77602C800601DD7A188F2172BB063692BDDB093765EB378DBC878B893B1565916593096A5D83B57EC88850776689C1032577CB6D86458B3BC773690912FBC30D22E5BFA66486494B60ADFF2EE48D0F68565963AB85B722A229F908A46B6D96FAF9FAC3CB48D62BF92EC628CA59D6BE230585A71AA020E87FA0924EA0FEB721FF8560747D125FE217F5918E46AF91E791721A853A4F4B91F1AC064EA5B88FC94B70C94236963D7C7E64903E01D1D7AA6B2426820603E4C8148AA1D20A853806FB8BEC3C89DF9BA311BF4C4283820300303200CF61DFF00FBC6C65C73C8DC4F2B9B8EEF05E57532546D4EF2DEC02CAE9263A7795E2993EC2F4715DA914BA649805DD5B6B1484185EC4525577F18EE2F561BFE24F2BE1E28E95F106678E65F2315645B528AD163EFE1CCF29D89C47159CC4110943055FC4332950B08E2FAD7A3CFF255A6E6F8993C61CFE073FCB7C8BC11AC1C74B2BA88E4A79EC15A79B2698CB3D2212363B2960D251AA38F302B5291F6FABCF2566BC9BF4A9E23C866B378DCB5BC47926FE02DE7F0F91AD90AF93AB92E2B7E4A4CDF31D8A8924515BAF24395A74AE45F6F20B15A1720FA96091E39955B3EE0642B252B1564661B88DC9202140DE94DBAB7A0357479A6B74DABD04EA9B888F631254EEFB94580D853560D36D209359E2A5628A1B905DBD4165B91C1F6D1DF0ED288DD666528D3C49A45485FA2A97262598A3020305F5F3C8B945CE497A9567828451E26941445B86B1824B2B033B4525A5412B4965E3916B310114FB4B2384F9724F3724D8982BFF2E314746DD1B4914F4DE3496E44D61839B7340419C7B9112239CB18D521074AA83D17F1E63AFE77350E3EA584AD387FBA92696196C7558C050CE86399183C8C8A1E40B1C6ECACCFAD0F53050434E76ED40C14927028292D44A822AA802541AAB17C2700815B50ED61012A5BF4A90035EDF2083E09071E01E1CBE337F9150C6FB18A38D4AFEEF7749F1D14F2ACED5EB87EF259AF65C97458E4212458F6FB58D493B1E9458CE19CED2AAACB6B1902ABB880496B1B6564801FC66865167B7B2EFEE754902488C1815D6891E863B2976267D3DEE20FE603904039F35FFAFE686BCA824604E9C531C16526AD704EDC9ABFF3FBF117DD192CD711B89CD893AAC4BFEE12061D153676C1DBAAFEFF0026FF00EF61609F4EFF0049BE26F23E6EB623C99F50383E0199499DA6C0478192716D1F40E3E3E5B93C863B8FD7C9C2FDA1B108AF7EB23286AB35FDB08E0E435043669B5411A4D5DD2CA5A2598960EAF0C2C3F2843075EDD9515D4FE3B6D6C3B92DA6B31ADD8643D2DA89D483BF99496704A9D86472EAC4A8F953B3FA2496A7593E98C0D108CEE66DC648C4975400ABAA7C9047F37DC166D1C70CEE7782FB002505AEE5F04ED209031605F8BC717FD5FC11FC3DFE9D78EC596E452F08E51671D5C98EFF002CCD52E6793BCC83BAC50F1BA32361A5795BAA4722F1D8A3048F72C469DE46A88FAB9FA9EE49E58B52F1FF0019252E01E2887B8ADC438BD1AB81FBBA7491FDABD9C8B190D6AB3CBEC9ED0C3F9474A39BD9842B3CEF2C4FC9DAB4EA227B12C8A1810199986BB7EF64923A9620EC01F0A4161FB5BF20E1793A367054529B08B350D51FCC2342D1D8395ACE4C09202E107B25BA4674CDD0368E80F51CDCC351A96816574D9D4CB09148C1154962BDB04AB28514091824D839169639B4DAC686011A40210DEDD8DAF2C9B56C816C4D10771F24937C36BC3F11664A9DFDA9A433BF704072FD37A0769D9A442413D46F675FDBB07D3F384C0C351164B784CB598D75A714A6059C80022288DBB1047ED99340EFFC1026278F7E9DAF474EB2D0C7833495E2FEA14E8D1A15503E19344FECFC91A240006C9F4BFB7F4E3C90398CDFE4115BEAC7D84C99151C752AA1EA58AEEA6340449B85CB7E3A64D161E82FE2DF5333BAA011DD062CC08C00BFE9A3576CF577F0307860D37A675A9A44982DE00FB53E416B6765AA27B11DC771E58EF1CF08C472E0F03607218E610B4893D8653132A7FB4803BA7E3AEBBDA9F81DBFE139E40F1EE06A493D283234D6CA9602BC9346937BAA14B041F896258807F6CA75B21767D4C6F1DF8F329C262CD4365AC64961C6DC6915BAB2C565636752197FD88FD4950CC46CAE94FF004D619F33E11CA33F99BB6AF62E5CD4464966ACB4AE8C65F843962D25733A8866F6DB41E34EFD8E876EC7E2AC2D34BAA950D2C51F5060FBB70A03A4BB29A07B8B046083D8713EBF95CFA6D269D9F482633095C36C2A4221018746E20591B580F926AAF8861CF78E1C7C922B2AACC8C482011F901AD82091F2C07E40FF00711F1FAD29FC63CE1E3C7DBE379B59B27C6B355D6AE6712D2285962F95AF7E99915920CAE3DCB4F46F2AF78A4ED149EE579AC412F773BC0E4E9C1744AB7847134A5A3C842B15CAF381A50CC85A3950EBE5E36EAE74747E0FA66B07F7F8BB708B22308101611C9D9E32C19A28DF5B547934580ECDF1B0541EBB3D1D4DA523703246414206D2192AF6F95360591D8D51CDF08F3A149CFE56D57E97423A412460E40C1F3FB1C60D1DE63887E2B94C971D124366386C7BF472611E36B98EB4B1DAA16C06918C62C5478A531825A290B42E7B238F5F7C0AA49633C90477E9E26C4B04F2D2B970CEB12BC69DF41A32224902ABBA99C7B6CD18423B328F4E9720C345CF7014F238D8FEE335C6AA4B5F215635067B7825796CA4E91028F2B62E69A66B0635790D29FDED2C14A562C7B564AB6A3AF5DDC4ED3A2234C542C24B752C5800EA83BFC3FE5DBE4EC32EFD5E8DC6A74C76D2332B2B9ADDB65A1BAD702AC6EA3829445583C0B990233C468EF04E70A57146C608EF7473764672FEDE8792C772C47573B0C35A393A42B30AD624650AA5E425CD79235798C863864895923E9A010A003D226DF20B76A77B0F93B15E7942B594AB0D84AE67EA033C4880A22B285D8524160CC09EDE87AA69A57D8B674E0D0BBD3B937D37641009248248001CD0A391423D5E0740A00508558580A306B39F3E6C9FE10D7EBC95A8208DECC45D4FC07D1D92A588551F285581075A3B276A08F59FE2197114430D6D9FAC9DE4A534876A6627F28CB3B0EAB2A01D17457DC56D7FE627D624416248E59D84D08588C91473B34B22C000287E047D91D46810ABF89FF77503D74C145EC059984B0AEF70C7B25C1520F705C061B2411F88D03D7E7E0FAB6EA92C6518D1BDC1AACAB0A20907EE39C8C820117E782B0C8D110EA7208DD939BEE280040A3F0450C76E159933A2E7443053F075F89206947F8F9F9D96FD81A27E46E5DFD376697C979FE01E3ACCD3795F0BC9E8DB4C896531CD8EA1432D3C15ECF6612892B14290F5255A158D19418C1686156D5AB424AB734D2C2A7ADC0A01110F955B0FA0B2B90A0064DB920760CC766787D1D711B98BBF47C8332FB55A1E5F4AA43281F2D56B60792499090ED7F185567876ADA6D86DAFE8909CDB6E9F43A8988FCED3C6F269C824112ECA50B432185F4907B5918521B7D393CB27315861A68752823D5C4CA195E0DE9212C08250ABAA1571956ED82C0DD78C9F14F1FE2E6B9685586B5058D65B56022C2AE7E162323E89790AE9631F034A47C302C8693CA357952DDC8D4C2AC58789420B922B576911D8A778A0FE9CEF0200599C46C1937D0B6B4D84E6F063F9A63E3E34724D8F972595A72D7BD122B1AB24B584105A3D84913B1211111C68BB8DE8ECFA27C13C61CEB1594C970FE579EE1C93C5EC8E3190BE327C72B721A13D882248E5C80B3771B064628669DE44FB38FDC354AC635331891791CFAFD5699A6975327B0EF4D1C212392356650AE37FDE96698A90557AA8837C64C5E6CCAF269E286131E94A7BAEDBD82A28FD46356644C6D69082058276861C2DB0763C7D92E399EBB2F28C59925AD66AC46B0315786411EDA293DDE8EADFD8097F96F860C548628BE2BC0786729C71A52D9C7C5933DFB432FB0F1CC199915807660CAC012AFF00074C013F8FAC3792BE9D39271837ED722E11CB16AC33FB572C54387E43C7A506BC33B149319947B766B2A4E19E69B123FF00218BAAC91C9A8E94FC9D89BCD8B1C424C8CF362675AF05AC662AED5A2C2293A4D4E59E6862843F5574857F306C8446423654E28D5431BED316A0C64B6D58E45DF090A5048E0B2592286458B3FA8815B55EA0D3CEF00916278A2383A7962D42852CA3B26E00162AD4E4377383C365F589E23AFC430399C856863F6A1AAEDB8143291A015F6364FE44EC6B4BF98D95D115573E3E684EA71D669C2599632A09856451ECC67B7CA308DBAEF43A003F45D88B8AFAC0E49661F18595C93ACD7F2376BE228A38FC6C3CEE249A554248052AC5625653A01A3EA741766A88D79ACCF358B5B79656323C8DFDDBD6F4AA1405F9D6BAE87503A9EAA3D11E4FAF69F4AF384D88D3BAA29BDC0288E97382036EC8AED42B69E11FD40609F5CEF0A00CD1478550A809DCC5B06C3361476C6E2726CE130B95CAE0AF54C850B566A5EA73A4B56DC3218E48D908603E080EA46B6ADF8B2FE2475FC7D3C9CEF9C70CE6983C0C92F8A78C714E6F0DA84E5F93F14972156AF23A820B1EE4991E2FF72F83C3DD9A7FB79DA7C2D3A31D908F2CD09925591DA9B42AE3FDB96CA8DCBDBEDAB807DC9D90807F1D308E24661EE39283A829192DA1EB1B5DE7B997B0F5AD9355208AC4EDA64616254118AEAB202A1228C05F6D76810A81F03E4FC671EF0263014EE2A5943F65D8D46985B582C1A8D6CA37C26EB0D0310A66C1F9D8AA56F392198E05D58EE783496DA3EF1B62CDB292CAA25580B7C7724216F6CEFA6F40EFE17A83F20EC7AE24C659796568B30625F718F58A4B1D76DF96D8C51C8858861B3D8100052ABAD7A1EA631A31B2C6CE7EF9077AF1FEFBFF001C0CFCB3E17FC39CE3E31F1FE7F7CCE2FA61FE1A3F55FF00550CB67C69E3AC84FC67DF48F25CCF3727F20E1944C63B48B267EEA08AE4B19661363B0D1E5327109149A1D096F56ED86FFA7C79152A15ECF92BCE584C6DD5840B387E11C46F66614D2012470E773994E3EEC46982CAD81D771BF6DD5747D01B8EF00E25C338FE3B8CF13E3F84E3BC6B114E3A38CC0607174B1987C6D2810AC7528632941154AB5A34D08E08218E20010A9B1EA37F9BFE9FA9E7A94D9BE2F0D5A96846DF738A529562B2CC4B76A6095896762487ADF824A74623EE6A37F32BD41FD697A939B6AE7D3F29D269BD2DA2B65D2EA8245CC27626B6FE2351A88BDA467F06185550900B7EA39562F44449EDC8D29D51DD46220C409E90768563D82D531268E3BD71A73623F8627D34785F119A86B70EBFCEF256B1E98FC865B9FDD8B336A0826529625C2D5A74B178DC5C93C8013623A2729006F6EB6456369227889CBB81E2FC5393838D54AF02F1CBF9DC7DAC1F489625FB5B3663C4D8A4E23548E3B15A2C94904BEDAF4920F66711EA4112EC5FE66C05BA56EDD25C63C31E4206C55AB1914F6A48275911639A3A407BA64127568CCD2C063647F72BB2823D52A7D4C709B391C1E72650D1E5B8CFB5CEF06E23EACF738E48B7B258E544D02976BD79E158574A2CFB0DD4FB40115F4D7EB8FAB0FAEA16F537A835BCCF94F3B934FA5D62EB26678A01332C1A7D669E3276C1F8596461308D555F4DEEB323B22ED79E57CB797C3A478F4DA5822D44484F42AFB926C16D1BBDE4B75051761A8F73C45BE3599A92646D717C9CC1E579D2852B12B059E4AEB6565A962196457296A331AC7295E8CF2200C009958D80C74ADF24E275DD69D6C8D8A3146888C805AEEA91C816394290BDFB2930BF6D6F4401A26AE791E3BF9888B294279AB5B1D6D579A1DC7345292AC81BA80C0893AABA32FE3D767F5B57078A7D5AF31E02168E4EA2B490C3ECB588C3CD1CEFF244ECC58B444280044DD21EA5954B6D5CEFE72DE69A586155914A856F754C541D378452AA46D0C97F685BA1DC5104AECD1EAF94F32975703B08A55B0EA5B70DC49538361C83DEB6B0DC2B898F9CC1E73238C971D9EAD96C7614A182CD28A6FC274EEACD1911C8CAB1B1552DA89187FC2EC288ADE4CE71C5783E362AB88C6E2F0384C33182BC72355AB099618CC962DC8C0C7A5A60A90588533306F978F47A7C99F5C3983C0B2794B7C62DBC7522AC8F721AAF044F3DA9E3AD557BCC424A25B332463A6D5540D305EE3D5287957CC1CC3C9D9B7B19C7B106215D9E2C5575923AC93C87E4DA00A19D937D9A47558CB69D63047C34E8FDBE6F049F8591FD8B08ECDB7A24A5243042A64902BD8070BBEEFC954E79CF66DEB1AAAA1204AE1628A2698AB10198A2A87A70C7AAC8C8BEF6B4FA82F3CBF9279256A78A85ECF1BE3EF69284B3BCAB05DB7315336419557DD64D0295D761996491FF001326835386C94F92969C7571D507DCDB4ACD614B8E9EE31846DAD33C51F524C8CC429EA0B29520B047CB316481E9579268D2E568AE5A8E26304725859DE3AF2CC42C51B4B1569CC28CC0BA4323A0608E0293037ED51390A22CA4535C68E6695551453923F6DA3DB27F6BCA3AF77EADA2A3B30D8D164E5FA6D1E8D20D344088C6D264760CDB98B49236DF3B99A434289E95EEA02849AE9E662EF2382E410ABFA9542802B0450A02CD633766D2D9EC6662A662E2590D7457795209249A4412C33C9DE27EC4B33FB6BD410AC0FE200234A7D393C75A8F1F85AC5D8AADB59CFB76D2547023EC5034D1AAC90F7640018BBB346F22EA48CAE802B605BBD6A1BB72289FDF8DD888C065B0B0074778846E7E13AB16EA480C8E77B5DA715EB8CF645F118DA6B7D69D732598E59A385E4760A90A3C9DD198AB13218D3B3108176A186A57712C71446D362077F6C8F6CEDDABB771AAB7360D0BAF8B1C539594ACBBCED8EA98F506EA208A6BDA33FBF73DFCF09BE47670F6F3375E84590A90C72B5768A0B6914464818C6645864AF23C2CE810C88D2487DCEEFD877EAA3D2B337C62ED8C958B191C3498AB5374678DFF00D19B61144232262B733C8CD78C666965411C324C6431451AE97D0F569244D897251DAB609DD585FD42C1F3907C62B150A3C2AAAA1CE001921B236D9BA362C60FC0FF003ECA0F6245ECB4BA4D5D8E8D99A566851FE00F6142992C124EFF0017488290449A241E160811CBCB24966728DB9A570C50B7F88D469228FF00DDA4553FFB6CFED1F8FE4B56FD386FBF489A159239E25977EDD98370CB0BEC7CB432ACB1AB6B6E5036FF002E9E890E4C8EB37F514F5037D082C840EFA63B23F141F3F3AFDFEF5BF5F352FAD766172190052C8A41F6D41218055036A802C0DC491473DF8D9F1114B19520ED722F7122867E4F7FB400D8214D7107FEB97C518AC9F159B9DE1AB470E4F1F246D9648942FDE40CE91FDE30035F715A4963133AA0692090BC9F9C2A1E80FCD3E3E8AED9964F64C886CD982453182AF0E5EA7DD7B2FF00B578CACF244C0800965047E81D97BCBB3FFDD9C76FE1E2D4D1DEC5E4E92C6C7E259AF94AF5C7EB648751D49F90C54EFB7C7AA5CF2370DE93F24A36A2292D39856922750AF0CB8CAF562935B07A32324C35A25740E81FD644F4E734D42E8B4A4CBB751A4D46D8DAE9C69E4D91460B152C446CCDB715900E140E296FFC1EB566414B2A12E2A8348809EC0502CB5BB1562FBF7D7EB9078CECD3C6FDEC15DDDF1F24D83E491751DEB65B0D68E2A6CAA46C0B0A3996AA9916EE80C4D723B1B31DA06264A6F1F2E5B26B14B494CAD3A2296523E090C482AA436813A56F8037FF003A36BDCC78A252E6194A88B147272BA899CC6B4A89F6D91CBE2AAD7C2F22C4CC5B485ECE1A1E3B729D5F97B48999980610484476BFE3D965CBC967108C0562DF73C6A350B928A6889711D0FC87DED69800B04711FBA8F65192503DCF5BFF00F4AFEAFE9B9A2A7A6BD4BAE8B43AC68219F92F35D54BEDC13E9B52AADF829E762143E8A7F7B4914E4AACE34C6272B3A8137EE6102EA204D4C1B1A22FB658AA9A2963651BBB8E8907536051600F49E1C8FA54E15C1B235F9FF1BC8F1FC466AB62ABC782CE51CCE331F98C6642B64F8FBE425A9631D91AF729CF03ACE8248ACC52472489A11AF54635A5F5ADFC2A39BF88B8EE3BEA5384E638CDEFA6CF2779465E31C7ADC1F795321C13F9B7B962BC79BAD6E334EBF0FA192AF99E3788E54D941064E3C18C8B55AB8ECB622D5FB45FA77F1DF34186E7F836826C2E679D67E3C872BBEAED158E23C727356A62F0B0495DC187986730FD16AD25963938FE3675CF640C524986C7E5F60FFA44CA71BC666737E1FE5BC7B0599E0B9DC36238D1E399BC653C860D69AD55A38FC7498BBB0D8C74F4248552A0AB2C2D0881C2852B181E90B9C7D6EE7DF48BEA4738E69C93987FC6F93EAB98409CCB92CD28974FADE4FA3D3059353A6929E3D16B659B7368B511A3DE9E17F7639219E1DC3398722E5DCEB4AD048804B046574DAA888B8672610C16ABDC895DD832336D2482A4302479A4E731D158C857C74F2508E0C62B5516F1D8BC4E2CCAF0CCC8D2CF2E22B429912231D3EEA79AD9F6DFA4561E16DBE257258DC60B6208A391E647686DC7127BCAD1274489CC807512B2B3B37F80F1FE3BD81BD67F16CFE01183F31430F96FE83382F04E03C9B1F87CADEF2278AE8DEB982C772E68618ECE32DF8EF0EB46EE0B1BC8E78D2FD1B58616F8FE1F20C319252586F1BAF7346CE65C4731C23954DC5B3985B14F2942E4D8BBB8AB11C905DAF7AACC6BDEA96EACB024F5EE43622922B159E38E68A55292A2BAEBD6FB7D26FAC3E8FF00ABFE9F4E73E98D6813E9C01CD392CEF10E65CAE66775DBAA8E33B1A398C6CF04D1EE8A54DA49470F1A61BE79C835BCA35262D487789C0304C2C24C02AB106EF630BA28D9157906C93A78ACD256AD9614DE369E8CEF034AEAD1A55321668EBB99A448DA549FAAAB05626491447F9B12DD3596AF7AC4935A9ABDFB52C312445D21558D3423656448D11421642D33923E4B32A866323A0786BE3209E3666B75665F628E429986286185E39E3DBD86D343DE392B3452C4A11000ACE4B2A357E44CBC3C8F395EFCB8AAD56AA7BBED57808120AD2BFBD321084168A4903A433460F4899557B7ECE53D348CF2485D012C193785ADA168ECA63746D4838B3BA8F6B5F8A7691BDB65A4DA4B5B7506B0546D6BDDB8511B4E2BCD0B4467B95F25C6DE18F4BF24F5AA57896A774AB6FD9826ED69A05B28B2A4C12C4F3B33A395323BF5D00140F522B0BC7EB721C74192C4AE07098E90CAB4E9646B196CFB025778E52D5BA20122C801461DD5D5C7E0812341EB81ACD22008F0AEF5A0D600EA1B6CD0040B3468123E38E86784123D988107219D0107A6EC6D201B19167B649C91EA1B67966668264841347A92FD2B2C1E3247B9769D469C280CA150BCD23A803E1989D9F58AE4DCC7398AE1393B14AC245624C953A2D3846F704372E2D799810E0093DA2555F475D89209D687A1EBE6B6155DF0F4AE75280E06417C83F20FC1E36CDBBB7FE2BFEE1128FF0022CE7F7E3A21CD5F385C6CED22B4BF66B6431076B2A2589D0AE9810164446037FED03F5BDC22F29C113F23E43D941F76F2AC9FFECC94E05919BFF6790966919B7D9D998EF7E87A1E9BB956247AC7FCA138C646AE3A38F23C1EE3807CC49A19389E87EC0C4F607C03E7E78AE3F3261E94DC5B915A2AE96F8DDBA1C830D6E2609669642AD98A07F6A40BB586F519EDE32FC6A019F1F76DC0AF19915D185CC649A0E3DC8F3AD4F1F672D81C44D771F76CD6F7251663052292701D23B1ED1224512210EEA3DEF713B211E87ACC7A05568FD3BB9437FD6F51075007F20BF2A630E6FF0028B492318FEC2D239AB6626AE91DC2EA806603D981A831ADC572D575B8F93DFF007E2C37C5DC470DC6F8EE3F138E8A56856FE3E59EC59759AEDEB96AC56BB77237EC7B686CDFBD72696CDAB0CA0C9248DD55102A2CA8E24CD4B358FCBD5630DF92BE28B4C9A07B54CD9AF0483E3E1D233AEC0FC900EB7BD8F43D287A919A49F54F23348ECBA9DCCE4B31EA93BB3124FF0073C5AE5E4D8166BDD84578A250915F04804FC9038B8DC0E5EE3DDA2ECC8C6D478D59414FC4759EEA828A0E94E801BFD7E23406BE747CFF00A8EBE9BBC5BE1CFABCC4794B8062EDE1793F9938ACBCFF0099859EBC98D9394C176C616E6471B50D357A47371524BB9A8CD89D6DE526B7753D892CCA08F43D655FE85357AB8BEAD4DA78F55A88F4FA9E4BCC9753024D2243A8553148AB3C4AC1250B22ABA891580750C3A803C08FA871A1E4FB8A216023209504834058245DD123F82476E35AFCA672F4EF62193EDF590B6E92B8AF1F78A2920D34306C1448B484056472BDDD958310CA8BCE63AB4DC75AEEA48AC53B91568E48A5914BC5DCC2BEE0666DB2268298FDBF81A60CBF8FA1E87AF65B49818C5BADD62FA077E35F54059100000F7146318E8C63C70A8E3113C78A8D059B0CA24257B9898A878A290A8631762033B105CB37CFCB1F8F43D0F43D756037B607DDF03E5382312A945255493DC90093D49E78FFD9),
 (4,'wildner','dominic','Domme',0,NULL),
 (5,'wichmann','alexander','Mystique',0,NULL),
 (6,'wichmann','gernot','Gernot W.',0,NULL),
 (7,'rohloff','thorsten','Thorti',0,NULL),
 (8,'engelhardt','rainer','Rainer E.',0,NULL),
 (9,'maierhofer','bernd','Bernd M.',0,NULL),
 (10,'mildenberger','pascal','Pasquale',0,NULL),
 (11,'l&uuml;cke','dirk','Dirk L.',0,NULL),
 (12,'piesch','timo','Timo P.',0,NULL),
 (13,'encke','timo','Timo E.',0,NULL),
 (14,'tessaro','nico','Nico T.',0,NULL),
 (15,'niederberger','jens','Jens N.',0,NULL),
 (16,'hildebrandt','ingo','Inge',9,NULL),
 (17,'lorenz','nadine','Nadine L.',0,NULL),
 (18,'kurrle','markus','Markus K.',0,NULL),
 (19,'de noni','sven','Mahony',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001F000001050002030100000000000000000008000607090A050B02030401FFC400371000010500020104010302040503050000040102030506071112000813211415223109162332416117245171B142D1F018265281C1FFC4001C0100020300030100000000000000000000050603040700020801FFC40031110003000202010302050205050000000001020304110512210013310622071423415132611542627181334391B1C1FFDA000C03010002110311003F00DF47A5EBDBE09FF9FBFF00C7FF00CEFF00EDF5FCAAFA4ACFAFF7FF00CF49D7FB75DAFDFF002BEB9EB9EBD5E97AF6787FD3FDFAFF00F6ABFF0065FAFF007EFF00DBBFF581FDC4FB8CE2CF6C1C716DC99CA97E3D4D4011C91D6D6472C2FBCD2D9A31CF869E82BE492394E3A56B5649559D0E18D1CC6992C02412CADE94A2491A94608880B331F8007FEFF8006C93A001240F5F090A364E878FEFE49D0000F249240007924E87A9136DBFC5F1C534BA2DDE9E932545024CB35BE82C85A9AD896082425EC90E3A58458E4586291EC6492B5D2231DE08BE2BD5327B8AFEBA7EDAB887404E7316F03915A29238CB7D556AF386B79E53440DF5993A708664D7F789F9B04F10465B5087244AAF5B26B1F1BDD9E3FEA49FD4C75FEE5EF766EC2F2356018D2A48133FC788495028820432305BF4F32429C2D28B384216C961994A539D34108B3D54E6464E6977B6B7F73A1914F34E30C6C8F716E3649A49DA54D2753BDF3B9EF74EF91CD57FCAABE4AAF5F3FDC9F70620BF28D338D418D8E7EE346996BD06BC6A6C35207B0F0EACE48DF8F29EAB642E44816A90AA48E928E998AB1001A5367EED766288A0AEC2963ADFADA9E43FAFDDBAF2CDFE934B3E4AAB095E2511299F328656C3F87A448E225ECB0AAD55D59096F5D34B4FFA9461335F2C2F9E563EBA186BCA6B4ED1FF00AE161F41153DE52E4280ACC5E33C2B2BACF553D76CFF002EA8636CCEB86854506A049A9E38AB9DE429D1514F3B5658872CE7465C6275E60615DC6CF2708E947646D86363D9378AB15ED547A2B9513ED15E9DA222B5AE774D6AA27AE645D86A28D8E061B2B212B90B1887001966C204E48CF95C210E19D2A42F9849087BA099624920F373A35457BD5F39E2B321DBD8CA6DF63464AAF72C4A82CE2AECCEAC4EC8451ED2F61A53E75F16720ADDA769A510EFA51D07760BB7208604F503477E4EF63601F5DA8DEDBBDEA7157BA682E6972C25A85ADABA906DAD3137A24805A3A94F60AC75837F2D9081384841682BA3431F23A44449A364524724A3FF0034DD68F88CD66EF4AECFD5E7C1B6B6ACB6838FAB6FB2F56FC3FE936577622DE5D32947A8034E44C1023456A1DC22CEC2661038DB3C6A44B871F667EFF4BE3DD9333DC8A22DF515CDFC76C3580F7569457743A42620C0658AD80723DB714D34910865B670E17C4C9AB002C6B001C12C64EAF1DEE7A83DC9FB76D56C392EF389F65A2E3622B8EA0E313E19A933C6D88048A2122EE85B0B5AC0CD7C5F37E7D6150C62D6B7E02A061E6C53B5EB6B0B2F164DF95CD76C4A305EB91720CFDCE80079E9A72B51BB3AACB533B53BAC958B286E67072AB8C6F3EF952C7243B204570095256ABD54B05D765752C09D033523EE34BDB92F1C6F6D761A2E38A27DFD4EB63ACB2A7611A7C85C4F52E50C78C2B16D05E6E2DAFA9489A2FCEB41ACEDA87F5A91082588F10541C76943C9359504D3E5331CB1796F774B797EE43C42D29B3A256C35D536B2785ADB896212A06923847CEE524F26C2047B606490CD3C6A197B77D208DE3A303C76D71541A7B6B2877BA0ACE27CF64E8A86EB29679506BAB20A9AB1F6BBCB0CAB2D249EACD8AD6B8A8C8B3709611D40E87B0A51655B3ABBCB2D7D2651A61BA9B11E4BDD45453EB3946F0ECDEAF1E3E75F5125AD9116B5B71350D5913987D624903AC0A04820231D1B5D231AF293492D31F1F1967149A5BAFE626B8B490BBD5EA690773086DDDAA52545D163FA8BD9DBD2FE3512586516419AAF3FFA45690772E85544E237567D10DEE0200601436977176874BC195175634F84C672EDFE62A67402B8DE32E33A6B0C4B1218A374E3525D3F2F6097D0C33BE4596D232158B3BE409516409EF7AF4C2D1D8185D9CA0E178D8CA1073E8EA1B8031925B6AF3C97C1CD34E548169697872D2BEEBB08AAF8E42A29E29217C4A0CF024C23E5997A3F858F37C58304E4ADFA6A3DDC69E2AE3D0AF552F01F97AFE931D99915A8652185280872328EED476D600DB93A21948D953A2AE3B291F043791A3E07503D5E17A5EAA4B906B76957FDAF1EBBDE9729C92CB610D747599CD6607369A3B19A481A2CD3FF006EF1C535AAAC68F9A62AB4499800A346849F29B0C32F7C59FC757F7A1454973EE0FDCEDD7E84EFD6677FFC4ABBCFBAF60463E5609764D305820ECA9A27B217445551B8D7BD7BEE6B91A67FC68F74F61BA9CAC16F9FB92B9140343B107DBC3600E80D8EDD8075240DFDBB0E362532D4B459182B846D9656563EDF865650478A020FC101B5BD7AB8155EBFF9FF00BFAEBB2FEBF1EF88EE7AF78BADC264F5249BC75C25E7C75442D59D3BAA0BBC02457EBAE23812389929845DBE7AB908449A378B5223A021D039A9EB5536BC53596E22D11BC9BEE3CE7D9A197F0CB77CD3CAB28357F87FF310564A9369B3EA565E391ED89E9B0CF6468E587E21A6D9D9CDF88B67D753CFC2102F30726D4931C8B3D56F751573C92CF29442AD75C1A1CBE652492B277C92C0E9967EDDF2BE47C892C91399D76C49A5ACC28F0A4E4A1991451896240524644A202A90DE407FB80F80016A9C9E1DB1D20ECCA559FB2052DB27A800E87EE158E81D8DB6FC75DFAE030945A3E43BD8EAC1748A5CF2B95D2B95CEF0EBB573D7F72A2F4CED7E93E9553BF2554F477663DADD2C724563A8288B4B046C4D73647355A8A8D6F8B64F2EDCAF6B53C7EBF84FB555E91BE9AFECFF000C58F158EB8E11D141D20F5CF923735256F6BF24D17933FCADFA6A3D17B5ED7A44FF00D470CCF549151AD547A351DE2BF5D3D7B4FE3A544FB55EBC513F67689F4A9D9C7B263753259861F15EAA4004280A3B6FA8D01FB0036479D6C17E1B8C4AC03E4A3317D12ADB2C541050AEFE0B163A6F93BFF61EA299B8D720E1195CB5632C2AC48D2248A36AA23515BFB55AD6AF978A2AA2AB5553ED517AEFB61DF70063AD0178A3D720F23BB91646FDCAC97C551AEF246AFD7D37B6AFD2FDA74BDF97A9BC96B9E4248A889F1A2F4EFF005ED155AEF1F1EDE8AE55F1ED3AFDABF69F5DA7DC23A47AB151CA8AEE9CC556FD2A2FD7DB557CBE9BDA75D77FC2AFEE45E861CBCA6A36A8AC3C91F72FC1D37EC003B1A6D0D781E4EB5B723C6E3097469063D40FBD360003C0F23600527CA9DFEDAF926ADB73C5161C5372DB64AC65B0692C520E5C9F928D8FE0951EE866F81ECEBC91AD6AB9A8AF46313E3F07768A7EFB54F7A3AA2F55151ECEF8D4CB9A18615DB0AFCA885FD347347952B92319966C504063622A1288A92D567158F2C47B11F32C93A4C6D6EBA98DA93E16BD0A1E76248AD4558A746BD58F8D17F8723BA5FE53C9157B77DA22D2EDE087E4367715FF00924B10438911CAC7BD8AA914ABE0D747E6D7398E4F8D5CD44746EF0ED7BFA5F5166614B382D5804C988578BB6D8498F4705575A52CEBBD0F1BD68FF0939E3FC31DA7321F13255D692D78208FE93BFB9947607441F035E0F8F5D82DC05EE5386347A4335F65C79C4FCAA201785C341A3A9269ABB6397ADA3ADA5636E2DF24557D8ED10575C0D0859ABD8E8E9A8C4062926ADFD35E5BEB7D4B9BEE77F6EB7194C694EE47E29E30B0DEC5B9AEB6D7E479803BAB9662A5AF842905D7DA5C4349A430996522B26332249109111613A153A1FC0F89693BFA5B6C6DB73C6F96B8B1B6C38B5FF3E8F3705D6DB8E24B75CFDDBEA608FF00485B9C6D9E0361AD26EA0745634D4BA0D89B92AE196CA79EA14CFC3947202AB914A228B3C5EC2E09D1A61C2D416499EDF6AB31998E5A0D95862EB2B0138D83796580CE82D719621D9D566682949AC983526DDB63664D9BE2CD6DF883C87196E5E5F9F3994C77C99B717456B0C5B214B551BB66B52C8CB4ABA48CAA14168A26A6BA50A70986B1A0147728034D5278E8E5834198BD42975D800AB06D8507C6F7E8D3E35E50E24A4CDBA8F8B36F41C8B99A6B4B1AF9B5CDE65E41C711717714A8FB732C2AAD392A78A7B130993F38BB2A4F8A84E797E75B044C6C88ABD089FF00D3FDBE99CED470DEBA2CDF1D691B05CE76AEA70B1E25B10C50D035CA7541747A4989B14744B0917687C70DE32286C870E08088DD22F4A597F88BF5BFE6AFF92FA97894C334638C871F2E4520483399922D12451484325761223A7F974478FA6E4BA0A5F435AEB68EB5F6FC6E64FEFF0024927C124F9F46673B9E697CBDEDF6AABE7B098CBADD4A4C1E10E8AC4A8C6A2A97191BA16E1E45D64AD74918C91CD5458D38AD634C90D0821492212B0CF3A55B897C2A2605617C73903458BAE005B99218DF2407E8CD2ADB1D0D93D5515E0DA01A3E509DF34647EA70832BA27C2DC8A0FB63E58DCF19EB78F7DC265F4D6D90B7B536BB8EDF98D05D3EE622A9D61B081AECEDDD35A025802472DA413D99315442A3C8FB96CB4B19E3CAFA4B879531C5D64376E8CB812A85BAFC5C888DB184791C2CD535DAA1E0971566F8E591D126538E6924D78A6AB84B3D1A4A60D1C1A7F1FC870BC9E1264705CBE07358F5A64B53278CC95CC84E83DB92CE968EE6B508894A2EDB46ABE77DB5AE42379D682F8D7C562F13D7264D162566CC4F5651B53ED91B008257C0F077E76861E0870956CC94A8E94436C4AA96D554D69546913626B2CECE92F2CCFBECBB7FC463C8D3F28DDDDD722BE560D97850CADFC3EBBFE4D06FF927DCF6E033A17C971AFE58D014622BA099F2CD7BAA34A22659C68E21A66AC33AC8D2478D83C8CEA781AD89CD6B76FBEF36E4DCC700F28BEA6B08267CBE7E21A3123A275C3320FD0D907524CA4D10D68CB3E2022484A98782C3696BAEB5367926A38C7855C85C5982CD60E92E79F93912BDD099FA156584778D8E3915A3E951218C09657C8C48A49C818C226EE37BFE29056F974E6A2211E22E25CCB8C84E98A7153DB70480D547BD69300FC92928A97247462A360B792D9FF4B9CEFA5A5CD47283E547999E03F1EB304AE2B6160D4E5BBF63A26996B3452347DBA782010B25D8540989CC8F499F4A901E0090C0C71EF51C51E286246AC8E489AAAE55776AE4546A3BBF273D3B5EC3ADA727724E76C9D243ABE3A32073D19F0BA63992468E5444F1746C573951A8A8922BBAEFA54454FE0B7E50E3E1355048EB591D2249DB90474D27E3C9E4E57224CC47223D9D35A88D722B53BFAFBFE0513B85327212D64B57582351CB1AC8246C85F27ED54E9647F69E2A9D22FECFF454544ED7BB3C8E0F235B1ADF2B0E58B42EC88885DD175E0519AE9A3E7FEDAB1DF824FC7A96188E20AB08E43D40059FDD69203E17AAF5460429D782CABFC1D0DB4C1C7FABB7D1D43A7B5405F3B18C915D5F239F12A393C9CE6BA572AAB5A89D2FEE73955CDFDADE93D37B4DCD75D8E3991DA561F20D14CD64AF11919323625554FC8483C9AF5F15EFF677FBBA4FE517A479E33360E68296219ECF83F1D601E263BB6B9EE44FDAC72227974D6AA23BFCAA9D222F8AA2A0E1CABC4B69A0BC82EABACCA0E54722FF0085DCBF8CF63955B2B59DB7C5515511C89237B6F68AD45735545FF84E5E38C559E63BEDACD4F2C14A10AD3598D336F47E3440D83E4F824F2ED718C4A4D8D1544F60A3386202B9667D211E3AEC68127FAB7E498FC5FC9192DEA3A1A9B21E67908AE8629DBF014D91111CCF11DCE572AF8F4D56B15ECE93AF26F6A895A1EE07264D2730EB805895EF9AD422E08D1BF7247670B2656351C9E4AF4F915191B7ED55BDA2F7E2BE8BCE1D769F3B68003AAACACD08B1F83C3D10C0A8D6424F1AB7C5C423A25F3454456ACD148D5EFAF28D5AAAADF9393B05ADD9FBB5A78B1D9A7EB2CD73D9FD8C150CAC6DC8E4AD38BF246DB1AF7B6480AAD94B8211CF1C947C320B24AD958F8DEAC791C3C9CA49E40BC2C1B1E14A02E54AD669A602542511802A74584FAEF640D1DA47D410718F1ABF56666D8F6D74CAEB37EC1D17B0EC428D84EC095DAEC6B468FB7BB7BDE16E0185B5FC9FB6C8C7641C752CE3C3B0032D36D2AB4D208FB9B4A4D2077F6C5044B0D1A707F523F2E11D188C58019DACB02A38CE3AFB387699CB8BA6338C46A9BBCED266A9AAE972D7E046825D99B1A82091687F0320DBDB32A4CBD50D25CDBF95A57BED4AB7AB1ACAEDAE749C6E5F9EB49EDC78AB8C6E791B8775FA33F94EBE7A6AACEEAF28064F17557416848B62B55C394F7FA43B24705A6AFB1AAAAA1BEA8A6C8300056722BE396032315AF3E0DB3CD671BCDF61BFB7DAE7EC65D545584F1F541D96AFDF6224A91033E5AAA9E40A49454C9C77B67A8BDA62CFCC57D157C5F1D95C3563B291436E05CFE2E23E672591C964AF055C9CB539B9B3F6B162B2C855303F2B2E473A477567C893CA694F6E22AE8C288AF399B9419298E6A920FB62A31CD621E6D66AD0A1D9DE957AAA8F0EBBEC08D7C9EE3CCD08967A4E58E3AA622CE829E5AE035DA2D30B71153003BA8EBD546A5E3DB71220DCCAA7FE12484425BE0464A48424927C48BD0F3EE3F5165BAE52B2B4BFDA64F8F0706A33D5198C571FD0DAEDE83339616A4622B68A6D39C2668AB6BEA69CC36AB4854A19492DE047490D91703E3F8D7A27C6709C34B8FC29DDF1B26CB8D1F7325E594EF92E510B64B3432E9163907752654743DCF5620EC401A4A027B66A5405343645F718750CE07B9E0331257FB11FDF4FFF0061B4AF9BDEA71FE746AB34D810CD410C8A188D94E1DA1E22E4A541C25B3AF77E634C15CE68D606BAA8C9992C64B0CAA7CD14BA6A599E0D1E91E90AB0688D905D0D811592B8615917C5D576FABEBE66888910532A443F0582FB0B0AC93C25B275F4524B1E70FF00A7EE36C6E7DEEBEF8DAB14F02AAB35F70725A676D2CABDA34D432D6BCA2A832B28D64440C59659E38A078AF37E3FC8998F64D32C9A5BB79F261FE9B4B453E86FF4510A03A815FA7A4C71F9F1CAAF42E6030BB37C056738D6AD832A13419DBCB992DE06C6753CB0B4F35BE3DFF0873F107D0BC41465A572B20AD562574722A93AD0B153B266BA3527A950FEE05DF81B3F35DF1E919D51C164BD62A40EC63339325762DA1D4B96D13FD3D7ED2DD75EA17E6FCFD6F20F11F2F71FD9D0D99FA576165378E800E2A7840166AE88C989B105419CD904A6747101F1FF00C49BD9B5B6D5B1B1B470ADC8A6A479D0E37C1D565D97F0070CF0C76D75259CF1971BFE76152C103266AC9337E49A0F36BA48BCBEA1472B117A4FBD3F463C14BA0408FA9ADB0AB3839E4B38292AA7028E27C9335C349A2E2B714ED6F255A3A659E68B7A2A134B9D29CF6206C8EE1564A5BF7002E79754F2B2B932B254F13CE1BE39F5B0EADB68446712E9EDE06421032E4A3292483FFB1CE8A43732AC50E721C8E8E28B40CEE64E364478E8D14D7251DDFBBA77413D36D401F7296203A8A7F4F43D9F6512D713C84246DC4B2D5DB2F2636930AA844F671665FBC7FA9BB89828541EACBB61A3BF4027292894504C5C84C6D87F86B517C9D276D546C51B51DDBE555FF2B1A889DA7DBBF9F4209B0585ACF11B3FEC12332223F4F591217CD0B1ED72C4F7C6AEF15959FC3911B1B553A73D517D115CBC29E419E10B58F9867F907193DFC3E7F14AE47AAB97AFDCE46B5DE3D2A357EFFF00C7D08997E40DD17AAB5CE6EB2E753C63132C55B3D3D7D7CB012344D8DB14CF94BB485F33E657B95AD642C6F8FF0028889DA8DC17E4B229939779E666471400B28BA1134000F79A7DFDC6605B7B51A51AFE18FA6DCAE431B09638C2704D8457675A3E9997B8DFB60EB6A3FA8F55EC3AEBE352987B540EBCC96EEB1DF975E417208067E191C868A8DF2044F90D2A4899608888C9A77CF18AEF26B990C29DB3D71CFD08C45C3086AC8C02C861C96433351EA194637CA7AE99D1ABA374D0B9155DE323A3FDC88D72A7DA795E0CF1465B07FC8556C9E124AC9EAAE6BCB82557C9D31EF68B257BDED6C6AE5F8CC722A2AF5DA2A74D61F7583D4426D2D4E8C122FEBDC8D96A91CC7950CAD4727F872C6AE8E4F056FF00E99A47B1513CD1BE49D4C99F79B55DB2F2C14FD494F254D164CBD068B36DFEE23AB76207DC77E40DD56CBC376C752B0A236816C67D3B1DB330316D31FB48D9F3A0AA40F3E4A7C68C092C8614159E5335A8DF28FB55ED1BE3DF48D5FE115551DE1D2F5D22F5DA386B04A81395C175A4F9C05F7B6392CE3743A43C1AEA2CF344BBCECB1FF74CF674D790199F94626E1C7D228B1AD9B560894A631AE825E6B84426155C39048CD74EE1E172BDE89DA3D63472B91557AFB7A75E2C54EBB45FAFE1B2581C2DB6DE9E70DC6D517635AFF79D2EB0AD2CD9686D051DF5031D19810B7E4972BA81A3C6A238CAE4CCE8403869C692D65AE628FF00247CEFD64C9C06467E65E38E31A1DC7BE7DB8D5BDC9FE9D3DB0CE51880285549EA4F556720FA15CF0E3F88E3F97CD9C168C70ED8F8D3A31EA723390E2A742412B44952B4520120A7C10347CB90861335C678AD95671EE881CE07556CDBBE44E69766F252F23097131B556F41C498EA7D1DD3BFB6EBA534D0EA4E2EAAB2DE61163B0905AA306631644F6AE7D447C6BCA188E57CD68C5C13AFF4A7CB91A6CBDC0D59C7F6E946056930F25DF140E8B5B5947969440296AAB24CE9D69644A144C75C6B55E4247DC5F83C3F2C52ECF01CB66DF4893D15C6CF29CC190E250E63DFA4ACB58E7D671FB859DC4E58CCEE4629E6BA7C9569921E254292D64CED50A2BD1B1C19A43F1945AAE3AC5EBAEAD3324F256CF3DA93B9722C1E533771432023D354B9C3BAFED6C45BAAC35D2DC990C167A2CF0A600C2505B3F277C485CA4639BC7D39D8D70296BD6071B8DB898C25CBA98D3073189E29F066324F4BCDB2155E05115B745155C272A48B55C9201C5B20984618D516C9338AA2322B1A3A92A855E9DCF5F3E492ABCAEC38BB49797A5CB901C9D1E1817C95D84FC8DBE438FCBA3C8C244F354678CC96CF4DC777552480D22596447E6E384B429877E6144924AB17A0F3DC147CB1B1E4DB465B6EB25B32F1F579FC2374391DDD4DD521426669421ABC582FEBEB0982FA6A90641EA0AB352CA99D382F16695AF1561897A9249769A356FC14A8402F2AF2386693625773632C8322537D4197E99001401081E8357226B475F7E93218833DAA743B1B4E815BAF53F6F50C40F201F3E8A0A3FEA37BAA5D39563C3994C9F115FBDCC99979C7D4615059BE17F9C448C54E2448F35248BA62AC9D37E3739AF6B93B44BE2E0DD05BEC386B3DC95C84085516BC96755DC6ACCDED63ED7886E2E49322AF01131D54920A76BF50D480D47123815D43A7922D1DC74C965615431FD38F852B74FEEF1D9BD1D5D51A064287736B6A0E89651991CF9A0DEC4986582E2895D64215242655B1F795C3CF2B191CA5B5B2AB1D7F9C87A6B9C253507316C2EF902B07A9AB90FCBF3168EB6A82E42D958E82268ADC4AE1BFBA2A0CCAE56C079400E7B6A330C1B32E0DD3947C6F2A79A548FC2CFA6783FC3CFA4E7CCF0989C95F0AD9272E7BC9C9CD9E3E2B4D532F268F76B524F58E3ABCA8B5C7AB19A4505168DAF5DFE31FD6B89CB5717121C5E0CA98F09D299D8D08A647B652B338C3AA2BCA7215BD5CBBF5EFB5598662CC4B9D9B32FF006B0500E5D6D66D26CC91253516816C1FBF8023163920B1CF6C6A1620B318C7BC37437D99CA5BD81F684C35E6C110D18BD4B571EE6C7F9B523626E791737BDD365E136B3402E5F286535664663D06980A7B0D39E28A56DAFD92433CB6F6F27E5BE049468252E69DD2F562794E4AAAE4BD7414F9EBD79F7BFDAF9F0EEB8B06A4D30B892AB22883B85D1EBB791942C7646423946D6495BFA36AC3598D22621E7FC5F9D1031EE3F581697720D18DB0B2D1D6E620B2A21EAE6CC37339EC3CB09D1AC992C9BA3B0287D2D557231B1A6B621837DBCACF095E4A8AC587652EB9D8F2E619BBB3ABAE1697211618976149A7B2CFED2E411D1AF906641A76945E24D274CD38114CAE5A172E591699044D010817F2EAAAC41249A01D06DC291F705EC3D55072871E58C054BF28AF9507EBC9551CF4563917B56B93C93A445F14FAED53A4ED3EBB1DEE6BEBC98641ED6A60224646AD8A6913C66637CD1517E5EFB7A74ABDB5EAE44E9BDB7FD7D5B95BE7C7BEACFF0011636D886C562C6AD47B4B811BE2923BEDCAE62A75E489D39BFF005FBFDC0472D50D40443E18224A92BC9FDFE437FE55D2357AFF000A6F146B58E4E9AD591C8C45FD8AAAABD7AB587953C7929B3BCD1FCF6953A907B2F6058B68793F075B1FDF7A73AA9AD4B7DCAC35D828DF5D7DA48F92DFF075FC9007A0C9946C612A3A4F60106E95158E04D91234472FED72B18E85AA8A9D2AB11DE2E4FF003F92F7DF88BC5192AD367B4A30FE7BBB39910DB59D9E443D1CD447B13A573917A6F4AE47AAAF5FB5BFB97D4B745952ECCC6FE49200C3B64FDD338B85CD7468BE2AA88922F6C7355CEEFA6B5ABDF5DAFA2BF8EF868229222E31BF2A38E459A42FC1ED0078D8AA8923A596389D3CEE6F4A8D8DAAC45774D917C5645BB6CA4695171AF613A4CADA4C55BBA9D1D35012FD49D33763D4E8FF001EAB51675A26D15AAAC3F55668A577F1F72AF93A3A23B766DEB4478F5F570961279C604195B046D9D8BF2B8AB9ADCEC6C1201A424C99D736B1901811041C24192CB28C53D221E473069955B1B9FF0080E47C26739056838F2934DC85775597B9977861EB6F9CAA02B696ADB35CD9D44F268561D781B01EC8DA798DAD3F1D73E51020E75B2C46CD13653D5E7E7CC5171852BED38C28EE6CF799B3B319F3AF460392B681DED84B48904C65F39F89CF6687AC88AD07EA968C748F90814401F2DE398020B977714167CB75790ADBD0E6E76A3977BA2273A6E72AA9F30FE44F8055933B60FB1D59B36CB42E4A48EA04CEC38BAA92D4ED039C92BA18081D323FAA7067CF24F18B4931559BFC2F22191ED55391C6C9C3AB8ABA78828AACC8EB406D32D2B8921A2B653F58F2ADC9E5B63C9D670C56694ABDBB97A2FB3EE32C8F5467209500776E8361413E5A9CBE5F06EF78541E5EC0F12D9E6EFE95E2E6B9472F4F7D7BB1029603EFA3940D2D4D525F526AB1ADD134B899612DF9BA322598B3A0AE80958A6911BD9CE4FB93F157A3D9F14E3B4396DA7265AD8677587E4B90F2B7594B232582B3F5AB6F708685269F599ECD4D1811979F1B9155D4C96337EA47001C700B1B638AF8F1BB5E1CD05EE378980976F9C1EC07D8EDF6DB6E29A75B675F0A2A4B9AE33CE9E0CBB6274618A5C4B545CAF8200A54BAAB91872B9581435C75B2CB6A72F9AC2D84656433B53A9D19577B133557DAF9F2384B8B492BF596D2F1ACD7D4B9EE40D49069D5ED6C7C5294D61056D347E4090614EB38484313F2DC6B63F2B9DCA6536623C0BDAA9C6C8262BEA3D8612AD3DB9089B0A6402D969D3219F7EE1648A16119A3374FCCC55A89D424B21A0E26BD19A6AAA4A3FDC48D4CE97BA82345262C4C5D226AE8B5DEF06838C2F2836B7F444E7F2D43C857B5447E8CE1AB7F548B5788E26D851ECFE49069008756DBB208B80EB859644744C827997A23FDA2F197BA43F866BEC38AB1367ABE373AFF00445E3AD31F8DF6C37A136AA63D5D285609CBF6377C894D682597E7C6EA2D2D9945815DFA73D8FF00808893D2F46717E99C238D027E98C1B9694DFDD3C670B9468182306FCC57904ADB609FBE8AAEDE7B00763D5A970B8D49A51B1E9D9D55DBF47229E58027F5275094F247DE802BF86500103D147ED878A6D38B3DC66CF9EF5C155E26BE96D2C717B4D165C3DEE8EA82D41E9F8E71B452E583FC7FCD1A509B66C99F7710C5FC6C42FC9657B54FB7736719EB2CB495A0DFDB3B2DF905D56B347ADCF67F486F2FD968816CC161076E92D80A6042BF676D18FBDBCD24147384C81F355106A0D24A36BECA7927DD16601879C0BBE53329BBB92B087E9E4268F2EBC7564AADACA7B8E1B06E24A0B0B5CF0AF26B623F4596AB234103442ED0564B24B2A4EBC4FF00D39B07C7557266E436BFFB59F74EB17D5D651D5C365380DFC7905A91B4AA1437D9E186260ED5298E6CB30724A0BC8F89EDF8ED61FD1DF516172708F0838AE07E95C2C25C38F15951B64E6D5E93566C8FCD2E55BF2D0C766F6D306784AED49ABDB2B22730ACCBC9739C8F259AF91565BA197B2EECA15B23B33B13A4093F0E433D1E7B63B6985047A14383F8F3618BCE332F7797DD7E977B7A29B92F6C8DAFCF9B9DC8D51412203A7D6118EC983054045B20488CA0B2A2BC6563866940C2C98A525432F76959B166BE01B4F7845C5AD0D74218D0CA13411B2D54F30E36B31B5B035A933EBF3831480C449CE7581CF494B2BC5F2A451E9B6872390E39A7B04CCD083502F8BEC2C5C2428A5D84D040D6BCA3CC956428D25218911672A695E8D6FF003FCF743DEFD311669BEB6DFE4A8ACED3117C14255DC902FE71F41710B5E390F8C183CE5973F28D10B2C528CD9A405EE2184C110B1B276E843E90CBC8C08E370B0C9CB971F22CEA423D0ACE6BBEB344434A105DD812F46D1111341ED29AFA6B9FE3F8DC95C6E46F287BA75855A9E9D5DD80A233172881C6806D28F01198ED47AA9C976B35793F1ABDCAF623BCDAAAEFF4FE5D1395DDB9A8BF6AC72F933BFA554FE621DC900E81AAF9190CEF7AB91CD93C555AAEFAFF00555722AA2F48BD2F5DF5D2A7DFAE7367F14E4C9388AD946915CE49A3722B58E6F8A2A2231DE69E5E6EF1F0456A2357CD5AAADEE253984239B223957B722A393B6BBC7E9A9DA7F08BF5DFEE6A2AAFFDBB5CDF313230DDA411F7D8864AA91A20FDCBEDF50CA7C79F800EB7E46FD6AAD69322D1080DFE5743B0DE3F6D13E0EC8241DFEE7F92F5E39C7D0846A1648223616B917A5633BF25E95513C9ABE4AA88AAAAAAEFE7F8E917D1755FA3AF3582510AE1AB849E5844599B1C9F1883ABD229899982C12CF2A44C5591CD8609A656A39914523D58C786346A623E11E247C68FE9AF915CAE72F6BFB9DD391515113EFF00D5117FD7EBD1BBC27C515FC817F4388B7B62A905DB59879192DEBC78CBB507FB8C86D529D5E291244C2CD154C42061DF244D9658DAC456F97A23853CACB10C70D382D1934A4375627C6A8A9B7EA0EB7D4339D6D476DEEA55A719BE453B334E4EEA06868A0EDB00820B375206F64FC11AD8315738634EE3CD7CFC99ED974C601577981AF219B8C64FC67B08EEEE0330C581172C44565ABC352EA252DC37E7EDEA30D661591137E5828EAF8066841BB06CF9274B4547A8938770DCA7F3DBD156E8C6C2BC34E4DD118EA61A9EAADF5C4D7547F6FEB6EE5B0B239FB4D1DE586608243324B0BB91838F13EEE7967FA5D7FC08E16D5817FC6F9DE6DD7D4996B735DEE0B5FB28EB470F3E0C4C32B4FBBCF682E569DFA6103809AA1B314D8B3A72920AA953724CF1CF3B73D9C9DB3D9E6F2E151D93F356F99824D1D9812D8F1513A9B93EB3535054A0117371A7A8B0ACAD0838E25020829AFE2268648A22AB2AA17B8C35E8DF50703CA7D3DF50E0E25F1F1ADC2D78E2987295732D85C97222B63794B25A86AAE92A4EEC3271C55EF5EE82866E27E74E528E1E4F49ACB1B283DFDB0DEE31B07D32F65E9ECE4AF74760A3A8EE012E8469AD5DA7E60E29E3CAFCFBF59A218617555E75A713839398EA55ACECEAD074FACADB58A5C469A7B054062C714FA7D13ECA074B2C7615CE184F99AD071EF279033B5399C602366AEF2563C8706BE5A4CB80CCB6688BDAECB19699F7690C16BAAD24BCB91A9AE6BF2B4F2D9D6325488119FD16E8E363B9774D16B73BC8A13F479715993C4E64A124D619A4D536A7215F4A01CCADD2E971D2C14CFB996A92EA9A0028ED2B33A1180D7C5F9E3092366FDAED2896B98E3B9EDF458BCE56AE80F2EF0F38CD15F5D8ADD0471425DA5FD4CF973F3F05A103470B45BAA7AD64E1930996491293235B0B765F078F0C7CDACA3375AC72D1311B242631C9CC676F728935617C852E60FD86E932F3A4D50B0144B63B43221EFE45126B45C7504E9DDE80B3167355D547B8191422AE80041DEA71A5E7A372F5B1636CB933DC266C8C6997340C0B3D7FBAD0514E236F2CACC12EABF02EEB80A80FF12CE1123AB0858E07A88EB756B25B69628D7A81765BCCF68AF249E9F8C28AE6A6BC3AFA9AEB5B5B6BCB7B7B28430A1596C6DACAAEBAA222AC6C4C9493C86940C6784A4A5797211209F3C8BD2FA67DD5515FE9E7B38550D599E152756D26E889689AA2B93D8250974042B125767BA729973554E8A7A69414B3A2694A805555C051A03407C6B5FB0D76A47489FC7FF3F9FF00DFD2F4BD2F5BE0F96FF7FF00E0F4C3EB8DB61623802839964488A1C886474523A295AD742FED59231515ABF5FC2F931C9DB5ED7355516A588B63086C83CEE64D123A4446C8D5778A23FC53C555DDA7D2AAFF00DFEFD2F4BD6AFF00870AAD87CF120128DC7B212012AC46582577FD2480364689D0FE3D25FD5648BF1BA24765CA0DA3AD81EC900EBE403FB1F410F347B7BE2DD64D61684513A9EE24596592D73D3FE944CD2AB9AAE98A8191CB5C6CCEEFEE63812654E93C5E9EA9CB91A906C8EA4BA6AF9CA28618A742C96C1F0CA439888BFE770D0090AAF6D4776D8189E5F7D7A5E97AABF88BC771F4C29E4D3070DF25D7EFC87C5835DFC7F9AAC868DFF2C7D377E1C6766D1CC5F3329E33360927C8AB4906FE1265CA28F03C000781EB89A9B59C364334510EAF472B915ED95DD2A4BF1A2A2A4A8EFF002B517EDCBDAFDAFD2AA7AB89F671C5595D1CB96DDDFA58DB5D0E40A7D644516C6D653990AC724455702341033F2627F4F84A31E61503911D04D13BB555E97A0FF85FC7E035B3ACD8386D68E155E356C689A45FDB3F749CA169B7FA9083FDFD1DFC41CBCA9F1B049E4E42256A168A96A2AD1484DABAAB00EA7F70C083FB8F5A37CF0416B306203A60C5BE06DC12C5B40ADA088F10F1A52488641CB1C96C911113E24463992B5E8A889FF44F599CFEB37ECAB81F84F8C69369C634D7B97934D79354159B1B447139601AB0CC42994E01BF926D7CE9DBC760B1D93A9E11A458A0AB8BE381D12F4BD74FA771B1B33EA0AE1E5E3C32B0C5F2EE3132253BE30B47DD11B7B155697BB20489D3A774048523D2672001E3F1E84034548F57236E3B042DA63F70EC402747CE86FE3D65639B78DE978E8BD48D9D3EE9B032BAA48F8CC28499AF90A84A73BCD22047456C4B031616A22237EFCFE4FAEA3CC1E1AA74AEC30071569137545851D9CE3171ACC8C9F49080E68AC2C72C4891907DC68F165F193A77DA223517A5EB31E7D56778ACD5514E5C0154015482809040D0209F27F93E7E7D0B4244FC123B590379F91A2747F91BF3A3E3D4C58ED4160571944EACCDD80D9BB8B1A2AD22C3395129EE00491B2C4861508A3B8D9FE4226738921AF9951CD891CD8218228D7A5E97AF3FF27E392CF03C019B90001E001EF7C6BFE4FF00E7D14C7443196D14FDABF2A3FD1FDBD7FFD9),
 (20,'zowe','jochen','Shooter',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E0000010403010101000000000000000000090006070804050A020B03FFC40033100001050100010402010402010109000004010203050607110008121314211509162231233241710A24334243526181C1FFC4001C0100020301010101000000000000000000050604070803020100FFC4003411000202020104010303020406030000000102030405111200061321310714222341513261154271811633549194F0A1B1D1FFDA000C03010002110311003F00E8A2A6DB3770FACBA9E4B727996FA20EC79574D2F3F44ED0C96C44E10B4D85E0DCEC9260971D1581A51D7B5DA016F2C6247432A0E04CD23EF1338465F5B3E5C59351680F48C53C3B97738A68B1446B7A462EB09AC9E0D57B80E92B60282503B1B15983D3672788BFBDF093F951CEA5101B5B195E619BCFE589AA8CDB0C0DF4F6B637D96DD1B982EDFBDED0BD293737114985CA533DDA3C2D555D6BE0A51A53B336F038581CB2FF0023131CE99C9230726AE2D0546164AEB6A624A3ECBDB4E3400A6BCD6415335B8D512779D928B7B98160B59C5668A0176F4F9922BDFF00871595887F846324854A68FEDA3E0EB2F20EA50C5212D215DCF03A4AA24DCE00B0A8EBCE3601CC5011E62D51E9D15C7B3F97A25991A4FF00380FA278D94F7CB614CBA1CE23F8B6C07B9FC42AB7AA675C1DB8614E3E6BA85E1ADCED7F28E42E725415AD6F3BE7F5F5CF2EDB6798155016E81D9437F36363E271028F3108FF0072DCB73A24A5C869F93E25DA6218EA8D4997F496BD9FA86C34E9455798A8AC632A7439AC6632E069237063D957E063A1264690612227F264C392C6CE268A8F5224F59BAAD9919476D3914D97AEF6DBEDF95E50F3DAEA6987D1599D89D0E9AB5D5EB4560DC5EFB3E6BE48A356D6ABC32D57162B65CBE94881F6DB78F1FBD0ED6DA7F739B0A6066D544BF8D4A38982E414D7D3E776F9DC7C222916D557545A1DA672B1F2A40446F7D9FCD93A12672020F33BAABA94590B320FF9769554152538986C860F148A3981724D11E2478E201CB84440AC6425B6501E31390CA752C2470601793A8D2469EE6EB248C95789261F8B6E56B8DDAE7E7AEBAE33CA73BB268D9FA9A0C68B544AEB7ACE8CC9831EEB422D8C71497F5C274EB04BE1CB19A35258B1972D58DEFECB5B6DD9E976FA5383AEDCE300BECCC9AC02C6C8816B43B39633997388AB655D3490D655D5A8918A05F9DA08D6EEB4392124848EC185C5BD6BDE473EE0F820E9C1D248264E389E295ADB8933F1EEB7CF8466C735B6CF53575F54FD55CD8BFEF2AC0C37F21679497BCD20B7BD64509FBEFEA35A6E93D22CF33C7F07BDD6584B5E7162266EACCB071A05746AE9155809F42642335AC637F3803BEB7492B57ED91CF6C529797E9BAF742D66BF1E5654A41E58E96266B55A38E49380579AC44794620604C25E4132727577485E487A4DCA65D25648E17108561B7E410B06D3158A30DBF11652CA3E4176059B7CBAE8ECD8E560F25573CDA3306CDD875A6761D71929B69A6D4D80B1FD0EFA601431F391B4E809258439B4219CD1A215B1149235C4A8C5F7078BB7C5E7ACDE0E4FA719CAF0794D0B39C8F504D9F46D00BA8D3593AD8DFE56CAA829EAB314245D4C3DFDD1203E4854AA6285927021B40881208E43BEF7D3ACCCD9EA2E7DB96C68B3861B5D5A0992490D34F67312E806406860B92419B4F3C649718E74803D4C8CA628900E690F9236CD751EE7EBF135B6353A9B7BBCFEAAB67FA2C73D7B5F6954FA83511BF18EC25310478D2ABBE3F5B51AF855AE897ED5F9B1B2F2CB7D25C0E4561AF99A791152ABD64B35A0C92CDE74801020B0233662457760F3472C7C25902B4A19FD88772EBDD80C3211C1C0915592588B686837B2BC8B1E2EE74CCFA03E363A0E06F5BBDE8589B9BD533693E62B2CC2AF39FD2CFCF57D649647A1EE250FBB34E6672A0E0995D29F0447C955673052105D7C323E0963755CD3F490733A9A4C8E546A3D7E9344D0A2CEBF29AFC8EA33B319644B030E03ACE9EDC9657CB24F2C6E6C06C63B5F1F87BE48A145912E7750EC995F757D334BC8769EDE6549EAB42D3AB37987CFFC652EF9D346C108D8D343515E21805D870CE213A12CE1ECA3823F9B4BB20DEB0FA89F9DD060333D064E877184C8729CEF289ED3276869DCF67AE0E4BD8C19C480430685768FD61411CAE82F120CA81A3205323207D0946455E3B9733B165BE9163F22B86C01A7D9D0E3EECB529D3C2D78EC59BF651130D15CBF5A7F359B79198BC524D15422456F3493273088A30538E29C584919DEB912A227229E5575D1D31E5C8B801832055F4437EFD5FDFE9D3D935F5F8ABEC86A9993F6CB2D769AB57A075E1EE484D377312B34F6029DCF44CC450434861D10B2CF550E86C6F2BC5AAAD6CE7BE7287FCD11E4F3916AF5F8CBC1BFBB87EAF1FB6CBCD46A6FE9F9EC9C642E73A5ED5A8BA16B6A049E20281F862CF61C759FF70960D3E8F45565848E9AD203A09E23942CEB3337DA4CC07BFE6CF4A906F0F9AF475C49B0E76178D67A17B0B41E96F2A286C069EE277C9620D755B675AB14E14621C0583CC862321C1577A54794EAF99DA93D77DDBCFCB60D05DED75D7FA28179AE0EECD506F1C750FDD93021CDBA3AAA90ABB47AEBFBC7CB303A132A1460AB47009A9F0FDD14BBB6D4B9291EF52CA62AEA33E3E94BCEF0B00F827A76C3FDD4134692CEC22492748ABEB880E21D8B331F7295DA553EDFCF5EFD5E496DDE4D891B8C6919748D02C60C9E5313AF26565D331279752C5F7B6DE8C7971DB97DC73DC900BC8A4B8CD736D03BA10F678CCC9C719254E7E70261EB1956B591A4823AB45438316586468F624B17C46BD0C46079EE976BA4D1F4F335A9A665E4956F91296D6FCA298057D734E34E2C6DA73248483AFA4B92E1126CCACD1D7CC14AEB4B164D1CAD5EA73F70C28EC926130D2488C5647B16A6FB87914A8769824E8825660C64088AA1CE9400068DA3D18808CDE99CAFA2DB89791DAECE986C7B3FBFBF83FCF463725AF9CDC7BFB3633719D62C320943DA3DC7EB6CE78F55A6A5A3FC4136551CEB9F32BEC7658B9C0FA0EACABFC9A30A119E334A1E6D2C0E0C925CF25A64B1E15775092CC5C5F1CE9ACAE7115F5DB3B3BBEDBD934D6A2835B8826DF675A49B6F98A7262B056495D737B512D6C648AFB0664EBEAACD92E4F35A2A2CCF538F9F629293A4D9935F68456B82CB4A47B7AF6D2CA46595BDF8750211FDCBB2CADFDB1B6B12450C1166C3B2B68591470E699144D9BD065C04377215074D2C926A82ACD26CFDCC69F2C7DBAD07F705B3E1039E60B524C43DCE7E5CF095E149521687670870847D635EFB121F621C6E9FE215AAA8AF018ADDB2254DD75E0930AE50ACCC4B18A358F92079183555D1112DF99439EEB270511BB7EA011A395F22313C8185F650B232B6F916024036B1C710258F99C4CF6374A071FD6858CB9CF74080A0B927B74CD6C960CC57153FF716876777D636E12899EBC1CE64BF94487A32AF46226FBEBFF2B497374D1E410DEE93A075FD874FD0D6EA34D971793F1AB92B096C36508AC0EAF4A452B1D003CDB00EAAA8A6108A4108847034DA48C61A2922ADB3296BA1FC541E427FD0873A87DB46DAC2BF7D65C5F1B4B917136BD66E2A6DAB3B1F68D1A539C7CF213D0B2D5F8DAB266BEF0F14E9AC0FD1DD9893D9FE3533676826CC0009C06BBDECF4F9394F3ABB36DF19869E597712E59E98AA58EC0D73E7BBB6E93BE5AFB3A7C8D514F6CF157E5F311EB7696F1B278E56888C92E22B4FE9FD683266C5FD5378563FC5ECB5955A9236BEEADB46C54227051C1EC169642C1D9618351957EE5B4C63AF0C64F295CBB0451FD68429404E8049188938C61F657F391DFE18B4FEE33DBD63BACD1D8743CB4BEE9FA6FF0028840585AFA0BCD9E6F2D135CD70995C4E06BA57D43D95AF74527F2BA216FCF3081E274C23457123CE64B97FBA7E6DD12D449E5F669D8C6C70C90CB659F379F51E87717360C80B46D65881CC2E0CB3CD530A85BC568DB0CEC85942055729078F6C10E644213AF7BBDF691EC3AB48E61EDA30983EC9D485451341B3229258F92D6D8318B14F1D2E7E3B496E7A510315F367F3FD0B49A30E1998E26AE59227CF590888EA9FD423DE8F5BB628BBEF709D5AA69E4F8B00C862F5D6983C754C0CF0D8E00337847E6A9E28E24FF06B94357A37CA2BD7C2FA999FEE9C2D797C542CE66E3C68F0F382F26331E9B914B0AD047058937CBF22C58895807919980206E371D909A32043085665662F08662C8A40E52C846D8124285D7B2011A000EC37BDFBA7F745BCCD6DB2DCD3DBAD9737CCECEA9F99B0835545DBEBEE65CB43F3FC6AB4B2AFC3EDA4CD4CF59639BF271CDA0B50675FC906C872E218A8C137BA0D77F51DD06964B8D272BE49BB83FE3903A2A342AD74F30E23A59C459B3CE3305D2EEE515269191905E5CC7FD7140390E91818CC8846643DE6FBC2E7D6D1DCE5FDC4F6D61B1F8F03D9F4AD8DF55F862A3BC3A96F6DAC69A76FC989F38A609CC95ABE656BBCAA7A22FC67FACE7527BA0CA7BA2CA65FAAE38E7410589A467AA2BED1D1AB91B3152D78E24392B19119FE4901B4434A44AAC49AF05622CDEA2617BC3B629B70B9DBB3A46FBE7762CA5AB12AB395F23388DEA485894573FA7201E98293D74C8E332F27EACD33CEC91C6092AADA8E350B1AE9BC9EA341C140D715017E343ADA713FEA29D1341AEACE4FD7B884B67681903D6856799BB2B1DD53133892B60482944BF3039748A0FED46CADA58CA739893D701E1923E179A7E21C64FEED81A8E6BABDFD2EFADA5D516B9C87419BA3CF5657471D3E88B65C6DF417F5B72CCE1C267D5B5BAEA2AEAB2AC745722569C0D8A31CE5228876CE23C9BDD6F3D8FA97B789B29BD1DC0BDECE75D0252E48212A28185253E476F0129BFE4FA31E3445AEA075B5E7382DEF19D1E51B5A430F9211F68BEFC2C6AFA15271C3735BAE71BA92CE7E5ADFE2B49A18B6E7967C5FC45357D9CD4625511716A25CA4417DD0D67DC5356081047044170C52BEA262F1B77B23217F149366F0B1C1FE26B03CAF65E27A086C35013864B15D2E40B3C2A38A465CFE0599646002B4FE294ADC1C87F4490F164F3A1E2C1595480C43AAB2B732DB00EC03A6321BFE6BEDAFF85238C733BEE54BD773555A27EB7BBDEE806A3E792875FF0057F1D91CE0D71A0D752DAD8C6E2180666A41C10EF4069C63FF0018514F1DE669F996FF007D75484F29E6B6FCC315ADAF06DA0BCECE3E7A637A8EC33C5892D7A487596BC1D5DB24D4440E5411C18F832959531175D62136B65899045B6CECD69DAB9B5B725B0B71B2FCF393D225954CB96E2C4CD71765C913058C3B7D2738C74598ACB892C840A0B8B6DD320471568F7BDE540DB22A40E3D33B55ED45B5B64387506929EB6DEAF2F7BA8A336F33B671924646AE2B4B3D4BAB83A8CED24B93B2BE8864FE1ED20B652C38A78CD6DAC874E34991EDE76AE4A96332F8A966AAE22829DAC6A4EF43337208AC52D53BAE2C487ED29981E6AAD2C8966C40B2067727C6EEE23C763ABADA124D14B22C625A35478DE42D22981A5909633BC88CCC4A8D8523936D486B93B7EBB8EFEE8B7168B23CF7150D7152571E066AAF65BD02CED8572B0FBF93464760BD8CB32D2456C937E1D94C33DB1C44B95C59054B22F54EF77BDCD75AB1ADD7F5AE877B88D74F4D008FA0CDF2EE4182A782B2236C27AD981CFE763606C12684A5504C218C34BAF688E9A38E36C31B57AAEF29DC981B191B933643BB55A4B0E596C602496656DA02B24A959D6465200E61983001B931D960F2E52012B88EBDBF1F33C43A727036BE98F806DBD907FB91D7451C6EC6F701CDB9C55E9B896E572B8736EA839F66AC36547F976B5DA35742E80518332D7419BB72C28DEF767F755F7B3DE1AD1E716DE9231A41A797F77739ECF69B1BD5B499DD291B464C35F66F8D5589CF6A4FC4652A19A1512EAFEC20B5D993A9B7ABAC6D9A02E6FF006D50A5CCD2493C01CE9F736A0339D01B2D569BADF1AC074C3CDD7D28957BB96CF674CB98C3451C879A93E6586EEF3B4B773E26B2A87AFAA82CEF34969703488794D748E83CC787EFF210538F16AEBACC3CC6809AB35DA4C1662C3468369CB1AD6B7F88D7D4986737A35B321AC00863EA4AD28F4FF45A8A5926C0337EF9594EF0EF1EDE99D29E1E2CAD4CCE38C7165E59ABD15A12E16BC1F7390115FA8F7E7AD727B11442611AC38E552D1072C656EE6FCF4D9CF89E61244BA918A04FC000E59E5009058FA64238F1D3B6C91D4E7EECB5BC65DC6F6BD4BA95B749DBF41239ADCE1E6AE8ABDB9DCE734B2E9B35164601B6060F2EB7376B3D1D85954132DA137C32C95F23A0CCC814362B030347BDDEE98CF6EDC3D9ECF3D98D84A0626A1A61DD63A852D97DC5EDAFACC5736C2B9FA3AC92165EA1CD915DA22A07B6BCD6C62E76B638A8AB2580BB2BEEEC5ADDA7283B9957DD9C270C7D743503D9A5E98E26E7A6ADCD2DC93F1C2DA911FE2CB1A55389B6BEA9057392454C0D5084C841531CA28FA6F1632AB97E64007592283427884D98C056C65C9AA08523CBAB9E64A5404031902C7F8EBF8CC922678637F17C47E12FAFA61DDF9CBDDA76AADFB35ABC991BC722D8EA6CAD0AD5FB6AE2B4A0A40921124C2D2BACCD2BC92AA4BC618A44895A53B5B2976963FB96E63E45C6DBF3D4A5643A38B325564F3AA13C155213246AC53E4020005BA101353E8CD3A5314628A7CD22BD4827EC7B9CBF2FF27AB3C2AF855F1E11AE77C3C7F923557D4BD95C5B0D4823B692BE174BF1F2C59E059D1553CA37EA73BED493F7E51A8D555F09E5BE3FDCEFD33415F6D2CADA3BA07063C4A91B028C072D935AD446F872A223A3F3F17A2311A9227CD15DE3C39AB5D2465D28C6C215F907CA6C5F8B048BE549966957F65BBFE56A44C853C49F62398F6398D918AAAD4F52ED4935F2E23E355890A39F91650093B2CA144618105F8873B047A00EFA2F044B49F8A46F32705210045466DFA8D4722E0EB436540F5EB96FD497373FCEC3012F6922C2E6B5ED89B3B98D454F9278F939DE3E3E1551BFB445572F8FDAA2FA83B49CC751685BBF8683F2E17A2231918E4B13E09E51153EC818B2784F088B12398E5454FDB53C7A778F9D3049C428424C79A1103C93221C714B60D746E8CA8E764B3CAC9264FB148678639ED9188B1B5AE58D5BB31EB4571EF22CEDB4603BE523DB3D6467453A7C53E4892C4F198AF722B5AD6B5E8F5445F0A9FB56AF086B6469B34DF70B676A182C9139D1F634AB16DCB120105767F2D6BE7456FA24EAB1B54680FE0478E4E21A3704B9E446830206C1041D681F7AEA78F663BBEB9EDEB5FF008CF1C9232FA048ABECEA6C185435F61132457C42A4B2B1B00E4C0F92626AEC2047995652CEF8202023ACC32E48F74DBC01FEEDF89F4EA5CBCD500CA5E34CB9B0491053EEEEABEFDBF9C6A3EB6631A1CA356C620B5F2433104C9356FE74E89311F8F1C61439C6F42A39F1D39FA0B0A038A05C59D6314621D1462110971B4397EA6CBF7BE61628D5C83BDAC89D2396463D1124BEF3D1D3D60BCA74C6ADCDCEA39F68E9ED323A0B5B52EEED692CA9A26994B610117AEB68A46D6CD5B1383167866AF63DAC8506487CC2AD3432F6EAE03395B21E78285FA37527AD549E32AB43C4318E44D8F2121CA8E1C5D393720474B27B24E77358FC6E296216723612AC135C7F1AC72C878A730A080A4150D272F5CBD0DAEC111A4EC3677D2CD8CE98FD253D1B1D25AE784FE6A6A926E33E1910839F9AEEED991CCBA4A25A7B134A1CAA7ACA57DA588B37F216BF8E38443EA776DAB8709D036F699904D125D5C39EBDE3F74ADABD8E95A5D0051864581B7C4E7184696901122B615B8F8E438474EC9E3FC32A61A1BCB1998BD23B5399D5F5C9757A5B8EBBB2BCCCDBE704B7045BD1C67B4FB5CE68AEE9D278470EA5F5D642585C8F5BF36D78F596AE6D2B435AD647EA8AFBC92779ABDC76CCE5291940CCA23A4B7DFEAF333D09D6D088CB54462D8CD6367465D66708B89BF24611EAFBD31C58A2DA54DA5AD80CE231076D1153239FC3C59587205EFE34473B4F5A7B35D096B0F1E4208E35B358B6A4AED59A39348D2784B168DA456CCD01DB3772F80CC1639DC2E5AC632CCB1C91CAB0CF4259E09A243186521A489955DB88089E45E4C4930E4359B530300CBBA2BDA8B02C11CA9637D1155B298A422CCFB19040F236A34485CCF95D03209E082315A3C430218B1C10357A70F20F70D60760EA07D574EDDE56C29524A21EB71C665F394725757FC5A19B0554E784D8252192392670C2C02C8E8FE50B3C797397A0598EF9EFFA595C8545C162916B5B9A04537B304848A4E0BB31629A327880768C47C6BF60555F3D6391E1510A7AE25A43C881AF674846CEB67D9F7AFE3AE9DF9B32F3AFD9DAF05D22DA179283256C1E231A5684E8FF008C8F3D1B4FCED3BEBF57746ED63264C85647FC7818FA87D8D74356D1F4E33D4BFC79A40CBF3BAC6718C2745E8F939798453ECB51A3E79CD15C0D5EB4F94D42573CEAEDCD5E5341AED55C598A5A49252657015C40E7DCCE696F1CA19F2C943F393D55F534FBCA813B06DBADF09A08980DE715C88D8DCEE66ECF40F44DA5D199B7086D2E84B9673A6B4B2D9FF6CA9EA4D77F1CDA5382BF485844715D070BC42830DDAAF767D0741D7BAB5567799551A76673980C70FA5B7D1B23F8580FD13250EA2A238CFB132C779D271D9268F60085029B27C05A4807D31DA5DB6D76382D772E396ECF64E43EE27512AA451D99E297EC161292D77431AAB068659A29D499678A2F1988BCD184DE911E685663023868A26E31085E4F232160D234114242095D54990A972431016977BB9E2EDBDE0E5747B0E7B65C93A043709BAB9E61758DBB5D5556625B33EBC83347D8B5770EB9E967AD420A6C9057570E35031E82C34B431404B6411E3B08D0725AF2481DC3CEC3AD079E046B924894730C8913E0BF25555746FF008FFDD8AABE13FC5113D1E9F7134C273D32E2EF5DB2B5DD5A7B90ACADE65477DCFB639B9F8CE73436645CC14D9F21FD12A2CAFA2CEBEC6D89B0E89B1A7DBD5096252D44D7800F2B4782211A460743CFB29205AAAD7C434F3D891565B1CC242B21586BD8E2423A07C83151473BE41DEF8657A35F1AB25F84BE516C4A75D23B994B51F81162B0B0578EBC5221FB48EB46C434AC163BA2397985B355161DFE92805393DC386CBD9B7DA7160E69E39F1F85CC4F36395351F8AB64618FCC2189D52431096BA3190A9E4CC589249D8D2D273EA92C894C2A08BEC46B97CCACFF00B35BE15CE5454FF7E11CAAA8ADF08AAA8DF0A8891926628CC26588536A68C60DDF79B61628C6BA519AFF008491870BD249269155C8A8C1E17CDF16BBC7F8A3D52C975C9BEC7362AA623224748D2FCB57E2DF0E6B55A9E3F7F1F8B95FE3F5FE29E7C7FB55AC21814FB034B028EF9F727D7CED82C05AAAF20C51679248D8C8C89122481CEF9398CF11C8E735CA88AEF8FCFD0B4C95DB56A69249960861F51A344ECB26FF004F94A83D85DFB50594123FCDBEA5B8A2B1431AA89243B6662EB19D0058286247E5A1B3B07435BFED2589CF31A08EEBB7D80D252C7138F5B41E35723A3F92222C6335109FC97391AD6C6AC4911DE15CC4679F4DA5829A756C5118DBD1237351A6B83FC729635FDB5CE63E28A57AC6AE4639558E57222BD1CA9FB57385CAF6048DF8CC12E56A7E9866FAD6A886B95087B638DEAE9658E16A2B917C364FF26A35CAE5637CFA8FEF5B9DE77600817C568453EDDCD656323AE8CC8D667BD9F149D81CF3911C2AD7B17E5242C6C6C5573D1A88AF4F2F62F5B592292DB79158BD54AB0ED8AA47BD811AB48BA52DCD7D8E2558FC123BA59A5118A50B03F15E2EA6785BF23A3E9031D92C4716D6FF00603D8EACAE1B3D563C50975B031F1B9AD739F131BF1555F088D544554F29FA472B953C785FF49FB592B6019A75350435CD92378F702B2485BF24591B2C1621C50222A2AA23E7247444F1FE2DF1F154F1FB89F8F4F2843D8CAF9249467AABE057F96C684B9D222B5AD5445637CAB15519E51CE623D3E3E5CAB355FE972998A116E76F60FAB0A39CF2049A218F32326D6A292D342100D65507647A4D70FA97D400B0804B5D64785195F8A24A41E27DC5662DC91D9AD97767A51C529690C6559A3E276555BD7B0C3986D0057475EF502E5BA38DC8D0CCC0CB57ECE78A779E4244712A804176507E0A8D1009D91FD874E477458A9EDF47CE3424D0E649C5812E1E8EBF6CCB0C032C478E688F04794ED24464F5D7366B66A631F715B9F0EB2C268E0B2687259C324F4F2D81307D8D5CFD02AE093541681261BA3746C0EBBA47352018AB2E43ADA9B2650D4E906BAB2B4B3248B18A9ED7371AB2C8418A0EEC75125167F1A1EB77BBACFDCED0886E9BCECEAA9A860340A3A7B6BDC78A4812836E6DEDA555566ACED6BA0B873CC072DA7B33905A82D189A042EB6130FDC692DFA874FC7D569CB06C31F92CE731CAE29846349B9CC64FA25FD502A64DA8E8773786E8609EEBF8D91667C1590085E994744AAAF0FE12113655C5631B09DC9DC7DCF4054A83233D892FD2513BCD0D985D21AEFF007B0422616456B2D62CD79A1535E5560B3C719132E62C964E6BD91BF959CC735BB3665B565983349358B0FCA4B52BB791BC8DC99CB391A698E868E86B73D88E87054072DDD27B7CA33EC1AFB392A35FD633391B6010D95F32C2CCD98392FA9AF7C8B24F5E3C2B14120D33086428F99EF917A1EBB7D8999BD55D54A6CA8BA60A397F0AFD758662EAD623428A360F18F55369DC1D941560CB0CC2C23B478C342232A617E4C9FE6E5E9CD7B57BA728AB916CFE3435E54B442E1B2E4013AAC807EBE66098101B444B0C5206F4F1AB020794B778AAB23C2AA42951C07A042903F6FE07EC3E7D0D11D759FCE3B5F59ACA0E7FF8DA5AFE7579536836132F699B75FEE773A22C4B4BC8E6D96880B124CA4C7E96CAAE1ADCD684F272FA979952290E8014AA4264712EC0F54AA4B3D9C3CEF6DCFBDCB7B9CD0867EB2F34FC84B1F7FBFC95586D0908AFB8B7D382DC4739C6987C9F2A5AF0E81F19C1BCD82A298D7A4440FCAA5C6C2DF9454D8D693B7E61A7233B7912327B2AD377569BE1692A2289A14F62E82C10AA289B60DA3604558D7821FD6A54423102614D90F81752873FB3375BB8E1E363719D073DBAADAAE85CEE88F0AA71B69352BD94F0DF894D7F06744C8FE797562D8D7DB050DB1411D14D4851273590CA67B473594C75DEE996F662BD9AA604A98C91E59AA57682A5679FEDEA04B0C45B92BC9692F5F829DB7F1C35C2D58844FD1AC466AC411CCA633640223453318226088098DD54FE72349C59C06504C6A0F2F9EBA0AE43D164EC57F6F1E5B4795EE7DCD69DA69D73C55EFBAE8F46F9B604C8FAEBA2EFC5A6C472AC402900D4860B6F971E1D08264C4014B641491FCE28F733801A5E611516C76DCAF6FEE683D1EF6C7A587CCFA34FAE23394CFB5FC81AB2C79D54E4E968797D6E7996B454AE46CA34169713BDC0C46A12E70612799779D8DCF473A9FDB350A4DA51B3ACAFB7ACC7EAB77CC2C75B5304CC12770B718CE8595D1E8C6499D5F736634D7E20E2123B4C82B661A13489D85CFBDC767B927673011B9064B2DA6935FF00D9DD06D733B6EBE4CF7B1C9A4820BB0AF8823A659566D20FE4E043D1B7E35DD793642C072C324CC8E64B33B073D87351F10972BC797A94D2ECD42C8964CB0C7DCE5F93D29ECBD8A104924F3F82CDCFBA92C974D702D2B74DD88CADA57A71B63A6578DC4920E5379D60977A56E44B3C2BCB71A3851C47E4CCC3D2EA15F20229EE95CF89B1931C6E77846A22A3DC927D9E5111ADF0D5F0E5737F6A88BFAF1E22A170B4160D75BD2926D25913145F905E78E22B492FE0E6BBC90A34A3BE45456A3D7E4E4F28DF87FD553C953F751C06186B2CAD69458CCA0BB1DCE73216AFDD5E62782238E64FD2F86BFC3DAFF922B98F6AAA2A3244F4245286FE9E45FE3C87C30C0428E4C0D556490AABD23447F97C8AD54FD7CDCD456F9FFAAB98AABE9C248857323ABC68B3AFB122868A58C8054386043B29D12A46C306DFEDD3C24E24914150E3F2011F601D81AF9DFBD123F91AFE35B72454D67223AB0BDBECE683EA8865809BEB422358614474103E222C5617B3CA357E3235CABFF6F8AAF85F5BA039C6231C2136CA0C725A4F1CB22165FC262DCF7B7C3963F2E7AB7CA2222AFE9113F4889FED1BB15446E90788A28820E2515D0B9CF73FE48CF8FCDEE7359FFD373BC2A35AAA9F245555F29EB12E2AAC626A1371628CAC851AD89924AB3CAE915E9E221A14473DF3ABBE2D4647F27797B55A88E5F091E2B11464AC572B2AE9BC890D682232311ED55A35573CB6001BD713AF63A2532AC70F34A90C2DB552EABA23D021974364B689F91C7D9D68F53172C816CEAC860F03918E3FE1135DF0737C2A2BD1515BE55111551AA8889FE4DFFCF857AB2BDE7F63CEF16ABE7799B916138FBF8EE2C648A411A4C808710F0D53CC6B24622C12C8966744C7C534122A41346C9A355556DC1F6DFCE081EA62BCBD15E23645592B6BC845FB97EC6FC47FB5A88BF397C7FC8AAFF2E627C51CAD46BBC0ACFEA8BCCB73A1EC31E9C1ABB02B299FC4515538A8E191C18F22D8DD1463E273515AF63882DAA44A8D46A2A31AE54646C6FA21DB1839F2992912281E7DC33C9E058CC8EEADC50A14D3065264DB0E24151F03634ADDC765CE1AC46232E8E628A4724E91012E796F5B1C14FAF9D9248E9A3CCACB036715DD8E66C6DF4570407537157CEE964A5B0966BA82C426FF00272C3742CED2A08E8C8B588BA1B2B810586073D6575B4838F5A4EAF97749EAC5D4F60C6D0E039B6EADF5B57FC0CB71B030C36E39DE5EA213A43ACF29617AC169B055291A57D5996F2B2B0C92306BA8EA261822EDC73697F29226CA13A98E498B18EB7A196B6AE28472A542EC9E5892B0192415AB2C2C2226C9023DD14CC595F1FCBEA4F1326E83B7B76686F0F1036D759D9C5346FAD1ABD8F1DD2991CE0D8C51471BA06030AD79A723103191607C8C8E1643244D99A13B83B39E2CA64AC4B8E8A04916ABE824D53C96E154F2B1685E120B45A8E4603728591256D6875547E946C5D228D91E26120F97FCCB212CC4804F0FE403F9000AE8756FF33EE4A7C2D545417DC8B916B4F855B33ACAE7316964646D920818E1D0E63081888A49E29AC11E134513EC3E548466F874B32F5534FA0102FC59AC14C7C1662A9B5054528C919D570944D546532330D613031C6569B0B21998C735B0B551158E6B9CBD57D27D3CED9B123CF2539FC933991FC6F6827276566E23C874365BD6FD7B1FB7A1429A0F4208F5FB6A35F8F5EBDB6FFB7FBFFA747239C714B75D6CB705E9E6DCD9EBA86CF473DC58E687B160D736528C6588FA58F53FCC0B3D8D88EE20BF9860187466C61B1E1C909247D337E5F8EEF2FB8BF4BB398BC9BB6039506A840B4772550C7754621F53433D65454D24E1885DF3C56431AE70C0E2880AE82522A668648158FED5B8B7B0FF006BBC2041D98DE6357616F1411C44EA3612CDACD11EF8D51DF74E55BACC20CE7BFF00E4743560D788C7FEE21A344444B52CCFD1C61A57B29AA9A0244B020295E2344485515AB0A0ED8522FA95AAA8B1FC3E0A8AA8A9FB5F563B7D2BFA7CF2A4D948B2F9FB90DAA1656FB3D6C482D4D8B4B18AD125D66AD61B4CD109610CCA5A44FD464271693B00645AE352F9C2F8F7C5C6F480AF8D56262C4C88ABB7D9D3AFCF5C02FB67F6C1D3FADF49A28F1BCEA39F73258C0837F660D9CC4AE5207C24D7135ECB0CD1202D60058444D6B2595F090DCD4AD62D8308B36CD33A43E3EDB7FA1D13C5ADCDBA3BA4E503B836C9B675FB4A2A336DFA663822C7F8DCE733FAAB66568DF0B021D24B3E99B5425CF97BDA12030CE4C441FF00A4C965735F6FF6EE6A8287EF739F3FF0D515F59F73DEAAAE7CBF843C1F63DCAAAAE73BCAAAAAAAAAF95F2E0778F0BE7CFEBF7FA4F2BFFE93C2FA678701DAF8F9EDCD8BC32192EC75E29EE65FC590BEF156964B104493786148E28A59E7754F1BB319A5496491085050BCCCCCC6691032A2F08A491542A6C85E458C854166D02DF0483B249EB90AEF9B41F946CF55CFB615933EA0334BA7FCA2077BE074234CF8A379288AF58FC31893453A35CD4477947AA796A0BEE97CDF0FA9266BFC85A384748AF7A1756631B2B5AE557B219D913DD014C67F8AB5B3C2F467977C55BFED7A22F7B3C8F1DD56DF40D99F0D3EC6B6CAC4229C40EF6C76083133C5198E622C3239086B124F2AAFF1E7C2C7F24F412F51ED1B435D6244D5ADAC955EEFDCD556E60043BCAA2239EAF1C66397F7E55BF73DA8DF09F2F2A888C1DC1D93972ED3D0A91CB4EC2A4CB54B46A63F2287658D242A75B2A2328B22B281A3AD00D547BA3016E38BC97A3A579142CA930645E71E958ABA294FC9BE76430F7B55001EA8D43CCCF80D6CD2E9ACE4FABEC8A1915A04690B5FE1AAAD6A089E55551515F27CFF00EAD44627845F520E6B1599A82C5B8D29B25CCA02B5C34B693B2641DCD4F92CB1C4AC8C61155C8CF949144C7AA35AC7BD53E3EA708FDB1F4B748EF8A191B1CE5622CBA30646AB7CFEFCBD629A646F972B7C3555FF00AF9B9EABF25F4FACAFB41D31474325B9953139AE4F8CA51E75ACF0A2A27C56364D0240D4445444F84B1B917E4D456F86FC9369FD3FEE29AC288B18202BB06477AE8138B0DB0DBAEF5C89F449D7A236740E8EE0C046BCEF67AA344A1488924799DD88047158D59883A3BD8F9F635B1BC8C5EC52D4B1C70217FD2D46B4754F312BC76227CA415EF6399140D456A4F62F4FA218FCBA1FBA67C68E3D3EC7B99F02F707CA75FC6BB2F1FC7EAC0B58A69296F74597062B6BDAF98651EE599DD03878B435D0D590C849A72453A272C529530734AC64D2B879F36E2BCFB9C4711F78ABA5B58FE2F8A29A26B01FB5BE1CD5708AF97EC6B17E3E10B2096C6AD47469178F57338475EB6A4EC58BB61115A10966C827AF159124694E64720362E72CAA913A4402799C3AF96B592B5AF4731589E2EFED9FA5594A38CB5965BF6EBE5A95692D5138E99A048ECC2A2540D60707924629C50445551887F231551D56BDD9F52315666AD88C5542D49ECC7F776EC8E2F2292ABCE1841DA0456259A4DBB0620C637EA9CFB82FFD97BC695A21B5BED83AFC340F82DDB68DC97500489461BE821091A10F4F9C167224646AD642911942D546A2CAA52AFF0087A10DEE77FA25FBC0E6FA92F41AAE28559670C10F759ED39292FE8154EB06C72C905BCD5F56125D50A493471C47A5955C114914CF9A19592BE57B3E8855854870509AF8DD0A14D49E185FFF00C48C791A8B07D89FAF8CAF8FE32C8CF1E627C8E8BCAFC3E4B9FEA25BFA857F331355EEDC4E1FB8D4C4F5DEE4955317985077A957238B1024B651BDACF7AA5E2DAD481C13B1AD8B8B89FB6964AC5B4C003E68F7AD6FC726FD6BE42B28FE35AEBE4BD69ECF3AED213F84463B432C88D593E5266AE07951AB2CB1A3658A416373644FAD557CA2F9456AF94FDB5ABD7D669E28D22FCA482191C89E3E4F8D8E5F1E55513CAB7FD2795F4BD0DFBEFA6EDEE4EC3CA17276C57BA200A5891B207FC367D7B3FB9F8F9F7D78FB0B9FF5B17FE27FF9381FFC75FBFA5E97A5E93FA2FD2F5E5EAA8C7AA7FB46B953FF0054455F4BD2F5F0FC7FBAFF00F63AFDD7337DE35B7E6F46D09C69F29641F7D6CF21D3FF00922394B9D7FE246AB7E96A22FC5AC8D518D6A27C5A8BFB5858F7BE57B55CF7797B7CAF85FF00CABBF7FED157FF009BFF003E7C784F1FA4F4BD2F5B06DD6AFF00678D5F043C454ACA17C49C4288A30140E3A000F4001A03D754B7924FB9B0DCDF9196424F26D93CDBD93BDEFF00BF5AD8DCE57FC7E4BE15A8EF09E3FDA2F8FF00CA2FEBFC13CA7FAFDAFF00F8F19D31E4023A490B9AAF56AF957A79FDA784F3FE2ACFDAF9F2BE3F5E5117C278F4BD2F4271B5ABFDD443EDE1D163B1E28FDFF4FCFE3EFF00DFA9334927849E6FBE1F3C9B7FD0BFBEF7D2AD9A638694E2A5925911CF46C4E77FEEECF0AA9E5224FF006BFBFF006F73BC7FA4F09FAF524F3D9241629ED617B9A74AE462CFE7FC98C6ABD11B1FFF006A784FF5FB44FF006DF0BE57D2F4BD5B6238C536508817712F10AA0713ADAEB5AD1FDC7C1FDFA50666FB9DF23BFC8EF677BE606F7FE9EBAE933965B9B7DCDF0D7362F6C87D965A90A2E5637E292112D7C0E964F8F9778591EAE7B9117C7C9CBF1444F088FD5FD22FFE8BE97A5EB01DD016E5B550028B338000000025700003D0007A007A03AD135C9304249249863249F64928BB24FEE4F493CAA22F954F289FEBC7FF00D45F4BD2F4BD46D0FE3FF7FF0040FF00B75DBAFFD9);
INSERT INTO `t_spieler` (`SpielerID`,`Name`,`Vorname`,`Nickname`,`TeamID`,`Image100`) VALUES 
 (21,'emhardt','steffen','Emre Deluxe',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001F0000010402030101000000000000000000090007080A0506020304010BFFC4003710000104020102050205020601050000000102030405061107122100081331411422091532516116712324428191A1F0182533A2B1FFC4001D010002030003010100000000000000000006080405070003090102FFC400361100020201030303030203060700000000010203110405122100063113224107145161710823321542528191C116244362A1E1F0FFDA000C03010002110311003F00BA6BD399EB3D0D8513DD400253D8107DFB6B5BDEBF7F7F1E27DF61FE9496D0C287B290123477BEE9000F7EFBEFB3EDDBC7282FD73AE202CFA63648055F1EE06FD883BF7D03F1BF19B955B027367E9D4CA5C28481B3D82B5DB5A24F724763F1FB0F16BEAC71B0462E9F1B98123E39FF007239155CF3D44DAEE37000FE80807820F06AC1BF144578E39BF0459909A094B9E8B9DFB9291D7AEC08077B00FEDF27DB7ADF8FAF358F9EB7903A5DFD5A1F1B2495103DFBF6FD47DBFB93ABD8E377B1C1FA62DBC4E949E923D89EE35DF5A075A20F71DFF60CDF236790F8A717BCCCF906E2BB16C5F1B80ED95D5E59CA6D881061B29D95BAE1DA94E38A28663C76829F9521C6634665E90F34DAA54789EA1DF165291E4AACAA0B7835B689AF8A03F43F3D747DC6C0A0E3B836A07B093C9008B1E0922C57C7E38E9DEB58CDB895202FA99208D6F40249F6237B1EE35BD68F6D11DCB2D9B669C53C7B1858E7B99E2786425752933326BFAAA38CEF40DA821EB3971D2B501AD25B255DC000F63E2B43E69BF1CFE48B69B6943E5EAB1AC171A8B35F8B1F2EBD8F533F2EB78F1D010A7FF2FB21368F1F88FACB8A432D3569681B4B2B5CFAA921C63C018CFBCD1671C937526E332C8AEF27B5B87A4BAFBF67656B66F4875F539D41C96A7A72D280485FAC95A4A7A50DB2E24F496EB723576C4DF0C2E59D3DACCA6D2C70DED0CA4D11CF22882180F06C23D29A72924FB620C1694A8693CD006CD026E80DC5AFE3CF57A2B2F3FF00E47204C5C193E60F8D9A7D9752CF52E64F4B014540254A9C20FD01676529320C8547DE89747C3E380F3770C7292E58E2EE50C0B3872104AE5230DCB68722721A5C42568FAD8F553A53B192B4A92505E4237A5277D49504FE6F4FD8DBD945710F08A8656E3E1B4C72D33261212E85E9A9325E79729B512545B5C78CE6868FA8D8F4CF6717F2D72370C722D6E6BC63945EE2B9253C31655F6B4F60F45792EB724333BA030FB2D3F1DD65D5B52A33D1C32E7D4AB4CB89424F8AD1DC3A813B55B1A6D856D19645DCBB941024134823346C1313F20F1441EBB66D1230BB90CA8DB4D6F0BB7E0036A176F91545E811F357FA64A9F0F1E971D4E8A80EA1D43B76EFD8807F73D89047BFB78F8E4486A6D416EB65447DA75FEC41FB813BEFADFC9DEFB6FC56EBF0F9FC6CEB7936CE878A7CD5B10313C96E26355541C94D189128E54F7DE92D478D9837EB351E9D52DE4C58312CE287E2898F259B3118854A3651898EB131B43A65FA455BFB42814A46C9041048F6F6D0209F7EC4A7C1060EB58996AC048F8B3C55EB63BA86912F9565DA4AC9136C21644250D104AB0651492624C9214784336D054934A57800D9A04FB8F039B5AADC0F58376AEA569251D6B7529F8E9E9D9DEC1D9F6DF62363D8027DF7AF4E6186D2A2861B0B000D24ECEC11B51D686C803BEF5BEFF1E1CF1894568757D6FABAEE35F6924EF63B13DBFDBDFDF7B07C753F8FD72E396B4439D3A2EA89241EFAD048FE7DCEC9D7C77F1651EA5102B73CB2AD8F86E050E39A06F8F8A1FB8EBF0F8521FF00A71A7CF041F1400B00F80079FD88F1D32C5D50247A6477F6EAD6BFFB77FEFF003F3B3DFC2F0E23B89C50B204A0A1EFB3B49EFDF5A24FFCF85E278D4714F219A8F23DCC3FC3CD117F1F3CF9BF9A867067BF1F3FE25FFB7F00FE9FE9FA8B79DB93066A3BA021D012016C846B43B1EDEFDBDF5F3DF5BF1C58FAA8C54A6E415B7B2074ACF50EFF001DC9F91FC7EC7DC78D2DB9086B4B6FA093A2AEA708500A035FA8FC93AFF8FDC0F1928D6BD0E10B46D253AD6F600EA1FBEC68A8FF00D923C0F988A0343D45F215C03545410B64D79B15FE86FABB1207A15B4F1654F9BA1CF14791F9F8FF0023B526E65B2A27A9C5A40EE7DC6FE076F923600D1EE7FB78A707E3D7E7E2DB3BE5163CBE611692D383714AE48C8D301F296723E485A3D19AF496D07A1F8F87C65B953044804376CE5D3EDF532F4574DC6E258C770E9684212A03BA8689D0EC7BEFE75AFE3E478A70799AF2AB8844E58F3499DE4853636993F985E5F631C85392DBAC576191B228B1ABD0C0D95B52176F5D7EA52C6FAE14888D15283415E224D958D87899B9528582485638A324FC4FB964653E15D515873541AC10E148BED074A9B56CF4C48DC97642E9C7B54AB20B6F9A1BBF70C41E6ABAAC8DDDE4D79D79A90B75D932901FFA16D1D4961A1D45B4C85BBA6D4A097544B20B8B6CA5234DB8B24EE5C47C5DC8DCAF7B1EBB14816D62B5969A5743D2DC0C0EB23AD63E98C77349EA4AFF00C44E93D29D920F4924A2F26B8FE41912E5592822B3AA33298EC243614C32E75BC56B29EB51737B1AEC94FDA15F6024AE702E0BC59C49198818E554180F74A7A9F432954975694250AEB594F5A8E9201EA3BEE3A4E8EFC63DAD77B626323C78B18C894804171FCB53C1B279661F80059F20FC1D6F41FA63919794ADA866478F8CA4928013236DDBE2CAA8B3448E0D7042D83D0536FF000F6F302A98CC3628DC78CDF557B756A52BD3484FA8A5A5614D259649042BD37D7EAA9B415ABA95B8EBCE3C21C89C133AAD8CBABA446F4CAD84ADA68171E5CB7DB5A9B6E484212A2CB614500B2D8040E808050A55C42B336AA75959FF002C16D37D25DF4D29714803AD29D0DAB5FC13DC6FE46FC0AEFC4A62D365FC72E4BFA640B1AE79E9915E6D94758E96C0E8529493EC07585276507A563637E28345EF4C8CCD4A0C4CA8A311CEDB0851B4A903FACF9F27802C57CF81D157717D3AD270F45CCCAC579BD58177C6E65621C82BC04E54A9E7817E6AFF0035DE845F658B38EA2A69874CA405CA714B5175F537223B91D5D3B1A792148712B0B5958583EAB2948B99FE06FE76330E73E1BB9E10E5AC9A4DF726F1008C29ADED25264D9E43C7F212DC780E4A7DCD4B972F1F9DFF00B6CA9133ADE30A5542172243E894A6E9C89B0A99CDA23C8E984E313105C60A429D6C3677D034B27A4EFA569D8095A125006C1F072FF019AE92D79C09BE84C2A657C59987A8A0A1FE75A44FA7DA5DE907A4A1C7234848504A3ADB3DD5E9B7D3A4C591E8E5E1E407F4E44CBC7460DCEE8B2648E09232DC2947DCB2559B9638DF9AAE97ED53115B1A43E648002A7C30174CA458A53CF05796167DDD5CCFEB5FFF004BAA4EB5B3D446C7FC9D7FD68E86B67C724DA3CDAB4A3D47406CAB635DC681EDEC46CFF035A1DFC75260A540752CA55FA7635EC37AEC7F9DEB7DBF6F73E3D8DC28ED905452E763BD803BEC1DFCFDDFBEFDFE75BF1A2318A8F1BAFC00A16CD03E7F1FA707F346FA184DE48FEE9A5B249F000B1E0D9F37C01FBD75EE43A979295909048EE3406B5FF3FF00EF85E3A92B6503A7406BE081FF009ADFB7FE00BC41264B3B7C5F1EE3E2C71C03FAFC9F239EA50087922CF1763F6FFDFF00F016D1339A0FB53DCEC77D2C6B408FD2ADFF0027675EE47EFDF26CE62D9002965A1B1A257DF64F61BFE7B93B3F1F1F0D1086A1B28749008EFDC9D8EDFE9FBBBFCE89D7B76EDE3A950DF42810B49EDB276A3FD8FC0FB7446BFB6C9DF7D2A5D3B01C901829238E09B22BFC87E960F3FB8E81E3CFCB516539F1400FE935C8A3649F920F35C73D3FD1B2A61EE90993AF6EFD7A2476D681D020FC6B5FDFB77AFE79DFA2951F99B3C832A4ADA8526E9DC8603BD67A1F6B27E8BD7DE492AFBBD3B0B1991881A016CAC68003C1866DA943F4859D6F450BF6FD87EAF71F07DBBFB7BF8A8AFE36595F9B2E29F33F637957963CDE0591625476B8057564071D4C1C7EA6A5B877C8B24864B067B791C3B9716FCA96B7E4B5222FD2B684BAC45642BBC7B6C666819F1E2CD109104332A4962F6CD1A1A281CD812DB528016D8FF4D1D27E9BF703E17702CB2E2BCC9F67387442A24210C5292A2464525523268B8622C0E2EE5850D3D5D749AF5AAE1063C971287105C016903AB6A29D2BB127A494956B7A27BF87F689BC098EA132EE2467427695B92023A948D10A0A274948D6D43A86B455D93B1E2B97C05CE5E6579BD89D8ED1C22EE43515C27A5C597592FB0E2DC61120B4EA50A60992C156963A13EA6D056140160B96E279936F295C0C8B29CFA4DB48724FA9474F7322055B053D4FB8C224BC990D752964348DB0DA3AFA129510927C2C4DDAD913E44D8B3E661614B1D8601BD67205307DBED0AA55810D21502C02C1881D330FDE78D0614795A7E939F9CB38B52E7D054A214A59591E46B534A8AE49E41DB5D5B7A33F0E7B6EC8A0BBADB08CD95364449F124F52D003850432F1505A13A5290475A52B49503B4EA39F98BE3D9DC9B81D9D5B1243331B8521E8C84A13A53886D4435B5052C851494A94127A8A82744009F013BCACF10737BF715766DC6CB6A9D71E43E9713C80DBF3A1494AC069F7A046722B4E1501D654890480E10A6DD505B69B1A60D4B7B271688DE68B6A65D36C7D2CE9486FD25C952DBE8438F841F4C3A4757AAB03A14B2481AEE42358C2FF0087B54C79B1B363CC781C3192358FDB4C2832A4D3C6588147DFB81AB41B81EAF74CD565EE1D3DE1CFD325C033A3AA233C8432570584B142E9C90CB6A41F8BEAA219BE276116F64428CE39F992673B0FE99B694D7F9943A1BFA7520FBBA16D108511B4829EE4286AC31F81E71E653807990E3FB6CD724C1DAB7C8B0FCC21A3108D65648CBE3D55B51CAB4AF973DB95491B1D9EE1935A84CD85437D69635CB79872C23C64852430517CA64295E613932D5F62BEC6BF0561392351A729B11A699AE5A5829B2971B5B6B762D5D7487B6B4EDD9319A08DB83A92493C96C3C832FE54E1862C30AACC3B21E35E51ADB583698EAA4BF0AD696D98B2733280A7664993256CFD23711C0132551E37AEF24A3523A01EEA5DE1299B4CC6D35127032701F258AEF6DECF0CD0E380AEAE9BED504A15956474DE0A865601D3FE9CE36769FDCF9DAAC9340B0616A3F66D14A8B1C52E2C134A93CA1ACCD199A348D91002236736182F566F9115C481D2523601D0201FFA0144EBE3607B1FDCF8C7943A01E9275B3B24F50D93AF9D0EC00D11AD8D7B78F684CA75013B1F036B3ADEC6F5BF7F7F8EE3BFB1F8F1AA2CC0760A524929042B60EFB77006BBFC7B02083EFEEC3473028A1E48EC05E09A3743CF17E7CD0F06FC785D1D298908FC555573C81C11E3F4E478FCF5CD289040214347F61F3FEC7E3C2F0831380D6DB1FDD5AFFAEDE178E09231C6F8873E0F35CAFC83FB7FA1EBE00687B24F1F861FEFD4600FA9B3BF55275A1A0A1EFDC6CE95A23E7E02BDFF006F1CC59291AEA7507B0DF568EC68EC024EBB6F5D80200DF703C61BE864A404A986744EC2DA7D958E9FD8A14E05A7B91D8A47B6C760078F5B55C8482B754EA02527BA10A580A3AEC4F49476D77FB8FB7623BF8D2D7334A9398F37127E6808A585CFC0F08EC479BE7C7C8F9209F6FA8A37BF1B222F17EA47222F1CFF007954702A8DD717C737906ED4757652763474081AE9F7237A07DBE0761DB7DB7E043FE2978C8CE5188C6510D30BC71F88F494A637A8D25AB794F24A54FA55D40ADC4292D23B1E95FDA415ECB23D1D848D226363BEC75A7A4F7EC0281F93B1EFBEDB24F61B193F89B61B94C9E21A6E40C5DE624AB0CB67A15FC561656B553E46A8AC449EB006CB702DE24584527ABA9574160A52CAFC0F777629CCEDBD5970406C8188D244B6C19FD2292B804802CA21A17CB501E7A3FF00A5D9698BDF5A0AE6C91C50CF9126297928C626C98248718351636D90D1A8FEEA960480A08E85FF0092FE13A9C4328CA6D612DC94FD8BB5D04CE90B68157D389B264C74B69425B690A0FC45A93F6A5442127A743C3C5CCBE5EF01B6537739154577A3F58A4AA5BFD71D6D3CEAD4A294CB60A0B414EAB4DAD6A282A01083D451B853C6DE60F31E29A18D62BA66ED5A3776CFCE7A2B4F3EFA264D8D0D2CB4FA11B53C23331A3B0E7A5A53606FD351EA2A742939B797B9DEA2E6BF2350562128A16CD5B78CB346F332A2BDEAB1EA5AA9E726B8D95147AA0A425FE8D84A1214952659B2668C98F2C3B40182869FD409BB92A768B514AA3953B6C0FC9E9E767D131B09B19C09A6324A4C69134DFCCDC02D9E76126DBD40692CF804F52C78638D38B70EF4BF2C79554B796DEA426C24BDD7D40F70FB8FBBB476292144200492948213E24DDAD836A4BD5154EA5C0EC73F4B2595214A528EF4B596C94950EA212AEADF4A88D90364346208CA1BCB2DF0C81954888BAC5B4A15B2657D718ADCB0EAA1BD1DF43BD6A61E2D3CD069C01D69C401B52480998FC5990DE50BB631ADED1731CAF910FD17DD52C85B6F32D971B4214A27F52813BFB411D453EFD21FACFAA64625A395D02B12090C7753AB5ED161855D3122FDA48F35EBA84768912148D832ADA28DA401B80BE03211C9048377D6661E197388E43C9195E452EB54D677618B543516CA4C82DBB5D5B1EF113112151DF86A8CB94D5A4A54754790958525BEB0E25B4B4B319E51B13C757F49CC6E26205C880E5363423821B7A34464D549B9515127ABA5132A6134D8433E989D2FA1C32A3ADB1E98F88B953D2E4CC4874B05B7A283DC21E3FF00C6E03B0014A4ABA55D1BFB8803B11E26EE1BE653CB970FF1DE0186DA728E0AD398FE378F63B22340BA896AFC699029DB6662A744A954B7D8744A8CF2A5A54C7AACC9752975B42D675A37D29D3748D675CC8D47589E28574AC68A611CB347040721B647037F3582B98D210CA010DB915CF283ACA7EA96B9AAE8FDB98FA6E9692B26B19594997951472394C54F49E58488C109F74D222BBB9B68D5D058760095FF0058C52074BA907BFF00A80034013A3B1EC3B8F73FCF8F3399885AB4DB9F6F6D68E88FF9D023BEBB13BF703C0CFC2BCEEE3BCA7C812706E27E34CCB92988A24495DE62B153223A6A599D02126F1E61C0D3F0AB1F53F354D19863CA70C4652D455997D31E61457F3F9BB30386B3620EC05DB4EC3E95037A3B299B93AA521237EC62A95FBA77D83031EB9D9CED90B0EA2B3B63486194C114D951AC83FA9564862747239E63661E39A3C6078BA3F736720921C486384EDFE6E5E66169C2CAA300A73F27195832B2B5826B759B04F4F69CA964F7D93FBF5A46FE7E4FF3EFF2767DFC2F0D1A29F995D4F5B3C6144C36AFD2DCFE4582DC90343BAD10E8A73001F701321441D8206B6578E1D77B641AF532081F230350A3E39150D7E7FF001D582F6C772D0B93441FA1EE5EDCBAE3CFFCF1F8BF927F249A3D56018E55FC4DC2414F2844EA010423F2282EFDA46D274B8449212804E9441F9EAEFE240F17DE7E22D7F3E0A72DE65875D09F7529752C62B52E49E85ECAFA02D9F4760E8276829EFD925253B7FA4F200C2E2B554AE14CB3E8A9699D9E896C5BD259890CD6533970E35EB996E497EC2434CAD28121BDBD374D75F4AF7E3A385BCDD60FC8FCD58BF0D37C7999E33925DE3B93E4B1265CA29D35CC44C53F2AFCC1991F4D3DC9A992F9B98C6201194D908794E38828485E7026C89D3747140AA0166686256F4C002C8215AB6F1CFC5F9E0F52408E22BEAB49668533BED2DC78142ECD58E41BFC003AF366579E74A265158C603925E2A82BE5FA590B99A5BE08F8B4620496E3BDF973D438844768576ED853909C9D1EF9C8A80B4C861E7D04BDC321E47E77B9E3CE4773246318B8C62C69F20C6ECEAB28B87321911D0DBEED6C9B3A91438B61618B18CB42E4D7A9D98FB2D3CD32E8654EB687132E2CE73411979694BE96ED1A0A0E2109D13656094842838B514747DC4A821655B051ADA845CA0312EF15C8E9E780E429D926531E4344B880E32ABF96B2D92D38DBA9EB474A4FA6EB4BEFA6D685770638CBB551D249A164D91DC12CB8C5AA256E5627893712C413B40602DF71F7751C64B4131923C7C336CB22FAF8B165885E2750AF1365A643AB12A189562437F4ED000E819E7BC5979576577611B20B7C7E745099AFD12ED27D5D0DD45B04B2E43B14A5A626260C9723ADA911A73711EF5633CDB7250B48416F25C71842AF27C681736CDBCB9131A79526DF31B6C822A62A654290967F2385169213CEAE3B12612CCA9A63844BF5DC61E2C06D649FCCD71FE333315A5B675A6E1C5A56518F594B68384A2A2439D3566438E2DE5ADB832F70DA71D71C7546C1B4B8EAC2121111B8CB8E389A96D5C99272A7D2A1D4A4B264B4A40EA2148F4D296DBD275B50254B214AD7DBA24E47DCFA749A5BBC5B03ACB1FAB0CD4E1D83B0DF112840631316019859465DC7C5339DB1DCF87AEE858F9990921CE123479512E5C98F8DF711AA0695844CACE24A132C45F9126D2081D7BB1EF2F181F165EC8C83104CA917D7080EDDDCAD6953F66A65A4A99694DB01B618623941FA66DA484A56B7564975C71C5EFE890E30A71DE8792AB095DC2CACF4B6D1436DAD400240521216011BDA95B00E81DBAE336C12BE3C766B67B325486971DB6DC77EEF451D2971D246B45237A5A54A255BD1D8D8D5EAAF615A4FF5509408E0943484ECA5249241EA1F6AD60A411B1D213DBDCABC67394991933FDCE5A3BA840859A86ED9C225306042A702B80AAB5C707AE6CA8B259A1C578D195EC7A2AA546F36C45000B16E58F0DB89269AC9967C4AEBE7A4156D1D24AC7E90523EDD90AD9253B3D290483D5D60693D9B5E459D88F1F731C7BB938F475D7C4AFA644C6603B591E43336C05FD6C6B06A0487A0312234C9360FB76321F71C10E4448D2168224254971F8DDC28720299FD2E00858FD3F29D13DBDC1D83D5B24F51F857861FCED62B2B0CBEA9CC65C6933310CDE82CA34B4BBD0B611615ACD84B95491C3CB311B548993D9B9025467161F119E80EA55094866EBB0F568B4CD4F56C7728BF778B8D36386DA07A983911CAC15590866589E4936950C4211544D077D5BD27265ED5D3750855E45D3335BEEB69B31E3E5AA22CEE06DF6A4A88879E04809AB24487FC23326CE472BF2842C2F1F8F3A92DF18C2E0DB6492806D9C3EA5A99925AD7B539C2D3CF1BCB0624B8CB90C3261C9B08274EA9A63D66EC0F7BCC18CE2F98B1855CBEEC19B231C73284D9CBF4E3D30AF666BB5AE3027BA52CAAD04A4301B80A0875F6A4A1D67AC34F06EA63E437CC45AF1E1E4AA74E7D4B81E2F7F412725C96CA7B31E5DEE552B12C3A7C2C5705C75F6580A8CEBF777311EB494F488A55FE65A449121B5A1D8CB8772F72DE4FCD78B2F98F3CCD5AADAA6627D5C4CF2C2D654C72B9D94D4A5403026B8644D8739D4F43A6230E0F494F486148E96DD6AF34ED51B1B4FD6B3628E46CB97559A55C5691420F52588B346A016A9A3DA0DAAAA3C823461E93018347A88C5C6C7572D24B218C281B0471C6523651EEE47B081641B60FB4902FABBE4BE52C26AC4444FC96AA1AE6418D631D1226B0D2DD85311EA469094A95DDA7D03ADB58ECA4F71B1DCAF1591E4E9796F998CCACB966930BC8AE31DB566BAA31A9F5588650CC07A8B1EAF8D5105D8CC458CDB4CB5204572536D02E94372103D6753D2AF0BC120D66121498DDCED5DEC98D23297017D4DACA5832870C15831040537D493AAD121612CA0D0605A987B3914A451BE2B8AF1C5DE25FE5FCAE45E5A35FFAA0AA763CCC0EDEE6A9A5D3E7CEB4C20F19D8C96AD415602B8E445951DDB8710871C7C861C8E232E494C6537DE58335979979EDE1E993F9323F264AABE2BE6A82FD944ADC82B935EE3B1F0C7CB2AFEA0C6F1C5BC25299F590A8CC496FFC2505B8D6C257A88C91FC7EBAAF1A974587C6B3546ADA0A9B5B3C771796105FAB4D5A9B9168F573C4F53EEB501B9535D71132AD2C7D6BD322850776DE2E199E0DCAD5728D4E1F1F3880C4DA8F4B1CC478D2BA5A624B4A23D8C466453D142FA8B19ADC1790D22438B4CB536C1699711F712FC69F05E1478116739700589F1A280AB091454A1A3452636E086526FC306BAEA4E5626640F245901A07C7950CD1CA5D5D191D6D581242917C820D1E57C5124B73C918A34CF2829CC8A99B4545EC38F3D46C61EE14876FEC63B6D483EB931DC716CBE80877A092D3A9483D0A098918AF2EE151A0DBB0EE5150977FA93237BD333D9F53D17AEE63B1DC0852810879B52568591A711F72494949F0E371DE09CC59251728C8E42ADC4F831BCBEFAAEC31EBCE79ADC578BEBFF266325956332C6640BCAD61EB47CC15BD2DC799A9B390F05F5B4BF48071B929C7541F87B607416B91F25F9B3E12E5AB5AF8CF9995D51478641C49998D21C7833198C22B2E331BCF49685301D896717EB429296A2C590EA12A36D1FB5BB8F587986168FA84AA32104663D3F2A6DC0C71AAB0F491C9DDEEE680B522C107AA6CFD57030D636C9CCC38BF964BFA9930251F5189059D82DD1E001647C51A30DDCCDB11E4179BC1E32D8CAE4E5AE8A08D8DC18722DA55DBD62B11DBAE8D06232FBF21F7D6E250DA594F5A5C2168E9290A488FE6DF2F379835EE511A9ADAFAA2CF18C826D34FA39764A7C467E14C7A14A8A893D4FBAB31E4B0B69CDBD21A5A520A1453A24E471179EFE1473CD8613C61C038071DBD8B667717D0EFF9758C02CB0BB796FD762B717B5F4B80D05A5E5AD8E2D8DA1750DD44D7EDE449BACA3EA6549B16D8537194B863E74701C82B392B25BD650E3F55965D5ADBC7981054D2E5BF2D5267C27BB1099516548528A17B5B91A443900112084C8FAA3F4DFB8BB3348C2CAD550AE5C91E36A0B89E8729A7657DCC065C88261EB42C27800114B1C3344BEE96342DB41CFD16EEAD17B8B52D5B4C4961931640604676B0750C428E63C7923708E4E3CAE4B40EE1CA7B1DF692D0038778EF2BC867C74DF5BA61436DC487029C756E39A3B214E3FA09246F5D283D3B246BA8824C71AE29A5AA8509C86F992F8095384FDEA2411B520288ECA291B5293B07A4F491EF13F8F1E981620BB5A962425494FAACA1C6D4BD7400B3A40206B60FDDAD8275ADF89E5C754B75383288D19D92F2CB6DB4D210E3CF2D6B5252943484F5ADC538AD25086C15A97D2120A8E8AA3A824F9590FBD8B16215515404B0450023A0599AAC724F17E78DED62C2D37D6586055647560F7B8054AF76F7B60BF245703C9BF2E4E07489AEB28A3A4AD95ADAD6D3B2DB9B07F9DF511B040006C01DB5B2718B7965C5BCCDE0965C67C818D47BDC26DD869BB87A59722B750E251B8D635F62D8F5A1DDC64AD6E41FA4517DC4A9D65F69501E969568BC1FE5864A8575CF24B526B10BF49E8B89B07A2F258490B6D566A4F57E46C1209719515DA2905C68B35EE84BA497BF95E17C35843D96F206478CF1C6038EB09538F4F92CD5D6C5006D0CA4BABF567D8CA50E96A3B2991636120A52D35224AC25463DA7F48F55D6B3F073F3972F0A312C6D89898AAFFDA99B233A9892148C3490866014328F59C52C71A822419DF757D53D3F0B0F374EC3FB7CE9658A58F2B227D8DA762C6C36CDBCC9ECC8DAA492A6A255B2ECC014318318FC14FC8D629C439BF1C60D855D48C8F2DAD5FD267B95E557D657F517D15E6EC2AEC2B54D29AA2AE8E9B161A6A6A22D289326A244FAF5B8EB525D4B802B32F2753310E60C9466C97715CD1167FD0759419AD4E63367E455660BF31EB2A6B1543C71FB510D15335F8B3F1961FC7F255594780E47AFAD44D8A933F8E7E39DE56A672BFF00454CABCCA938FC3A2144E50991E33B1244A4B850A9B3F168AE3D7902896901C8D25B132DD61C4999410F4E06E63F3ACAADF35D8FF1B4EE26E3FF002FDE627079168890EE7F92F22CF61383C696A6643F3AB6062D4D3655B30B661C5765D3397D156F5B31591ACA88A185595731BDC5F48F5CD3D71303B8BB71B40FBA8A5CAD3B51D4A3C6C1C51FCA13C98F2E64AF163B3B491C2F2E119D3363982010B4B27A522E185DC7DBDAB2CD36979D8BA89C675867C7C34391370FB11D208D7D5F4C166093A2363B28277FA60B0153C2D82F24E3B8ACFA6C4E9706978DC1C8AC23D2AB2EC82D2EAD18AB6634066BA2A1FC7EE2755448AC426E3A53571653C9AD9064C40AE96D202F0602ABCAEC866BE235FD5B5D094865097225663CEA6046581DD98A5CB66DC71A40D04B8E34CAD43F5349D775E32397B0C891C0930AB7B518C6E43CF942EA1CA7F84B0048F239E4BA39A0D89CBA7B54EC29456C29DA406A04551AF9FD87545583265645C6F6B2AD24759B18716D5B622C581023D6BEDB75A86DBAF44288C2D2CB68654947D63931F4AA43AE87FD6445723E5796391B3AE22BA770FC0B2AB9A20AAEA516F95C398B8B9E6449B0A98B31C66E73085F4B706BDB4CE5C445356BF5B48F30CB2FCCAD95645F9EFAF0BC38DFC3C689A2E5FD5ECDC5CAD234BC9C6C4C5C99B171F2303126831A655C52B2E3C5244D1C32296621E35561B9A8F26F1BFA85AA6A71FD39C5C94D473D3267931A29F2133321679A2DF20F4E5944824923A441B1D8AD2A8AA51503B39BCB7BDB37265B58CD9D2A4925E7E4CA90FBCE12924953AF3AE3AA24EC92A5A892493B27C6AF067CC8716208F25D6D2E25E2B4256529590F146D49490144A7B12767F63E1785E3D0EC8448B2B2D62558D52365458D42055F582ED50A0051400A1428578E96789DE4C7C6323B484B2312EC5896F418D92C4926F9B3CDF3E7A7ABCBAE5D758F7984E0DB1AD7D28931F96701520B8952D0A4D8E5102A6734B4A56825A955D324C4752929DB4F2D208DF8B636738163198E48D61D7F5E999499327A2636484C88929B69C547B4AC7FA5461D9455125A7C25C6D685391E4B2FC675D65C5E1784FF00F8948D24D4B4D1222386D04AB0750C194653D2B0606D46E6A06C0DCDC726D8AFA272490C19AD148F13265B488D1BB21470894EA5482AE36AD30A236AF3C0E8572F1CACADB9722C542D286272E2A16A282EFA4978A06D496D23A801B1D2948DFF00A75A00ECF1A71CE29C4F4D46314803F34B281124CBC8AD3D29F7A4CC65A5BAD4692596A35733A714DF4D6C488A751AFA85BCB1D7E1785E3CF8ED0C4C47D7F30BE2E3B185E631168636F48AC80031DA9D840E015A20703A6EBEA1E564C7A3E9C23C89D04C882609348A2505109128561EA027921EECF3D4B284FF00F4EE1F9064B11A6A4D9D4D15BDAC75CF0E3EDB9261C17E5349901B719756CA9C6D21C4B6EB4B2927A1C428850A44F9A3F379CFBE68F9327C9E57CE674CAE813E6B3478C53972AF16C722A5D7102352537AD2588CA53694B6FD83EA936F3529499F6329494A82F0BC3FBFC35E1E24B9DDC3972E2E349978B8F823172648227C8C612C8E25104CCA64844800127A6CBBC001AC0E930FAA93CEB8FA540B34AB04F2E47AF0AC8E229B622B27AB182124D8795DEADB4F228F4D5C1AD874F4D616719AF5A627EC4BB2D6E3FD2129F7482A4E8A8AD455EE09D10078E7C41CE7CC38165E8B4E3BE48CBF8EAC11350832F06BB9B8E3CF210B3D2894A82EA3EADA3B214C4A0F4758252A6882415E17872B56C5C5CBD37131B2B1B1F271A689C4B8F910C7341282ED6248A4568DC1A17B94DD0FC74BFE9334D165E5CF14D2C73472A6C992474952A35AD92290EBFE447464F1FF00C683CEEE0B53131C7EFF0000CE1511A42917F9AE1A64640F36B6D094B32A4E396F8D41921AE82A4C87AB9535D538B54994F9E8E85E1785E13DEE1ED9EDB875DD5A287B7F448A28F50C948E38F4AC048D1166002A22E385550380AA0003803ADE749D6356934CC079354D45DDF1206677CDC9666631A92CCCD292493C924927AFFFD9),
 (22,'scheike','thomas','Thomas S.',0,NULL),
 (23,'marder','patrick','Patrick M.',0,NULL),
 (24,'dehm','alexander','Alexander D.',0,NULL),
 (25,'wolf','martin','Tha Man',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E00000105010101010100000000000000000900050607080A0402030BFFC40035100002020201030303020503030500000001020304050611071213000821142231091516233241612451710A4281173391A1B2FFC4001D010001040301010000000000000000000006030405070208090100FFC400361100020201030302050204040700000000010203110405122100063113410714225161327108162352426281A115337291B1B2C1FFDA000C03010002110311003F00E64FA3D8ADF71D5E2D82A7ED1B645B5CF6626C6E4B3595A58C77A72866B993B156F62A2782200C895A7CC50651E0951559A32C4A70BED2D7674C7EC7A267F15D3F47AEFF00BBE3635D9B6216A29622B2DFC0DCB597DC6692ADEBB2BAA549F33757172431D98D52B218962189F6D9AE6B5A1AE4F61C24B1E67F6FC6C393CAEA1049069DAF63E779CE46DE4D2C436A5C8D9929785ECE4E1AAD7B1814245F5113318E7DA564715A254C661F4EDAEA66B0392C8C72EBF1E1F336F2F6E60F04896E9D9CA52BF6668B193A77C8F15DC7D2C9471C4B29923F2323EA07C43EF19F2B267CBED1D4FE5F2E377C438EFA5646662EA2A76A90BB267C72F0C4AB2C33FA4A8E3D46DCE142F509201081EB43B924A363687420D0A60A0FE36873B830068D01EAD734BD7756D4DB5BCF6B996D42DC3B658A142DEC3B5652E59D9C5F221AD98C76571F89B988C3E612D24F356C6E463C48B10D9486766916176B7B19D6DD627C25FD4B36D5A95EA198B589CE61F3D3178FEA2947DA6E51AF2A420C5253921B2ED66492C58794B35968D95573D6E9D5D5C7DACDE36D5EFDF7175DB24945EA58B17DA8B57AE2586698CD66FC9251AF34D1B587B115BC8AD6011678A52862C1DD55DDF09F5B8DBB316D9524B30CB3482374C84F24B2896DD69864ACDB5C9431C1E0A914B6A94424852589D2505081BC5ECFD43BD4C30EB4F263C99302CB14B8CD95246B95B054CF1C92831C92E348F1CAA6558E6B508AC91952809C2B540146E14E688F3445D0165771A34030E68F3D18CC6F51E1D7E7C3E5F4CBBAD498EB52A7D251C8F9971F61ADCF1E381B396C05AB999A1767F2B1A2F3D09A862E328B7FCB2C8BEAD5C8D0ABB6E2B604B589C663360B78CB9F5F5B71CAD4B740656D4304F416FE4201570B6C3A468D139811679BF98ED0896DB3E1AF6AB9187A9498AC5E3F278DC35DA586367110CB5E2C79C6982E278F1B1CC1552ED8BCEA9DED3575AB0A346AFCC51AC5E8E8F46BDB96A5BB69162A6F394A9B134745D6DCB03C74AF636D508E792ADEA193FA5649E5AB6657256B96858C2B4A430ABC6185DBE16EBB26BB9D3CE62872B165159B913491411E234ED3C3188217559840218A57488AD3A85130014923D1F4BD4B550C21C7B422BD57A5895CEDF0C558DFD366B76DFB79EB9CEEA6EF2FA26CF9BDC74AD635FDA65B5161F55DC7358959EBE1B2F9AAED5A5BCD8FFE18BB4EADDB9150AEB4F1D8ACC7D46A96A67B56CD0B251268FF0038FDD3361EFC187D1B5E870B6F63C0A53B5849A38618B279ABB114A14F278EAD704776282330A3AC1055A62C191042ABD86330D97D7BA3BAB6DFBC6874F56D2765CB64D9AE633E9F178A82C66EC56A0649A1B314200B8F6961F9863911A798BC05014584677D1FD9EFB3EEB46CD7686E0766D376DBBC498597508ABD68B093C48FFB7D4D7F0F0D5AB41A36B6AEB691A49CC4A3B60ED65454BC3F93FB6758C0C1875B393A8BC108273268E468726448D15639E0865907A514C81A2651688140259114C864767EAAAF1049E3799CDD11B0AECE5ADCFD041364AF93BFCD50E84975D7A6BABE2733A2AEE2379D0313D42A35CEDB83FD8ECC69A1E6DD9254B75AA6C76E4FDDAAE47BDED43406C742AD7494A452F8E25E23DD33E88EA58ECAEF9AEECD8FCAE77A6F97C4D69756EA461B090ADBA190AD9466A2F6F2E31D913828F2B1C53E332B8AA95ED35B89BC9137744262597DCDF4DE9687E4D3F725A792BCD4E3C563F60C8E268F912B77AC78AABB5E3F238D35ED4378471D20D4E45F0349118EDCA9272A39335D31EAEE2B19ACEBF91E9A6DD8CC524B7FF65C8493E1DE1AAC6C9BF523B70DAB71DCC7C362BA34D1DFB10D491AA431FD2A1EF60D15A1EBD9F3E86748CBC96D166C79A6C365F5B1E31EA264BE662E763CF208A79E6C38F1A38191DA579E06633C7EA13629910498B34D03A6D31B53A853C302A39E281BE68120B1A0072046F5CD224C1D1A39EE9E63ACA0E9D6F5472999BD9ACB622A4F6628EEABDF9862E48FBEBC2B5A18BE8ACCB23D2819AC47359927711C4CDD57EB3E1B77DB6BCD16174FC8D54A3362A1CB4F054BD0E24E4EF3DCC5AD5CBDFC7D0C8B7866B164E42A411CB4392EEB1CEB146E5FB25D50D5F5CCB65F5D9F2F96CF59C9D3CDEB37EE50CB2D838AB791C67D252CA4387B93494ECCF56D2475A9C4B5B19E49666BA971E4585062EBBADD8E9E67E8CFB0DFC7DBA72496AAAD2C85F98C950CB0C7D97EFD5A10CF257A9DD6E39F8885B693E9E40A8CA01731ED9EDD8756D5A2D6B58DE72B12394E8D2C9EB24B971E7027319ADA3326C923DC008A358926500014A528D4BB9B6AA2A45F872380D7E40DA2CA8DD44DD78E88EE8B928317ADD4C4EC6D8B95F193DEA9886C865A864645C21B9358AAB04D5F1F0CB1D6362C5B78E2BD5AADB66692C080539EA4922F43A6B85C9C2965F6FD617E658D3F24948E6902B126389F8707BA312A09042630C14011A2F4772F6F2492BB9C88D0B39628A240AA4952400AFB40BBE070391EFD3A05D78502878B8C1F75F7209F61E7FF0086FA3CA9D4ED4E0DCCE2E56C58D8B92D8FC41B976F477A9DA8255AF8C9318E91D0BDFB8F8A4452B1C6D0468A8CD2F793E87DFB9BDF355D1B7383F67D0F60D05E68ADCF9EC543625C7D1B8322F5AA0929C3144F4238D9AA77D98E197CA91B18C3825DD370E1BA3DD38E8EE62C6ED84D9AD6CFB942628A5972F645CC455C7CED15A6AC3279E8E95217A8C0E164AF4ACDAB31CB088E284BCA249294F76F73A73B2EA55F3BB2E6B01AF65B61C2472EBF1E3352C4DFA5565FDC456B36206C8C90DC7B33F92CD87BB572A6532C21E186B73F3AA3A04BA4E1F70E0A61E4EA7AA6264C7F2DA8088CA9009993D2B581527597D212AB5850C4EE915C015D799323189A37923F557FA9E9FD246DB504866AFA80E0EDFD4DC11547A0E193CB4198D8F396936365C6CD14D731AED69EAC32C962346101856BCE145763CCCB2CA2369557B679380DE9B75BC2E5769CDE2701473554F932339B302D8965A94AA0AF059B3927B2F23C71B313243224A7959830F94624585BB74A5CE9F7B65D764C564B11108EDDCCD6459B52CDDA30BBC0B81C4E1E4C865EA34C615193B33CD3FF00A80A78913915CD4181CFFF0009EB365A048BF7CCC92CD690F74BFB7F3CC15DA45ED041750F3965553C2A3060AC9EB6BB426C1CD824974F78A51885310C46355686789136FAA842C88541A64650C472A1415EBED3E18E6997D4204495EA8A524AAF202907CB5151575E48E2BA26FAFF00596A6068C3AF56B10C70E38289AEAC75F1D3DC955228E4BB6A64F1CAB1C8CABE308864B0DF6A32A0E0DEFD42F7DF9BE9E74CD31BA2D9C962760CA5048B21B4E3AC54A171E062162813210D98327761059C4D4A716840AE5C88C11DC177498F3FBE64130F8F9A7B13CF691E7B4C4B471282792BF72A7C127B4FCB11F71E07E37B6AFEDC62BF4E9479FC9DBC9CB57F9B0A59669AAC321501A38E17600273C77F3DBC900120200B96576BE3E648832655689DC34E85A9A745018AB01C18C90B68C02D581C1205A9A5EA138C678F062108281627500AA10403C6DFD544DB0240F71EFD41F58EBA6FFBC6DF4733772B77F78692010D9696CB5833B38F1CCF222B489DECCAC651C127B7852CCA3D1DEF693D3CDBB235B0BB3754FA53B250C4CD7E0835DEAF602C2D8C252C94B32C90419E6C62457E2C7D966358AD8969580F322D694CC560616D77DB941730F04781C857C665A8C71BB588625A665589BBA3AB318115A40863022980774E4966278E362F40BDF56D1D07D3F67E8DF5C35CD673FABDC7FA8D6B6886B5DC5E4B19386685B0974D65930D6EA4B0324C96A5C2C5344ACAC6EC4D182F13AD4474BC673A7E16EA5310480AFAB145B82EE5868FAD195259D05B5722B9209F4C8595CB6748CDC6F591C11193FA995C937193B5689005EDF6A1D1AFEACF4EFA69BD74DF347A9FA962F2B94C6DA9E022B0AB9B5A961A349B1D3C96EEE0E14305FAC44D528E5EBF6F2ACAD0790A5993959F71BD4CDDF48CE65FA3D8BC851B7AAE51B2E942ABD0AA1AE62F152F9B1115FAD5BB6FE0A4852CCB4531F532156378104966178DD1188C74FF00DC788FA8BB32685B1E668697B8509728FAA6472EB7F03F558B64BCB163ACD92EAD54C6D723AF47270D9B55A475AF5E699670C839BDDC6A11F51FA8967AA9D3BC6E2A3534B2557696BB975C3E2F03671B0C6EF72285E7A82736AABC7356A51453A589FC8A952008A0832695A6666A38D95AE2E395C585B26133A958926D8044ECF2143148AC0AB07DE64A08BC841D08F7D6958F2618D5719514C7204CA08402E090BBE46534C439FAACDED65F047587B21D43A70E73337F62D5F1986B8816B61F1342D66E9AD29E64AD254963BD1E467CA388DE0595231684B0CAE08B6D0C8625CB7B166B2F9BBD35DCB5FB7725815CB4B6E79A6748D0F6C70C925AED90950553B8B3332A8E011C133037A5FE26C85BC8E56BE56343651AF636C79E2C84CEBD9F5104D92A8259E3E7B92560892B70E6171FDDA63C4D5CDC13429E0C3431595B395B97DD8D782B4AC91C12C112BB48F3485D9648225766508C3B144856E5C2861C1759D94B6E82155958C8EB0A3DB32C61C9750C4D9AB690945201017AAC2340AC091EC849BB50A3820022EFEC0124920D835D3061EFE25A92F972AF4A459240F0B528A75EEE412D1C8E49F19E7851F8055B8007C7A5EBC4996FA30D4E1B33D78EB3C90AA56486585BB5DBF98B2323B481C9E43163CAF6FE07C05EA70A48C4958C6D26D4955B2A76D13F41F2093E4FFB1E9E6F61C057AF6E078FA48F2A78F1EE7C1FF5313D77EB0ED3258B3A6D09AF350A32E532AB04F938E5AD95AC6DB76D9A7356A355ABCB0579144F66C989E79834A1842E90FACD7A468FB475AD36636F6A92862751A50CEB80CE5A7C8DEB78DB724B3D96C2D5BF9000F8D43A575C555B11C975E2322448CD39CCDBCEED9DB19296BE5ED5B92DA19E8DAB06F2598252F2A92127AB625AB2AA9452AB1CB2447E3F241630EC6EE1B261320D770796BD5E5FA34AB62D559666956942542A991E3EC015800A14F628E0201F96A8F44EC29B48D11E1D224D3F035678E291339711648CE42BA19E511BEF5065857D143B43477C060028874C77FAD8AA2B91C163C36D2028BE7C015F607C8A35D687EB0EBD7BA75B8DCD535ECAE5E4C25BC7D1C954C76528F12B559A14921494D4A75B1DCCD11668E4A719AFD8CCAF6247EE98D25BA89E3B93D715D683D682BC42A40398EBB495A32F0C7C3487B6272EBF0E41E7E3ED3EB40EC3BC691D51E94EAC9B6E7A4ABB96B93DAC7578E1CCE49659EAC5207AF63258F7C40A90B5A42F02354C9DB902AA318610CD17AA6B63D6368CB559F70831B2B624598ABDA9D666988721A20F324ACB6DD49421A610F8C30E1DBE0F05FDBC26C682383355867400E364CD2AAA3664A8E8B1CDEA208E399A68C02095122B6E56009E65B4B81E4699238E591A38CBCBB149611A905DD8A82362DADB1FD37E45DF5AB3D99602AD9C5642ECB1235E368B190AA8F1C5CAAAA16E010588E5C8661F800F1D9C11DC6D815C98E1819DC7FDD184ED04A8E473FF0092581E0161F2091F3973DB7EAF5B56E94E2AF9A92496B38ED6E66AF11F3BC7DED1C11A31F9ED0109323768527B81F8F4EFB0F5FAAEA368E3E16D6E497CCD13567CC29BB5C2B0043C704563BA540A3B9494E1C9EF2380A65733271E2C961333FAE6FD38506E91D5428BFA47D209DC390370E6C79EACFD2DBE5F071F715036A991E81DBEA51AB26C12A41BBAF1438EB62E266BD54AD8155886E4FF00323250F782083CA94EFF00EA6009FF00623E47C561D54D36DECF88BB10C42DB36A4591D1A172481DD1349110CACACA1F95ED7ED1DAD1B215E3D336AFD55CD64B0A7255941AA04561A282C79E26540C44EA3E54B2A162CC41FB58FC0048F5EFE9A7B99D7EDEFD88D672BE45A591C9C142E6567ACF3E3B190CF32C4F72F08639275AD0825E4315795950376F7B73E9B2CBA4E63C2725E5C75FABFAACAC3D31132EE70E010AAA40DD77E39E7C4CE4CEF1C4C91B173385558CB28F50DFD23DEC30045D1A27F16709E6F13B8741B1B8BD8664CAE32B64F24B4AB641A1FF004F076772DC4B55CF64F3F6C6163E56320A19006327DCAD1D69DB34FDCFA6DAB58B5B1AA652EEC576CE521C7D2BB3D7B1056C6435FEA15ACD1A260B61A58A2AC5ACB0E18F26201D98EAFEB9FD36E8DEB7D09F6716BA4391A799D7B60C2EF76ADEC34042B26472F48EA935F79648D627922F2E6669A9259F1CD56B9F014431BF1CC2F51E09E8EB3AE62238024104B632E9764B4818C77EBC71C510844924A8D2354F2B095157B8C611477125863C7A6EA5911E5E1C876FCF64411CCC91DCF1639A470186D21A848A2998020800961D0AF72CB2E04795A5C8408E587159459212790412B84BDBCAD3004D022BC823AAD72CF01BB5D29ABFED98F410549E6044C636770EB6407922EF90B97630F729571DCDC8E7D31E4B216A78CD1A7CCEBDDDD1C101EE550ADDCDDA887E4A90C4970794208278E03558B2FC98ED192551233031484348AC39421B964201219871C7E4F238E3D79E8D3BF66713D098C0D11E1E712F608031E04866525F8018277203C39F90796E0C12245037907600433D15636698B7F716E4D556EE38A1D012C7E19C860B55F9343F6BF63F4F37C78E90BDD9DCB2171277377F785EE2DCFC9E39F8F9FEC7E79E79F4BD3A4CF4283F8239CDB2479249CAC6DDD2B921F86784B32FDA0824FC03DBF907D2F4B0704020351A22AC7F6F81B457BD71EC3ACC18CD1AFF00D87F6FB6CFF6E7C7F9B979CFE5A0BB24559EAF885799952015928BC008456490C51A4CF32B273334A79697BFE49279639F213D15F24324B5A64ED8BB012D14A8A43779FC28041562A4382413CF3F1EBEB605C8B5A59E785E3B1DF324DD93C727F3A19424CEF029568FB5CF05997866FE87720F31EB3638241248657241621086E4BF018B768E40E4FC061FEE07C35861023451F52D125436E00DAB120D72091E6B9A1CD03582ADA81C11E4DD3726B8E478AFC5FB58F3D492FED195CE474EA586808ADCC8BE082BD4666202F92631247E67011477CECD205E472412015AE806B316CDD29D57117694763F89F1B671766F4A1BC10434A7C95A98A342CA86FCCDE4F0973C1F0BF707E3D07CAF2767F31508704B8665E5072403DA0FE78E380548E07C76F1C1F4413DAEFBA4C774E75EB3A76DF26421C657CB417F1591C7D386F18D6D49C5DA562BC96219960691DECC5620F29469675283B9416FA8448B8C02C6C563952554883962E1BD82067DA77530500D71416E8BFB373B1B4FD4321720C50C59BA7CD8BEA4A42448ECF14A1642D402BFA450126B732A9E8B5A6875696BB8ED669C2AB8EA38FAF5FB54F8CBC51C6A87E22642439E5A40A4F3C91C91C0F546E73A5789113D03163E0A292B39AED0C50052E797625507686F9E4823B87DADC8E48D81159AF3E26AE42A48B2C562924D567424ACB04F019E26047E4152ACA392382BCF04F3EB2167B372ED598B3CDBA30491493474F1FF00590457641148D134F2D779524903B21EC0A8E8A4953F7B7C07E3F7345919CD01C089B2D9AE59E76D91A14228B1B055C03C251A2493E090711634271D394520A85555B665A502A811542D6B83640E76F57C7B56E8166FA8DBAC3D36D07109B164F358FCA8AB8A4B7468C52410519649D62B17ECD1A892044090F9264324A563406565E73BE4BD93DAC1F5333385B58B9DF334B3F6F1B3D0362ED2CE6372B0DA92B4B42415ACA15B95AC030CB5D94BACC9DAA08E39B57A69D6EEA7746B64C66C9A78386DA309622B584CC6261301478B8611DAF2BDA82C5794F6F9A26816295418DA2656E4BF753BDC57553A8FD5BFFD71DA66C7D3DC7315F129B064759C5C782AF6EFE26AC5523CD4F4E063149959A3891AEDDE03DA71E4603BBB7D4DFF0031C2B188E5D143E262467D6C81930C4F248F25BAC2A8E4CB1B021B8560086DC412075F64E0E0C8B881F258648936EC689846B155AB6E283D39030A3FE2B208A03ADC5EEC3D89753FA69FA79F4D20EA767EDDDCDEA1D7BC0EC5AF6BB9FA71BDCC2E97BA69B99A39FC1CB90919E4C91C8E430FAFBC94457816AD9A3CC8F3CB3C920E5BBDCCBEAF73DC3EF6FAC6271DAFE15B235AC3EB95164A981C2E466C452B5B16331F119BBAB62EAE7A5C9D7C7D257EDA95A382941DB1468A3B57E93FBB3D5BAA1EDDB13ABFBC8B09B274CF0F97CE66EDEC794DA70FAE0C262347C5E1B65A593CA7EE33C390D87E932C615A582C2B1B795B9E1A16629A84D6EBCFC32F5AF6AA9BFF005537FDEF5FC5BE3F09B9EF7B66C188C7490A466A51CB67EDDFA94223181138AD56DC30809FFB7DA3B881C7A8AEDACC1A86A79D2A85C6854E53C5878CA06262A64FC8888B51DAD3B982768CF0C104AC4AEFAEB2F884DA4C1DB3A7E3E3E2C4D9F9FAA459273E43BB306269D85362B431BB36E5C7925C88CCCB4374B14443305B5AF053AD75E37696586B07720468AA1DB903C31B4853B4C9C001FB98AF7166FC7A6D4A96B1F279621256859F9EDF21939ED6EE1DDD8E5988E47CA81C91CFC707D49EBCC5A9BC2D09758A5081560924549C07665055FB9785EE62CE386753C769047A6CAC2CD8730BB09A1EDF0A3377730777C7776282C1938ED2587F60A78ED1C1AA920B03CA8DB61AB95E083FF51279BBA1FA7DBAA4C3B0BBAD9E02923C022ABC58E479F1EDC8AEBC7208267324ABDB21E3BF8262EE6E01EE281805279F9E071CFF009E7D2F5F12E3ED349214042F7B01C01C30525430FBB9F9503F3E97A545002A50050A1BD471C7B6EE3C7FA71F6E731543FA807E2FC7E3C8FBD781FB75E762208A5A4664115B65679BC66593BE306458CB30F3AF0E40ED465525803DCABC8FCEDD7C78AFDE979E4B913222C09552580A9047925B4F28208E402823E5BB5B83C9F5E5EF32D88C49DC881B922200BAFC9EE0BDDF6F781C03DC40FB8AF6FDA3D4E694156BE3D9444A94A7E2464B90C33D899947059E400F8E32C48431317E7920703D252388B6962416604801486F02B904F200002D9E051068F5E3B18C0356588E07038A06C9068EDF000038FF00B32D1B3DFF00494EEE061B2B542D957AF1C904B76A443C92472F63A978DD03309C76BA8FBBB880009EEBFAFDACA46DB0613033FD39CC51A50413D48B234EACCEFE48D2D4969E20E1954FDB2C52A32A1124BCA9259E67AF05355A42CC76198AC6AAE4B44B2467B963707C9E29179E4152386239E0702E2F6FBA46D9BAEFBAB61A957CC361AA67F1B773012598632B51AD6127B6D6D0B78CB490A98E324177EE31AF729202322CACA64829151B7CA5CC86310A90F3B100820855144B10BEE42F27C8DDB21E38D014792548D41B25B7B85036F144DD7375E7C75D03EA944D7D1B0556548DE4A386C7579562511A2490D3823902C6A7B5114A9EC4FC2F3C02403EB31E67A6B4EF6CD632B8CBD26BFB256B3625C566E9C70BCA914A4B4F46CC5345243629D85ED32433C722870AF185917BD74B63B2A71F24942407E9A62562FE908838E386E4F0002078F81C700FC0FCFA876CB8449A769223E376E194C6CCA47039EE89C10082A7827EE23E559B8E09A3B4BD40636B79873248634CDF58A3CD6719C48E5A9BCD12A4AB024F01BF736EB37C9B430BA968D5818EAC2B10A06D2D66D8D7D3F91F7EAB93B3EDF1576C4E5313D25CDDA5827AD1E42C6B3769DD93C95A2AB1CF612A66AAC0D34622571E14AAAD2B160919E41859E98C92ED58ED8B2B3D6B198C9882ABD5C4C12D2C362B1B1290F157A4D6EE82F210679A596CD8918921582803D4FD35F0F6A399BC96A50C02AF0C4861F040E4B72473C9247CF27FE7D6A9D6FDADFB9DDD3A5BB17533A1FD03EA3F5766C57762B1FF00C21A8657698A8E76DD37969CF728E2E1B176CD6A855677AF5209BC8CD04763E9E198CEA533CDA7C7873B623E99939B90860863C433CD3B4ADC858A3776455E4349205411A0662C1371E98EA39F04244AA9244AACB2316964900DB4C420695B6B5862142AD920035C741BFDF6752ADE6375D4FA45AFE5F231E1347C2A54CAE26A5CB3162F25B3E5EF9CB5B6B55A09BC172D63AA0C5631BEA6BBBC16694D1C4C086070DEC7AF6C11E0694F7F5EB18CC75FB97061AFCB1B415E5963300BF5A19594F9B868D3B95D8F8DB9E0A90C3D105C17E9EBEF8F7CEB94DD33ABEDA7AD590EB7E565CB66321AF66741CFE133415EECB16633D9A1B451C654C56221B960A4FB0E5AE55C2C1626862FAF124B02C963FB97FD28BF510F6FBA454CF75B7DB375675DD5306CB3C3B1E3A963B74D4F0F525532597CEE7743C8ECF8EC2B48C23F1CB98BD4918A88D544800698D25E2D31703020930659936CBA8D4804FEA64338F582466D94E45428662A7D20EAA4B28535AEA19D97A865B6430728D210A18B6D85392A8A7F4003E9240ABDC5C826FA1054A85CC5D8568E4132B46F032710CA122997B65FB1A394060090B228EE46219595803EBC97FC35DDE3A512C61E62C583B890A92418C06058273CB73C93DC3993E3EDF56966B45CD432A353C6DBA9241D8660ED2492B4A503391204511F27F08FDF2773FE54FC08CD8C1DDAD3192E529E07890B06EC0A1980FBBB4CABFDC02C141E5DB8E38F8E0DA28A79A25CC30C8627001708DE99653FE26E5085BA14C6AC822FC360A4FD4459001AF06E89A2371E7DC003EF62EBA61F2CA40FA6A73B43C7D8780EDC125BB64605433AF3DBC855FB42FDA0F3E97A914356F9407E892507FA18340BF6703B0105FF003DBC13C7C027B47C0E02F4818F9FF964F3E4126F95FB7EE7C7B9AFB7587A6A79205F17C9FF002FFBF9E3F3F9EA25475BB3622B2A2ACB2D90D198268D240C9C160411FD253B58060519B905791F8247FD91FE96BEF5BDF3EC38BC4744BA3DB466352B77EAD0CBF5433F46DE03A51ABC7258486DDFCC6E976A8C75918A8CC962CE2706731B14B1248B4B0B7271E13FD1F3A01FA147E96BEDA6BD5C963FDB8EB9D46CE63D23926DB7AE97E7EA54EEF5C2BFD5CB81CE78F42A732B2794CB8FD4E805627B7B57E3D5A1EE3FDEB74FBA438A4E9C7446DE04E5B178F14A05D731D41359D729D78843050C5D78215C4B3C112845AF5A17A756350854C83B23A97BFF00E2DE91D99A3BE7CC527CE79618B134981A1CBD5F2249ED55B1F0967850471ED324D90F3FA114618C8E38073CB687071DF2751CB8B171D05B3B105B8DA3645BF682EC6F6A857E49BA04F5C6D7587F430F6BDEC32DA5CF72DEE42FFB93DD2F63695BC27443A43823D37AAD7441C5B7DE37CC9E736DCC63756AF711E1863C2E3307B166204FE43633B9DA0A0E962F035AC470EB5A86B5A26B74898B0BAC6AB466A58AC6560C556233DD9EEE572B648F9B195CCE4B2395BAE2496E5C96423D173EACE130FD743949773BD357DADAE5F9B0FB937DF2259B52349F47974E3B6CE35E52430550D1231303C6EB19616FBFEA7B474B738709B961A7C73CDE4FDBF2088D36272F101C89F119145305A4E3EE68D5C5AAEBC0B10C5EA03E1C7C567F881A34987AA4FF00F09EEF681C4FDBE1E38711F15812B269120111D4A368CA8C99E55F9A8E5B578A28F682E7B33BF3B675C71A662E3C181A861CA57D39CA3CF9FB4923262C8655690050AC204086136195AC3963B95A6964478D58847F192849E180FF00B91B92006FC0E09F8E391CF26495EB24D5A38AC223954E1965E0F737C10DCF00F0383C13C1FF006E48E7D47F197219E22FDC3805995C31F9FC0E7F038E393F03E396FCF3E9FB1EF2BCEE7BFEC2476B93F203F20055E491F008627B47C7E473F0DF5BC16F967C3931D8CB1F247890037651F7001800C6FC5573CDF56AC93C7918E8587E91C11C8E6B6B5F245D8DD440E38B3D5C5D30C56BEF91FE76BF52EFD3712335A8164804A0772828EAD1C9CB153DC7BBFB866FC83DB37E9D1D3CC574D3DB46B98BA6D0BE473337F14666CC28B1A4F6F2D471EE9E348C044821823486045002227F907D71D9D01D7AEEFDB76B7A3E069BD8B999C956AF3BD58CCB627E2453276A21705563EF6200F9ED24124007B7AF6E9A6E5347E9B6371F95A9263E7FA1A156BE35CF26A63F1F462AB53BD7E4A4D2A21695492DC84247CF1EA3FB0626D135A4C84D3F2424A998D959B946497D28D71251090CC4A426670E91C4A4B3890163B49A86D4218069D9249DAE7231C405AF7485490CAA1BCA04B762380C101F22ED192F19E7D971367C525B82B4C687680B3CB564AE25F089070E58165240239FB49FE9F8F2CFBB62E8C542B64A58A2FA9C556B2C960AF6BA4C8D1BC6636FEAEEED9030208E0303CF07D43BA9D0CF8EA94777C7D96ACB59EAD0CCCD1B1EF8219A7FA4A99051FD2C2ACF3AC37158769A92F7C9FCBAECAF933DD463B3D6353D0F7DC2C8CD3E162C9E3B3690CFE1F2D497C5277F6F2A244866AF3301F3D8260DC00091AF5DDFF17FBFFB07B83BAF48C5661A96978316BDA1EB3932459D89DC9F0FFB87BAD72F4099E524649CCD11F5BC8D0F2C484A9870E228F6B2B389EA590B8B872E52402568111A483F48DCBB21908A20806BD4E38FD5C9E3AD076FA15ED27AA37AD64367F6FF00D09DB723059FDB26C86C9D28D073571FEA2A4778466D64B036AC18A58A6EF6467ED2C1D8AF2493917AEFFA24FE98DEE3715623CD7B67D2F46CA598DFE9769E8BF93A6592A13383C598686B0D06A776552CCC899BD6F2B5CF24340C0B03ECE90E77338DD622B56EE4EF6A5CAE22E48F24B2167362BE4AB221627B988458224079E55153F000F587F09FA936EBA3115BE8DF27122763ABCE5514F03800B9662DCF041209E791C91F9BB7F864FE25B5DF893A7F7161EAD86B8F97DAF2602CB97A54A71F1F323D464D442BFC9DAC4851B024F506E6126FDCD64F39E870C5AE26408E54C59A08F1E431CA0B44E720B8A575B20A98CF2435F1641E3A1CBD56FF00A42F1B90DD32577A3BEEE22C3E89602498CC4F513A64B98DA31CE5E5F255B798D6B3D84C4E56344F118AEC384C3BBF73C6F457C426997A25F17EAEFBEC2191F57A27EF62A4DB67FB0F1DBF2D5C11FF0003903FB31F4BD6D22FC4081955BE4A26B00EE6D374F2CDFA7EA242D127824FE0FE7A9AFE51C926FD7C1366EDA596C9B5E4DC47DEBDCF83D317BA1F751D68CBED5B0EB7FC4C31786A76EEE32B53C3C0D4563AA7BA197991669259269E31D924D2BC922A97485A2476523896FDBB99491ECCF24B23798B48EC59DB956FEA66249F900F27E791F24F2795E97AE4FE8334D99853E7E64D2E5E7CF2CEB366E4C8F3E5CCA8AC104B932979A40A3850EE428E050EB537BEB2B266D532D26C89E548E4FA1249A4754E5C7D0ACC42F000E00F03EDD46BB8F6E413E0A84F20040FEA0CBC1FC7F81F1FE01FCF3CF8E8D4C76E863D1B6EC5E3B64D5F2EAC2C62F2F5FEA63AF221262B3425EF49E85A84F2D0D8AD2472C2C4B46CA78217A5EA4F58965C7D2D32B1E5920CAC63872E3E4C2ED16463C8A536C90CC856489C50A78D9587B1E8363668C8963664962C8578E4425648DC052191D699181E4329047B1E86AF57F43C2F4D7AA9B169DADCB92FD9B1B2576A83216D6DDA8D2C45E7F0B5810C3E48E2621226911A631802596562CEDF5808239232CC0963128E79E3FB337C00381C95F9E07E09FF007F4BD2F5D03D39DF2FB43B732B2D9B2B2A6D22079B27218CD912B9C3425E49A42D248C4924B331249249B3D6EFF6B4B2CBA2614924924923E1C2CCEEECEECDB13EA666258B7E4927F3D19BFD1C75BC3DDF737AFDEB94E3B53D3C766A7ADE70B2C714CB5DE3595519485750C4861C10C4B020FAEBFF00B8C8BCB1E4F7303FF1C2FF00F1F9FEDC7A5E97A671B32B3C4ACCB198D18C60909BB6C62F603B6E891757448F7E9CEB849F93B27885EB9F173480D7DAC2A835E428FB0EAA9EA0C096FA5DBFD598B98A1C6E70C7DADC32F8A19ACA70783C712A29F803E071FE7D670EB1BB37B7BC8484F2C994C4C4A7FB84B5728C56141FC812248EAC01F90EC0FC1F4BD2F5CF9F8CE01D7F40240B6F821991B1A16C907734A6043F7484A21894F119442806D142DA98071752B00DE14F77FB5FFE79FDF9EAB0D4218C6AF5C81F89F5961FE0FEF089CFFE164603FE7D7345D49C85AA56CC5049DAB25F9A362472C55493F9040E4FE18F1F3F1C71C0E17A5E93FE0A1994FC510ACCA0C1DB1614900DEABDC2A6C0346D495E7D891E0F4BF6073979B7CFF430873CF1EBE6F1D47EB70F0A338EE623E4F730FF00F2C3FF00BE4FF9F4BD2F4BD740A124451D13FA47BF56A2804024024D592012794F24FEE7AFFFD9),
 (26,'benzler','claus','Tha Diva',0,NULL),
 (27,'schibilski','marco','Marco S.',0,NULL),
 (28,'hahn','frederic','Fraggy',0,NULL),
 (29,'organzidis','thomas','Orgi',0,NULL),
 (30,'weller','oliver','Oli W.',0,NULL),
 (31,'hahn','oliver','H&uuml;hny',0,NULL),
 (32,'he&szlig;','stefan','Theo',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001F000000060301010100000000000000000000060708090A03040502010BFFC400371000020202010303030303020407010000010203040511120607210013310814220932411523614251162452711718333444628291FFC4001C0100010403010000000000000000000000070203040801050600FFC4003311000202010303030205030305000000000102031104051221003141132251060714233261711581913442A1435363C1F0FFDA000C03010002110311003F00AAD2F5961E18A306F216E7B26298CF223281A62B186D9D721C790DF250A3C9273A771B188A890416ACB723B0B5ED37F6C706525085043142C35CF4DAFE48D34E5FA8B9D4164C008C1FDE62B54A25201D93A8F16849236BE49D81AE453F11F7FF003197C2911D0B2A490416BD511E100120064C60D6CF83C75FCF9D9D182D14840A88D7036FAAA0016A4F7BBEDCF22CD903B75CB8D15BCC2E49009669E35E455A90A8CD64DF366BC1BECE9E5EE3DB70057C05F94C6E58EE360DFB811B5E20EB6800203695C6CA8DA9C12771FAC9E4792AF4E4E4CA4957962B0CC0B728F4752FE5CD2466E4579008E3915662CD3EC7D44E6DCB28A72BA30E1C8E423D83BFDC59682927634480767E0E9403ACBDFDEA09E5FEDD24F74ABB24962FA0550118B0577AF146875C9235DA96621631CD80F59F4A4207E5F8A3BA6620F20F24513E6EF9EDDF9256345039FC263DFB68991DBB05BB0596C8A147E403C7003B21D55DCA965260C7475DA48989590154755938927DC73C493A43E38F8D16E4A186DAB7746D6A5376BD12E02EFF00B51ECBEC7EC046C28058A9663F0ACA080033D1DF7EB0B12931528A52002A1A691DBC05551C9447B53BDFE40F261B276790DA9FBD3D683873C3E301F2A4C9F745BCE86F71D943A3B20BF80DAD1DA8D1C884D00634F9EE189228800B30340FF6AB15543A50D2655BDB0612F248F613CF822CB57F038E3C74EE9BA77AD6E349FD43AD23AC1B93330B6DF9306FC62E31B37966236780552472277E7A14FA1ED5F911AE75D5C2CEEC66F6DA4934A80B30E5C897034E4A05625745786C82D1FF00F173B891537BF0E070F3441889A6AEB93965AEE06E3F7160C8A9407F1D1E02300FCFECD69D6FA84EE2512D28C762DE30AC9BD669110B8401F941958F4C8402158E8E8F35700284EC90B5858F8E2D562E2C00C3C920F7F77F1B689EB0749CD1B591A088D9605628C1ABE002579DBDEEC0279F805F8E3BB395F316618F1D96EA6CA4CC596C168E382258CF02654692C87E039AB1631F18D1C8D921B6A7C9F4C786A35A39F2D62FC4FF006D5E4092DC8CB4AF6E3FB858C7B71CBFFC60549673C27DF264456F517363EA5BB8F210A65A3095E5CC0FEA4430FD9C5B9649BC0D1D9503E0FF008038377BF7DC5BAAE8F9448C38236B1BBB80C0860AF2C8FB51B200D9F0BA2490BA7152617FA0781C0EC38DC76ED1DB9A005102883C860E91AA96F6E7246BC1B55A367BF0BB07C7C7C5103DD2BB6FB05DBDA4D1C90C93272D89A3C966B130384858C138E62DBC8B319430559230DEDACAE23711BB8D65ED274006426F74F56888057EE33D5A76279AA88E415C9646E2E0F165E6400DAD712222E7EEDF702E322B672525800163AD5C127F253F8AC4FF009378D13C9813CBC313E8DD8AC8779B248B2C57B214E12838CB60414B48C815408DA14908755D11C007075B1E0054864014B3C31A29F2592CF600B6EE7C0A363F9014050D03507E0EA45EEAD4A48F4A36EEE37EDE689B09C163CF00F52A09D01DB4AA042DD4BD26ACA072097276524285043C70BA49C9543720DB008470AEAC00F519ABD3BDD799449FD7E405BC90B91A50804F9FD88481F3F3BD9FE75E87A6BD153EE2F0924D9365ACF07B97E47039E9C1A0660000D41A800390D7E3FF0027FC78BAF8E9B492A0F8DB0D03E3C01B3AD6C8046C7F209277B2436F5F1413C8F1D103F6FC68EF5B1BF3F0037CF8DF9D9F9FA49D90574478D824EF67E747607C72277FB8B6F7E35E8EBC93E3635F3BF1A075FE75C868B680FE7C7A9BD74BD7823F120282491F915F21BCF8249FF56B63F8DFC1077E94FE98C7749C15D6F66ABDECB5A955BDAA701152940C06834D39632D9E0E002D1FB11AE9B6F27C12362B1A7236E284871192AD2705F7242BFED1F828588078F26009E5E40D02E63A5FB6F9DEAD796B6070990B556B0AC90D0C4D56BD9092BEE28DA58D913DB40086E534C0219252C88EE547A62791517DCDB0772D7B68581DFC5DFC8EDC903A938D8F3643ED82269A424054542E4B13C528E0F6228DDD8E0F441A767EF6396956C5D5AD40990D5AD0451425A4284286B1188AC5B9433041EE4C481B5E04127D76A974465AC813478D96F47421FB8B5252811EAD6844849FBA915414909660A24DA03F88662422494766BF4FCEF8770E0F6B13DABEA48E3C7C73598EF65E2FB167939C6E61AB1BA468BF6EAB2FBF2C8EEB3CCAC1026961F5A19DED7F71FA3EE6528C783CBE37A822AF6703916BD8D8697155824AAD5E68A38FDAB91B47234681E0AE26747015DE3DAE94EB38864922867C76922077A7AEA48BE14BB26F20380D6C688200DA49207483E97D5238527C9C1CB485FF004B8C675166AC0256800C00008095454A8E7A62F84E8ACBE4166BB4ED4704761FEC2C446482BC901887B904762A47399A43208D5837B05641A11BAB0E2733748DEAF41326A2B52824BD1D2C97DC027DE693DB465B71BC6D1CB112ACF14C162601848C448092EAB0DD1597E938B138CBD45A1C96463B1243975ACF5AB40F1BCD2B472B2548ED3589D40581E3053DD5E47DE566F5DCC8E3BA7FADF110632952C9495AA752478FCADC969C3095BD2408ADB8E393EE9DE548DE5AFBAE54996C231092C44A1F5150C0D2B42C46E902DED5560A2E8ED6258155DC5589175E4B4BA5AED21894942B111B92097045D104D803F50E54DF71DC34CEB5EC3636CF4F750751625D2ADEC5C02FC156A08E7A77EB2D78A5992211BB32E958B433C324B1D82A554121FDB487A43B2599CE84B39ABD160A9C84010C804992752BB1CA0252380383F8996569575C845EA40F31431584C960717133A61EBE2EFD3B4D7D1A181E9CB3BC66B2ACF3495FEEA0B0825F6A3735E688C8501691C14DEDC782AD90C862E9CDA8E8CCDF6A489119609B5341C8BB003DA46304A3F20258E4FC8A80DE9EC5CDC9281418DC11BC19D9A23B2F605121B50F60380DCED6ABB53D43CEC4C750B22DA11EC9044A186F00306D9C10BB6D49DA2C8F2C6BA20E03B6389E94547C6636BDBB3C581B965639EEB36D817124A375C1503FF6FEDA8DB13FF513214B0A3562929D6B6E8013A00151B60E7F8FC54311A1F2178A830458CB0CA7ED6FAB718DC7F71BF0D8FCB8AF9E2A5C68025805D9DAFC939618F2AAEB12442CC92931C6887DC7656D84601590F83E175B0C177C40D86799A5517B331031B6DA533A0BE09602C10A073F3E09AEA12AA1202B63330041059B1E51DBDA4F606C0167B9E0DDD92A94C5CA79C95E4573AD82ACE7FDCFE45C1F927FC6878246BD0F4A9D2A73D780258E9F4B93162CF2B3C8347407B43522EC46178963B2CDC9B7C48007A8DEBA7FDB73DB9FE91273DB9E25039E3B01E3F6E95B5C788CF6E7F1B19BEDFB8F8FFEF113639960A07CEC6B5C411BD81BD9046FE0B6C83AD91F1E80DFE5B1FCEC0DEC29D907FDCF9246CF8D6987E5AD8F9C48DC9B00EC90367C0DE80F3A009274002C4F93E08DFAF43FD5BF9208208F1E083B04920851E3FC0D1D6C6CF43D6BBA3FF40E56863B29235E1FDBB3566AD1F24678D1DA29045BD0DA9F74A9420786E1B21079BA9FE97BD90E87E97ECFF6FB2F3613116EFF0052E2A1C8E4EF58AB56CCF38BB1F88A69A752ED5A38A66448796A28E570106FC51D602C922F12768DCC1463F0BA6FF2C00035BD7F2A3E57CDE17F4B2EB3B3D45D8DEDCCD25D8CD793A5F1A551D9350BC3022CB18E5F27DE493C807C727607E7D0AFEEB3E5C5A3E21C5691524CB2938425410B0B18C311E3F53004F2CABE40A337D964C59B5FCA8F2523774C41263FA95C132A090F63D80536058E47663D4F9F6E3B6D87B56861B1E6BE2F1B0942D1B16FB78D1D507B7027CA28450AB1C4AB1222808AAA00058EF07D2576BA29EDF517F4CAB6ED57AF24C6CD686256915C33B2B398C332173EE8E6CDC5C7342A40E45DC3773BA53A46B9BFD65D5D47A729C004934F6667113C6A498C398C339E614AAAA2317721157F8F5B799FAA5EDE75374FE457A6FA970B9EC38816BCB72199E1B10FBCFEDC6CD0DC5AD298D8F10CCC4F047572A136DE823890EA12E3BB478F3B3B1B334765DB8076EE5E5AECD8DA49EE09EFD592D426C2866C6493271845C038EC1765020DD914BC83ED3C0E05D920D7C3EB87B178EE9B4BBD6BD3BD3D06416848E0635C14866996306295A422491A4D0918B1954B3C6C0312DF8C49E12DE06AE3E5C6529570B696D5EC85EA5965ABF737ED9A2DA82ACF5C979B90D3D699D442B1CF2175FEDF35B4CF5B5AE9AEB4C4E5EA260E7EA7C6DD1729DB51496C62A63EE347234392B42BD09F84A1886AD66568DD4488CC40DD727BD7D8BB78EEFBD3E83E9E5B91D4CA65E0AF0E3EAAC4D6923CC306AB1C13158AA07AC6566B454048F84B2859CC844A45FA2F5C5C8826D335432419585134E24660524820037168D8D0311624964B25AF7EE1B4067EE07D34F8F958DA9E96566C6CE9961F4D537159E7281546D6B6DCDC0DB66940DA5792D3F3F596EDE7A13579EE40C25375639A2B3552490245142E8A49AAC6C17B134FEDFBB02158B833AFB8119C7616CC1D75629750CC7EFAE6191A48A6953F096A589A970050B46E15123646D31208DAEC9E36ECEDC7E90DF4FDD27DB3BB73AD2CE5FAABA9B259287056BA96BDDB38EB18C9B29027D9CB5921518F6AB55A5A95ACCF6E2B1259B3216F6E08784629A3F58588EA3EC77D4C772FB7D89CE4F0CBDBEEA6CBF4CC57AACBC56DD7AB7A6713CB0C826575B5EE7BE63956450182FCAFE241FA6FEA1D3F5F972E0C0059B1E256ACA87D349A33B41963A779027A8CA0EF457E50D0AE47DF58FD19ABFD31A6E0EA79EF1187372CC21B1652CD0642C7EAFA32065505BD3DCCAC8CD18DBB0B161C3843D20B2BC7F6B6189757D7B6EADA2081A421C31D36B408F93F96CAB0060E9FE91EA174BB6685FAD764A36A7A1620AF3C52D8A1712AD5B5257B62465686C7DA5EA72705669152CF125250CA8C2B01F517D7D858C99571B91992326BD9B75DA17824563A9648A9B415ACAF321992484ABF140EDC396F77B4FF0050D9EEDFDECD3E54DECDD1EA3C8CB97C83476A38EFC596B040B9918DEC473C534B6E20A2C47298FDC30C4CB6232BA6E85B058472918CF0BAF2061E530F5B711BB6890C6A95DCEE0B7542E8743C13FB94B491CA588B79E000C7542D8A872D757C6EAE0F040A7F4317D609B46A323943AE5108D535A04682B000E8ECF96F9FDC7D0F48D55FAC4E90584078BAA4B6C9FEE60F113379D7832A67E20FA3B1CB82EFE400A4003D30A8685C7F5029A1604B11AEDE448C3FB827B7EC01C11192495D32C9B3F9321F8F34B6783CED166B81D46EAA6FF25F240DEC9F3E3E003AD8F3B1A1E76491E078F4A9CBFD2A7437E0904FF8F3B04FE4411B277F1EBD01FB41040E44E99BE7C9D050411AD6C9D125B43C93B1E828078804023646F5E46C201B1BD1D2800B28D6C379D9F5D1750BA3774EF4566FA871F94CAD392857C7628B7DDD8BB91A74DFDEFB4B5796B415E5992CCF2495295B954410B86FB668BC48C88F60EFD3B3AAF2B9FE9CED7B623AA325D3BD29D331C980EA0B55E0BB71281E9F2B7B2724589AEDC2CD9B956EC32C4F6A64827368433495628A4956BA156C4F5DD5A3700AA3A83E0EC48A5245656D820A96461A1B53AD793EAC45FA365883A97A0BAD3A363F67EFC75F529F20F214D458CCBD2C756603902624B2B52F44DFE9213449D12BC67D6E047A2BE5C914590B8B930B2C72A131849AF1DFD41B887E64F69DA392128D92487F6CB1973FEA8C6D38CED8A3371F211A759363AB4604E862603D8E3D3E3716527DC41A0A6C793E4973FD358CC459A3733350D1971F15DB1431F8BC8DCC7CB7A59315919AA27DF58C6E45A832ADA84E6EFD549DBFB6CC8236F5BDD8FED9F4C74AF4775E76CF2BD1DD2F4EAF59E631597ADD4EB8E9F2BD7F8638AFEA0F560C3E7AF5D634D2D9C93C9916860E560C55D5A411C037D1CED4B181EA0C7CD82CA54C9BC18DACB7A9C1567BF522B0628648F1F37B2BC63B6A1A3568C92473038B02393C2E88A18EC966707633F82AF126469C12BA51203E3AE18C3CB46711ED4046F0BC501D028E43AF9AE906B1AB69B993E4604ED827244918FC38FC98E2C8DEAC9E9306508A8FB01085957DFED6248BCD37D31A13E12C33C6D958DB63725A512BCB262498F90AFB9A9C37AF123B202222C9B4208E97A25F5CE062C3F6F21AD2519996B19CD5BD720516E789A10023C847E5C37CE366E5C493F9EC0530A9DC6E8CC1DBEFB76E3AA393432BF52515B8C0856658C58ACA1D815D471D79DB614B12EEADF28489FEEF57DB1C46528E3E268F1D56B32D5AC5A49046DC3CB7276DB176F92081B0429F3F942377720FF872A2665A08D6E50C8C96E19E68D390292B710A5C0235A0C38FCE8061FC0D5C731C3CB982BCB234D04F8AE43AA893D78F63286DA06DB2185AEE1B43027B1E6F56C3C7971A08E18A28C41951668322291198E45955B68ADAE00B34400C0D5D9EA537BC3D75D3DDA1ED1F51E53A8AF1C3744E0A9E6F252E5F2975058CAC4B431EF0D4C5D6E4D2C8966F21931335A9526B33AC7055A5180B2D8FCDCFEA57B8B73BAFDF2EE87712F4CD2DBEB0EB1CFF00504AE599C07C96427B262462A83DA87DD31C6AAA2308A15542AF8B1E7EA85F55DD67DC1FA64E881672D623AB35BB1FD471D4FDAAB5247C78B14F126C2411A3D831B7B72F3B32485880EA11DF66AB761FDD9DE4627933166D93B209E414311E7637BF3AD790492141E3ED4E91F87D3B275594839194DF82D8BBF6C5162300E0B39B677945B1000A8D08E0F35D3EF77D48733274AFA771D5D7130A3FEA52B3A8532E4E527A6BB76921A38E2562A4853BA471B40009D301747FD6429E2A7406C9FE4007F71F24EC03A00EB7A3E46D4904EB63F1F00AF2F823CF96237BF00952411A27D670142B6C1D90012BC41D11E468EFCFFBB6C05235E0107D7866D7C7E3BFC4027637E3F90FE478D0FE0780A140DFA2D7405EB049A56D33331D6F6AC75E7CF82186FE7E48D93F3AF803D656400E8F21E06B8C8A06B5E34086D7FDB7E0FA1EBDD7BAF3A2CDFCFC9D36F4079F1E7475F8FF00277AF83AF24E650090A75AE40EB7F2365BC8FF006D37820EC8D2FCB0D18703D319BEA4394FE8B45AE0C4E2E7CCDFD4D5E23571D482B59B445996169045CC37B518927909D2A11B03886161A1F8B2924820EB89E7BD9DF8FE3C8248001FE3E3160FFEFE47F23C7F7EBDD7D541BD80C49DA6893CFC8500ECEFE3608F2410791D8F5273FA5877D2C7697EA26BF4ECD6C478BEE7E3ACF4C08A591440DD46D5EC8E98762C55772DC99E84608D3CB7517C9035192A8DA20F90402BA1C740007F6E8AF9F1AF83B00E801A1D9C364AF60F298DCBE26CC94F278DB95B2146ED7678E5AD6E94C962BCF1329E714B1CA8AC8EACA55B4411C47AD7EADA7C7AAE9B9BA7486972A07883117B1C8B8A41C1E6390238ABE57ADAE87AACFA26AFA7EAB8E4893072A29E81ADE8AD52C4688E2588BC641E08637D5FB7E99F35908F0B3E2F2B6B1543A9B12D249D4D3F5A67AA606C1B9944925AD42383272B65ADC75444D0C6D8FC6DB68D9B892032A48F5BA23A9FBA1732CD5BA7BA469C58EA92D795FA82CE5B2694EE3958248FFA7D7B782A99262D21319F7EA536764E6C4C6033C207E9EBF521D57F51DD3EBDC9EB5C43E3FAB7256B1F83C86427C3CF1E37A9335D3F8CC7639F2783B6C91D69D6CD75A32642B44658F1D6E46431AA3C1CAC67DBDC99A5D324DF060AF1AC52CD6D8471C5EE84DF0328FCCB306238A84D2AA9201047AAD7AD4274FC89307230DE1D438F5C9924658DCA872F8F4238E589AFF2E4A23605B177D5F5D0F55D3B58D0E0D4F1CACD8936346638DA238C210EABB9A5964CA97272A7F503B8E316142D5E83B00C791D7797BB288A9DC8D1EF4F4C9C804292A452050490C9C83283BD107CB6F654280221BEAD8C5FD1AE50A044D76CB357A904414C93589DDA28E14556E5C9E6740A37E7C8274587A903EE977870F432F906C707C858B708A14A9D5026B166750C84C680B4859B6143003424624E94FA674BDADEA5EAFEB3A3D53D5D4E5A95EBCA6F57C6CA9B8EA6B9340D2467FF00525F25FCE82F146D81F3C92C2D148D9132FE5C64B444B85795D7DC506DF965A2400541DBC82034093322C8578622EB6425B0A1C50043737405D8F0451E39847FAFCED6DCC37D3C9C23C264BB84C2417658E353E25A92D49EDB8047EFE22625D031D1653B075EAB77244C43290C002548E2C9E7F1D0F2A36BA07886F03C9F04F1F573FF00AC2E958BABE8F50604C71C867C4E468B8750008A5AD246657650488C17058A06E2149553BF35D3FA82FA45EBEFA7BEA97E82EEFF0049418DCD2568EEE3B2949FEE3199FC5CFB3533185CBC11C697E8CE14702E239E1911E1B15E1991E253EFDA6CC932B45CE81FDCF8D94D90CA08DE132002CC57B955901B61C7B81600904D78FBC9A1657F50C2D66181DB14E1C789912A2318609627FCA59186E11FAA1C842E46E6523BF51CC62D01E75C7F2237A63FC79FFEC767F2D0D05F24E80F58CE8A9F8F0CBAFC886D1DEF45BF8F0575E079041F1B0B465BB6D06E4931D7258761484B282550492A752008472F8048728BFBB6548F443BFD2198A28DFF002C2C45B3C25AE393ED390F2842BECFED20211BDFFF00A2A0607F6F147837F1FF003E2C7C740D28C3B83D89E39E079FD87F35D149D033121B5AD0D1036080360ED81DECFF00FCD7A1EB65A9CA8CCB224AAE09E4191D5B67CFE400237A3F23E7C1F43D67A4F4E13B0316A0EEC4A21593EDFB5BD40E8657645898D8A08655244819951A4458DB8F30CC4316FC244B7FE4E660925488976A68C5540D1B759E7D9E051B4A7F01E58EB892390D7A5A3B37D38F99E9AEEA529EE89A9603A2AE757C1163643B6C952BB8CC2C66E48D1FBB2525A99BB264AEA7DB794472B7129C953DA3D36D6721EDC36AA58748B0C6386269E59657E7462521121276E246E0139ECB2A95F92A91DC9EF646D03BF8A1FB59F1C7CD724F4B0A4D50B24907CF3C76E39E0AF22FA2CC58FC5CE138C4F13BFB5C7F2727760308C32BACA1B66263B3A008F0472D85B7E9E3B207BD9DE9ED676C28D8B5EDF5C75CF4C74DD896287DC9AA50CCE5ABD6B9750680FF0095A2D66E3131B204AEE5D82736F527BF461FA34F7C3EA1E3C0757770EDB76A7A02E3537AA7218CB16BACB3D56BD99A567C5602D8A0B8FA6F0B70FEAD989A0F6FDC5B15E8646131ACB69AFA55FD37BE9F3E92282276CFA4BEF3ABA5C6EF21D739E9972DD53916A710104097DA182B63E9FBA81E4A988A38EAD6E550F2C25923F6E4240E482771A374B5C56D1EF6FD2A01E0A8DCDBB8655BB050FA3FED76BFF504B8B99938BF82D2FD589DDB28159F2A2DE8C520800F50ABA03F98FE9A856DCBB87074FBFBD29D13F4C3DA6EDE746743742251C3F4260125E858B135E1A98FC5DFC656AD526FEAB6882F2A5A8E6DDEAC035CCC4F39B0F34534525C8B47B73D47D75DD2C563649FA8529D29F83DFC3E26A9A3634DC7C4366C58BA01604B1658A273C99A2923D3167EDDECED450EFB769725D3F1BC716692A89B1B6255626AE4EAAEC416136ADF6F3B46609C7960AFEEA7E5128F4D3FB2BD0991E924A6B72A3433D07FB4C8D375559E95CAE424B04C8431FC3C345282639A19239A3668A4466AFF00F7860D57125C1CCC78D171C9781F223855A6DCBB584534CC1DD55C8675DBB4DEF05B920DB85D331F0646C578C47892E345F845DC5235644D8F0851B15762AC6029161492382474E47B7BDBFEDCF474D5A4B7D2D566B36222573190AEB7B271CC54332D8B7319656E4E485D3F13F007F0395D55838F29266320B0882A80C90D789503A281F202FE3A2A403A3A50C75A6036E12BE260CAE36ACF122AB05512445011228D03B5DFE2C4EC83A5235BF07D707AA30334585C89A95DD0AD790F2651B62232080157978248002E981006C0D7A108925C8841724C8C002ECECCF760D025881CFBB6ED1E6EB96EB591E3AE3B8DBCAD8AB63540935E79005D80DC5102BBC0C775B056B29DC4C9E3ABABB2BD6B9147B0DC598C52E94FEED0E2A41E2BAD28D8001E4A0F7A3E9907D6DFD0DF4CD8CBC552BF77FB717BA8713D359E9A2F6D649F0771EBB632FBC71CAFF6196A0B544C78B086C0AD65633EC188AD79CE828AA3E43AFB22BEDC58DCCEB20CEBB3F6B233C1A2A41625CBE82281A7F1F90276F27B3FD393633E9DEDDD7A6B8F4CF65FA87A869D50ABCABD2BF298292CA1415F7DAB56864988002C8EE3F6027D193ED20CB875B9422EDC69210B20A20348032ED707682AD1CBEE1B45AB01F03A665C5C1D6BFA8E99969EB41938195F888F9288A445E99BEEB2A48AAF0B801D58170C48EA81DDC3ECA75BF6EF2D7B09D5DD3B96C35CA16ECD6616A8CF0D49BED65963796ACEF1082E56DC65E29EBB3C72A90F14851F650BC9D1962760CA098C8DB3AE8063A0C46C83B1B53E54282A079E20BFE88590FA7CE83EE5F4455A998E9BC265A4B38F8C6431B95A55ADD6C911171F795258DD2BDF44F0250856CA1304D1C8421F51CDDCEFD1E7E9DBAFDE7B30E0FF00E0EB6ECE1AD74B4B363CEF931D3D07F7712AE3E09871D0A80A071D1E3EAC049890B1664668AD981560AE8A37529046D600D50015EC1E5B76F0A03D4FECBEB0BF9BA4E5419B148A1E38672609154EDA0586E5661C5B148F907D8A76BF554CC6FD36E3E6C360F2599EA8A146E66F0F47362ACB1CCCF0D7C945F715A36E35272AC911549159C1F755CAA88CA123D598F31FA563579AAD1C5F70D063B1B42AE3E90CAF4ED6B76D6B550E90A19E19EB23A471F18D4985589562DB249F43D425C6CBA01A4858F6243C801E57C7E11AB827FDC79F3D6807DABFAA5405934C9B7AF0DB24C364BB1C2B19C123BD5F3DAFF6A9D7D334625E9FEFCA9257DEED1DBAEE5028631CFD67D186400953A242F0DFFD0CC87618FAB547E9A3F40BF4D3D39D13D11DDD97A3E6EA6EE0677098AC89CEF5659AB9738799EB56942E0680A15B1D8E313C6861B82ACB934038FDF15247A1E87A95180202C000DEBC6BB80A6DA4A82B7DE882411746FA87F6BB1B1F23EA28572208670819D44D124A15C6DA650EAC030F0C288F07AB0374CF4FE2F195634A50084C91AAB483899382F848D495E29126C94891563524E97D29342B455A78668C1F7046AA093B007BA3F8000F9D9FFB93FC6801E87A923F403E771E7CF0481CFEC0003E001F03ABB5A62221C608AAA03A50550A05904D5015CF3C759F311AE0F3F8E9B1DB87FA8D389AE4474D0CB2058F7298F40091B910CC0807C1D6C6FD24DDF2E97C661F12FDC7C3FDC62BA9ABAC31589294891D2CA57E438D7CA5378A48ED226D8C6EA629E3E4424C174A07A1EB49F524104FA665C734314C8D8B216496349118AAC94595D48246D5AB1C50AEC3ACEBCAADA1E63B2A978D6478D8805A370AA43A3116AC0F2194820F20F4B2F6D638F2BD374AE5845496CD6E7208761390D8DA890C8CBF24FEED6C9F5B7947F6F179B8CAACAB055B5EDFBA0B90115B4090576085008FE46FE37E87A1EAA618D048004402D4D05005EF02EABE38FE38E87F0C921C6918BB9611C6C18B3121B69F7024D83FBF7E98CE07A5311D63522EA5CF44F6E56CDDBC74589FED2E0EBA47398C598E89899E5BC4393F756EC59923600C1ED687A75FD578FAB87E875C1E3E25831B1E263586BA2A22C08A888A90FB6A815429D790C491B624B3961E87A3DFDB9444972C222A8558428550A147A65A850143712687924F7EA47D2FFE835593FEA350693FDEC374A299BF51E001C9EC00EC3A25749E931503044DA55E4A75E7691731B3BDE8B0F3FE09D689DFAE7432BDCE53CC76F6273238000552C4444203B20711BF25896249277E87A1E8AF42A4E07155FB58375FE07F81D7518407E1B18D0B216CD727F2D7B9F3DCFF009EBC7DBC527965F23C0D123C7CFF00BFF93F3E7D0F43D0F4AEA550F81D7FFFD9),
 (33,'pfuderer','tobias','Tobi P.',0,NULL),
 (34,'l&uuml;cke','jens','Jens L.',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E000001050003010100000000000000000007000608090A0304050B02FFC40030100002030001040202020103040203000002030104050607111213000814211522092324310A3241611633184351FFC4001C0100020300030100000000000000000000040705060800020309FFC400361100020201030401020502020B000000000102030411051221000613312214410723325171156191D11625334243628182B1C2D2FFDA000C03010002110311003F008A1F63C781758FA2B46CD6D1B30DC83A7C9695CD1A5B59574939C31FC851AB7AC554D78D2B232CA9EA37356C6FB3C96D9096432F81723E9A713E0BC3FA99C2B1F4F2D269DECAE433B170DB68F7FF000EB23302FBBDCEA05E5E24FCEB081F5CA8E621DFDBBCF43A6FD4FB1CBFEAD73BCEAD9B49AFE060098AB1337674306F07E45A714DF4D634489B6CAA2DA1522B722605732B959C5FA1638FF1DCEC6D906DDDAE957F34DB3A9C1391E95B5E5F1EBDE918D06E4A8269A12C49DB4D854D486CD94C14DE6100C913A7B8BBB52393FAA56B11431EA9A0E9374DC35A2F24524165F7D989D448CDF49146E8F5A131C877A49B5821DB9EF4ED21DA0969C8662296A16E0306F27C91C90293132FC5434CE51E3F261010C3702C01E8F27EB158FE4742AD9CACFA76352D24283E172BB77675DCC46A5A34D95131B222824298ABEBACAB2155C69648B08829F60F6B174B95F1FAD89A934F2B3EA65E4D8650275A38B8B440DBDA526B586A8EC2AC830ED081C359130D295B23D5F1AFD63EA464F2A0CE362195A28AADD5ACCC3ACB713563016332E2E42F97FF00724554CA066ABEB40B6650C6C789076397E9D0FE3DD5F3D0715517739B366AE76A39DF9A8F0006A2CAAC05970CB18D559222B159903355AA72E0BE667BDDC17750B71C562CCF7F4D7B504ACD2C3134F2435D26F1A26ED9195F2CF283186272101E00CB22969B0D786392183C3211301106055A5758D54BE776028452B9046E2C40F60CC1CDE414ABF35A85C11DAF72DDEFE0B8E62AB0740C2CDFA942A505DEB975B46CC44D5D077B0C526E9544BDFED8284F9FCB7FAFABB1D29E9BE67E5299EFBCCAAFAC128D3D3D141DDA11A3A29D3F36BDAAB91789D569F6F7A52475D50BB3FF0069675B23A9FA3C39A83E05275F72B9D7B1FC8A942A7D46824927F8EE21235BBC4BBB49B33EE22F08F3F019F9E5F28E73D51E5D7D9A7C8F9772AD87DAAA8677D5DAD2BA67599E60AA7DA5E6BA75BC3DBEBA8A426BA4223C40459E72CAECCEF29BB7AAEAD347A648BA9EA4C2386C9B1E08AB540EB248B15648D8ACB2B72FF2DA1563540BE353D09A9F635BD73E88B58820A509F24A2488C96669540588103685455CB105B2599C91CF1A6CE49CE581D3C9E4D9F7F29BA99B969D3DEC907D6B500A9AD11A15AC57AF166C8453122B0C85ABDE1082EC27D85675F1CDB9485EDFCE907562E9E6C67E7F23C4B9965598591B154189C8B37AE5952F4AD3BCA8005861D90512256F582CE7B0D249A34EE5978575D5A6F8EC4B2128ACAF31968B7FDC7B161FA2909F79BA58265DE0FB47653BF07AABD41E0A09CBB565FCA30685A491E1699CD9A685019349742DB0D9669811F94CAE9B1751A4C86921C6733361D6BF11B53D764899A18EAAD7823F0C51CAF26FB5110126983001E2788B4734254F908570432A901D5FC353A64723C7712DC8CEE3E50180AC4E3E4B19F249F9A84828E71FA8AB704F5737D0FC3EA86FDBE79ADC7EBAB8FE472978A36B7921E768282648AE540B96D376D45B203B70C7DED37B9236C465ABF426C7C97F8787C2B8574F9B637595ADECE55170FF003162DE723401515AAD77FF00176345A75AB55519C0D74031A2E35C1A66DDA317B05FF48FAABC4B99F422C9E0EC545EBB3637615836BC197B19ED89BF142C22B246DB10A5B0DA165C32A6809B4182A82118A1D6B455E318FC87A77BFA1515BBC8F7C39D5DE5A94BA6CB38EB5B75D390FA8FFC7B75ED7BE956391EF56B19A655FD43C6658106ADA7769F68D4D56ADA86EDFB7A71867BB7ED7919350B604EB4E28149FA689A569E495421F1AA6652C7AA158AB6751D5E6D39E27A620B51831C511595E1AE046D3C8E30CFB220AAB838CB6107A2261FD7A66CF50D3CEC86F22AF1E1DB1A2E6022F45BB230446D650D30656400DC00559639077180F610B5899FF4A2656063E4E453FC1CD98915BD86F693E6C587DE980F7BADB24A4D96D82112E229F331F1298F1F19F9503D15EAC338C7126D3B7BB5F3F8FEC512D9A9899899ADC9756D32E7E08D85C05A9AC945AA6A8FCDB4B49358A6C33B5B6A6013367A3BD414F53AECF1CC2D46D0B39172DDFD57AC6DD9070A1F5EB4A25C7E8AEB88AC5156A928A6DA1C23698CB4A7D8484D761F7A52B35F4AD262C4BAACF4DA6999CB34859E53210EDB585688E5A4489B0C8806F8D4B2BB03AF68F612C5C9F684A714AA3685DA9B446A37B12373C9850AC4672FC6EC64098135E27B4FEE3BC778ED03FF001DE7B4CF97EE67FF007FF051D8A267BF7F8BE7B515A0220643D9DA2220BFE26222223B4F6FD778989EF3FF009EFF0017C74AB12061FEC38DC3FE5E3391FBFBC7DFFB75511191F723FEE207FBBEB0E38FFA0E01F5818CBCF16EA9EFF0FD5D2E4DC4376E60E658A5183C8B8C957A37AB10B56DECF5D6B690521AB2884AE6C577AD12F8F639A470B9616EF532D5A5D9E37A3A5A56F1F50D15D74AF3EDA4EE128188ADABE110F80BA145694258C23826A96E35FA225520BE1DAE4BB2C2AFFEB6D580942E93DF56164D391F21FC9B26AED0CEF03E64C1F5B6172A93264C47272C03CDB79C54957266C0A5CD4DFEF0E48FADEA0AE727E12D6877F387076531303FD4C23B4FCBE9AE5E9992B49624F1C11958A3123AC2C400ED888B141BDFE471F1918647DF1A81294492C92EC412BB06326143B60704B7B76009C3E738C0FE1CCBB9959D48AAB6C52D424B913E97DE64FE4ADD5DA2B07AEA92C9659C7E47DA3B4C5911F258AC8858DBCDD1B362CE83AED1532EAF4A273CAA7A1B16936446D2E0555C6605A982993641C3466496C0164480B3AF36C6959AFA9F9C24B456EE310BAD5809A363FDC442CC112F3138388F7C31D2B90F203008F196FD18E1746C53E2BADB999FC6E66AE8D8FC6D1298AD109403C5BE995818B6241E9361AE7BF7888929879487B50AF1C531B138F2318C31F7B6370C06D552D8C1E43009C82BC7C00EA7F4BA82D5B895C8C01B892A005218282707924B018C60E38FB1E8B5F5D7EBD60732E3DFFC87923EAAB6752D5EAD95922C36684E84B4EAD2A8EA5EC118B4E70AFD6C7F8D6AF540EC59504441891B9EF4778DF08AD70F5134586932633F0359172E18D70442D0D6D3AA6B5FA252C973D4329739F12001E4207627D3FF00A37A5CD71387722E39AEBC3CEADA5A79137E9D51A576D67ADAA695C107B46C26EDB5BDB5852410E48D65437B30AC104DDABFE3C30790338CAAF6AA2B329D7D27DC653A686DE4C2D4A4E54DB73C129D5D097BD77C8CE6C7BAC546AFD4F1779FC8297B8FC9AB78DF54892B3C92278543096058CF2B9CB025800DB8A92F91F04C0CBD28765D997483652BA67C28D030F9797704218F03071EFF00BB60647ACE0E8F4BB8C51427902E80FF0018D91A439375BE3B2F7DAB24913AE91910B6B45A6535B42B41B249810B48C91C7C0669704A1CBB7B9185CD3A280AA5421B55056BD928B375603E60CA7FEDB42BD723FF0049B1050C5AD50652F0199DBD66E85753F8F7532C57A5C5B7ED7F23A34E988D7CFBD62B51E48889ADAD72B56AAAAF10DD3B340EC5405D7069554C4C84BFC9843AE5FF005E39A61EA6952FE039151A5A59CDE55A13AEB7666859BCE32F457BB7F456859BEBA0A25D0A2189693212B96D7088B1C1A84A82395A750B347BA0924C8210C8ACC5D5881B8213B9B8058A85555C935FB3DB57595B3508F0B859005C862548565DA46E566C16038507079F50AFA6FD47D7E84F5574F132B42C370B91E6BF8E68F95724F9B58A74E7E821D052C1BF9D699EB0BB5D8B21ACEB4A93F0228891993C999CBF42FAEF5EB5BDCC7945BA58B98165771151CAAF63D17E4EB5572A9B6A57AE88451448B502F29F3482C18C314757387B6301DBB9D426A9E57E36956095C9CD6904A4B4610C96B5FE91B161EEA8D630DC61E0E299333082B7D5BCAE15D44B7363AA5D54C8E97E066E094E6C36BBADE8E802ADFAF4A2B192EC7E25A6936CFA25712DB127E2B43A6182CBAD0867D5AD69504572254594AB1B73A55A71C8C84BC92B9590C64A978D30921467CA216CEE4B7776991696F2EA12C06395970CD1C4D24B2229FCBD88837BE766C750CBB9173BBE20F44BEABB785D2DCC4E1FC3387E4E6E8CAA963EED7AD6E770EC56AC2BB0A758B40B59247C956967569544D94C802EF9D84B1284CE1FAD9CE76B3336BE07433A305AA696E3072FDAD5B0DC5A0E7DA17098D4B17FB855AB55680FC82A4055A5A2929ACB3B030406CBE2DC637EC6DCFD7AB482C8C2DDA4C3EB4F549ADC4E2C3115114FC1D5B52A67D9262DB6D8E19A7450D17D9518D0456AEB619D69FD89E09875D9C672F915DD6E615D6FCCD3E619B8B1532686B24CE8CDAE3F980127217044CC2E1E68BCEC8130C0A9DB2B20DDD0120D0753B3AC6B5AC442CEAAE1631A74E6BFD5471848E2AB56164FAD86AC66127EA0415E3B80925C9054A9B526FADA5052A956C58F0286713AB92AC486F2DA0ADB093E401636999E36072A791D5A8668DB652AF3A0353F90852C6F054614A156BC049AA5C9308FC424A2224E648A3B14FE8A3E2F917B8D74F39EF29C8ABC8A559B50B6002FCCF208D0B1AD6FF254B68DEB46BBD4540764080FD2AA95D49FFEB5AE0462657C7C457B5578E371A7305655650CEA18290A57707991C305C6E0CAAD91CA83C05DBD6891D91AEC0ACAC558052D86040232339C1C0CFDF1FC6721FEA70B6B5CAF76831095B075ECB4A44110D7057FCA5AFB19B5822C8F194248800608227B110BAFF2515F8D7F2D4EDE868005C651A72084B56BAAAFECD62FF26C9CAC01864B04FA1810A271FB8647B7C05506B346F964CB7F188A09697B866481AA82F257914D8989390F18998EFF00B88180991893065E70871BD7BE76AA452A56AB9866D4062EE58640776C325C608B3583B8908F8D996C79CB100433DBE7CDCA8B18804920DDE58800A806E8CB81B7203658972AB8DA02821B805BAD4F2C7B42E4E594A8C6080C1B1C13C8CF24281800019CF1D34ECF2848D86AAF20D082B53695564601A17A53EB27C0FACBB9979F942E55EBF092F0312918F96BBD18C0CEE57D30E979D8D208565E51AD132D2972B435B4AE5D5B1E250B490489894C91309400818361C178D63E3713B9D43E55C1F8DE2D48AAEDDE5593915D8CAC0401777741350ACDC7A6A56211F6B1652850314B547E9BDA6462D6B9961711E35D38C3CAE8AEC6F728AB8C8FE3391AB572F330EF01D3B8869EB642EB5CB2BB1997AC15DB1585A7F97972B045B160B22C379666A911AB0C64A5AB0E42218DDE35117E5334CE8A638770930BE5706462554165245E7B63B7B55BD4753D72955F2D1D2F64169BCB1EF124BBA4558E12DE594A4511966312B944C16E5C037BDF4A79557CBE9764F188D27EB3F2B916DAC6F365CE07BECDC9B246361D1E27DD9627C887BF94C7699990F3F96F9C04B0134DFA5CA34DD461A89530EB5AF491ABFA94C11431725E1E1E63DFD83E411FD27C3F5411D19EA374EBA25F5F70775DA4A46B67F1DABB0EA1B84EC97E8693D3FDBF027406A235256F8F4D82CA759186018992C84BC6B2BAF5FE50BA9DA4F6D5CDE51C8729D60FCDEBE39414F9AB0D01F5D592B8B8A15252B984B528599CC894B9B2CFEF0999741D5350D6EED9D22B7998DA9816910C75E2769194FC446DF10AA5880980BB72C4E3AD11FD7A9E81A1E9F535073E4FA3AF23046404218A33B72CC32C4B0006324E4E3838D5FF0058AEF44D39B747175FBBAB943448DF5D644C63221CC3895F889360A7CFD7E2C77F4F714FAE60E0DF5103A35C96B8A766D66E9139102AA5606B5A2F32597764C0AE244A0FBC8BCA7B87EE21B1DBF59C0E9AFD89EBA75DB95F1DE9D71EE59CAF90724E69C828F1EC7CFB6915E93B5745C35E9565B2A4C2021EC329963CD284C791587A97127F1B3F67F5BEC5FD5AEAAF22E9CF570B9671AE7D935500EA1475B2F458E5193928686967DBDACD9AEBF5D949CD3B0E64383D524B392389E8BB33B9E468E4B372A43293855490ACAC8BB43789362C850670CE1080300E3E20C7BF7FE990E9CF6A3D365B35D2411493B20318775042CAE32A1CE06003C9600601CF53EFECE74572AB64F25D4E2945C599A2818BC89631AB5D45AD2AF2547F605A8152B80088858F6831EF25333525D39B6FE2D99ABA7534467538A6A5A9CDCFB53657584AE94AADBECBD8D1CEAE159DEA04567A08B505EF26312BA20A77A1C07AF9CE7966BA69DEE5FC9B22DDB29403B6DE56E85A991F1FC7B2E08410A5E124A9494F8B067C24087FAFCF6F82712C2E63CC2FF0FD6B77F8DEBF34DE7ADB6ED22C8A7270D8DAD7B60D545C84D6D333A162F141CBC1D597402CA7FD2B3E0F6AF6C69B6E3A674ED4A786399E68122B4D2596C3B6C8A3259042E8FC61240DB41C3B11B71D20FF0010F53AFACC6BA9C151A286142F3C71F8D808C4AA643B724AFF00B53918121563B07270559EA5EC5EC0ACF5F3EE65A05A1634AC722E17624278557B6814273EE56AC97122E6897932D439D45219F01ECAF619330D3B4EFA75F5738868053EB57362CFAD0F9CE3C8E24166B58C82B39F514FAFB9B0EB8B063B448CBF33F1171E94DA08BB3618DF24A21F749FA2FC035792D8CAE07571380E0F197EAC68F51BA83CAA95E11CB5688D7CFD5A9947A740133A4C26D9A8DAB128AF5EAD4157B5D71564E533BA93CB76742AE4F1BEBCA7AE96F1F3AD51B01C3783600F00E328A92AA4FE47CBF94F294D7C35AA995B02166752D3B9AAB57A577022C1A89E1D95463D0ED49A95ABDA76BD33C8B5B4E6692B470D496A30496D454E62F7E4B2A508161914060F2B3280245CEBAD596B301AD444B477287B3989C48D048329197855A18D18618F924DD8C0FD59536A93CC38A440FA372AB17D8A20AA2AC584F7033590C1D64B5704321224125041DBB48C476995F2A5B8A7D7CB1BB5B5B6E3A95CCF942F5790EC5956DE36C6962675D80B1155C55B3EB5BC24A806D57B0304BC9A4960C41D657E24A0A57C6DC7AE771C888EB5A8BAB80CAF1CB2323A9DA559088181565E410CC0FD89079A5B68B4158AB5F90303860C80306CAE410C4104138C103F81938CCCF1BE27AB99C9FDFA554D756A19D87D92755872164E31ACEF531B012D6F8902000825CCF2543067FEC2258C8ABB4F75D5D934635717B0D200FA96095046DF1EFE769633E031103E66B30FE90C891FDB07895AD5BF46FEADDA3A7731574FD579E89384262BB858B0438ABB109F481140AA4480059E623E71FBFCB39D589D95B72D17175A3D54E02C7A2D3A2A56991AE04D688AC5DE31012D942C7C264206060BB636B715C9A62C9E2F2C3104047E91E99B39DD87604EC231800100E4E3483AC923BF2372281918C7D8F39F4D9F59E38E41CF25AE9B6CBF8172EC1E502FF756A9AF87A38ED63442B8456BE87D84138EDFA84D1DCA164F5F9ADF10C1901091F9A5DE3FF5F37F98DFFAF59DC17A7E81E902783AAFF28EABE0F0F5688DDA659D67464791EC54412E2F6A3A73ED24346CF9795E5B16475E1889CBAF25A4AB434B546CBEADD6AA4D798D522CE035AEFF0051C48B697FE2D767B1912E542E452DECC6F894F80DEF7F897FF2D9C1FEBEE4DDE8B7D93E357EE6022B7F09C079CE395FBF733F16F38D8EE19BD42994D2D0CB568495EC2D57A1CCC62B16A928ABD27494D53B82BDB4A6BAA55AF62CC95C49F51520F324C43446282411C4375915D9848E8AAD1BB1DDC6D243AFF05FB8B4BA56357D07579A1AD06B62BBD3B164A470457EBFC3C72C92958E3FA985B0246214BC49181BA453D5AEF4F35B8FE7E39BF7B1AADFE396CEB65F29C47660EBD1AB324ACE5697F1500D531012708D2804988D580B063DAA9F97A9F653FC62FD10B7C3AAF3EDFEBED5E83726D565965AE0F83C22A7232D1047A8DEFCAC09D8C2AB555E4E04A6D59DCCAA8D6CFAFC6C361A4B03C754326BF23D3DAE24A09E29BCDBDA79942E18CB8B0F53CAFE7A2CC8CF8939942CABCBB0C194FEC7B94CFCAE2FB8DF633577195F8AC0766A58535EDD923D2DDB0CEF0B927E95B375F24C0C0A96837CAE25400BF100888ABE856F5BD3EE49269232D71BC6FF005902DAAF1860ACAFF47315459E32B26F69158A91FA090FD39F5FB3A05BD2B3A8CF1C13D565F2C902C45991311BA23B2B8D9271B5A2F965976B0CF3633F41FEAEF41382F5C36FA95D29473EEA1F1FE99A955B279C727E399F9685736DBF6559BF6AB71AD9E59878F14304F4174AB4F22D2703B4A2EDA3AF61150201BFE79387D5DEEAFF0017E791959D36776BB5DA5632EECE84022DD64697EEC2D672BAE9735CC64994AD473EB3288138916617D90FB55F48FEAC713674F159777079CEC5EDFE6CA6D70BBA9856B66AE6FF000A2E2AF73C7C2FE75490B0CB75DEAA564D550881CCF19AF5EB4FDEBEA7F575EF76A66DDB766FE65ECDB96F56DBD53493A55E6ADDA9934F24B3D1159C2642DFCE9B60D4C8A89421E7053540F735BEE217A654BB5ABB4955EDA59ACB13944749562AD582A564F348E7C4CAA30329B86CCD635CBFD9543B41F4289A682D59AF0D868CD395A4579E7AF3866958849197C2AA5D093CE0B2905447AAB891924868D2274C8C1D763DE6FAD1FAF202F52C56266B9EC431EF95410C790184787C2A5BE1D7B775F04FF34F1ED233B09B66D92026589667CB5F2168ECA5D5ACB551490B9AEA7B8C6CFB5C308437E35BA454C79ADDA384E7C22C45F45691B03E25EA7B2062606627B4C44F8CF79FDC48CCC40CF97C965D54E3552F75079457C9D4C7C9C1E194F37206AFE55A4E83EEF1DA7533AB5FAFF8DDE16565B8C1619754D54AEADA52664DEE68FCBC5CD4A2AF4E49A768A19637F18566545790A8C6032BA9566741C0C9DC3041E7A407713D7A7A3DA78E64C5D8A28A02C4139F35766241E58855604039E06463181BE8F1FDD5B0B824F1C636DCD1CFBE355D62A6CD435A6B3EBE4DE9B86F887AAE13D40AA80F940DA8657B2A87ABC04F7D2CE90FD8D5F2244721E9AF2F470EE3F956F294DB95FF00F8BF1D4159D00AB5EA9269BB353B088B8B59056A9F9017EC0026CB2D4FB06465C6F976FE1A9DA7C4B960E36C02742E6ADA756A572F5EA32280B99B56FDA4DE6366D777D8829A74A56F401A0C19210248CBEB0EBE63A8726E4DD48E697F435B486966672ECC1E7D2B0A7F99AAD319A0C9A037ED7830929CE2A92E6B259EA39068F8685AFE874A233495EF58B5B65963806A82BD685E3CB81E215A796772E372ABC6BB88F2EE2ADC27A68EC49948C4037615C98A4918B10A18C637A2A654302C09C0DC1B27D4FCA9CFFAFDC2D73C4F3AD50E079F83EBA74B8EF1CE9CEDEDE6212CAE9B856E35BF87DA8BD6B41F69D72EB42F48059731029442BD62BE46247DA0DACEAF5E959E65BD6AC5657A9C76376EA09720662B52D2171F0A48A21440B92195F9C87AC6062657CB30FC6AAA707FD1CD7CE704FF00ACE49073B3387542AC3DED61EC6DF5C0EAB4743B618811D6386233F4A8727232724927279C9E7D7F6CE71B893F93881E5E358B16962CF2FC2A4C6B6C1910F609AF4FCBC1CB734970C5C29A453E312B2EF310EFCFC9D4239B66A750D2AA9B9EFB3752BA2E2B073E4EAF7FF22606B0D57110818A1767DA42A8F2F211817D9AD6B3F69A34BBA994ED1B932D9601F884C1AE4CA6173EC208028F02182EF32331331332078FDBE57CD4F2E5F79AFB2EAAC5DEB572D5AB8B552AA504D1695E658F428A2427C16E157F581F544CFEC1B2AC0991123549402EE400CA4A9C175230EA46739200C0E09C10DC9C9501C6CD8C14B3104B70B91EBDE7DFF38F7F6681676AD886E3DC5B6F5BD07D6D4B711691F8B3590B9322A5726E1579BCD06787B195A5CD6412CA3DBE532F2A3C66D6969628666732956A562A839DB56A10D501B05609204CB21AC4F94CFBD64B2637F4401DE03E74AD703E415EF9CD80A4EC6D3758751B68BB554E08144BC0EC011B594D52303000D5031B13E2B28F3299965F4DBA15CC3AF1D6BE9F71220B1A187A1B752D687E4A981399978E716F5B47C17D932B550A8D40134656769B5D0060E62FC83B2D2C70AD9492158A052F239C9897E0771C2B6DE155B08C542846272780469D5A7BF7A8D3A6BE5B166C410C31A024C92CD22C614019E4670781B40C9C81C5DBEB709D7E97AF86715DFB94EDDF570EC2B94AFD496954BA86D15325204E529B1F8C96AABCC4A87C9F5DD032423053599F6EF88EA5FE7F85AD876AC24B6698C159A800D9CE6A5F01EE9905B03CE5A233FDBBCC9790B3BC4CFCD0BFDBEE86EAEA7476A724C21AD4F90F04CB53B31C510337F3AA81BBF119253DFD9EB7BFF50C181F260F6EE021146FC3B9AD5773EC8BBAFEF85A5FE4B93EC55BD4D611695164BE492B82F0162A65832332731FB588950B41B42716AFC62399E196533570080CCDCE142EF11870CAEA4839C30070061FDDE559AADE834F943A413342619B1854884830093B72C982A7D71B49F5D0F79CF43FEE1714E9971DE49CB74F8E755387B68D6B96F8EE672CB47CCB2724EAFBAB236F89C08EAAA21028B31B5C7F0B906156181A97EED3B8315C6BFF004F93733B3662A718C0A7C7D8E031B2C326EC5EAF107124759B6E9D5AEA9148CAE7CEA37D713ECF21280F1D3575ABA4BD07EB87486AF3DA5F69763A55A3915593678FCF4FEA72E17DD0AD123F81A21C8700ABD76C0F83FF0031852120B90AFE444C3CFEF527825FE1AB76F71EE7B4F9FF001BD4B97B34390D0C46E1BD96D5245606ED1B02D687B7FB4C1A6F5B4B080FD8E9F21999EEDFD474FBC6455874FAF6C4ACD252A86E5711C858F162374F034DB47FC390F902E4A2853D01DDD4A3AB056B152DEB12561580904D66BD88CAA84C1AEFB96D888331120689D13700256EB97EB11273B9BDFE47B571663C5143A76196DF553F977A24069A8DAF25260996484C89922A00099291882EE47E59CBECB85908C8CEA1A57E6EDB9D5A9757A21A643EF736A8D959DA5893187EF781FB4667CA5220B892803F4F726C7E2ECD3FC7D38D2BD5A76AB32AE37F3954A28B7D101773417EC72E3B9F93441AA4AFBC3567EE2F1F47986833234ACE8E770E29FE2335215F42DD29C68A5A69AB0B63AC6552B6548AE3D630E9A2E50561582192859F651F96B5025CD4218140916A2B398F9589A591571B88963460C76200CAFB5A3C000819416B368DC9E1808223AE19861863CB23C6727270401818E4AE1881C91D76A794D3ABA5B2C86E59B2BBD091741D81AA7A169D61B7FD436535C53E247FE9C29EDAE09626024486455D2D3DA75C93BD58894196A6DE3AB766E54A971AF364AC6B0CF627258E5912947A12C71444ACDAB9158734F33DEA9C47019B98E8DA2D6B8F7E7D50A1F8946B3D6B822D52A74609D7AC28C9A232D2AD0004B7983600083C2E26B46BDA73B4F5834F56CA346F3F26E1DFB39D9960C58A40C49CA5172E57559EF5E02D356AF338F323995CF6A7A7BCEEA56025C49F4B1F8D8CE6560C22222DA010C487059B60477C0676C751888A3748C83862B91872C149078C055E73B8B60027193ECB851D4EDAB55AB150E3D6E2155D68B455EA30D4DB6B89F6307D84D68CCAE54242D6B590433E47FBF115F2FF00FE97FF00D3B3F753ECAF4138CF5955CF38D746B1B98D9B97F8CF1AE79679154DAD7E3C6BAACA5CB2BD0C3AD6574B1B75ADB259017A5576DD4AE1A9091A17E89B17C692FE17E9D1854B7AF76BD2B2B813D4B5AB5A166B4BF0DF04EB1D69512688E5244591B63A95CE5703A890361A3A16E543FA644898A3AE570C84B8254E72A7182304641E73059DC0F0AFE90596EC56D0B66436D9EBB52E64D378C10F63BABAA65652D196324218115E4E663B7689947C0B86E9F2EB3391C638E58DCD6B4D8CEAF89938D65DBFA1F91E496332EBE5D6636E0D93257A02BA64E4FB4FF73989F9B0FF00A4DFF49A719E17693CC7EE775B2392BDA8405DE98F4592EA594C4AC96D755D4EA2722CF46B36BD9F194DBAF81C671EC00497E26E47F538D52FD72FA8BF58FEAB7164710FAF1D19E07D32CAAEA4AAC58C2C44CF20D6F40402DFBBCA6F4DBE49BD662223FDCEBEA5C647FDA3301D87E172E87DB3A7ED1AAEAF3F70584D80D0D04FD351421A3678EC6AF6A1657601768FA1A57216192B6410327082E59E157C3171B64B192F8C0C6D81183004FAF2491B2FEC49E3253F443FE97EB5CEB1784F5A3EE7F38D1E0F635830B71FD15E359C563965AC029AB78F339FF29BF6929E39B57EA4B68DFC9C7C9D1B98C0DEE7A88D10654AB791CD7FC4DFD7DE8D31BCE7EAEF45B80F4ECEBE6B33B6B0F8963B13A77B2FFDB993695B73DAEB8213546CD9CF381B0F693ED0DABCF642A2E4B1ECCB5772A9CFFAF9D7AC5668CCCF780398B35A7FB7EE44AABD51051FA991288FF8988EDCF786315DE7B4C41807FC7E8BBFE867FE67FB0CCF6EE3E3FB88FEB31F2335DB275DD3E6D1E48A2D3F48910C69A769A82AC31A1D9B0CB24604F7644D89F9D7A4B123608242314EAD3DAF7E6ED4D5A9EB3444762F547DDBEEA09D640CAF1C8A14F10078E47456AE2278C1055B7283D64C7EC2D359E16971B21250C25F566483B042D8B35B964BFF00860C17949ACA23BCF7EE6263DFE653FAF1D2CD4E9D751AEB13564F8CF20B565B54AB0312BA7A2705E435E640417DD71EEFC7FD489C4C8F6F113F9F488FB31F4E7A73D6B8B9AF518AE19CDD82C9669AAA4331B61A5133E5BD9CB81953CCA3FB6B50907CCCF9DB468FAD6B8CC07F90BFA41D40E0BC4F66B6FF0007658CCF293C5E6F901FC9F1F8D05893293076AA81AA831871E334759746E9A8DC3F8B03E31F1291F6DEAFDAD6DE48165D4F4EB2C2395E051E48A32495924857E4A62203B32074C12013965EB425CEE0EDAEFF00A514B14E9A6EB15E30CDA7DB751233A283224121C476639083831ED719064894E3199DF46BCA6ED63BFA0796D2974D6313F18304AD52BECEF100220858F6EED135220CBD9FF77C69E671A4EDD672B4B41997C5F0ED2BFD35AE57566D597326BD750F8340ACDA70C49140F8C2BD8703E4131F0DB52F2EA3EDE4EE54145EAAF655BD55E230C07A66566B19988818828FD14176989188EF131324F471CA3B3D3FA9C7F8BA32C3949F2946FE3D5BCB591EB5BC9CDD7B539E9332544DA5652F52FD4027285CEAE2AF30260C4CFD24D4279ADD3AF5F1764889A8B1A461DECB29452A59553CC3248C8249202824E0AC7BA204A7A2DAB31D994B471C80A1918AC684A865507718E3527273F1E06704751A34390D4AB62E306BE6E7417854CD429FA759F9E7594BAE9B5F8709AE75E95853C6ECC7723B2F2FF5640C62663973ADBCC760330B4B4B41DBFF00C85730B6FA5654BE45568DE67E75420B7799251593556DA562A84366C0FE1BAB7FB84B0DF9D4CB6F7BB7722F93F279251408EBE7D946B62EA2948B80C53E2B5CA6B625A8643902C9AE4635C510BF109EED01F18C31E58F5E46AE9B99B78F1A19F5936DD625EAAF68DC6C75B87435C6DAC2673DEB3110620953BC05711F04D2F4196A665BEB62AD8AEF134F1CCB219E3788860AC650CED1171F30F8DDB84800200091AAAA434CCC1A3E18721B83CA92D8E42E7F50F672C0E727A155DE53ADB1973814D57EC60E75F75ECAB5A2B366952594AEB2D076132A442084E0243D66204F9888132EE5AA3FFA727FC404FDACE77FFE567D88E306DFAF1D2DDBEFC731B510E556EAF7509135EC0E4394E180B9C1B8B84AEE728818FC7D6D07D1E3C64FAFFCF22BC12FF1DDFE36763EFDF58B8C74338F3EBA29C58A5CA7AA1D45CCCAB319FC2BA7943450AD3D2EEFB2EA8CD7B7596AC8C1A0F289D0DDBB481EA2A95EEDE4FD373A3BD25E9B7D6FE93701E8974938ED3E29D3BE9D71BA3C638C6256FEDE9A55967076AF3E7B36EEAE9DA8B1A1B1A567D96B4F4ED5BBD68CEC3D852E7D0E4ADA2E93FD4E284C3AB5F69534A57521E9D5276CFAC8CAA8135873241A6B2AE5596C5D1E378EB3485C31ADF91A3D98A90C9BA727D5893865801E0ED1C493FAC8648F18770A5A1B75692D552AAC2BD6ACA142115C16942549EEA5294A11805AD6B010582E2004044462223E2F91C79BF51230F6868CBC553F86A6C84981F8C9B6C0F6F3FEDE71FD3F45133DE3B77FDC4FC5F015A72300C4E4B609C824E4E3D9CF272464FEFD4B9B08A76803038F646318FB052063F607EDFC75292CF6289098FD7689EF13313132703FA9898FFC7FFD89FF00DFEBF5F1A2AB4EAFAE5500E65515D76624E6499046E8512FCE67B92BC7F7D8BC8FCBB7739888885F17C13A27A754002EF4340044EDA3B3CA23F67F8D3DD333FF00B087307BFF00E466227FED1EDFAB0032FACCFDC17772A6627F5204A26CC4C7FC4FF7484C4CC7EA3CA23F453DD7C5F39D73A6EEE297608AB346080D12507FFED5CF7EDFE99FFCC44CFF00691383199EDDE3B4444405EB4DCB59D574E6BB888094E5352F15BEBD841F9031166BB0253610D0FE8C4B80D66132323DA7B7C5F17C3E92AB6FDCA0FAF601FF00CF43D866550CAC5581E0A9208F5E88E475918FF25FF5DBA47779CD3E7581C4B3FA7BBBA38F65FB0AE9F56A9C771362ED3B5EC0D0B5C7A2B5BC4A975C363D569B8F47306C8254D72CAD4BAC3AB03EBDE62391F52F84D5D163E13C7EFF0025DBA635CC55EEB94F8E6866242E7703F7578AFA9688941EA226C8149F80CAC97C5F2CFA7D5AC6D68939AF019DA376698C5199599527DACD215DE4AE06D25B23031E875C9AD5A7D2B5847B33BA05C0579A46500ECC80A58800FDC0183D4AAD4E99F01EAB65D4ADCFB8A64721361DBA0AD07A0AAED52AF16DEAF5D1DCA27575EB2E654A6B2B85CFC573820DE8677382AC0EB2F40784F47FA93B187C56D6FBC5BA55DCAD4D6B79CFD7A891ACBB4346ADAA3939C90A925D94CF6566D97AA3B58B2D39964AF8BE5EBBEA9D47D03CEF56BBCC25A91099A089A511B4C81A312152E118000A676900023A58E8D2482DF8C48E233B898C3B6C246704AE76923F723AFA02FF00800E8174C7A4FF00E3E381F52B8860857E75D79D4E47CABA91C9AD45776A6B3F0F966FF19C1C8559557AE75F8FE1E6D132CDCC296C26F68EB5F639B6B41EC9B80E4F69A39F61BFD48855599D8A264648AC141778EFDE2084CC660663F45DFBF9444C2F8BE2BBB8B8EE1D4D070915B10C4A3858A185628A28A35F4914512AC71C6A02A46A114050074C4D3401A6D520005A2566C0C6E673B9D8E3DB3124B13CB1249249EAB9FEC4DFBABEA17A9569C95270F39600B2F1181875D98EFDE2666620BC7CA67BC888F7999EF32BE2F8BE15101B1381E87FE9FE67FC4F431E58E79E7FF8FF0033FE3D7FFFD9),
 (35,'enge','sebastian','Buzz-T',0,NULL);
INSERT INTO `t_spieler` (`SpielerID`,`Name`,`Vorname`,`Nickname`,`TeamID`,`Image100`) VALUES 
 (36,'','gregor','Gregor',0,NULL),
 (37,'reiff','christoph','Christoph R.',0,NULL),
 (38,'benz','eric','Eric B.',0,NULL),
 (39,'','','Vesper',0,NULL),
 (40,'hertler','timo','Didi',0,NULL),
 (41,'lindacher','holger','Wolli',0,NULL),
 (42,'schenk','benjamin','Ben vom Berg',0,NULL),
 (43,'forch','sebastian','Seba Forch',0,NULL),
 (44,'','goran','Goran',0,NULL),
 (45,'gr&uuml;ner','axel','Axel G.',0,NULL),
 (46,'gomez','alex','Raul',0,NULL),
 (47,'schmiedel','sebastian','Seba Schmiedel',0,NULL),
 (48,'benzler','steffen','Steven',0,NULL),
 (49,'k&uuml;pper','andreas','Andy Küpper',0,NULL),
 (50,'starkloff','timo','Timo S.',0,NULL),
 (51,'drexler','markus','Markus D.',0,NULL),
 (52,'utz','benjamin','Be_Wave',0,NULL),
 (53,'moll','daniel','Doktor Molli',0,NULL),
 (54,'keiper','benjamin','Ailton',0,NULL),
 (55,'buck','michael','Michael B.',0,NULL),
 (56,'schnell','markus','Schnelle',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001F000001050100030101000000000000000009000607080A0502030B0401FFC40038100002020201030303030303020505000001020304051106071221001331082241091451152332244261161725335262714391A1B2C1FFC4001D010001040301010000000000000000000006040708090103050A00FFC4003A11000201030302050104080505000000000102030405110612210031071322415114083261710923334291A1B1F015177281D118355283C1FFDA000C03010002110311003F00D25723B788A79188C90DA97236561353D88DE558E53DD5FDB9155E261EE080903BC1765D004F76BCF0E6FC930B8F8DB49462F652798A588AAC323B848BB8BBC88D2B069446A4A957EF05558B9F5175AE4591CD64A2961851917D8F73DC7AE503C626F6D889A4EC623DDDE8F70D927F927A74B917266C8C58EAD6675AD24264B342B77AD7B32C4BEE2FBB1D6ED8652240AE819582950E0FD9B51F8ADD50F0E7C9946DE728A369EDEA2403900FDEEC70319EDD2B3529B89C83B981C12770E579039E4F047719F6C753EE06E449D92B2C80C2855C7FB4210ADF67DBF715D0924009202E941275E9D79AB514F1D4D1241A77886EE0410CB19460DE76341403B20EBC7907D568A1CDF2D1333F6D7910146642A36CA7C36816F3E0EB437F2743E3D377AC1F525C57A2DD3ECCF527A8796A382E2DC671B3CF6AC4817DFB2D326AB52A9595C3D9BF6191218218B6F24ADDBA08091A0514D1CDB98A79603B13BB0548524678031F3F278047B6CFAA8DD028570D95180BC30665E0639CE3F03CE3DFAB654723469546B77678AAD2AD034F66CD89560AF0470C7DEF6269642B1C5146BEE348EEE15101627B77EA89F56BF55CFA0FE90E56EE333DD7EE299ACBD18561B58AE1D6A4E5444F16E3F6D2FE2566C27BF1B030CAAF938C8DB236DD557D6333F50CFD5E7AFDF55F92BBC378D66B21D39E8FD696CD6A7C378CDDB14E5CED5691E386CF32BB04C24CBDA95143FECFB61C5D62076D69250B3305CBF25FBCDEF5AB32D99E47058B3BC932F732BBBBB861B70C5081BD83EE177006FD67E95E6258388D49F4929BD8F380704AE32704672704671DBAC0A80A71B379C72010A33DC8CE1B3839E07E40FC7D1138DFEBC1F401C9B90D6C4CFCB73F82C65B4989CD66314FFB7A922EC44DEC639F213912380619937DA0AB3AA0EE2A573A25F527D0DFA83C29CE746FA91C5F9F63A04A9FBB9303928A7B348D88E45896ED1631DFA33334134621B55E170F1491E8B2903E4EB88AB9FC24D53250D3B0CD1B473224D044C96877EFBFEFEF89D243AEF53AF82412E08F442FE933EA1B99F4A39A62333C6B9367F82647B9C9CD61F217E0B0B71125146D0AD879EBBCDEECB22C360C8CCA3B984B15C8659995154D3CF48AD32BFD528C9605511C01DC294C03800919562492A58770B60912A0AC6E9F4ECD80A72CC87B618EE3919CE0E3000F5609C83F4F9C9BC1263E4EDEE578DA2EE04AFE5D7CA9D063F3E37DA091E7C78F5EF77821308D795AD0AB6BB7B958F616D7DA34477336B67F04EF7E822FD0E7EA6EDD6D922E8BF576EE3E8758A8534483331574A185E731C31473C52535EEF66AF216AAC659F151943604162782182549E94057939A5FB92F7AFB24A2B46DF6107F040D13AF008D30F27C6C907D2AA20B5B145240C8EACEE70495653B233B5948041C73FC1812A413A2A0B534CD1CCA51828C7190C09EEAC0E18771C639183860409A90C2F12C88EFE1C061DA808D29FF008F1B07E3C6C1F037E0FF00268D3B53449D107C85F1F923C0F3F1FF003E7CF83F317D4E697ABF70715CA3FF009075206C8D6F7A217E3E7C0F8FFE0775397CEEA098602081BFC0FF00F5D83BFF00E478FF009F4A4D2CAADB485E08EC7E401F19EDEF81C7F3D42746E413D87703BE4679F7E3F3E7DBB74F0F6236F3B3E7FF006AFF00FC23F3FF001E97A6BA72695813FB68CF920956523635BD78DFFC1DF9DEFF001AF4BD63C8947EEFF33F87C7E5FDF18FBCE88F24F3C13E9F7F4E7FFBFC4FC1EB34BCD7EADB192BE332FC70495EC4D56ABD8AD2CD8E4BB376E6B2B423A1692BD79248A4AD0C72E42088581AAD902CB1859CC8D6A3A11D65C9724FFAD396E5E6C5DBB5C03359FAD81E3FFBA861CCDDC6C182C666E18A089D91EC4103E52732D88E06645ED47944B106011387E0B91F3B5B7917CFE660B31449050A91E2AF5FB3631E9763C9C5666416E1FE9DEC3A2A190D760913C30C6B34328788B374331799E3505DA53630F2083905EE532CD7ABC97A338DC5A498DC5E626BD2CD4E3A324B1D8BD5C20FEB31363CDA54931EE8B5A7B4F5555C74B69CA38D015FD6CE219D121ACACA84826A8A57963465855149A76980998F7629B95B0403D15B6FF779A595D49F2E984B4E65A8A2A4A72F0C72849196494BBFEB1230228F040C361D415373D3901852094302B3451C8032823B5D5587FF0083BFC78F823E7D055FD6EFA89625E8D74D38152CA342790F25CCE67258C496BAADBA780C75482ACB3C211AD32C36B2EC913874803193BD259447ED9524CE50B152ABD0BD5EE4505580110D98AC3C6BEDA2AA4A6291F522F63A11B2491B5DAE8FACE17EB1DD40391EBBF4CB85D2324FFD1BA70B90CA29D18D4E779164FB117E7EE1571B04AFFF00B5D07DA4777A69EBCC460678595D19942B8604140C0E77038C855C6327924127A2BB7C72355A4532324881F7C6C8D957D98030D8206E6041C0F6C638C033C6710B57EC599648E4789A40022C4497750151F454F646CCECE57B59846853C1729EA77E19F4F1264F572C459011DB848ED8E8FDA23768DD76449190D0BA06465128329EE66ED27BA78E8FF49D39267A95BB35521C2C765269DA73F7DCEDD3AA45047FFD1F25A4327B6A564D8EF058928585E2B8F10C11D682AD5081214558D554245A036575E49FE003F3AF804805E350BC32252D1156971EB3B80DABC70782377B918FE9D3DBA13C3A5BE3CB515E4C30A05F2B7A922467E320633B40DC7B609C60F6C8A8E45D2D861E3D5F1D6F1E59F15744F42D410B569FF6AE8BFB8866445549567EC59048E1D64587B19C586796483F092F1FE1DC8F1593BF59AED5C56524B19BC53BD7A56AF53D8AEB1D531AC8AB1CAD2112C4D29595D52291CC0E083979EE92E1B390B3FB0A2D2E99640A3DB253B59D5E35FB75276A86EF2C7C2FF901E696F577E914E6E49F2989AC64B48A155618807EE0A1A6891828771DCA74CBF70527B401D8839F457A640F0D71658652C18AB65417C0639182A181DD95C157C90324825FA93C2B9A38CCF6950F340A8C1401B5D536E08273CAE07A4E41076F207524E366E9D7516D712E73D15E499B8727C6DA73063247B78FE47C6730B4521B193A961ED41FD463A3F68A73D4BB67F6B3AB4B13493D2FEF6ACBE8F3AF767ACDD22A5C87376EA4BC8F0737FD3FC9668DA28DA6C8D0458DAD598A39192BDBB11F64B6E01EDA2CECFED4502B2578F209D0FF00A5AEA45B76C461A0CB6273536631E30F66B493C324314F198ED46CCD27B614CDEC598C5B050A4B283DE4F693E3FA75F4AF91F4E723C9F8F75072798BD9886F8C98C5C75AED984642B1AB5E2BF6A0A1049EE5B9207823A977DE668CAB2280D336F1A7AECB417F82DE956D534D552B53C6B212640241BE2667DBB1BCB90952C02B10CE1B793BBA6DB52E99AA16796BE7A514D3D32A48E51700ED2AB26D4C8215D00603246E5057681B7A37B2E48EC9241037B3B2415DF6795F1E18F8FCFC1DFC7AECD6C84802306257634CAC743E34A767EDF83B041209FCFE6314B40B215F7957B8C12C760C865478C01A904AED2EFC7F93EBB87FEA07D386B5C2921427B43155DFCAFC1DEC9FCEFF003FCFC7A77DE31824FE59C76EDDF3EC7DC7F3E3A68924E40CF191DFB9CF7F6EF9F8EFDC752CD5BC4C2A4B6BC9FF00711FC6FE0F9D9F24FF0024FA5EB8946706B213DA4FF3AF9F8FE589F4BD24F2C9ECA3DBB939F6FF009EFF00883EC7ADDB87F657FE7ACB674BF38385D8195ACFCBDB1B5EB55C257E4D2D2C7E56DE5AC43463C5262EF0BB556ADBCD3550F939E1AD3DE15DA217C352B114324BD4E35FF74B99738E7F90C7E472EB8FE4F9F7B7061B1B3CB5E0831F0642E5CC7272641DB8413AFBDB0D662B161103C35DDC7D8D5C7E9FBAD9C8BEA8FAA189E27D2EE13D4AE65C231998A789E4BD42C850CAE4A58F19255C8DB924FDD6D29F12C499AAC31C22CCF8C506E2475EAD37F67B8E1F1AFA7BCC62284512DDE3FC6AAC0565FD8492AC81CF8694BA605728A6670372C966646762CD24858B37A67ED560D67E25CA649A2BD692D3B4B2C518A285A49350DCD8C2AECF34CA1A96DF1159B0103564B0CBBD4AC3228649077AD49A3FC2DA78A944B65F11356D5D3CAEF73A8A6869F4BDB556A479494F10095B739964809F336DBE19E12AE92491BB23D40E59C539874FFA4BD42E414F36EDCCF2B82870B4AD40B2252C4CB91CA51A8648649C2BCF62BB4C5A39163AA9177308A0F25D8267D687480C5670FD447CFCF99C9D5A78DE317EBDEBB364DA9473D7B791AA9565B76A79A8568ADBDB8A4C7BCF208C4A8F1831CCA9EB41DD63C56263E1BC938E50BB90CE66563AF3C9669AB4582A628E56A642692CBC86696422BD57884BDB1450ABF792FDBDBE839F59BA642CF19C670AC8A7666AF750B1D63217A39E673C9ABC1426CBB65279E513ACB0B2BD7A895A100446296B493762A7AECDEECCBA42BACF6AB744D456F4A3C98DA792A3CC792AE76AB7966792433D44AC7CD9599DDCB841E9DA02ADD25709359E90D4B75BDC74B597CA9BD031CBF470534D0C31505AE1B6454D1C4919A5A4A726582144441B2695BD61DD8B13A25D3BB78AE3F87B56046EB631F5EC12480434F12C855942AB01DD2091403A8FC970ECEF23DAFC5E2E335217987B4C876AE11BC283B1B21197647F91700160C09D104F0E3AD5F038FA91C6D0C11AC68885C848E38E08D13F3DA8AAA9E42B1F84D053DDAF5F8A1EBDF07E27622A5C92BDA3453EEB59581A194545620FBFECC6FDEF11D3B16EE3A00820105486C94F535152D28CEE76254919CE5832A800EE1C600C0E31C13D3A142D4B61A78D032C62289125E71B5D1543E4F6007A8E4F7073D867A9B2AC0AB0471ACC9FDD07B4EE2762367BC9685DC2313AFF0038D4F8D686C6BF5E32B545B124F244AF06C14D84914B02BDE5D345C37F8850148050F7313E036B17C9FA6BCE53F7FC53916172BDE0482DD67AE993802EC812B20F795C6C058E75789B5A059490BD38EB5916DA28E5AF2C726B73A3C94DC28D02E74D2C6EDFFA8AB39EE1AD27F88F9E3950959158918E09E46318C8C1207639C6303391B71D16525CE1A8895E1956589D47A94E411C1619EC7E064E01CFCE3AB5DD21CB7194E518E8A4862AB6449114B3ECA46F1981498CC9DD13C7ED10346471FDB1D8DE111C1B4DD2FC546DD74E40D14A913E2B8245919F231CEAD1359CCE7E4AD0D7DA32990983152C71BC6CB17B35DFB76A004A5DD35E0B99BCF2DEC5BADA96A40D604627085C046EE48E39665470410027B4E587958CECFA213D01E3391A50725CF6531B528E479164AA57AF3492196F6430589C06263964B10B32C10D7AD98BF9C6C7D78B520477BD248FFB958A255A3EDED71D696B1E5CAD0D10A8AD98C6AC547948043BDF3855350D0AF7C3361402493D349E315652D1E8FB8B432D3C73CD252D32A48EA8EED3CA166481580691D206924644FBB123C8DC260DA37AF62D1491ED54B12B22F6D950A0C87C285B2C0824B6C77193BA4076C198F93E703CB114F73B415703CAA9ED217EE8DFB47C8D3147F01D0A3EB4C3D70A856C9A580B0DC854C4EDF7242E5BDB1BF2E02246E809663DCBA1AF04103D3E68D1B16D44725AA760B3207FF4BDADAF80C1966550154FDA41D7C0D83E448E969F7A9C2386C0EE5707B77DCFBB8E7E7F1F8EA1A4736D23D608E3180C319C7390B8EFCFB73C71CE5C346DBAD740141F9F3DCCBFC6BC76FF001AF4BD7BE3C6C9597D91277843AEE4EF51BD00468BB1D820EFCFCFFCF9F4BD738D3CA091B4F071DC71F778EC7B71EE7B77E49EBA2275E3B9EDCF3F29F00FC70327DBA1A59FEAF7D2F7D29714ADC5AF727E9F74CB0D81AA23C574FF008BD5ABFD6BDBEC0638B17C238D4125C856CB681BD6EA55A6F2B99ACDC0A5E50397A8DFAC474AEC67A0E374B81F3BE3DC12692417B99B5BC3DDE457A05FB5616E2B037B38F81F40FB91726B73216D3D603654095FE44F3DB92C64E7B135AB733CB3DC9DCD89269A46EE79679A46691DE4762D23CA7B9CB12C4924969750238DE8E32D1FBA9ACC61B6EBF012CC6CB1CAC7F215FCECFC123C76923D37F75F1CF525754434D6AA0A1B15B778029D2215734F10ED0CB50CB12246C004294B053484128D23039EAD574AFE8FFF000A74C582E35DA96F37BD75AA040A5AE5254BD9ADF6D9DCA06ACA2B5D2CB3CBE645B9A4325D6BAE9080AB22532329C95CFA8FFD4A307CF78158E9CF43B8E72DE1F732F7A9CF95E679B9B155AFC983AB61E79B1F4E9E36EE4DABD9CC4F1524B72CB76456C70C8D2689FF0070B28652F31E59CCF2FC0721C865865B10F1EB5607ED2B186B8B9FE863998B3C92B90AD203145BD287091ED0C8009EC14ED1495CC8416102293BFCD7B33C646BCEC0668C1FE011AD7A2A3C3720A6BF1E42CA552922A0075A7F6E2237F3E1FB43023ED63F1A2BB00F79D5174D415CB55769E391E08052C0B0C4B0414F181291E5431E157D6E59DCEE77EECE485EB4EB6F0B747F877A52CB69D1D6C343056D7D75E6BA7AA9A4AFB856D4C4D65091D45754969CA79287112B2411172628D43387B25362EA66F013D7CBFBD07F64A06887B6C8D1A3132094C722A77A0D330008DF72B8237EA8EF35E89D01C9B16D2F5293038435E4B192BCD84AC72B14AB66CCB157C6B55C2B599D6DD27A955ACE432D15B89E2B16C5B9FDE445BF9C6795F1D113C5980259D54C5242ECA9DC87FC57FB8DE5983291E7B485ED2481B1C2B391E9CDBB95E82950D25AD56AF34EB2C0AE490228C7782A858FFE5003B4B781A623D742866869516A2192925796311C91D4A17C06C10555895073C02391CE01CE036175D234BA8A8A22F555742F138A979696A1A983E369FDAA64E31F791E2647539F49553D540E86749B3FFD4BF790A470D7EE94D4CAE2DDABAE41EA86609731714A04267858F677060D32ED848C43892BAB9D65E57D2AA72E3713C672BC8391088DC8A8C6AC22AB550A86B5659A543D8A19A79618BBE635E392609A1DCD7FB846131B158AEB0414E764AE65AF5AA2A88DD97512288C84DB22970554921DDFB40DF706C7597E9DB8FF0022E531CD98C8C1C5F357D295D82CB286B11432D6882C3344B3C36102A8408EACAA42B2B4720D6D14E225AC80480CEAE1DCA2FA7CD0983B1643911A10700770AA4020302A90582A45349496CAB5A69A50E914EA85D50AAA8F322562A2665277333150E73DF81D537FA7DEB0FD5FF29EA4705B97A9E5F8D712B1159E416D6843255C454C262567B57F25927B15E197DA871B427C9AC391929C935630BD682CC761248486FD387D6AE5B19D45B9C67944B25CC7E66ACFC922A724C67FD954CBDC6B179B0ED2956AF62AED647AEC5ABDB44906ABCA1265E0E72F623E9EFE9E79EC18BE5D066C6531F538DE46078EB46D3C9C92F52C0CED06E26B3297AB6DE695E4B323C7056910A958C3116B93CE4D82EA82E7EBBBC30E1F894AF19898A13EE3475E926C7CC6F3CF1AB6CE8A961F1E84AE977AAB66A14ADB4936CA8A54DF1F9121753928DF4F3924A4E19762CC8DB91B7608C807A95FF675F04F4E6A2F0F35BDBFC42A0A6D5549A8AB6D965A9FAE8712C0B4F0CD5525C28243FADB757249708E4A7AAA59126A66A65314D8672DB3AC1363B3782C766F0377F7746E524BD52DD57430DBAD246B29756F6BBD5CFB854C52FDF1C8AF148AACACA9D2C4CD23891A3916395242A8C4AEDB60120901957B87E49EC0479D686861FE9ADD72B9CDB179FE9966B232DCB78BC6E2B94F1D9DA60A24A992C7536CCD029AED20643DEBD1A22288DA4B6DE5597B49D62D44525988C322B993BBB1C2131383B0CAE18695BC8DF68D83E016009941A66FD1EA7B1D0DDE35114932345570A92441570E1268D7396D85B6C9102413149193CE475549E3A784D5BE0A78A1A8B40D5CCF5747433455D62B948AAAD73D3F715F3ED95522A85413A47BE92B76288D6BE96A9631E58425ED4F2133420C822EFD9EEFF692C340923B8793F275B1B275E97AF04A8E514F6152C0330D823B8FC91A040DF8F0091FC7F1E97AE818E7C9C16C678EFDB231FDFE7F072D6A9870320E7033C0EFE9FC7F2FE5FEFF0039EC957F76558830826D1F6C91DD13E8EBB5F7E1977E363EE4F07E363D7A989C96172982BA852C2D69123898FCB2292AD19D1EF0085ED3B075E4793EBDF66BD844564EE9A08DD902C87762ACE803340EE365FB46BB5FC09632AE341B43D66482FAAA4A4417E05D45291D8CE0823B1F7A2CBA208EEDE88D81A04188818385E72559195877565604647B8E391DC771919CFA4C78B6C932302A67864824825FD954C32A6C78D49C466400931B0C06C049155B1B22FE35433F94A790BF8CC75EBD1F148D6E72496BC2F2C38FC5497AA63E3C9DD915596BC2F76C53AB24AE5564B32A28FB9BC90EE9BF2269B0DC5EE3BAB0F62B41368EF524482ACC7E75B1323EFF009009D8F24CC5FA7AF4C319CE7A57D6AE2DCB28A63B8FF37CB64B850CF8AEA64B192CA71EA92C35EC4CA55C4182C9AE1AFD33233431DCC94863FEE191C529E2F91BFC0B90673A71CB524C5E4B139BC8625A1B21A36A799C6CF355C86364EF0A63679ABBCD1772E9E55B249DB47DC7775D3CD476BB1DD959A68AF10CF291B0A793353C803427049C344EB246E48F330E546D55260D6A4D50755546B6D3AD108EB7C35B95BE9E7513099EA6D776A25496E180061A0ABA6861AB89370A7DA1EA196477504B64A5C72F612D64ACD092F4F1D5FEDA24D3C52C92C687B155E09629DB7DBDA02B68B1ED275E563AE0D8D816E4B57936222E21CB56636B158CC8C71CD533151E43669362339336F2B61614536B1CF3417E0944A0546AE91DA93B3D27CF57CBC752313C4F342D1472AB49169E45EEEC66048D1910B30EDFB8C9EE01A2362CEF2FE398ACDE190E43130646158414F76BAD988A2AF702D1BA153D9200D1C8591D25512452C7200E39B6F2913B354478889DA8EA036D7E18330E03A1047A49F4E3284107730524C52B8D249573C1146B90D1722362E4890C4787518C154D8EC18104E369E774D3AD980A39697097689C2E76B5DAC934291D830D91DC5967A324C8DEE6D955A7803B34048425D1924660FD58756AE754FAD983A7D3D924AD99E3DC5A8633312F7BC74B336EAD8B52192DC4015AD2C10B0AA3B19A7D2033C0B0B5766F774FB8250CA64EAB527B162049A586D87C9F2B7156389159FF00D158C9A565EE8A58C430DA7B55C024B56750C82F6740FE92F1D98CC45D48E4B8D8A971CAAD351E1B823105399685A56B39AC99EDDFEC1A61FB7A9540FF00C425124B376538963BFD1A5B7566A1B9D3DAED4CB53502267326D65A6A380B2ABCF50E467621236AAE5DDD9630CEECAAC8EFDAB62D3B6C86ADEE70BEDA97649A9E1984F3487204482631AF9921525C2A6D0AACD214456C824EBAF5A3916631D5BA7D2DCAAF53119182DE67F6459D26E490C12C31D2FDC961EF438582C5859D502C4D939648D838A35E62D76E40F92E311D8B5B379A8D2C44B3336CCD05699EDF79D8D86568A0590F9DE81F82357B3F523FA28C674A72353AABD2FA4D5F86E52ED78B98E021426A719E479090EB2B8C5550B5B0195BACD566A9FF00938AC8B568AA76D3BF0D5A233AD5B3155A5891218C24296EDB790625B2E9DFB1AD87FDB40ACA3E58B68793A221AA34FD758AE6F6EB885355138944C9931CF0B60C73444F3E5BED0A54F28EAD1B61D0F565BF679D5BA6B50F8776DBA695A99A7B64949F4F5C2AC2475EB7C4DA6E29708919D22AA491FCC8F63BC6689E99E066A778CF4657F4A4E713627AE7C64DC9375EFF006F1962DA2AF1DEA391A15D7EED6C4762ED46D6C7958F446C1F5A6F66952CCE825501266552D1A31EC627B491EEEBB41FB47E401F9D6BD637FE8D79DD8E37CBF1F96887B5262646E4F5A4528861A98DC8E323ADDCC002599E9CE7B9B6340B6CAB9036278CBF15C9564925244C8F2C732A2FF7637F6E4476EC41AF1222E87DBAD6B4DA05DBF04EB5A4A1D416C6240A5B853D620F602B60F2580C6380D459FCDB2383D412FD24FA7520D55E15EB28C6EFF1AD3176D3F33E30C5B4E5CA0B841BFDB2D1EA57553C922223385C075C13D9112EA5D8D0F86AE07C0FE51BFF00B83AFC78208F4BD7B2068D22552577F71242024ED89D9DAB1D9047E7E3447CFA5E9E6F2F9EEDFC38FDDFC7FBF5755AA18103EEFB7723F0FC7FBC9FC71F3C1C80585DE5D2B029D96563DFF7601BD4D1FF00335524BAEBEE65EF8C8FBD7B58F68B099A0982B32E9A1B118DFB913F9475603CA329075F8D9F3F1A7E5E2650C551BDD4DBBC21B6EE0007DC8493A2C365BC0F23EC9174437A6E638D1B5664C7CF222B45223D391811B82D1755881201558E78E5895180688048C8EF5D18530B150C705B0A09C77DA7001C0EF8040240E57B708475E9BAE912CCC912C8886572A9BB015DB1B8C6724618852467055C76264CF4563F4BEE4F0E68752BA31918CB1B15FF00EE3F1FB43619E6ACD8BC167AAECF8497B3FA258AAAA7B8EB20CDE11487F7EA0BF4499BE6F5EDFD4274BB016B2F7A3AB157EAAF1CC540D264ECCF8C8221073CC3D5ACA64B3325548067A0ACA6C44B5EBE612394FF00569E1B7FFA4BFD3AF04A1D29CCF54A1A915EE7BCA2E721C04B9396679A4C4E130F63116E3C3D584B18AAB5A92B4391BB284162D24F5048ED5E1817D131E234D71991CFE1194298AF1BF4F606C98CFB4CAA480342315F63F1B3E75E3D4B1D2BA785F7415AEDF78910AD4C11D65BEA69B266A2472F2D0C81995409A3490A3C6060C6C602D9CB0A63F17BC491E1F7DA4F585EF47D248C94B52F63D5569BA283417D9E38A1A3BFD3342A643F41552D3ACD0CAE0BFD5A0AD11ED2B11C65746F92E678CE7EB58932F14D0ABA579A95C952ABCEA595637F7AD3C34E19A0935209669D1000E266489DD8144E29D58E436972389C0E1AFF002B9F190C4F7E3E2F55F97435A0B210D776B5C7D72D4C23B8788486D7617578833B0214FED9FA42FA4CEA266A1E49CE3A0DD35CB66B20CD35FCB0E338EA97ED5CFB8CB3E45E92D5FEA7348591DE4BC2C3B95ED62C0769B65D3CE9E74FFA61865E35D3BE05C578371C8964924C5F17C0E2F0156CC890FD96ECD6C5D6AE935993B991AC4C1E5728ACEE4B1F5C68BC2BAC498AD55DA90C033B5E9A91FCE980E47990BC8B0C4D91962AEFDF600C58328D6ADF1A7415C29CD5E9AD2FA9ED7797084D2575D6DD2DA28C97569121A84A692BEAE245DCB0ACA9038622569405F2980DFD36703EA1F53796E371990E9FF24E19C5A5B75ECF20CEF20C15EE366C635250F661C62E56AD39B2572DA44F5164AB0588A0724DA78A38CAB146C74D0C756182B430D5A389A9FB7A94E22161AC95C086BC28BAD2C71A940ABAFF00053B1A3EA65865396E7593B458B45584946124EFC5685E3959490361ECBCB20200DF706F8F1EA0CB31B52BD90C6C719598DC78F5A3BECEE6D6F6002BE411AF217F91F07FA67485BF4CC753F48EF51535CF1B54D54CA81D96207CA8A345188E242CCFB72CCCEC59D980408C5EA0D5571D4D3D39AC0B1454B16D829E32DB54C857CC91D9BEFC8CA15771002A28555525CB33B9074EF07D4EC467B8CF2DA497F8C66F1D6F0F9CAD634EB263EF874B8E9205EE8A78A1769AB588C896B5848AC42C92C48CB8B2CFCA96F92E4AA507615E7C8CD3CCF232192BE32BCAD162AACCE9FDBF7BD858DE6ED3DBDCA8EA3B41F5AF1FABCFA84C57D33F43398722B1768419CBBC7B398AE3752D386B791E5593A231F81A952BF7AB588E2BF717237BB12468B178EC84C515222EB8E9C69B172C3D78D1A4165FBEE4C5B762CFB8416EF941FF004F130DAB368B88C955501BDC5683C6A7A4FABB3C2853EB20A7AD7A86217CC58E66A5FA7577CE4AAB4333227B392DC02E4D8DFD8329EF1159F5C54CC2A8596BEE760A7B6C41A434F2565BE9EE6D73921870551DE3ACB7C55150396850C4DBDD5152E6F44ACAD1E3F9EE42BFDA39B9E9713C1236D58D00CB526703C6BDF92F25A241D31AB3B7E7BBD6CB389E771F3E071192826F72959C361ED42D19566486C5582640DA624284651B23440F3F803181C6A692682AC18DAFEDE1B89D38E698F77624D97B80D6A6A840D33576B12DA42416D2AB9D77681AC87F520E8B74D30B89E3738E4995CAE1309430799AD5EBD1AF5E3CA63AA4356C402C5EC9566282C40E8C5206EE04E95B4A088F83B74A7A0B8EA35A8923863A8A7A1641237AB30C93A280002CD84983380B9F503D12FE920B2545568CF082AE28E59A5A2BDEA6A590C6BFABCD7DBED33C9BBF714EEA00B16EF60E3E7A3B352DD69E1F755A49518ED1D5D17681542865DF861F07C03AD123B89257A01363F590E31426921C374AAE59A0C44B0CB6B9AD782460EA0788AB602D471A10A0AA99E460491BEDED1E97A7D86A7B1FBD6367DF14F58467D39C114F82093C1048EDC9EE2A5BFC0AEB9E2971FF00BA01F1EDE6E73DB3EF9FF6CE7A444B651849DC0C603C6E8C5248DFEDD3238F208DF83E49F1BDEBD32736882858C8AA84B904B7EB7BB18ECF7560A8F7124951751FBC67A75DDDE2588376795DB3965E97A8834DFB551EDBC0C7E054E47E47DC7BF5E966F207D2CDC7682461FEA4787637FA93736D3DD771C1193D6A43F454C95CBFD1BE4D0DA94C90C7CDB38D1C449288F2710C0AC9228249EF9160855CEF44469E06BD103E4B3498FEA0E1FF006C7B46433396A36436C87AEB8CB76D40008D3896941F71D9ED0CBFEED85E97A98BE1C92745587249C53201927802B66000F800718ED8E3AA2FFB4E81FF0050BE22F03D570A676E072EF61B6B331F966625998F249249249EAC1F131FDFA287CAB368824EB5B03C79F1FE23C8F3E3E7E7D4D36656868E5AC26BDC8A91642DB201F2C3F3B3A28BAD93E3E767CFA5E97A389BEF0FC93FA83FD79FCF9EA3B4A079BD8776FE9D431C3140B71CBF2F2891DD8F92CCE49624FC924EF7E7F27D540E5FD50E403AF51F0A4A7868F142F646069D2B5B1909041089227799AFB41EE295D6D6B2A90CDB5DE885E97AD556CC8D4FB599774F006DA48C82790704641F70783EFD136978209E6BAF9F0C5379769AC923F363493CB91510AC89BC1D8EA79565C303C823ACF27EAFB9DCAF23FAA6E3DC7F2B76CCD85E35D31C258C5E312C588E9C76F339CE453646EC90097DB6B96056A95DE7458DDABD4AF1B777B7DC47DE2AA55C7E216FD68231227B8562604C01A3EE218AA95777240EE77919CFE1810085E97A87DE26C9236AABC82EE40ADDA0166202858D42804F000E00EC07038EAED7EC95494B1F847A39E3A6A7476B5C9233A431ABB48CCD233B32A825DA42642C4EE2E4B13B8E7AB4DC5D238F82DC9238D11A59B0B65CA83E659E553212492581DEB6C59B4012C5B6C6AE75F2792975639E885894FEBACC2372C514D9A55AF4BD8A0AF69361D8A907B95095075E97A5E87FC3DFFBDD78F6FA09CE3DB22AE90038FC0703E071D097E90303FCA6D0EF81BD75C4215F1EA01EC37C2E0377018A21600E18AA939DA311656CB5D4863024F0511B5B6F1DD1AB687DDF037A1BD9D01B27E7D2F4BD2F4F16D5FF00C47F01FDFB0FE1D543966CFDE3DFE4FCA7FC9FE3D7FFD9),
 (57,'','yil','Yil',0,NULL),
 (58,'jakob','sabine','Sabine J.',0,NULL),
 (59,'','bj$ouml;rn','Bj&ouml;rn',0,NULL),
 (60,'schenk','david','Dave vom Berg',0,NULL),
 (61,'jung','marcus','Eurus',0,NULL),
 (62,'tessaro','florian','Flo T.',0,NULL),
 (63,'baral','matthias','Tha Baral',0,NULL),
 (64,'schneider','jan','Jan S.',0,NULL),
 (65,'','joseph','Joe',0,NULL),
 (66,'kasper','bj&ouml;rn','Bj&ouml;&ouml;n',0,NULL),
 (67,'k&uuml;rbis','dennis','K&uuml;rbis',0,NULL),
 (68,'jakob','philipp','Fips',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001D000001050101010100000000000000000008000607090A05040203FFC400371000020202020104010303020308030000020301040506071112000813211415223109233216410A245117252633425272A1616271FFC4001D010002020203010000000000000000000007080506040900010203FFC400321100020202010206010400050501000000010203040511120621000713223141141532516108335281911623247173A1FFDA000C03010002110311003F00CB9E03329BEA4B6B316D09081EC0E0E3B1EA27C4971313F71E333D4FFBF5E23EA5FD62C63D1572C6BC853AFB0DE3C751A09B97471DFA7A9CC62AC6650CB342DD5B569159F6554951628DAAF6C97745C60A843CBCE49F611EDDFDB4ED3678F395BDDD59E3EDC2AE3F1D98FD119C4DBB659B6A8E560E69DCAF6B08BCB604D6DFC77AE6177A0D6CAEC4B92B64480CFF00FE89FE99B7752D775AC77BB2D6833B5A9602BE577CC8F0B72DE1B2CB8C7E3BE1CCDA0C652ACFC7E5EFE42EB22D2A322E842DC9124B31AA69A4FCF405BC5F4F75451EA1B34DF318F41616AAA53B2FF8F6258DC54C8ABCA90D72D8F9D52552F24A7926C44CE14830754758B66FA36DF4E3640E2732F0D58EC49EE682C247244B7692181679A2FCCAE5D49648870E68260C54377EC7B52E34F6CDB16BB4F44DFB29C8791DCB53ABB9ECB91C854AB50B00D1B799C4E2B5E20ACD64939AA7DFC9DF3ED11FBB1EB1AEB9AC6DB2EB16475FEF3E33E33313DC7531D773F7F5F53D4F7131313FCCF7E9AFC89CAFC3591DFAC3B8FBDD6F01E5F4DB38CC3E2C72DBCE97C9F8ADB31ACC7B2CCDBFC5C354C68E39F50E19F2D16DED93B39B3616DC6E38D7372C74321B47B754D6A1770BEEDF5CCDE4A189FCFA3729E8BA963CD829F26CD31BA8D9AD2E94D9E9494DCB56ED9A0645C42642FF0053F0E76DDCAC96F397859CA3A466D4CC90C6D2C815102C715582182358900400C70EC286219893E021771F09B932E3C2C7484AFF008E8A5FDB1063C36666773C800C791624EC377D9F1DA19EA2267AFA99998EA23EE3AFF798EE3A9EBAEA626267A8EE66623D95D4EB6E557AE96BEC59682135D2B26B9EC64C2D6B5255066C699C888008C9999C080914F87A8747693DCEDE6EFF001DECD7F2F8EA7F9531929C0D146995AED715F8D39D98B5AC5E3CD4E6B950228B045F034182D8510B848EAFEEFB82FDAC693669EC54696E3CBFB5B42CE2B2DADE3AC399AB7E9AFCAE3AB5DD0B79658AB730EF277E52EE5F5E1E6F58C8D75202925986274D7337D6D8CC6C4638219F279194F0AF8FA411A72EE0F17B01B66BD45600CD388E564425D21975AF168E96E869733747EAB92ADD3D89893D5B594BF05A914A068C3434A0AD1B3DBB72AB37A11B3C1598A959ADC2594B183EC1785757FF00B64E64D0354DFF00335B7AE777E97AD721E336CC4D01A5843D26C5C3C64E0712AB35F235ED611A3771D99A593B2E71410C9D24D8302ACE0E5EE26E50D1F66DC359CCE46E465757C9DAC0E4717FF2B46AB16490B2A8A5458EA7886E36ED3BC9B355D41ECAAE0B3D81C366622B3340FEA09C69A96E0BCC68FA86C980DC71595AF91C6E53177ADD96E2F28BBC6CC945FB89B3F25872EE445EAF93A96EBADA367CE6AC35448221B73FEA37C89CCF95C55FE54CB64D95A8064D58EA994C163AA64588C9950308C7E531D5E5372DD765644954C80C3D8B5D62AA3622A07C88A757F94191EA5A996EA1EA2A76EFF5FD8BE27AD960F58C56F1495A1822C6DA8163AEB145516277AB2548096F5024FA0798DA5F969FE21BC9EF2DFAAF1D53CBEC2E330BD0967015E8E64E530517EB9533B03FBEFD2C92B64EEDEA5918CA476F1F72F57782455B90C92C892C13D2A7BE7E14D7745E41D4773C3D2C6E2A86FB986D0CF6AB4BC548C7E46832941DE055194AAB2361ACEB0C657AA704BB94ADD88684DC4C07BB8678C35EA7CCFC3795D7F5F1A6C46E181CA4D94DFCAD8FEF62F3363256461772FDB0940E1F1371D312BEE3E2F323899E88F2E7DE2EC5FB93ADA666A9E5707A6AF4DD8EA67ACFEB656A3216D163234DF65888ACBB436B2314AA3114A9346A620D969C6E68C216481C3DAED7E50C6F36317C9B7F29635FD730B912C1BACD949E38F36C72F18AB15CD6AAE4E21C1E4F36997312995CDAFDDE06C203BE7FD6573A73C95CB627A8325CFA8B1DD3598A4B5A6B256D58899E4828451ACAC27B856A49146482D20835EA77E5B52BCF55E97EA8F3573BD4DD0B854A9D3D9BB7432656085563AF907C706CBC9E940648EAACD7C4B3C9187F4C59672876780EF7BF1BE6BDD3DB60ACD813639E74D7412A4E19FF002AFA231E323D766B9BBD8F533D19C48C8CF524D7FEA53A86C5B1E278C39171988C8DEC3E08367D5B317ABD573EB63D62EC564F16C6B01732AAF32DCA27E7740242549489C918F6C8F747C9184E5FF735EDD745E3FCC54CDD1D5F9730D91CDDFC7BC62A22C16735900145F608D46850A78DBCFB3614D6A132C5C137CC4C06DBF61DCF56C4685B458BCCAB6B19A8D0CB66F307309B286D0AB4AC4E4E3E393917855FC748B2A1484D94755D913F92712B46273599F2A62F20F2D2612C4F96831DD597E5C2DB13D29E5A3D419538EAC9614C0D2D67B70BFA95246864DB2C6E239109522C9A28B26B9E8FD65107AD4E013A719023D783D5761EE01846C00700FD95041D9F15FF00ED17FAA1EC1ED938134CE1FC8E3F62C855C0333D7F04DC5E7578BACAC46C19EC8E6FE09AEC829268652F650CDC300270C18F19212335EA0BE06F6A584E6FD015C8FB567F378D7E6B33994E2AAE37F460AA189C5DAFD3620157B0391348864EB64D4A52188AABAEB4826B0444B1ABD3B196FF00115E5C60B277F0D93EA0CAD7C8E32D4D4AF5786B5B9A2AF6EBB88EC409346BC2410CAAF1975D02549006BB0F22E9AB96634B11D7AEF1CC3D44676556656EEAC54F71C868EBF83FD9F17C1BCE945C92DFD437E1C2EE928A08AA8B7B96A9AA6D32804CB1884A5DB0E07244B08735C60B93954BD86EF1269191474FF6E7C6B96B156E3789386CEB2D48AE690E17E2901699283E66975A6030BB6C9CC144CF8FD404444788F095EE23789015DCE3ADAC16504B34C6A1AD12CA4440953E5539B322703E251FCAC47AFE3FC4BAF4D3F721B350830B9C63B6C8C17C902BD6EEA8A7B8989EE2964B6195C751D8C8F9751111D97DC11C62C8471AA888844DEC2C7C554721DDB8AB0EEDC89000EDBDFDF6AEB56998FBFD4720689259882BFC77D80A37D837DFD6BBFD4FB3DE2960305FC67C451DC11AFE2E28E3BA6E2985B5C11F255D6D3FC408F631333F713F51331236F3AF0BF02717E2F04CC8715F1FB2D58B172EE6AC54D130CB763E9D32A818FA756B63D38F4BF2396B6760A3F224ABD5A151A7356DBAD253053D5F72390CCDFA38B4E8B97A8572CA901FA960B92EA2D44FF15F656ABF1A5EC7257213FF009B62F57480FCAC7396BF23F549BEE33DC25EE65DF769A48C89E2752D5EEB2F67F2E91381BD79F342B584D451C88BC9152857C4E1C0A14BB4BC5D8B4C5AC1935975BEA2CB5D99A9E3A95AB15C582D3DEB08EC863A516A3E28EA4B2C93CF2C691AAEFD4E0E84146722C3D3F46247B17AE4424585562AB1BE9964B7210C0B2B690A45124AEFCBDAACC8E3BA85331E679CEFE470591C2D7A7611AF1A22A6B5819A18DAF83C58A852E2756A55F154F5BC738176ADD918C7631EF041BADDA1B8050688275EC06BD95CDD99CFD580C1A52AC9622C5B8C91C52D872088B56322B85DFA576D2C8228D4BABACDA3F0D961B4EA9A6B457B438A37B8C85A732AE4EF7E9A5055B0D884366E5BA7493621C0EB969850C75C6C28ED5B611C27F32C3DCA857C68902BB89F8DF60DBF0A5922A5906576A2C271E984D939629426D2B304A4F84915872A3E6996497990AC60625670F1D4AB89AEF2F1E018A962C49979BF6DF21A024D6CB905806E64B30EE6CB14D6B3138863264E00B023F6711F67647B7E38EC6B5A006FE38EEDA760C6616A3915D789A6E8AC7683F7FE3B49EE93290B6CB376C23E3AD526C4C4A2CB1A04A01261B95E0D05F37DCAF914D7D6F0CCABAEE4AD39B91BD8F8AA40DBA12D455C965B1A50EC81DAF8FC8B1D6A0C9FF129D216DF351C9AEF9E4DC7D1C4D65267229F2AC445628AFE27538F03244566C1DAF94555A6BF82D66A5BE482099132D0221D2E863724760E6C271F4595A14849F97CD2440604C529899915CB0A1C2B3018264874F233968F2A8AB6B9CAB11D31656D970AC3DA0175EDEA30D031EF928D72EFDB5EAE476691489E41ED0ADF11B11C7448560348BFBB96B6DDC771AD782138EF9E30B80DB2B236AD9ED64B03B25E6344ED890FC10A9491B6EDBF9BE74384DB69410A9141D3642C9426B3255C4EAFC1FC61B969AFCE56C6ED57472988143E2972165B0AF555BB5A67288B25471516416D872A02B43001C402E70C088AA73401A9E4ABB3F5547E3EC29C73E2CD8C4B62182CA3E63F293A65AE34B95E4C78C81027A6B3A607721379FECBB9DECDCD355ADE2DFF000671B4A9A31A87856BC217F1C00C8A0DAF9253ABB1376ACAD23F3A888D35647B65B8869F5670D8016EADAC9E231B9120FA3CED52AB33C2C428475764E5137B52362A157F691EE1EDC337F292D3B90D4BD6EAB22FAA238E7902CD183B95193914935C8BC63BB1EFA1DF64B7E05FE989EDB73DB1E7367C4693B8E1EC69181666B1F7309C836EC64632972F52D76AD348E5F156B1CB07AB237ED39F66B1FC15EA5914ABE42534219FEA65C27C23EDC3DB7DB76A79CE5A8DF37DCDE2750C5233BB6E332185555BABAB9AD85395A34F054D9765DAE52B55C5A2D58CB2E54364B22B48CDA9FB79E5FE5ED871834B90353D474FCE6CEECCE22BD6D5F1986A35ACD0C755AE342EE4270D4B182F7BAE660C94BB1165EA5A2412E1393F92A0BFA83D6B9CE5EEF7DA07B5CB36CABA6DE5B5D7EC60A286F7433D9DC7EA9716B17352B1BE189D3B345458E258CB2C84B7E3534CE00D91EA1C7752F9C1918ADC625A3D2B17E4B258820B5E963BA7288CADD68E52B34C449939658D78CACA446234E2EC7962472DEAD888A3594A7E57259382AC41DE67F45014551B22155049F7770DBD7C119C31EC2B47C4F12F1BE2F2BCABCE5AC6729695AD7FA8B0985A9A5370F4765BD88A994D8431676E92EE4529CCDEBA4A5DB83B29992539F60C25EC5EAEE697140CA06C65EEE171166ECCDB5D5C86571D4DE5599D0A9D0A7830A565206B1601CA88967F1CC8C44CAF41493AC285F964BD67A57093D8BB23DB9E7B5571C6CCB2D9713C924E5E9CAE65669199F9C8EDCB7C989E5B9151908D5635B922AC6022AAAA71554E0AA07B7E00035F7A1FD8F148E58872ABC982CA261C04B99FEE4C07F6C7A218F189222F29F189FAF1EFEE7B88EA252D7817D184AC224CA048BA883988F21998FF002121FDBD1444753D7F125D599134A7E502011709C0CCC2E2481D1D7944F733E5133FC77F71F7D4CCCCF4CAC227E78111F904457312A31961F5E51DF513253FB07B981FD9FF00A4A667CA1F53C46FB13BF82360F6E3F3AD161F647D123E4771598C93FE96EFAF95EC4E881DBB6B7DC0D7F3B1B03C37998FC8E3B1F6EDE3C9F72E229D87D5480C131F68145F1A0020D312C63260523F2A63CA7C658B9E98395BDFB60CF67B2197CAD3D7ABEB95329947A6EA282AC4B32EC5D83B2766F158B17CA726F73970C1A64AA6934B12847FE741EC3B5ED8EFEAD86C3A754A5AED8DA369CDE567336763C4D5CD271BA6EB75B1DF355A7F9C26AC75CCCE5B25F88FB6818B728555016C28ED29B46BEFB38FB13ABF266099AA6270984C5E67AB18FD67134A69CE32CD7F9A1EBB4755E05036AED072EA3A8BF1EA1A78DBAAE8094766CD6AAE7A8BF50CF405690CB1A8ACB3C8C04523423D7955506F6A85B8ABCBC4192390A850A0B126EF97D96A7D178BEAA9AED6FC4CAB99E2A30B39B70D7691EAC5625278A6E578DF51C6CCE232A5868E857570D7166773DB356C7DAAB6F1759CF5ABF1A215F926A131332B26671305311DC57F2F10FA8F924E008B4ADC79C0994BDC4F85D6E952A7569A2AAE0F248B89AD915CC0A5BE426AA52F898948858AE4FF0007002E41C311EA05F685EC7AA66F4DC46FFB1D8C8D5CD5B68D858A9E455CC4BC3C6443AEA4264A7BF181899EE60623A99B8BD3F8B2EE230C9AA8B306800EBC0A656D28188198EA07A89281EE3F991EBEA63EA6237A973515E7156BB29FC69BFEE805D4348001B0DC887D7D12483ADE8103C4EF45F4FB51536678C11345C829D12012082DF03EB7AF8EFA3C80F14C5CD9EC0AD6670992D828E7F32DC9C2C9C68C3554121A5F5DFC98D6B55598123F45F0C2CFF676111D78CD586C5ED0B95B1379DF051B16205A422766BB2ADCF9226484EBD543AC30CA6466571133F1978981075DCEC5C354AABAF616E35C34964A951344A3F8281880298899899EA627B9F2FDB33DF5310FE7F40ACB74329D151941CC9F601D794478F94C4947F88FFEC99FA8EA3EFD7CB1D9AB94E1D2EA453C46A4543A3A1AD1E3CD4680EC5F8EB4380037E26729D2F8DC932C8F1346C4E83C2C429DF7F7804A02DA27911BD6C9EDE32CDA1FB43E7BDBB20EC4E0B45C84B03C46CE4AF84E2A8D586224661ADB330CB10D1F174F91A407FC5A700733EBAFC1B8DB7A572E64F8EF906B564B711B250C56631970E631D76985EC6CB6BDC4B4FBB49253DE099331F04646D4903D335949D2FD9A16755A4D8AF55200E181368C0C34E20BC8FEE423BEFBFB989FA182998988EBD65B3DCBE7AC5DF7C7B4E335A75A63F23B861B07582887E4DE7656C52C5D16B2BA162C275A6E55909AE8F0237B5200225E51DCCE3B312E62DD9A7244912C545EC1917972492378B8BB9DF1E1A6048E2BA03609EFAA8F5174E55E9BC654B91CB233CF796B188B8D189E290E86BFD3C4E8FCFF0027475E35E7C29C43A7EA199C16431985ABAE6ABA6505E1B0A58D5B2A8E46ED3722FE491452124328FD415277AE3D720BF24D557CF6242B8D00723EFF005390FF00AD2DECB6BB90FC7C3E97BBDFC1629C304D1C53341D232753220B15FCBDFF00E355655CB809281B1605853332673A68D72C453D6CB2D9CBA8C5D2C06021992A830449AB530F8637DFB16AC048D7432201F68AB5300AE8F964DD2E3869464BFD944BB37EE82972AE56953B999E43D0F92F95DC9B52A930CC6D1CADB46BAE5F9936B904AE9612F645604E54CA0CCE6410EEE542E8F5B992B9E7165FD62A27E84C9E131D6E776579F319F8B20DF9323073220F431933904248826662A0B6CC257C64B929F058EAD12BCB63290735EC123823684334B21015235328323B3150149627440D22BB6ECF6CC7FAD675EACC5DB913017325998C73BF16B115442154D565008AC8144AD4109508F442B08542E657AE4E8C9C3D0D5F1190BD56E6372DB3D3ABB2E5E9ADF90625772F5545649A45111080B18DA542CFE3B258D51B8C49AC1F1295E93F8BA717D38CDAC8E71EC15533BC56C7A6D290A5CC64AB6D39160ADB3C800DBF9D1C7F44E94A84D5B3472162CD73E8D89A0A755E07B1115498C32091C4B109032C728722540B276E5A580F1F8EC7B5CF731D62110D72C085E82FDC918F29397A1B25FDD71F51E3F7E3113E3F511D2762B184D04C5DBB07F344AA622844364542C81822A701303E42271E5F45FC8F65132D6C1ADEA5FE3F6D36D72B4524510260C38413CE44CA408E18C64809014444097D17D7A9070B887EC990AD8CC2E3335773B6BE63AB5EB507E40AC3D5E0B7155AF8F1B162659599E5E32A280EA4BF740C1AF74CCA59B8A8672468044E4468062C00DE80FBD7CEC7723B954A2EFAD385D6BF776DEF5AD93B1F2367FB240035BF1CDB3AD9E53149C362ADF964A6F3E3A185AAC9E3B276B10160C8EBA63E3AE16AB42EC5A208AD4D962B36E314A29300CF9CBDACE3762D878829634C939CBBCAF94D7F64C0B4EC589A784C4D9C8DAF9D168C16A96552BADB56982A31BF5365C7925C2AAD68EE993B8691CAFC75BB715EC75B137F0F73FD55F857516D7309B18BC9A66AE529DAAA422D535D8F75F2557B69011B4A4DA15858A4B399EA9E839FDBF9438C33B63165387C5BB6FC8E4B2452F626B3E7198A52E9034CBE2413ECAABB7E2EFE462D7041DC111407F36E98CEA59AE44D147232C93BF750EBC605E4ADB0414765E5C760977D0E3C07865B01999F29E5A54C05B8C85C6DB4015E3657990DA32D770DA2AC21599E3F710CA154A8D4920321B74D5F1771B5346B388B176D50A13570AA4249CC13556898B3085812CD80DF168C108A88C3A8F288F8E6963DC4FBC1F70BA364EC231C7C8F89528C5677C78FBFEEF8B027E1E04F3B953E342D889133F8887EFBF02F2898D0B64F328D833474FB5633158952E9F9349628995402CE7C64A6192C98F212859AFC9645322C911980F97380B59DAD8590A566B0FCC230F2ACEF802C9752426D590B92EEA7FDD8B29181FEDF51D758B8426491EECE91CC8C55DE2695158961BDEDA294776218FB0EC9FE00F1352628DFAEF0D3B46B3F108A4292BB509B007A91F7D6C6BD4527BF707BF8A67E17FEA0BCD396D9EBE99CA9A72DEF9FC421CED4AB7709984AAC80BEB9DEC35D809B446864318358458B1EFE9BE31D595ECBCE7434DD7D19FDA5258AC73D10DFCABD3F8F04A301996484AC4A2260FB89999FE7A98888EE1898DF67FABD7D9179A5C5536D5B48B04C58569B466BFF000392508198044CAC3E40F08161C400947A64FF0050BE0ACBF2F6B3C7BADE233399C3271C19265C1C0897CB716A0A01542C2ABCACEC0A842D0FC0BF3F38B0C9154B412C54F3BA4F37280C35A2678D19943C8A00D72720025986882A91A293A0140DF8F3061B238FC6CD3166BCF00D046602491BDA14290C52350FADAC93B90BAE4E7BF878627DC3F0E72656F830FC85ABDB7F8B169C6232491C8CD98EE015F8E7E2C89291888835F4633131E50505EA8C7D937050FB89FEA09C93C916EE957D2380B936D722E57246113FABE5701B7586E9789AEC3895056B792C39DFB6E6417C58DA167F6B18E58110BC5BEC833D83CACE6AC4D6D971580C55DB2CACEC3B707B5BB2C843AD20285A3A58D2B316652B42E93AEDAB49678B3F2EC933B596BC0DEDF31FC3BC70BD2AAAA8D1DFB378E8CE723E5E914B633DB76456392B7F3B7CCE2FE3A95B23C6AEB078A1B4D5308012B2E6B3ABF8BBF3F4F7562F4CE4563CD5BC61A54ACCD5D5D11E76E53158D9E33B92BC72448ECB198259629406E20F81AF555C92C59E9EA5D40BF815DEF7AD31406492083490BCCD12B1493D12E64D4723348070054B6BC149EF47DC16638D7DACF3DBF17F82AAB6F8EF60D46B5F65FEEFD6C9EE9F368935D55E7E37C5EAE79B8C8AAC914FC9292388254011811ECF7DBFD6C57B81D070395C456A2CC47B50E05FCC01AE6B9AB99D9770DC33395C9185A52C2BDE15E06DB6EFC733D26D930C4AC34C7D383DF4D6B57B80F8D78AF277E6DECFCDFCF1C57C735AAD553A955C8621195CAE5466A035935E558562B1186FC86185C35393F92E14FCD1EAC0F8735FACCE68DE2EB5E96ED58EB981D7B295501334E902F47D433D4F1359A002E72EBE3B62AB70664135C6C3EE32AD6AE364D3E929EAAEA1B7D25E5F59C76323B31D8EA4C8666B4F2CD27FE5C316325E9BC746E38FA4D1C3F93733B5115E33C642918657754336ED8AA969D70CD1435E856A2AD7B9B8B991B4D2DCB12341FE5B0ACCA2A3BB3C617D3850A2A3928BD1E5DF7B5ED0BDB36D4BE38E526F27E7F6B6E2D1B19CE858DD66ED7C662B2772FD6C3D4D86333769DAA9B05FA18E4EC635169FC58D773BAF58448C58952D7ACAC7BBFE63B1CA9EE6399B7907B998FCB6F197ABAF8B6449B5B52C0B635ED371EC3597830F19AA62B0D8E260FD326AFC9DCC94CCAF4EEF4FF935D0B5B058682EF4E52B7722C6514B76658C979EC2D7844F236E5DFBA4E640F80A400001A025B5D439496CCF27E7C839CAEDA0FA036DB20007435BD68761B1AFEF5F5C11ECFF009BF9D765A18CD7F41CE62F07946832C6ED9DC56471BA9D0A44B137DDB39B652F89F24A1194D5A476EEDDEE02B5664CF71637CBBED4B66F6B1AFF0010689C5B7F0AFC6EE8FDE19CC1CBF98C52BF27117E850C35BD57138DD5032B5EDE631F9128C857A141D9F5D4C54D1C9672C4BADD94D26DF05AB68A20AF28815F701101111003D4C07EC888885C75D4F8CC78751FFA667A017DF5C333DC25B0E4697915BD3EFE3B3B31133D82EB3C71F9264CC75D0271392BEF2FFE1D7FB77055EA389A2E9BCC2E22B98E78F1F3D80EEED34D2C95E3F5555A4458751FB071851551DC8F5BD61C544774ACF0C7D478537389ACD7E186452142AAD86F47990DC81643206E47F681EDE27BF8A77DDF3785C967B59D30ACB330AD66B653697E52E8A22C64F335EBAF1E9B0D52056AAE9AFF009F314E9D78F8EBADA7044F6B6C39FC6C16E0BC7EBA0A57C704BBF749831E31D9498CF87525DC97C5F1C8F7E3125D4F94C7DFA1D2360796C57F304653E38AB5480BEFB22B566AB4A07BFF0028FF0095EA623F8EFAFDDDF7E9A01BE02EC9635AFF008FF3FE63540C48AC6C8C00A8648FBE98CF15ACA227A29EFA8F18EA54BC5A59BF3196DCAF24D2B869E47D93EA173BF8F6F1002AA8D050AAAA001A1E1B0CDC5054C6F2AA8912218D59147D28249DE8FF0024EC9F9FA27BF86EEC7C8D9A8BDB3E44DADF8E5EC6A415263FB40CCBE863A0EFCA0A27A898EE3A993932EA0B1E48E51DF5CDC5D5CDDDD7B0AB12EDA92615FB43046B85891410578221F1295ADCDF082918578797A76E62F9295926C29704C99025947914C44B204420A7A3992999E991D4440C944F72423434B91F52CF1E60B3186C7EA390AC6D87DEC4642E330B74225A89BDF856A0DB8EB5243336D357BC72EB5C6BE5C9E89576AD047158F42405A058C3058C7791974082002CE48D90AAA41275F3A06B389BB6E462B489676E47443C8C0715DFA71A06762002C426D8AAEC0241F05271E7B8EC4F143B19A4ECFAD580B6FBCC48EE8FB617E32C76AC3BC02F9B9A166BD81925A0180B7D4E8058C7D68380894F937DCCE9559784C9AA68DF8A39AC70598260FCCCA99262E8D95800C10ADB59F61360BCFA5FC159E3E45273E830DFB8C779DBB1F5F2D92C0E2F7AC67C572CD7C8E87B6560124AB2118DAAE6E372C2A4FC97C88EC535AAEBC454B6C3D8B9128981A9E7F55DAF1D95D275BC06771B7B0B6AD52CD1E5F1674D35EC53F8E2C4C5F183C7D96553ED360AADB798394D4CC03966039A6788A49F8CC54C5B924453CB82AB2A807DC5E21CFDA14A805B8AA85FA9E873F3C75A58E634EFD594A466482706484875E4D244BC6524F1D032715DEDB477E2E4B27BAEA3B5E1F1C9C029155CD3AF65BF078C44A83A61C9AFB119983881EE7F9999EFF6F73113B75B5D5D92DDD5F6D82A18F228152CA553276D4D88E82664CE244A647FF6CC44C884CFA15386B93B8CF5AAF7696739434A5E7ABDB8C5BF1991DC3029C9639548207F1ADE39B910B552DBDEC236A5CB038105FEDFB8F444D1DCF0593BA37B179EC564D76A9826428E4A958AB30A297797F62C3260A523203D4CC441C44CF8C74246C1D735F1C8F60833DAE33C9C871203227A6847F2A807C824127475A3E17AEBCCEAE6B3CED1122B5041521058B02CAFCA67D8DF73210BA1B1A400FCEFC063CFDAC56CDFBCCF63BAC5A050E271D99E68E44C93992412EBBABEB5866EB492B03104A8AF9BFC68F2829147E6134A62224BD4D9C6FEE291A66D1EE8B973A4648723C89B06BBA463C0E2318C5F0F71FE1B4BBF9C3CA18C31F6EEED3A1ECB87B9662402C63F038B0131B4757E67072B70B55E626E979EA59BDA35CE40D517B8E3F4FD834BFD30F2B5E86F98DB184CCD62AB94C4E629D917D2AD42ED52FC60B1472746A5A43D72B68B1CFA47B40E35E3ED56747CB6C76DDA5071D1E935B5B89C766B3F8DBF90AF948CDE60B377283EAA72392C966F25B1DE6822E8B761B676180AAE9AF59412A1E47757F9FDD7F3D7E89E96CB66930D34B84C9588EAA54E9FA095BAB2EF5258B3733571ABE3927B72A61A34AD1CE6E4D0C1905F497D3845885B9D578DE9BC62CF9CCAC35848B1C95D2595E6B7385AB0D48E182AC624B2F1C318946D53D18B947B6504F1C7DE66D43B2360A48BCE0C80E67B2923033122992FB999EBFF00AEFF00999F4BD6AE70BEC17D8E60E8863D9C2D57676ACCA5D9CDB36EDD2EE7320C9110F9ED9E1F3D82C42E484067E1C66268D48293314FC8C6112F5B6183FC20F57986232F51E0E290C69CE258AD48B1B69792073E9F20A7603705DE81D0EFE013279BB8312384C7645D431E2E45752C37D9B899C91BEC744EFBF7F93E372B93DA42B5984DE8850F9140B064E2A320A204847BF33A4D9129885B0DB59B05322E16787A1D396CA8ED9A7F2B69B56D2ACBB67D1B3D8EAE9F28F34DBCAE13214150E0F228064B8D2C0E88A3FC660BF6CCFA7E72A6C08D7483198B216E5EFA992C7C87CFFA7D693082224C48C4BDA7F4AF90BA0159CC752A6090DA360AA6572463332D97ACCDAC8E98D1754AE044DFE60CFE6544914F7330E8EE7EA3D2E10508AD5397DBC527824858376E61C7124020903649277DFBEBDBAF17F6B2F04D13A9F744E92A1F9D3232B03B047F1F477BF8EFBDE6D5BB13025A45E5067313F1944890F944498304A67A293828FF00188199EBA9EBB985B6CB96D9F2BEB30A0E248E7C4E3B490CC18B07C66244A3A92F2EBC7CE223EE7A199F3DD66A1638BF9A77CC3AD6C4632F655BB2606060855383D84CF2755757B8FDC8C7D865BC4F97DF6DC7BC7A920F290C72FB4B7A35F9CC17EE02899883289EFB289FE20C667B8FB889FE3ECBB9F49CA6366C464EE63E442B355B7344FB006FD39388201EE410AAC08F9E40E986886F465E1CCE1EB5846F65BA904C082490644472BF3AD83B52BA1A20EFEFC3D75CDBD19C8BF4AE9FC3925CAFF240E6445DF1F653693D75D83A7A964444781F979751FB49D1B861B766E0CECE3717FAB560AC02115462C8357D2CA5668108777E6204161204496084CC4797522DB6F9B2E22C5674AAD0B46058B9812826178C2FCBEE23C8A403C27C86667A28889EBD5A1E23DAA7BB3D2F45D7F3D80BBA867672946B642FEAD63325472B886649B766BD126DEA5383B64084ACAD9A328A84D86FC0A1B0B09B8CBCD0E9BBD9A85ADD3AF349256285C2145572C74BC39B2FD291A1B6D0F807B78A67EB70F4E5A4F5AD47147333889CB3ACB1C91F072559412A10F121F7C7DDC7E4826B1AB4EC36CEC60D9A9E4F18160C57716A2CA632A3D510E030B756ADFA0862A01CC3001ACA059B258B543888C837F7A9EEC301EDF31D1C79C7B5EB5AE4BBB8E543E16A09A9AC22E2BF203259450C0C1E42C43C5D8AC6100C4AFE1B96A06A8D755ED337127B49E6DDC73617B9EF15AF68BA6E266ADCC9E331398C6E5F63D8D45E0D5E2EA3F02DB58EC5D4B62D00C864DB91FD414B980A7409ED2B7533A3FF00114F0EE3B8E3DEC6B7B5E335FA58CD7394B8138DF3D5A3194C6BD2558D2832BC62787429700A1B18DC4695AF37FCC882BDDA83033D4CFAB763BA12CC300C9E6E2E3141346D0E395919E5246BD5B4EACDA5DEB8C249661BE5C535CABFD5DE66CD9083F4EC7CD0BB480BD9B90415E0E6FA55059A0822362C052DA9A42DE9827DC5D9B8E7A729BF5CCF58BB773340ED5EC831EEBD90758B166E59B360C9AFB2762E4D8B1F90C6B0D8470E8996149CCC4FDCCBDED9BDBE72B7B96E4BC471E718A2C26EB0597739B0DB7DAC760F53D6EB395190D9B64C8A45BF858BA22F48C7C40EB790BAFA78AC5D6BB93BB52ABBE38878C361E6DE40D638FB8FB57765763D9B2C18FC6D5611295F4B9759BF90B3E2D0A98AC7524B72395BCE1F86963EB59B447E29288D4EF15F0F719FB4CE2F7F1268F5EB5FC9652A859E4DDD96B8AD96DD7643A8D498C387C9F475DC1859B15759C2C34978F4B1F69E4FCBE472D7EEB57E46F9456FCC9CAFE5DFAF354E96C648BF9B2EF89BD32056FD3EB329D05D153665560628DD2342AF20645BBAC7AB63E9FAC522225CA5A04C08C437A6ADB0D6A61DC900EFD356FF0035C1DF656F04771CE2F5DF6C3C4DA97126A198BDB4DFD675BAB82CC6F99219565B61BC80F0B5656A2B36CB118E7DB631EAC657B4FF00058A42D5BC8584CDA3FD296E367C58EC84B2D4DBF10555081635ED644082520C35F6F697511DB416B18973DEAAEA6B0204ABB44E52C5A75A6C988B647F7944F978FD914CFF003333D4CF8C7724511D7D7F1C6C86FCE4E7F217B1B6ABFE26A587C9ABF198112E6E6DD8DAF65D71525D812E8E36C863D4D4941033219AACC0ED2313B40C3744E07A4AA63F09D338AA388C6C6A6715A8568EB44AF20F56CCAE91280D3CF239696560D2492485A466249F0B5DCCC5DC8BD9B993B12DBB2C787A93BB396EEA2155DF644403DA89C551469405D78215F93C9586130F600C0C4F7018DC756C4DC04AE267C66C5BCC51B762C5A2FBF90D0352A084294AAD26B6DAB2BD571DEE63BA160A1D77FB931045FDEEFECFB2EFECBB8EFBEE63FEBE97AB8B51A2AC57D289B89D6D95598EB8FC92C493D8EF649D9F9EFE2104B65BDDEAB0D9DE80D004907B76F8F8FF00607C6E6767B96AD65996EC38DB66CDD6C35A5D794C2AC042C63A888111169040C475E1023D788C47AE2D9189B27DCCFF00787C4E7EBBEA6B01448CF5DC48900C8FFD263F8FA8E97A5EB4B9076275DBDA476FE380EDE1CB9BF629FBF6F7FF00DB2EFF00E7EFC54FFF00522D6F156B54D1F71626473B57677EA916572231630992C5DBCCCD5B312046DFC2BF509B8F98608D68BB786459F91D85206CB8CAE267232D1939F22E8E3F999889EBB19888FB99EBF8EE67FEB31E97A5E961F31A345EB1B1C510735AACFA503931863DB3687B89D0D93B275E185F2F998F4BD6DB31E2D682EC93A0256D01FC01B3A03E3675E1D94F43D7247895ACAAC73B31B1647237DAD6F99B5D88A39075054478C00D74584AEC42E07B3708999978040EA732F5D55F03492A1F1011ACBEBA8EE4173624627A888EBEE7FDBFFE75E97A5E895E5877C76449EE7F3546CF73A0A001DFE80F81F03EBC553CC9ED6B14A3B2886C9007600968F675F1B3F7E3AF96325D7158CFEC7BF14968CFF04B1AE2EF19FF00E4490829FE6464A3B8EE263341FF00133EAD84CE7057B43DFEDD315ECD8DDEF95F5255DAB3F0C3B0796C3EB3946D4B233066DFC5BB85AEEA13F20C559B39081128B67D2F4BD12B2201C65A240242EC6FBE88E3A23FB1F5FC7D781445DA45D76EE7E3FBF9FF009FBFE7C57A7F49CE3DD575CF6FFBAF30E3B1C1FEBECCEE59BD1CF3363C1C78FD6F0F8AD772F147151F18953FD4B219597E599F230AE450C62FFB6AAB20D9BF6DD83286DB8D3B12666C6B0A4A24A267E408EBA9298F1FDDFE3D75F51FFE7B5E97AD9179210415FCB4E9915E18A01262AA4B208634883CB2867965708179492392F23B6D9D8966249DF85EFAC5DE4EA6C919199CAD9645E6C5B8A2AC415472274AA3B2A8EC076000F1F9EBD6DED8730D853202C6751242245E431FBBA989EBF777D44C7F111FC475E8756EC5989AB9F74DD6F9D8A3B35839F29E84AF5CB64E05FDFEC50C34C16313320BE87CA623D2F4BD30CA496524EC8AE9A27B91B54DEBF8DFF5E072DF127FF73FFE11AFF8FAF10D3A49E70D322F331192989EFB9EBFFDBCA7FF00BEBD2F4BD2F5C2013B20127E49EE4FFBF8FA2B300006200D6802401FB3E878FFD9),
 (69,'forisch','timo','Schlampe',0,NULL),
 (70,'','marco','Mack-O',0,NULL),
 (71,'w&uuml;rz','rainer','Raineh',0,NULL),
 (72,'h&auml;fner','bastian','Heif',0,NULL),
 (73,'eisenmann','frank','Eise F.',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001C00000202030101000000000000000000000809000705060A0402FFC4002D10000105010001040104020203010100000401020305060708001112131409152122162324311732418191FFC4001C0100010501010100000000000000000000060304050708010200FFC400391100030002010205020402060B00000000010203041112052100061322314151071423326171081524427291163352738182A1A2B1D1F0FFDA000C03010002110311003F00EFE3D7CB9EC6AB51CE6B55EEF8B11CE4457BBD95DF16A2AA2B9DF1455F64F75F6455FF00A45F589D0C36C4515CC1413C02DE4B56747504151A4A34364F1A46852111B9151F034858D6545477FAFE5FD5CBFC2D0DC50CEDB41CDBF65EC4D1B49D0E9CC9A30ADE8EAE1183D1D3BCE7460B640A19458EB4B1A38E60262C968A3B85FC1B57326F9950B3803963A4DCC28269CE63DCCC02A0997156247262CA8514001981650785B47441F8277A2476FA13F43F6DFCF8BF5A60C5D897588DFB240A01A62557E5F1864216470EDF8BA3FAD5EE631D2B5CD7BD5BF14F931BFD15DEB49C6926941FBE29088E08A59C7FB18B3B2021658E29658DAA8E63267433358F56B5AF7472237FF55F614AF3BE5365B0BD53B0873C9661D4CC0070E7EE2C2B2BA504BAD57D44F1A3E42050430DB63215216B6161018C5AE3D26744E6C10456DF3FD8A5861E9367A53C079F7B47596F652557E3CE109018CFB046C0C00AB25FC363E79601E6FC925E4A231EEF810F961624B79BD1E4ADEF9A4E8E0F6D2D7D4E03474797E9B721A3C34396B9213C0C09D0FE27EBF1BD7CEBE4FDBE75FF005A4FC90DC0F8A38BBEA81E57EE321944D1567DF6CA654A8C73AD4305199375C559F656F2DB55BAB476D04129C40963341334E1A726B9DA8785BDB7BFF5EAAD25F76CE73261E052AC7F118809E0385B1A62A2A8B0AB92B8C92C0D85F1C634048F04A44444CE94F2560963589D1D1DFA989DACCB01CB3A1F2D02A66D1674CBAB0B4BAAC12C09DB0D4D551465D68B4D355948D5AC9AC0C263B00C8AAB579024A4903286C00A96553388F29FB1C3B4149CAF5CA3A8C2D25D61ED7A6E7602E13CCD573B172D9D5ADAB96B5B98B790B68625C9F59A525F6B0DC7EEE8C16484C8A8DC8D19EA3D623D3FAB4C64CF24B09158D29D42583D3849C33D2CD067E1955C70B446342AE88BA9CDA8F20E83538D80E5A1CB457B689650412490401F5D03AD9277AECE97C85EE23732F25385656B75C9574DB652369B426C75572F8E2CE35860800E165A28CC8E7FCE2A3586AA1682E82490A3669C7914369801DBCDFA0D374EC3D1EEE8993C357762C8445117F049607C134A3CF1BA489D243346D9617AC24C0E7C2440B1CF1AFC5E889CEFF99F26B60EB0EE95CF36193DAD51F63570F2CE6B4A6D56A3530E60DA774377654B1413A5CE1EBA2632C8687E8AB0270AC2B468D5935954805D6B4EF1BFB269B5FE2CE64FAAA0A2E756C26586FC72A1B6AEB5A006C4DB8B61C117F30A9AD06AF25C9100596D363B628220B241FD89C508E0E157A67507A67F509BB2511E86B8E719E56853F4E2381B8B144ACE2B07691597A66EC6C4B3212A4D8967EFDB7B03B7D803AD0D9F8DF7EE77BEFBEC68E536D49ABB3BF0A9B45516CEA7708A5021CBEF695496112C82B6C467FC2419B3C713C90D27811C48B3405B1CA3CF0ABF7CF41BF8EDCD75FCE373B475F6BC4D6C9A7A6A5BBD8CE6D8932DD8FB92E6B0948B06450D7C14A6037756C1C6889066AE6861E603861CF05090AF420EFB6B066F6194CE96D28C76D092EB2B3EA8E367E01A20855B4CF953DA3524594019C8C7C5112F11E2CB215341049248D2291A19AFAA66D53BE620C28A0F2208055989E1F0EC78EB8962AA3B0501EDB3DBBEBBFDC9D0FF003EDE2C5F53D6163B805F7E451B4A8DC7C35B01EE190B0DCF642F225895CA1B665398E4F785D24D2C28339928ED8A4F9ABDAB9AF4A0656D9560C01209041D107441D7C107B11F20FCF8EF89EA7A9EA7AEF8FBC52B43BF054726C6CB6541614597A526E749A056B8682581ED94906714A8897537E2D680E212DE5897F252688459A08D268DEBB015AC132F43A8E93A6D28936192B04BEAD50EACA63AB6922098F8E4446A967DB9D7124ED9191C500CD6AFE20C282B34844D3734355DCBB87521F578FBDD0E7711C5B8313B7D39D599CCEB4FCC6F41C75ABD65C802D7841D6E8CB9650260D2AEDC1A4C7156238D6A404E21E8C20CFE79ABEB1DAE7A3B6E7DE4883B4326C7E7E7D85254D7BF1B90871A468ED73F4155AA69406968B35A8028EC890145A992CCDB5D14C09F65570C59D86F90630BAED339E3094210AE5C56D8D3CBCCC595C435434CD78FAD5D483233C915F81C483E4D72512D3E4D85D7970DEC8EC3B9D96D003B7C9001EFFB8B1D90011AF07603C8F9B7938FD86D7656FA53F1B7F5E26728F161D8978A1A8E84EAC92C0F2ED03A77807CD6D6FF00BD962CE69269B13C4899F8CE51D5522F5707E435A3D7695B4167B1A3A71F3B3E01F8BD25E34F09F1874B495D9AD208552DA14705525528B29C0569B75636ACFDE8A38D98435E82C388DEF73E31C87719FCA4B8DBB1F4E45F879D9A93215C0E916D68C8A2B4FC7904C9867A1C738F140318D75650259CACAAB27C721020A5C4FDEB965F680CAA931ECE5F4B8DC2DE8E63AA8BE76A05493438920422B68AC34A2ACCB57536C4D7D7FC036D15C692C1E230329E1D54A8A08F3B8D978F942B3C72B92B8EEF17A7E4A6A872102FAED5B11B375353EA189AB02F42E6638AF853800577F3B24E99BBB1235A1A035B0401B03435DC023C69DD170865AF8E3ADE56CA293BA950F3D5CC54EBE2BA580C2F41054035A0CB6B615A65AE881708E9EB2E48789FB91B2B6331F28048CD6CB3F36B63E0F6A52F4EA2D0EF28E8AC000637E94CC85A0D79506C81D79458CC32988AF02E86227B270C03DE54B5B2D612212F68567219120ACABC8BF2760960B5F1E39610673AE7F8FB1B00747644BE5AED1DC162FF00AF4475F131C8D7D557B15E488B5C23A29CD25EA843E38D8C0875FE1F920056491FF8B8A44D4C092E01975088516558983B5CC790D89D19A494AF7A27D6C6CC8AF62A4D2CB3B9C9EA9AF3A79CB0AD9C91C5E9F2CDBE27A8897B4A879E982D0C7A7B70963630A96E14BAD6B5644594E288CD43FF002EF929BA885C9CD0C15E6A524BC79F124114A57BB0246942AFB8824121881E2F3ADC772BC43B01A4C5E6AEB1367CF73E25399B433643433EC0D8439C5B0B382A9C1BA31D844B69609141182D6B4729E01C5132FC9CF2739BF540F25C37A267FC7678B9ED958096D7D42053D78AC615BA0C446D61720454DF22A00091DB3A062CB232CCF9DC64F11EC6BA272F6ADE9D45BEB662E82DA774D1BDFF005836614756D911AE7C91AB066055EC6C8C74BFD657C32CE8E722BA772A23FD58F87CA166D8D26A3326A0C835A483D80AD2D51AF7089F041C98D9FC8A6398F88867BB5AC298F67F5737FF0050F1E68EB94AB65FE74C1AC0CED02831D5908EE088CA2937543C65E8C93800072246C1AD3C8DD1C62D2498CD2A6CAAD4731407B90DCD8B722481BE43B91AF8001AFF008DF991E6AC9BD3F39AAD4324EB176AEA54B5D5D655E5ECD9695D4A8E97323DD5FB2B70B760BC82A560E1396B4C374379341521433590E692C6FC62FD4DA2D164630B754E43F49435B9BC4C2B79735E12DFEB6F6D0EAC4BA96B0AAC8A3AD8FED99B25D363BD0AB902305640D10284D1F3E2C6FF009ED769BA4E676FF1B61B615C0042ACB50B999997A311681D644E2C4D8CD0E75B761A13182C36C0AAE18D05A452D9DDD3D51D312B85E4DE3F5C76A8FA5856242F1515DA687026607462E77A2F4B99989C6C70CAB93BAABCDC59E75A9DFE227414D645D95D8F41631CC3407833C64FEE762F962597D451337A3E65F1EDB617C7BE4D6D8C8955982957AABA96E60BC5E00DE85CF24BB01314EF5AE8B97D0F2DA1466AAB97A41C01C6B32E3DC06C95753ED6463ED620F64D6CF7F0F2F773A7F23365DAFB0F41C74767A7BFB2E6D0E2F9D9ADFC4A8D4B119FB7077B5B6644922C2DAB3451AAB4348DB04B6247854C2511D29566EAA1F98C2B10B9DAF7431FB4A43D5AC47A33DD125917D98C6B9CD4473FD911A8E57222AA7B2AA5BFD263C66D671CA1BAB7DEF22B9CEA5B431CF95D3ECAC4486DE4461322485438B8CFB7752157D5D15459484CC5BA6AEFA26A80CA7851B226B61EC99DD56B396EEB3D86B8FF001FD95A672C87CC5D7D890A565E2C0E7D698B37B2AC29014D8DEB2B7FB31115CDFE5117D59B83857E9F88B8D584A79603BDA2AEE17F30E4B1F52F916BD9E942435AD90CB40ECC1D1027111B227D3E5B2DBDB0EE493DBEFA1BDFD343F8F727C588E2C667C15C48ED4918D918AF9E36FCE377BFC5EDF75FECC77B7F5727BA2FF3ECBFC7A9E95FF3BECFE52C1940E97574715AEA32E65C66EF2C45CD476529A456DB9DF844D93E2DF0830969353CD592195C2B8B600E73479CB71AC2A1827AF2332C40DE06583DB6008B807DA19792D8AB71248E4A4A9236091F3DF507FB2DFF006FF0FBB03F5FB7DFEDE39E4EE20E87977857CC53FC93456C4754E9CFDF6DE219D14F2875F6F58F657565A0F5F7765760E909B096530E108CC0CEB998A36320F6423B59305589E8DD670AB35341A7D36432BD00EADABD4435475CE696D736D2879079AD3334F72138D6D28F62922B6C2BAC11F1A172091CBF92F57E29FD1FAF762AFAADE5795656E3E28685A4D9ADF4CFCE9848A3ADE8CC2429661640AC478071D0AAA7BE496CD5E3B839986C720D07BBB1647AD5993CF3AF6839EE72BB21D26B6D0B08CC7132FC8987100495D79A2B864F6E65AD59D15DB8294996F9A2B0D221642223AB91B04346664727A9BE4751C5E9345321D39A78F3757C65E97284F1E73AA068E4D6D6582728A73F541BD8FB76C20A0EA6FB767E00513927162182E83F71C4A82BDC120B2B7B4EF8F83B4AEFDD67966B25EC3C8A9B41AD9A31ED46AAEB1B7C28339C0D38B5FA8CE5459ABCBB433F657E629AC1B7115756D68751596AF1DE7A9CF1DE34FD26782DE40D2693C7CC0D66F37191976B419646DDFE1581EA8CAEAA1E1961B4B42AE4701222AC2B8912C9A18F024118440E5092120923112726EB6616872EEA6BEADDE5E389A409F4BAC8D2D0FC6672922B6A9068263AAA3356B0218AB49E4AF4084B68E282598A1E10E436621D2376C26E734578ED6990C37FE380B6BCE30BCFD62EA06FF8B69A1D449575C70336568EB8412BEE43B002E490E7942B31AF89AF06B4B4B5634A106B2528F2DF574C4AE6FA9532A9C54FC9E3E47AC15D91722D718F8F73818F8D3349016A4529314098C2B5BF01E2423944921B64A8600FED0C3B6891A007C72DEC7663C8E80F0A5FBB5D6E3B8790B7FCE7336FF8A3751E99ABD25EDA82E636C4AA65D7DC9F224EA37C2282141228A32BEA6318AF953EB56AC91A34EAC978B51E6A4081FDD1A5895902415E34F0FE2A40D911A933E457C92B88965F8311D3FC98E746891A35AC4445A4B90F1B3F9AED3B67491CA8361B7C7871E543754C251D5A9A5B22CFBEBC26B9B64F63CB92579434EE922958212D9D9F42C427D5F108FB179CDE5160F4E48A664F4C7D630A745347799ACFC5033DE4F8AFD17192D7E80E11CA8E4FAE39EB11ABEDF37AAA31CD408EA18F93EA2C31307F3B9A47E673289C790A50813986763CBD39E82FA6DC1399E1CB913E34E795BD2C1C493E4FA8A1C4514AA1752A06815D2ED7B1E47B83B236011B0F0AAB91D5D34EC7CF9FAA94A8D3E51BBEB6492C8D722AB7EB57355ABFC3FE48D472FBAAFF000BFD7F9A935E5E8331AC8D94B57304D30B47490C10FD6C99CD826FF72A7BB5AAE8FD9AACF7473BDE3FFAF746AFA0CF3DE6175DA8E26176ED10848398FCC68CB09314844D0BA1596091913D519F373A746C71239237B9553E4C62FBFAB3F877EA31C6BB196C034F51A37CD0CAC8C8D2255072435734ADF8A3A61C62C82D8888AA923DF0B3E2CF93915EA9FC0D668BE48F43331B2A0B2E01F8252C88DB5654769ABFA7A3F562021D6C68F83CBD305166A6C9BB2AB2239D338215836881F24FDFB8DFC8DF8DEA9BAB3F4B61BCCD93320B38719F20DF739FFF001063E3866B046B115153FE48C34F0A27BAC0C644F67FEB27C9D1735E9EEACE5BE37D8E62BB8DEE747A7BEC654E8D9AA951DBDCECB77A92E1B7BEAE863520EB19E81B0145C96038ED41CEADB19E573A386778DCCC792FA16733F25C54C599F974FD270D09542B0A3D47B39AE667D4C13358E4556BA274AD9DF17C55FED04CC546FC5551E178CBE2B884EE7906F7A665E89DCC32D85DAF71B0D452D9D9FCCAD5DAD7E5035AFD6D39BAA9AC73AEC836BA32824A6CD8045B5A56D91273DF1CA6C73DA3F86F1CAC57ACE3654C7AC10D6CEF54658CDB9D3804B428559558061EA28775150932FC73EFE22593D78E32004AE451948E2C526C88010486EC7900DB1FDD0747DBE1CFF35E8AFD195A4CC695A1546DF39AAD054154911FF96A65704DAEB302F2B5B240312B506D4DE554D1BA589C834F34802913CA3B9DEBD1D4FA3E4F020243B4B49B3D437749A54274AC319570D2B2B418A624892DC890416BA660441250B3A9AC299208B3403BE38489C75812F901447F9CDA6A0C7EC8137237FC8C70E9F55496ED2480DE360EE6D5009E72A4487ED8ECCC8EC94A29D2DD34E1441247BE20BF146B2FCDCBD6F47F032AAF82BA12DD34351CF2621F2D9A567EF565705D4542CAD1852127B2320BA3D92C34AD214120B736535D28623954F717AF473713AA1C3B42D6E9F6CC84F549D569F9565085B4CC288FCE618AB02C58A02AFA635B0A0218820942C0FD412A0773A1DBE46C7D3F88EFE00EF23F9CF94F97E89111C2BADF2ECD734D766A9367481EEF473D56B8D22EDA436DAE2F596141665986D9DA88592E3A5B031D2B1CC896655815AD9E9ADF8FDA5E71CBF8C739C4F46DA65E7D651E64004E9AF0740AC9E384C502B90888D26D9D23E10041C7792314D089962926106161736064F4F57A5741AAAD32FA4F4E6CA7556C826DD446EC429A7697528CC69F7DA729A0D69514003C3738CAC791AB293A6E20AE977C4E876F81AD0FFEDF179E13709C2DF5F82BD234FA3CCC953A3004A11E83FC6084D05AC871CD91432AE3D9A5A84FAD1CCAF065ABB60ED097252D89150DB416DDCE366E8FE3258E78FDB71DA6B8F237BF75DD358E28D85BF5F2F0317CE29F457952F43443C380577F9153C24686F3DC196C8EB12DF624BEB43AF12A1E9DB6FE4A5B77FE44171AE45CC4BE7DCEB2B7666D4E13372BAFADE7163C957D5EA2CAC6DCE8CF887AA4B6A57DBA3C702406A2336315E548344C7C81FE5BBC5C65B0397C017006241953EE22A15969AA2B6C6016C2CAD6D4524EB8AFAA11D7D60647703AB4B38B77D6235818FF008418020EDA85BCD395D17A75B1FA54378F46909DBF211C5CDEA71A3C067DC5985298D3DC6D872CA232328E2D1A41228DCBC45234E4B4F68241041D683121410A47204A0275C81F92DC468378625E445BFF00E18E91A8A8ACE44EC356EBAF2CA120A835359D39F42E32C49B0AFA8274143A7BBA61F4758D00D25E0975B47A451D9230C7115EE6BA4D7397769A0E4F8CB5242CA8FD0F59A3AED1664A1F48602DCFD1509C10318D6B511102486BAE96426EAB5F5EE74E43472E22C340081DA42AE4E8DE5B0F666247A096AA66573628616CC54C759042888D00421580B8C42EC1649274790E5217EB5F64746CFA609764C77627695F14B0DC452004B2732B69591D7C89FE88603FF21E710D88E18E8FEB5926867716C9236BDAAC9D913A3687E5E4F52777EA8532B15E89734B922CD04620F0C6B4E6AD07AAA90EB265A2A9AA971C8B0F699712424FB3B925794C80A480A36DA0A49D711DC6893ED25B63A38F1A7AEE60FC1740DBF4BD3C7A19359B99CB69F6233EACB224032795AF3C5B31A59164888A5B118CA84735E884440C24236359563656DA1D6F889D4F77163E9EA28EF34A4B889A598607E2002F12190C914DBA2888C48E4FAA291F140B27DEF56AA46C555F4AAB1DAC9BA1F089F0A1DCAD75D177DA89BF2EBE713ED61F652B6DE36B1D5F2CB12BCB422186621A91CB2B1AF9923865733E3ABF3F76B2BE1B1E256BC1F4F6B2194F0DB45A6CE5C562CD790932FE3CE556B492813CBB11A6F8BCE1BF263261739AAAE91AF648E5254EAD91997BC726905C5484CCE32D5A804A735AD18B12B2E7FBB82BBB120029D99B58F9233F1FFD1EE9A2B2F5C9C49FAB5664E0B4559AFA6DB6D268900331D020A9DEC0F0FBFA0722E7DBCE175BCEC35A43F3CCB98EC88081704434685B1149F95146F49229BE991CB390AFF931A8D491CAE4FEDE85DE5FFA58F2D32E61D267D72974E46FCC79A5885A4BD8604573A24AAD252B232E358BE4AD8152773163F762B9625562AC6C511B5E15AC8ADF49D4FAFF0032CFD6B8C6C959A5C9E9AA41685F5CC31809D656D446563E088657424150D9B51A8D93D8C45F7F7B6F857917B4CDF56403996D67D2F33BC6936E05C476249957513C49F73E28CC74D2452044AFC9F1A42FF68645744A9F5FC111E367F59E9E96445C5ACEE03E4A2D3264CC58AA825AB2421991559D0B32B0EFA201D9866DFA367249DE3E8D966B3836A76506687DCA55CFB472650C0A91B0495DEBC1A1E62E0B9E62F5587A8B8088FCEC0E1459023E32952D0664D7B601BE31E456B54A9421A234F6FC96344FC591EAE62C8DF7F5F8EDE7C742C978FBACE715FB1D411B0D16727A7CF8D2B03D4C15B44C28920CAFA10830E0B6A60248A7B207F7E9AF4C86B6695F2C75FF002A96036004F9A3D0EEBA3F5B26D175B3D8E8195F93A15CA0F5723E1FC04CFA5B5BC915C3E56ABAC96C6C8C6A0620ABFF0019A33093989210D1BE386EE8F9F9E743A5164C463AC591D1E56FD9ADA649B717359765A49153E5920CE124830C361462CF24534B098C1EC0D0A03A780A2C75431EB962A2F5AD61338B48FAF0AC97D3FCD4A956C67CAABC658A28069B4694505C491E8CC872D79D7AD2F51EBD49456698F802B893AA03FACE285ECEE4302595B515DF6559291BE44F8BA2C2CB7FC1755CFBAAE9E73292FB775EEDFE501B196B6F6A968B4705C05581D5D94366733F288087B58CA1EC9B556D5658D339D08D2C2D250CA0FC85E87B51FC5EF1A70DA0CB65F5548D8AECFBEBCDC1D694CD9B52B617D534FB18E6AD2C3AB73AB87AA1A1AFB16E94C9D860029D3547E3A810057A1E856D75E36D4F00A5C441475396B20B5D77616CA1C475BDF496C7199FB336C4ECF8D723434CE92C922A9B5B42009EB4811C8338286169F55E57A76BADB307A1906644AB936B3E8B5747619ACE57D7E86C5E1A56B9688AA8A6A892B2A2B610CCAE063A2B5819581FD75E1863C0C1DE3AA7A9F49E975C87C4FCDC66D3856B89470894B4291A3C90ADA16585ED09727F6E5D1A25508675D857AB3996019C8650CDF3A5DF16703B0F923B30F9F776EC3C744A37EA9FC4B0AC7B3B1530EBAED3CE469862AEB196D6EEB2CCBE67D0662CEB9682ACDAC02B4EA8A01888EBE29237B4A7965C90B1C5FBBA7A441A4FD547A86544C864B9371FE3E366F2B8EABA328FBAAAD8DD9FA0B814AB0927BB7D8004D6B1F14E04F5C1C109087182C20B0722CCE74492FA9E8CA5E70CC12984EA7D5F5C13B7E4BA79F7714E4377CD4B37BB7EEAAABB6C330DF850E528EDEA47E07CC28C7B807BB0A0D91F7D7D3F96C1493A885CB43D36169CB330BCBB516B56C928ECAD8865C4568348842DE25DD6479E22D4A3AAED6C6A5F0D8D6B6AEC4128A6BC0648E56A5559F2321A2863B0AD952BA92596D191BE48C573C77A42F89974FAC6B16089CA923DED21C4FD1F1159ECE74B144C7D4DD366D8F48A517338EFDA1973FB68B50AD22ED6BCAB41DCE218D85A92C4436531D1C8D4F997F07C8C91D1BBFA20E8997601A3E3D9AAEBFA606CAB2C5B4601C14224E21B6841C37E23A42C90DEEF93221AC11E8C818359B8A62408408D6B7EB6827A6F90AAE721EBD4EF96613C59BAD2D496B90A34810C81C3B2E34D904C7B8050BFA8918D46759BC598C83A54C8AF3E3CF80661C34A15B9305E6154ECA83B0BA08EF04AF32F74282DB57BD092CB0E22267C92DB7E2B5D196D3E494D18894374A5C4D732515F3CAE64E57B3E289558FB0794BF6371675200918F776E41314501C4C693D7D8D700D687098D2D501740DA10D0A471534B0C508912C53BD91C4D4F5B772FF10FCA4E93B0B6D737982672A4E7BE676BBA7363C1E605692AB33A6A6FBD95561651A3669239132F436AB131EE85E122B563432745C3721E3DF20DAFED9714BBEDEDE901FC2E2AE85D4F5B9394F125ADBAADCD5C92647617E21E17EE10484179EA18A379843E281F290A90DDD8BE4BEA5950C75EA78FC315A58C5855E6990C480A57D25A2DD1581E5EABA4E647FAB04F153EA1896AB28136590009A6980F95DE98F6620EC711BF77CFD7589F187B3E6761D7EF38D73DCD54B6A3098EBDE8FA8E870CD6C5E8761A6A1BBCDD5A3048DB61167A972E1076A73ABEB40A492D0C95567B4BC31B28C304ECEFF3971A2C3D26A79D53D6E8DDF188A8E1FB983920972448E97F0CB49209E05995CE7C6E1A78A56395522FE3D282FD3439D63F35A4EC1730882C67D867E9A81D3C89F32631AD2532C2CD88F77BFC18414001F63188D47A0B0FBB7DD888850EB767D9783D21A6F37BB1ED292038A74B9AB363A68A347AAC9F3055CABF5357E6BF18D51CD8FD97EB46237D9B5FF9D716789D6698B849B6C4C7C58D503FA22EC46DA6198801124D39A83A1A52BFDE24E90FC3FBFF005474EC4AB176C5A9A6E6A054CD41D2319B2B0A0A7BBD456054A9EE0EC8F05EE6B2BD53728F07A7628D8735F097F261BED25D682BDF1A7B39EB3C16962684ADF66351CD68CD7BDAD6A248E46A27A1D3B0D8C54BA2B41F355A28593E7F96BFD6E85E042C8663EB3255065B1A30AC89AAD1DAF1C29010635639AF2658BE6D562222D2141E57796FD3AB66A68C4AFA314A9160FCD2647B23818BFD11210E248DF3B953DBDBDE5637FF008EFE3F942FF9CF1DBA03176E7E98C9AFB43AAAF940B820A8BFA3C235AD42C548555ED41E681D2C4E891644589FF072B955C8A3729564AAF950496240F39608B8A2B59B8F1ABA4FD8740924B0008EDB7EDA2FCEEA3FD6CC31F0A630F1C4D435531678AA37AECB29248124F67A05E4C39723A0410DA97ADF8B7E5A7321FAAF8F7A9D5D1F90DC8739606752E31D27F6BB4B0D7E4C77B2097A4F35BDCF415F0D999974B1711ADA6BD141B3828459AF8552A1A9B1926D113415F6BAA22E3517568BBABA083D5B2CA7B5B273CE99078CA8E4B4BC3243AE4710B1992095E8E2200DAD1A11585023322923D5BC79F0DB1BE3AF9896BA2AFBB6CB4E99DDD48FA056B6686A2B6DB257ECB5CF94D8DEC71315AD5CD356B2B26912696035833915668D5D6011C9B99E418FDA524FA1D9E76CB315B16A86B42A68E61E4388439F30B3550EAB454F3A35EEAD9CE8A3021F84F0B5D3D88844639B79DBCBF6CAE95D2BAC749C6CBC8C4CFC34F50E1E0727498AB893E4E3426B105A61F9DC4A6B449C9431A39A3E5BF31E1DF0B3F366CAA6D3AB0B9830A455C90CEC846F886E4490DBE0DC94856EDE31DD3BA3BB03A1A1D6C78E274559A534801B7D4C790931B5A211134B4B38ABCD9EDAB0D8823625498A9D824EC6C720D298CFB189AB6B7B34FA01211F2873097426908DAB3E296B8925911B13DA95E43677C311C210F21E590E9A56CD1CC449F5424FB2AD51BFEB125D4041E08D3568A70E0C1340AE6C633838A0860485E4C0432379100B1FDAE67D13CF0204C79100EFFB114795B480E8CCAF6C770B510825152B16EA0739848AE490892782018B9E6AF9DAF9592C0B0B5D22BA396593E31A39D56E2797E794655B4AB2BCDA4B48DAAC2644745D0C8AB19BA02D2401D89259958E9548BAD5DE809054720ADC982FB7BE811DC7BC6C6D86C773B03441334E29AFAB08BD1E7092CBB38E4B6165ADF7B5812BACC99CD1A39086153B184C6E9A664F0B507731E9F29C7612F99EF9EBD3CDFAF846E3EAA51EE4B1E163248D8059CF662BEBDFF35908184FC70271C809E4C93990CF0A40CF915241F435F0B9F24F4865D42E5642B74ECA565B382AB5B0552180E20156EC3E07B9BE9DC86DF851F2201D8363B720C77D9C1F91F3C7DBBEC7647C9D1FE542E207DF748EFB53CD71EAADB7B78CDB4D85D943B6C9F555CF59A22EC4AB4462134C3023CCE30874D24523A788507E72CD2470CCD9E3B0E43C85A1D7737C556D86AEBC61C233A2EBFE3A1D21258F0C71C8552C76092D66752491A93C2B54245630A39239AC8954573809E37B3379DE7F4FD434E540CD9F606CD9EA58D00100B00F11939DCE150D51A286225F676AB34685355EC203ABAE7ACC4ABDB22683A4EAB6F6E5D7CE094F62584CC749231C8E922F94C9F639A8E4FE655FEC9EFEDEDEED56AA7BFF0029ABFC91E5BE9DD27A5F4DCB6C188EB193850A665CF1A5674A6DA78B3B32FAB394A745144575E74E4ADCD6730B37D27152504A320E7545FDC7608D87E4412149277DD97E15747E7C197B4ED77D6C71696879D767164C6D4490E9644FADAF6A2A39EE7C8AADF755F92A3BDD5113F9F8393D2E3F28B4DD5743B1C25B452590581CD695F626D1D7D8CA08B7810130713239A2192194896216235E8C2E4740AA5B5228D88C572999C6B3F06EBAEE3F3D70C3A4A832FAAC2B18C17B23B22C796767E486210F8A58C734B67CC682792199904B2B657413362FA5E62F909C7CCD3F1CD78B2E086CF5553E2F31D0F34F839E5065EBA236C87CD5912660B4A284BBFDCE301A4D358E5F4DA2DC69F5915B5DFF0084DA44DCE4B13ABA42FCEC8C3C75C5856777A59D5D3D15410801694256C82EEA5F959955126B56ECCD429FA628558BD232BA86266E625213961280A943516C965C7C8CAA241652ACC19E36356AED778C8E9526EF5713F01CF837DA79DE7B7D6B47A11506CAEF84A91C0BF6A1BF655DF8F228F5E07CE652E774263A620725A6B5E9192907B4EC6C8B22369EB5C5E0BCAB7454B72D00F211B2B1B6B5C589F1F937DBDA4118D22454F65F6739CC455F672FB355C889CD0435B6D8F5210613F38484959A5AE47B5AD9D88AAF73847AFF00AC735A88AE855CEF83DDFEB9159FD256752DFA71F94789EB7C248A8DE5A8C4379D523A7B3B0BD9E3227AEADAE0E421B612B8C8D0816040C69E32059BDE404D0894F9AC33C0898A3FA536179E3C9B25FC47F27E6E4E4E0D6D89D37CC9D12B8A99B0859C263E0755C35286D19E4B89E2654E7540325A145567C8A1F061E4EEAAA54748C9650126D5C4A1EC4A860F58B6C81B992EE9A209407E38EBC0DF86E554FCF419EDBA3EBA801A9AB5798558AB090C21A1851CA8E55B386BE18FE688BEC9F7492AB9113E0ABEC9EA80F203F561E3FCFB196745C90E12E2C6B1D357BEEA4904B2D510D646FF00AD3374AC96316AE62E76B468AE2E3F364AE864799106C2208A5F40D79EBE59EFBCBEDE9B98C9549943C43336050F8FA939C4B5F77F091F0A69EDABAB641C690E3D9ECA18A6473475A2B983B1EE964266946DF1DBC2FD1769E994984CA51437DA8B49492A3AF59440AA2A40AB1253EE2F7476C53A0ACA9A4A1AC14CB2B230B9E20C00469E721EAF6A31D60FE11FE1579B3AB749E99D6FF13727FB7E6E3A664BCB1392E0F4FE95320D94F5574A8BE6E62CC87C9C6CBB1C0C6E2D1BCAE11DC35EBFE72C806B87D25C4B1918CDF31147AB5FDABFA24A9F491B4DC5936EDDCA152DA25478C7DE2E7B40D5DB66501198B2FF003F752EC233148B58A69E6056DE0246317E89FE07473404B94B8DB330C1A77113163BD514D6CB9D6F89B247D15B4F57734363616994B98DAD9217D65D4CE2AF32B7424D1CA3D967ECC87CCF96B0B8E6111F33E44897EE915266BF4D5E2FCEFA2D9E4771D9F7B47BBA6872A501ABE67E3FEF3A5F26D35DDE201367A801D7F3ED87F93D9C4659DA85515E599CDD81D85A111895D094F245FCBD57B0E675FC2AD42AFE8EF12616E2840D663ECAA8739A16B3256EF29B55A2AE8EEC0AAB812099E21629205DD4D4DCD69C01F5F695C19E111033564A73963224ED0B4E68B2F524954428AAAA826690946E826DAFEC8D4984657E437B201070EF4E458BBFBF4DA2CDB3A6E5DD994FC121886D8235FBB4405D78D7E29F96D5DFBC0C085C33AEB592ADB265461DB82D0D94F14A93107E5D8F11208889E4FB527A52EA880E4549A565AC6D70AF4EFD97C63E83E2B75DAEA0E84C8C6C3E86779A06C3286B56AF4546AE70A6C1457A48133E0B019EE845286B4058EA784D10BB3AF8803472672F287A557C76113813A41495464AF8E39518F457FB3DBF3F8B91513DBE2AAA8E4FE57D97D915114C9BCC6D7F95BC32FF009BCD3C0FDD538656939C5A90F09A4C17708CD8EC28E0B338525D5F0E88363069268920FF00982D73A72611E296560679A7CB587D5BA7E7DF1B1D3FAC463B98D63C654724AB307520CED5036529546AF30A1A8CABA2DF33A7C688F494C2586D82AFECA10016E2808018EBB01C767B104927C27DB7F1CEB997FA3847DDD855D7C1787C5542FE6632EDCDAA4731E0FDB615DAB2209A68E17A412C8B0D72CF242E2595F00F3C0F967A38F9578A730B82A1AEDEE8C9A7D6D636C42BA12B6B42BF6A94DB63A773CC9CB50A608E6A1083CF5EE855626C111123DD2932224F5936DE62685AB03E67C399851E2C8F8B86CCAF26F4DC335205D8965276E791E409EFF22FE8B377257BF7EFEA6FFBBF3DFE9DFF00CBBFC9DAF0EFE71416BA868C699D1575062EB02AC85BFC7D10C52CAC45FEBECD591E91B5647B5AD57AFBAAFF00DFAAEF1962496EA849DCD727EE932227F6F64459D254444572FBA239EEF66AFBA7B2FB2A2FA9EA7AD9D8E00A1006806A680EC06AC40D01D86801AFB6BC172FC28FA045D0FA0F64FE9E1B178F7F5D7EE934C341036DB258AE91D029257C492C63EB30DCBF63B6CC5ACD0C9F2694FADD351D5D9A4047D8310E11839314C2BE485E7EE98A59AFBB564600A96AB3DCF7A0F45C964ABA873B9FA04ADA06F8BFE5B0E6032934D5609965FBCAE6E8C9BD22D08309B83AB4534E9A626264AD9EA7A8DF3100D9340C0309749E8F498600FA74A799449E89BFD8EF3559BBAE99900424A803C597E55665E9D10ACCA2F7F37CEE14902C90F253D2095D11EA24697B524AFC84DED56401A8E4A4536B039659239226BD924B322A391BFC7C5BEE8AD546A7B7F3FF00CFE5A89FC2227AD339C5CDCD4DE6D2A69AD8FA7AED6013E334A2574C90C5754929E04AAC35AE649F229AC87F17F26358DEF0E490699258D588C9EA7A98CBC5C5CC44C7CBC686541A91668E4C6779334AD3AC98CEAAC84CEA895992BB4A22BAE994115E51DE65191D918368323152034D4100820E8866047D43107E4F8B42E73B4D441C70D7031C5F1F846B33D5F24EF47FC1AAAE955DF2FF00A7AFB35BF1627F088CF64F6F4CA7F4C5C4646C20F2A6F6E73E0DDBB15E3BA6EC0ABB1796DA9B33727D7395E819477C380484459E5F41257B2AB514EA5C2DB7A424B016783ED6CD1CF53D481242641048223A041D103B0D7F2D13DBF8F846C07A63B0F953F1F5DAF7FE7E3A23E15C430391F3FB4B439504ACFE571FCAB13DAA93215C44699B8363BCAA3C2BA89C01039127EC9091574775595D0910BC3BBCED11DF952FEDB0C5EB9C2FD617AAE9BA4F41A7B2BF1E8462721B8EE982A6FD929C7AA89B9CCAF5DD009503951C2AE42A587EE2887CB22FB2CE591F064703990327A9EA0D99867F4901980A60568E3674F426C0D1C7C3391D8B1DB11DB7E3C637EE3FEF42FF00CBA5F6FF002EE7B7C773E115D15FDAB34BA9721932FE190AD8516493DBDBE71A7B3BD9E8ABFF00E2B7FF00E7F1E9B27893B4BE1914F8C862CD5CB04B035EC73E355FB13DD92B15FEEF89DFCA3988E6A391CE45FF00BF53D4F4F31BF737F869FF009F0ED7E9FE203FE1CF5AFE5AEDAF04075ED8DA55EB12768D54793715B0591C55A5742793215116753B55269955ED8D44A9155634556FDCB348D46A49F16CF53D4F5887CE539A79B3CC4A934551D673F4AA8AAA379249D00001B2493FC49FBF807CC2465E400481EB3F60481FB97FF67FCCFDFC7FFFD9),
 (74,'michalski','marco','Mekko',0,NULL);
INSERT INTO `t_spieler` (`SpielerID`,`Name`,`Vorname`,`Nickname`,`TeamID`,`Image100`) VALUES 
 (75,'kaiser','otto','Otto K.',0,NULL),
 (76,'krenn','christian','Christian K.',0,NULL),
 (77,'','tobias','Tobi',0,NULL),
 (78,'klotz','sven','El &Ouml;',0,NULL),
 (79,'kirschner','fabian','Buunsch',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001C0000010501010100000000000000000000070005060809040A03FFC4003210000203000201030402010302070100000304010205061112000721131422310841151623613251092442437181F025FFC4001C0100010501010100000000000000000000050304060708020901FFC40033110002020103020405030304030000000001020311040512210013062231410714325161082342153391527181F092B1C1FFDA000C03010002110311003F00DA8FE45700E29EEBF06D55F538FF000AD1D6FF001F6C6B6CF32B32B2999C5DFD5CC6792C1DC43C1828848A33A19C8BB07CC9DA4F3DA695B5456B7A7AFE3372FCCBFB648A8873B3F3E85B576097D4706D81A402E693245F1082D169BD0F3C4919F20C76ACA9997D0D03133D0B5EEA0EAC3BCF7FD49ED9F2EA69D9F616DBCFD40B094EA3DC68B39AD2FE2F892D942C86AA55BA666228C2DB0C4962B035F516112F65E05FC5EF6FF8FF00B44EF27D6E1D6DBCAC2E51A7AF40F12DAD6588B63627DEAEE6335959292C92D9350B14D41FD8BCB33AD41EB452762CA2755D8B8B1A195F25772C30E3CF02C86371234AD206042C2CC02A5DEE6D814B535B1DAB55BACD08C6C8579A612A328842244E8CDC29EF12E19005BDAC038BF295E491B04A726ACCC4CDE27E3A88BCC7713313D7CFEFF733D751DCFF00733311E9CE3900C9F8C5E7B9FF00D53F3DF73D4F56EA67A9FF00BC773DCC4C7C75D542579AD666264D16B77DCF57888989EE7F758889F1EBE3E67F71131F3132F62E6A5F1998BFCF8F73E36B4CC7C77F8C7749EE27A8F898FD4CFEFE3D116D3858E689340115408F70DEA07375C7A7A9F46C3318004F3C1BAB0C189BABE0557F8BF7E47567EEF84DDDBCE263AFD4FEBAB7511DC444C75F1E5F13331D7EE3E7AE7B3A38AC52DE334EE263C7A989EBCA7E7BEBBEA2267E3AFD47C4CC77E80D9FCDEF11324BF7488FFA67B9B5663E263F7311D7FD5D4FCFCC47713D44391F98AF4A44D09F8CCFE54EE6666D31DF7DF7F1FB9EA2263F7FD7C4C2630DA36A3645A90C01AE39FB821B93F737EBF9ECE4861CD13B79AFCD7AFA922A89AE2EFDEECC0DD547857A56F58BDA9F1DF71113F311F1F331DF5D7F5FFAA3E7E7D439E52518EEA5B44FCDA67AEA27C6BDCC444CCFF5FBFF00B4CCFF0071332C187CA25B25C317924CC56695B478F9D6663BEBCE22266B36AC47CFEE27F5F332F3A2C7DDF549B78DAB13359F999FD4D66B13E5D44FCF51F3DFEE27F7E95896486409B832372431DC7ED7C81649346FD09E2F91D24CC928DC1289A3601A24803D413F481C1F6BAE2BAE20EACF515F2B7533133DCC4CF7FF00C477E33D47EFA9EBBFD75DFA9366EB7731E579EBB8EE23CA2267E6B131E5DFFC4CCF7599EE3BFEE3D0FE319EA126E2245C5DCDFB8B795AB5FDCFE313F111F95BAB75F13FAFEA5E121776A8A22F36A47E5113D4FF00DFCA667E22BDF511E51D4F53D7F532F9E38A800548A27FD55E8483C91640E0D8F6FC5A637F96894AE0DF375B4861EB5649F4B009F7F6346632498A962FDD3FB89BC5A27A9FEFAEFF00E7F71FFDC77E9E2FAD5BD26B16B77F3DC5BA98EE2BD75DFEE27F7DCFC7C4FEE2267D0D331CB04514FAE3F99988ADA6267F7688999EFF0075FD4CF53E53D4FF00C7A719B3659AD9688AC4DFABFE51FBFD7978F711D444D67F7E51D4C45663AEC3490299091B1403B54D151EDF55F2CC2FD4702BF1D3E49C220014972012BBB77A11CAD7A57B9238B3C7BF530ABD311FDCCFCF7DCCC4F7FF00D771F3FBFEBE27F51E97A8FC33208819A692488EED35F8EFFA8EFAFEFA8F99F4BD71DA3EC491F70783F4F23DBF3FE3F3D282423D5829F71F6FA7F3FF006BFDABCBEF0BE55EE66D669F8370CDDB61E661095CFCD6B45C98D6CA1E1360A5E147232044D55990B10B157632EA85D54EA15B62C4B430D5B8E0A8A1C32749BCF898D5E4175DCE40F56F7AD74B48707B15BB0C97BC0AA561A6495156D3E3F567FEB258972857858B145C9F90AA9EB55D73EE34CE7043452B75A175D86AB67C42CD0AE4B290E5171B6CB26D15A4A4CE6CCC103562C58FF77E6693131DC4FC7979475331D751F31FA98FEBE7BEE7A998927E14C5C31A789D7261CE9DDA48DB2965EF848D6421624258A42A02F9D2354BDA01BA03A01A8644A66ED846896958A05313339552FBC853B883C0047E48BE7A31ABCB0F1718E4B6EA263E22F6AF511DC7CCF7368F9EA23BF88FEE3AF5354B964DA91FEECCF7E33489B4775EE7FBFCA3AEBF71FA989989EA23AF55C2A63D27AB4CD6B1F3D4F7131F1DCCC7713E511F8CCCFEE66267E27B9F5CDB1CE72F89675B5F7B4C19A8AFDD2A664D4A0EC48114B610E6F31162586225EBFBEE83B4CFC56664E67CD89838B36664CB1450634666964665540828D93C7363F3F6E6F96B03CCF22C49BDDE464445A249634028E28D93601377C8E38164F73DD3C6E1F984D3DFDBCFC8462607257DE02752DFAF28186C72D20C58A4C4DA94B4DBC67CAD1111F15D3DD0FE6EFB79C0B2B3F5EBC8622FA0C082894B9FA4FE238362A5AC1EBA1889EC504415C3E7346256B545527D615EFF004876CAEF777DE347DD1DB73904F3059CCB59E617C6CC3E8DB378FE624A4D47003335CAD3AD5E2FD0195FA56C26E58B792E4216F3F4EAE7B8BCD10DDC3D9CDD2771EECB41F20F9723E168662D4AC5A7CD101955F9268DEBD5A943B3BBA4E333492DC34BFD29F599F5CF891ACEA934B0E9ED1E9F84F2911346A065188305EE349284A670376C440AB745DDAAEEAD17C13A74104336A0D26566054924877AA40A48DDDA2877166200B62458BDAA383D6CB7B35FF893E1ED73CD0C8DC715CD5341F48383A107B4AC86C5E2150A2FD492AFD4C2E41501EA4645488CED6AD22B11F7130BDFCF68BF979C2B9399BC5E5BB28E0F263EAB52920DB8AD40454D41B4B7D8C5CF47EAA103E6C00EEA4A02416156B6ADAE217AF1B987CD7E92CAF1A6426D6469372217E3AC67E7682CD4D7C6C4B36C6332D9BC6B1D907670093114BCDC249B4960A19DCFE33B942206791F20D60B6B0A5C6A7274D63BDE02A54284EAAEA59065C52E3FF677D76E71EF1F5572689C10380B1D3FC4BAFE973A4873A4CB84A6D31CE3BBBBE9B6B52190B51DE0B0009015859E8E65E81A2674661F97F957A55124076B47B458504DAB707934491C9E00EBDBE63F3D49A10CCA34B3402766A9D530CE1384916F028894B5EA5A12BF956E3B4D266D1359F9F2AC943CB1166FE11F85AD48A5A6D1159989FEE3A89EBC67E667B88F8FD4C47C796AFE32FF0039D6F69B756E0DEE072A268E068EB0D60304613FF31C6D46E9E5F78DE7A4EE9E73F0334C55C5F3750FA4760B4FF6063F2A2BB35A3EEFDB27871B9B09997F105976D659B01575EBA8A4562F174CAF1151DE2D17AC17CE63ED226F76A00311AD4B9B48F13697A8E9D2664B910C3363C265C8472631B5517714DDCBD11B4AD964342ABCDD559AD6899BA464AA2A49362CAC1209D05AB6EAF23D7F69E893C8E486A3448EAFD5F92E3E778D9A7A2D32500E035BC58FF50E6FA63BC8EB6924D2D6998B126BE3148BDEF3E14BCFA9FE472A4591C546588899F1EE7E2D13313DC7C7C4FC447733FF0013D47C75E7C7977BF8EE37BB71B457B901B433D1D37B311D37D532EA67E7588CB41581AC0067B6167434D3C276E8B2232F98AFDDA1B5F4980356B37ED67F2E937F1D4739E6CE271CD7D32670545D1BB85CDBB3AA12B6A6689BF266B7D2A82220EB77462D68924520723AD45E9DE30D3751C89F1F324F9531CC111E4A8A14461B636324DB0C864603FB6AC82A8B1176D24C49B1A38E48C090100B28F3BB1E0ED5553C9516285D1B142875B2DFE533E7AF391CCF51F3F8FCC7FDFE6267FF00DFDFEE57ACE3DAFE4365F1D6E886AEFA2A3365E8CD42D68E7AC68112E4A566C26D90963F31122662BE3168B57B8BD6F5AAF5227C9C047643A96382A769024240A2A2810D5EF5C71CF1C0E9059E4201104A41E6FB60F3E5F720DF35FF006FAC1D4F571795EC318D79DD9DF6B44EB31A956CA852761922DF4D4A8D664EF50153A82086CECA299E2AB3202AA613401DFCE3562E6632396EB97D07104960B4E9CEC9AED5E07E32C58CF32D33793DEB379B1983DA9F35FAB1D47794FF00C5A67FCDEABDC88BCB6CA389A6A81A41848B3AAFE51D9089F669A242D6945C40531D6882D5935067985C80BD0C263483DB9D9C7E5CCED871F4CCF04D06617981C84F9B4A402185DA5EAA29450F761EA1457AD9BA33E3562879FAD35981FC33D7B1317061827C8C0FEA7A9ABCCF0401629A158C3148D31A320463779A479499379F3717BBBD56092652B187098EBB8B48387672A4B3171636EEDAAABE5BFBB0243633EE8723772F94BD878A0A9B8BF245B1AE3D1B38AD9B056DD685C5370DA97B8037AB7428AD71F88EE2A8CF4B01A3073F919B5EE22DECC998E49C1F8CF29DD6F7B8A23C4F2B2ABA0CBE0E41AFA22481F595BF63834DCB64665266D0D2CE9D32087435E2CD5A217849FBC61E4BEE337C7753076576F3323611C041ADB7B2730BF61214738F4BBCAED6785405ACA5C64A14A1D1B1EF4254A52FFB63EF9F06E41EE1F18E36C2FAEF71FE2572729D6E49C827350598271E90BDC6C9088DAB3F4235C88992102EEAE121948B795085929469EB5E23D3DB0B558356D5727E626C157C7C48F526926658FB924FDDC4894458C1D630033F22C28B6A2C5343D34B6A9A5A458F04A1B3F1C4CE22236C6DDB1E59DF9636CC4ECBB27CC547A515A7F14FDC5DC15DAF709DCCCAD1762EC4E3892A0059B07BD6D23A2EB19712A21D6920A2A0ADA9369244CC562D7A027DCAFE328F060F2BB06D18CE0127E96767AF5BDACBD2D735AF66BE9C05615EDE172B561C4C4788FCEF60C1765796FF0027BF8E02DB73035B9BF19C6D0B14E7B51E6C72DCDCC5BCFDD1A95194D5193BAC0E4B6A40C7151D6295AC0E007CFD0E2FC9B8C6CB3EDEF25CFE488E951883B996D05BA8E8C92F6344DC442784FD0B9294A5BC6DF15F3F188B4CE7A8FC419036E442024058B2055DAA23240DA5D95C9228EE6254B359E79035AAF8774A93176C6227CB119B0D26E228000510458600D05142A80E00C55E03C6788EA72E3E1F3138C12F71A7FECCA1628B318EEE7C00C85A4D37086ABCE78DEA3552528329185FC6C2B450951FB05E1D92F9C19D7E41AD1476EAD34D2BE7359CD5AECC885654ADDD71FDA9FBEA8F885A4B5E97B3202B41B888489FBCD99B9C6B94BE57C6CA4CB50C0A24649190D9C2ACE51578A8E266B14BA8404DE623EA5BFDF899A9297968F6B38F6FFB9BB3FE244EE3E0248A8168CF6D13411C44C746879AB8CB39C96A68B4D326D1584AA0820E38525E9140884268F49EC330960F9D93255710E3A17BDAAA8C3CC64EE3137E5608429001E5B9BEAA997172C6A03020C72325A6281230497662000A081EBB6C313C73C51E237C9F92EC719E4B7BE9F1E96AE869CC53552BBD42DE57BDEA42903A22616FA47898BD2C8553705348FA6D0AB59A4ED1FF001EFDEA77DF2FE38E870AC9E47F61A3C1196390AF3A439E3B6D9B9326D77B25BD6425985C0907135272AEAAB8F7FBF7AD0DB02A5AA1D1CB4F7731798F19E66BF17F7299435F48D820D2C2DFE3677DECCD7E3252389244CBB32922D22249CCAD1CB6F34F8F8EFA7A99EED34C176E2C535F1FE0472AF6D38EF19E5583CB38C67EB2EDDACF5F399B58CEBF0E21A492A30FDC89BA67696738C7DF2AEC8C8C2E56AA50264186FD91C4CAD38E03C99539F91684349263C924D098B753B03195918795AD633B830E54B0E836AF819A8B998793048B9508DE71E58C248B3474EA0580149534A6B953B8351BEACBFB93A9CAB678BABC0799E65CCCF134E0486B61B36D174995AB55B5112CE986D42CD74AE0122AA3A66BD466106D6C6AB22AD6D37F63B8DF1FF7587A5C55C6D8CF553AC96792E5EE687FA8907F23EC3350719C76AD089D67EC11E52EDFD2B33565BA59CBFD5284B5AE1BFC9F0CFCD5227197793341C312E1138D3C92AEC67E57216345D7AE6417CF5D3CF1E6340C7369A3738CAD2AEEA95EBB6F3155883CBFDE1F6AF82CE5DBDB0C32BEBEA7166F0FDC85ED6BBB465A037980C9A299F4D9B6868C650D0D02EA6C8673D0D25498A5471424123028869F99A7AEA599AAE76A2DA8430CD781A74CF3E43CF1B22AC2E89376DBB70A52ED93702C1957CC12E10D1CA2208A36190B0EE205DD13820924FA5BD9B63C02A68924105DAFB8DB8B5984DBE67969D936DC0001F61EE0F275A8ACB253AFFE3F438955FC50A5E06E86904DF5572C1AC6FAB62C3275EA2FC678D60728E3D8FA2AE5C2AC513FA1A731CC3678D7DCB96319B0B76CA587A32221F29BCD93158205A29AA4B14111E0632F4686A32A52A69D8AE83E9669B558D8AF046E4EEF91AA815E28F1438AEC6C500032F143E88AB8DBF7527D40F524FF0091D669F05E7DFE3334AA0343504F35E7F71A38A72C096CF92F5A77B1C85548A5965C74F31004E05EA1CF5B9034AC0AD7B788EBED8F0048715E4BFE9B1D73108AF226790B89DF27580656EE0F34B5486D3781AC92F78718D02BFF00E31966341562FD180BE3BF17686DE98D822ED6831A72620F2D7AB08D542083517DF58942081344BEE476ADDC6A435B0EDF52B6A5AE23D88D5E56CE920F1E8E6A63E726D06B3B4249968C359B75653393B2A435AAB882AD595C4F3E6BD9B27D258835005A54B5867E26462E6C0F8323479123D9720B44A64DA3F714323C8AA41F2015BACA924575F1C775D6888D576A958D491C9A2CC1DCB7A58F2F97D8DD826E7C2F9BB5CACCB5F906AECB773343777F4360FC84D449A1D981B6CBD6CD06B5C01C7B2005D179AD3797682A9C8D47DAD45E8AFEDF7B3F1C836794FB53C73301CC05CCF39CC5C3E53A2BAEB138D96099DA78FAA7D1136E8176B3C016B6BBB2353E2B4AA4C0C5121700C53FF69DA7F8BBA3D3CDD7D16B2838EC633157A7EC5A5744C5563ED4B9D432F655465928E8D52FA3732E9BD55D98B8AC598B3DFC77F76B47DB0CFE54207265B89F2BD948A14F91389C7250C6C7DC1EF7A3289EB2EAF2F66198A3ADABA811AEADEAB17EEDAB403D19D375AC07CE964CA940CF87172558B28C3C49F23B62282150C1A58611B4B49DC3E667F33306BE9FE9E71133E04C895E2C78A68BBD2C6B23C8912C83B92AAA8EE07400F145C10085603AEDF7A7F845C5B97F2B592E0DC8DC3E964A595917D233DF61C8371DC75574DED9788B56D2A31BA709345958428500476443AD6828882AFB73FC673FB2688DCDCE4BA2E689E224D986D183016A7E37FA043D5519D88F18988831A4758FC7C3F5D82EDEF1FB99A9C8ADAFEE67B8FEDBE28F07EF9DCC7386C62E315A2922D0B18F79D06A6B05BDA0EDA4D040F923B1B221F7EB80FF00C84E61CAE0C61E8A7B880199017552768C2C5245BC67C2693D54BFA9B2F7BCDE9DC4CCDA96ACCB0CBCDCF8F093182E33A3FEECACAD1C82212B580244528AA4F2A2320A2F9696ABAD4B8A7455783371CB4BDC851D1E4474122ED528D6D4640568B31516480DC74D7FCA8F687807319437AAD8D46A85A28D40EB5A9246720CB169FC626A1A1022881F516FA852DEF6B8AF238785BF8E99B9BEDF60DFDACCEABBB46730A172517CC6EE5393515034DB557D66D7A5C7E6776CDB2A153502B920A45AC40B427ECEDECFDE0CFDF28B9609F050B14A1073D47E5123BC4D6DF3DCC4CC78F7E335EADDC7A90AFCCB9860C147C1B555C8B7D838ADC65CB41F5AC264802F54038238C071956111730AB435263BADE62D6896BFD4B2134C4C232B376A512F6DCEC8D94725372F98A6EABE7F205837F30E1C4C8D606618520EE2D3CBB4C8D4B44D8517E614B40924FD400EB2AFFF0011470F89EEC7B7F8436A3FD5987C0269CD680A80721D06F61A713A12573141F78E53EE7519A0FE9D3E936A929161DAB6F459FE17AD8D8DEDD6B6EF22B909FE49ACE3C008C4D0C42A0C4D6E2B189279A0F5329E6FC2D74CDE1A0B6712A222D57027A6BEF1701E553EFAED6A73A26BE9CF257A7734B420F0C686855921AB24B19B9A8C57648095AB7FF7009022A41A67186AA5AF6E67B58AF28E16E5D1D3478965E7F1DD174095FEEEA6D2D5CCC9269038D67AEA03EBEAB870D29216CCC28259898FB82F7314ACE71D5E2F0C6163432C05B2236926CA1DB18F8E0C86599419586D588B18D0B72C53903705EAA4F1B655EB5ABE5E4453428D2A6363A302ACC228E28124A02C19163DC426EDAADE5BADC675C56E6D9147170E73A2CDB6DAB4FA816051C8103E8E8679675C29B82FFCB66DF39AFB919110DE1B2AE422E7B05564541CF3CE2FA1C29C734CF2E0005DC02788B173744EC104ED6CAB76ABC833418F6339958021E6B051B0F67B177ED60487ABB8E5F2B578AE6657DCE7DB3F773D856A0E5D1B3017769756EFBB8ADDACD28272EBA8D5D7433ECBDC99E61AF93AC17606A5FEE8CFCCF910393FB3B8B8BAFCA364FC356CF2F209CB2326B1B3792FDB68BF3B6759ACD633B30DBACE92F6FA6B164BA63812757179D64185A1F8F91A6E9D365459101CE6C89D131DE36576331F569642F2A01B412630B1104A00118B7556EE666B8D4909F520DC0B2FF1BB602EAB9DB7560904F55CA72F7F5D6CF631B99F204171A220B2BFD57F3816D1F329DF65312A5A08AA3AC1EEE8D8F22DC963922C59F0F0A2F532E41EEAF17F6BF59CE0AD2BC5B49CE3E5B26E3F93C2F0F5576CFDCDE0A4675478AF54D01B08700611A1C60A0259211BB316F4BD48525D41D55D34B6646168C9345B0AF1B4AD256DAAAAF61F8E95072C01FBAEA3FD2370DBE9C557155E9F81FF00199A0E71A5F6CA4ABAD552A4688738D039D519AD50DC965E56A92B1E036340EBACAB4CCC7D3231238EA09692371B67FD5C2D28A4DB3B41213205B704CE912A559BB45C3F5C3572C98633C83A82D3F42B711621A05BC8A6F38529C7DC414CDE488D14438DB0E157CDB2919AF5B575CE25997D52651C6FA4930A80D9855EFAEA53CEE307DB998252616B4FC231B8536C1B96B46D3F269042F6CF3803D5DB16653375EA68AE80E096D6D5B468414604859A76D88C91D17CFB29E996A9918300695233BD7700C8A6464954ADC4EB1A90379278772AB6DDC507A414A87531924FAD6E018901456E040240E5B9E013600BA1E70DDDF70F8DDA8779F33BF6A82BC91A50CCFDE16EB8CAB8A44FAAE17ED18D05AF09C33982A92E515853012CDA9D5ACE0DEE8A5AE2BABA682131648C50290CD28BE8B8E1D164ACD27FC5818A19466F6369866CBD02BD2F41DA47FEDBA0C1FB3A87DD6CBD986702BE75B3FC10E4DA23CB7ABA2C5B4DA1BA20B088C6EAC369159B02C967AF472B7052E3557300A1E9D32694EFF1B54045DBD1B0ACDC184992A050FAFF0052C70422312E8107A2073E9300BC490CA9056AC55488888E64C785AAEF48190644B15BBE3C7D83179378DE15A4DD440059B6902F6B126BA552652CC642A51D18120B0656DB6A790EAC6CD92A49BB03EA24DCDC5F6FF23DE202C17B078FEDEA7122D0BBD518612D3022CD6BF40E58812A99D4B996BA8015E8E342324C901508CD3727DF9B238FC4B253C9C1CB47033825B49554E80153EA8BAF035EA2EA2493159F22F737B4CD6666DDF7E846BCF30E15830547558E3BADCA72D13596BACC40F5C03338B04B9F7A0175DDCF2B1D2EA3221D02235181CB04A0CC580F6B677BC5ACC89761875EA1A0A44EF239A8B4570C9AE52A779B9287F085CB2C50730C2B61128C0857AD3B471F24CF8D8FA78CB5ED63304D933B24523C6DB5CC40D2B8562BB4DB10059E01EADEF06EBFA7369B8BA5E565E3E3E542648E2190A63332B35C6239194248C6CA10EC1B7794D8AE8C33CED85EF612F69BF7E348B45E63B8F9EA6222663E63A8B7C4C4C7C4C4457BA973813FACFBA23376BFD2B0EBE5DC4DE3A899B57E7C7BEFE6B1FBF09F29999998998ABDC438A6BB7A0016816D06ADA9178999B453B9F9EFAF9B5E67A99A4FE3DD6227F53DDD9E1B8F7408BAC48888FC2B5FD77E3FF5CCCCF8F7DDBA8999998B57CA6B31135EA3A9208A1566A5663B98024B822C7BFF002041355F7FF63D5A9A7031CB1AA8B40012D45777A0E4F00D8AB5F6B25AFA956DFF001B96F733445AB7106CF873980A5E751CFDDB721BDD04A6D79AC8EAD3FF004C1369BD22937B5E66663D540E45CDE7170214773D3ECBB0EBB9E46B4019BA3896CE60EE302D02262AB2AA61BB4C663293C36F46443080750566AEADA917E6B8BC0385C722DB744A1C01AC229F9D25AD17AB136024A8E2D33735EF1337B5224431CDCD7BC06969F54DB60DC27DD8368BDCD38E67875F5B4F534C6F20AA82A2CCECDD89760CA58164B4416AB4C5490FAED12A725DD0905A130CD068D640DB88E25F958284821F3040C558C60EE53E7345D412A106D60A1C5D9185FA64F197C6BD3B3F58F0B4F85A7B69506D8575412418DAD659DAC3071F31519619A34DCCD33C6F00B8E190A6EDC99C3B7AC1E41B3F6DC6B319DA06C343586A2793F53545D58204CB6AAE07684392A728D28C95EB48A093A4CD4A5A5025BE29CAF201F4F8EA94D26C4EA12BEB22D06BA396B68290B04D0B8E71B1C19E935AD9CEE819666946F1D380E234360B43EC18D5C6FF008DA5F6FF0094DF95A4A8B9A60783929A082898C8895CB4D973BF98E0346C71E793ED1A46F99461C8225332756E4A5AA3BF709D557FB0066E131C774E8D6939B465301649F2128BC0F2DDD2E477245CAFB4E3AC6BB57165267368AF967309B2E834754E8D631A78C62E141DF4758D86429488E3C8280EE2F6D9818D4281B554B1A1E65E7AC95E39F863E3FF00865AB4BA6F8DFC25AAF87F215D922CBCAC7BC0CBA141F0B3E1DD819B1150487C59D86EA1408204C9CE2599C85ABEB627B50FE9649D7CC5536F894B08E2316CAC94321D717A36B89929757490736192969F06D1B80643882360ABD3170C539FF22C5A39C5B8BF30DCCD09615B318D1C85CA2CDD565983A5A0CABD80BA43866862CD2D3585CEAD69508E28B897AE9353D623554190E4200BE6D9BB8DA39DB305FF00C540E7851C035F05C96F306868FA6E6837571560926FEE092793C935D558E19C83353E1FBD8BC6E998343411B11630DC97BEEEE46A0610C5F46C29CD3240B8DB407E2B7DBB17A9081BD880FA333E1E811ACCA5975FE86CBB51981FE334C259CD950671997D8CFF00B918312D5756829027251E464F2BB54BA454AB6037B73E6A31AF91B3A06CFB28851385EC48A9CBAB35F3801DD0A05520F9CD0AC32D09D3771DAEA06D1719FC0F9C79AC844FA9A0E6A1997F9334F8D974082D57B3DDBB0C345658D12B39E2A4BD54BEA498CA28DDCB7383C65B1D8145F57C718C72E1899E59F2BB2E8D5348D291415438A5FA46E6AE028214124281F200A03461D85A06A0CD45850A20F248A3BA97DC92401D1AD3E561E3CAEB62722C7068F20C412997AC4722BB2B2FAB921D10A958A8BC10D2590698665B0F7A20B5AA22D007BE72B61C940DE54B793BA9892CFE55C7652631CD8ECA575734D7385CCE7D9C171A2B663B57B519749282F7AB161D9C7EC71DA5D0EE76D61C21ADA2F60DDAD1FA7772858B30A161A215322A22D9A71A51EC820EE61C30A49CEC99D921CF02047D533FB02971EE45BF7D4D1A0BFC2E1E7A4EF21004B656C672B323CEE3B6B0496B5BEECB56986A6909DCD97F54BF6AAFDCAA2143A4C4449670EB95032A832CAA641147B96E5090AC8AA23277A2C6C0EF2EAA6CB59977807C13AEFC46F18687E0AF0E4324BAAEB79698B03B165C7811A9F27327215F6626242B24D3B72555580DCC6BA7FC8E27CFFDE6E46D72CE3E41D7243C834EA0DA7B2AF9F44570B816F33FFE832E4576434BE72B63B4B20E99630D21A8B4A97704C5B5E33C5BDBCF6A30892473FD55AA9432DD03AA90EF958DF78C7D6D39C01B60338B90924206AF32D94F5A78D93A2352B02BFD363F90DA192B072F8962E26522A2F40289AAA87E98034A4D4740AD5140C628AC75589AF5DD7A8889ACCC85F91FB93EE0F2A55C16BFD95324A19867C8005ABE131FFB3400473258F898EFCE626226623E7B40CC89026361638C7C48576A96ED472B805492D228DC0DD90176B0B65BBB03DA2F85DFA2BF849F0EF0932B5BC693C73E29F95647D4B58897FA661CF245B1DF4ED1943E2298D8B3433E6BE5CF1B81246D1300044F6DEF6DF8CEE3ACADCB78F1724AC94E91E75528F009664D41DEF24F3A4062629E05893562B35B795A23D42B67F929C7D1BCA7C415BF22D0A44D057050B4CFFA933158929C94ADCA38B4FF00ECD6D5BC7C4187F17F55EF9370648BA06301621885BDED021FD389FCAFF168B4F8D6B5F89AFCF8C57B89898888987BE3BC405955156EB068C92B16EA662F2214DBBEEC4EAB5F2BCCF5589AD6D11DCFE3698F126658C63AB4B34AF608EDA858B8A036312ECEC2B9DC0A9A20D8BE02F87BF4A9A3E2EBAD26A39B99A869F0CE648E090C7144D187B5493E5E289DDB6800812A0FB823CBD4F2FC8396731D01EDF2C7EECB1148A239C2FC12CF15A7E02B02266054EE63CC97B5CC5988B12E498F2926F1E58B134316D159EAB311D4751113DFE1FBEAD3F8FC753FF331FBF508CD5680F19B47D498EEB5EFE6222DF1F33F3E531FBEE23A99F9FF00E666BE98C6298F38EEB3F158EA933F133E5DCCF975E5DCFEFC6623E63FBF4127662A4451A283E8AB4A1770F41EA492392CC58B73CF5B63C39A369DA0E9F8BA769F8F0E1E16246B1C30431A471228038DA8AAA093C9A1E62492093CD9CE1BCA974604325E9E15988F1BD6B68988EBB898B7944F73DFEE3F5FA89F8989DF32E05ED37BBB98047907D44DE5095324F22D5D36D53D66B7F2114768E8736A567E95E0829FDFD39EA3AA2A7E5075A69F427C6E4BC06B6F299998ACF56B4C4FC44444CCCCF7F3E33113E53D435AFEEBEB5B50A603561811D195EB582562B0156695FCAB33116B5E2BD5BB9EBBB4FCFEFD3448F255C3C6550ADB170D6CB5B688DBCA9F37A004DFDB8E9D78874FF0B78974BC8D07C51A4E06B7A5E6A187234FD4B121CCC6994AF24C53AB2874FA91D69E36A78D9586E130D9F6DB9FFB63AAFF001AC3C1E43CE31ACD1B4F336D1E566C5884DD25A02934AADB79202B8B40664ED09108CDF569E141D29510D7A25F1DF78C8F6650C562A2250EC06D5BD3EA77022DAB4B566DE5358B0FC26D5EFAFA9E731111688F4BD131267500E2377E033106D8F9793542CDF3407BFE2B15EA3FA02F8159F9F979B8D97E2CD360CBC8927874FC3D5A238B871CAE1D71F1CE4E24F91D9883EC8FBD34B2050033B11672EEF9EA2EAE3BD34B9CCF652BA27829CF58B32DD76ADDDEEB9407389665155E582D18E2AB81114B52D4421D38393B04CAE49968027EBACBE7E4E8C8DE9BBA361BBE7B8C588C80F6BAC48FAA1A4CD2A0A52D136F3ADE6D33E97A5EAC1FAE660DE60AE4286E428D8E685DD0B5078F700FB0EBC32527B910B35FBDC59FE3B02FF81E9F6F6E8ADCD78D67668781329C9C56D04B90683239B0482B9F237C59E844C1016BD8610149F04BDEF36B4C45E05D0E24BFC7B60A9F122055B4845A9BBAEE3631F75A58FF007D64EB34AC4F55A8C0A8A83ACC5BC222D15EA262217A5EA3A84BE8D39725CFCCEDB6258ED59E72AB66F8040207A02057A0EB717E81111BE362B32AB347E16D71A3665059189C352C848B562ACCA4AD121981344F578F8F71AC91A48B521B9586EC3B188624927F29EA629131E3589FFE267BFEFD0DB9B3A737239C589A87381735617056295240A3F192CCF979DADFBBCFC773D75D44447A5E97A8CA92678D492547708526D6D47068F1C7B7DBDBAF6F32005C51B405B542768AB3B873C75092842BE7686A5074B361B5E05248F2A53B1DAFF14EE3E62DFA99999EBE3B9EA3A8366DC86B52C525EF7396084B4DA7BB5884B797FC444FC47511F111D7A5E97A5FD4CA4F2414009E481E6E05FA0E0703EDD311C7640E051E071FCE31FF00A2475269BD875B4D7A9FCFC622D1DC4445A2B111FDC4753DFEFF007EBE5F58931DCDA67BADE7AEE7AF8AD663A8EFE23BFF00F77E97A5E91F53183C8DA4D7B580B46BF1EDD3D24F939FB7FF003A62D3213FC94D3CEDE211C5871DCFC7713131FBEA627AEFF5DF97CF7FAE853847210FC86969FC6BBDA35AFF007E310C16B111DCCF5F8D623A8EA3E3F5E97A5E97C6FECCE7DF62F3EFF52F41350661958B4CC3F7E61EA7D045C0F5EA4B93A0D8572D685BC565C72DD79DE3E658BC7F568FD4444477F3D447733E97A5E97A7BD334924DABFB8FEDFC9BEE9F9EBFFFD9),
 (80,'boese','lars','Lars B.',0,NULL),
 (81,'fai&szlig;t','daniel','Nachbar vom Berg',0,NULL),
 (82,'','','Nachbar vom Nachbar',0,NULL),
 (83,'schmidt','markus','Schmiddi',44,NULL),
 (84,'oberknapp','dirk','Dirk O.',0,NULL),
 (85,'hytrek','florian','Flo vom Berg',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001D00000202030101010000000000000000000809000705060A040302FFC4003310000104020103030400050402030000000301020405060711081213001421091522311623323351172441520A25344261FFC4001C0100030100030101000000000000000000050607080304090102FFC400331100020201030303030301080300000000010203041105122100061322314107145115326181081623243342719162B1F0FFDA000C03010002110311003F00135F949BEFD6B16AABA8E28E40264B50E4B2E454D284B262BD2BD22AD4AB16249885FF0079102D7AC67CB1305351408462E6E0ECF996F5E1160F77456F7164E9A4B68943652DC269A0B2206047B52AA84321B0A44675C098352B46F7940C42AA7899899BBB2BB76E5E5B8A8AAABAFBCAB2D9CEC8032E88D5F4D26BE9C4F7ABC14F4D536E2005B058674674782E1C4085924E318C67900F56495F80D0321C68F1AD27C8BCA55BBA7BF2CC3D0BEA4E670C258757040D860B4913D4A06567BA3D6CA381ED38E1155C89EBCA983B7EE58A234D9B4FB159218BEE9C58513A6A260C428678CAB101D8576876BAB85762D82AC44510C98C07C6C62A5D8001FF006640E0FA739FDDC0DD93C75EFDAD9A65B3B1DA0C1B61E537B716955F759F89C29B716B6B062823AD69F261C6AE912CB0698E3953D872902D6CAB004813DE16000373877CEB69E63AD6C29F3BC52B9F7ADCCF11157D8D42A11F124E438B4823EBE419C35148611887962EE8932314C26BE3BCCAD220971D69B0ACAE66D5D867131F171ED740CD23D2418E0B38E7B6BCC8A145AB130CC91315AF98EFB7C77926948A22B588D3B5A3109ADFBEB5CDF15D7799CFCF76B65956116B68D517DAFF005257C835FD7E6395D85938D06AF279B5ECB2FB6E3D5C9026DD65241B18509D2B6B94421CE7A26B6FA75DB74F51FA7EBDBBDCB0FDDE9D25344D4232C4ED9639E2B75D2AB2925A58E4840450C4C61910B2E301EF43D2E6D6B4F855E468E359517EE2424E318DDB7D8385191BBF2A46720756C53D67577B96BF56D853E9FC69E2C45A56D766D726C074946CC2B2C833AC4C99149CBB27C4E66616D456B676550B72E64B5256D5C186791C015FEB68CA706DF38E44A7C6EDF5BD2DA8A445B0B0997945B1AAB2785436A6B8B134B878FB317B0CA28E242913CD1664A88C3B8C173FBA0498E8742BF5997F530CD721BD7015D7F9132C2FC36376DC4327B8AFD4F1EA51C7952295B5579532ACA7569E4923D74D28454118DE33CB86E462814848E8FEA46D7341C88EDE9FABE763B1A7F92C64E136D95888D04EBD6D8320E470A5DE4BC3640241E2B4C61BE93DBA23A20E2B21F8951BD4B5F4BFB452C56BD16937E8DCAACB34772B5B9BEE0B42374324A637891857673E38C23209170372850D4083E9A6997D7105BB725865199C6C0091B5002A231C1500280C1B8058B723A5C5BF65E510B4D56332CA48F4596DC65F0967D7865211928C330C51254C8CC31123583E241E66B5554AF20DAF94F793E14539D420858DD8DBC910127CC240AA8E6789AE3886E9439E56C6EE4440388B15CC7B988D57B15CC72AA3D5AEEBED41ADF76573EA364E81FE16D1647392FBFD439D8ED7CE8D291B631EB4D4790563007578A44CB00D4CC580DB0852A5A03DD45F72F933122FD443A2A8FD3ACFC7BFD36BB2E7DA8730BA2CDC4F26638479B4D2545DC2C332E2C6448CDC92A85358C4300626590393804C922961055E1D421D5668D84F6527ABA778CC73A8162E3C691D759405CFAA466927656258EE25B24F264F6C58EDAD321ADFEB6EB8924920509B23FF00509750782046AA08E338E002323A749D93E7BD2D6CFD51D4C0EAC16B430A364D0C35ECB28A92AD077F87DCD58A34B86D73CB080C9B631E4F9668C6D91EC0CC8E8F285E82ABFEA6110F337FE8CEA38F187DDD40698D5D9ADCCE1BDAAD959D63510BADF3B6B05E46BFBC72B1687225B959E3F24D4EE7388F77718D925146B0D712A86871BC89F0B1DC2E9ECCD7102C60CAC722CDC69913EE15B650A59A2DCC0BE8F1873CB2A33E2986C4770046BA5A94B55EF3D675BBAFA43D0D93D834E495A17736C4D653DA123E3CD998DECCA5ACD958E446B989C001F7CC772D0A4E909E1811DF2E42BDC46B42641FA7DDC737746B162C5A8D68D9A7A9DDEDE9925CC022A8E8EF0B5A819B7C522C985944C030F1E047C81D2F69FAD4BACF6BEA4F29CBE9DA87DC471C4A7D71C6F1053B47FB8C2F286CE1494248CF27459DD48F517A2FA79D69B3B4266575453F556DFCBB16CD31D144FBDE2F6F89EC4C7AAF31C62464F412467865AF8B7F8467F1967F30E6C275C710ACE21CAAF7FA45F5F1EA15267DC2FBA7ED216968718C27B01D86C1AF13D58DF198828C5BFB46054CE55772E29FB18BDBC111396D595C16E65A5BA8ED7D5C564C058EB6839FD396BA419405BAD3D96D66452D91D64F252C6FE09939F0C9E7EE73C28AF7B955395572FAB8D19FEDE5496B9CD4721C6067998ABCF2E18DEF720D8E4F1AABB847A2A35153E1385AFE8165BC33D71232982DCB1792369118C7285983601E7D4CEB9C0E011F8C70EB773EDA7AD220061B35A2963C73965CAB00307DC042413C12063E7A6D96FF005DFDF469C5241D17A0E3477222A0A6BB66DB1D1DCAF2AB3419A5308AD54E3B5190048D44E3977FC4F4A9A454E38470DF11B6201B8225788F2AB55CD2F6FF00311BD806A767EB8454E51DDC88BDA8DF53D32A599B6AFAEC1E072269707F6FFE27F3FF00BFE721BF588CF2C8E49C649DB927D39270A7DF078C9F9FCF5D546B8E9E96164D5D5B71F65965895B6F1E09B22B75C29CB1A7C799322593EC62A1497E7E156BE646FF006BE664FF000B42D1B9A14CF930FC66B99E5BF8B616EDA61DA49AAC7D961224820CCB68AC0B2C6AE52C0B61381511DA01BDF39918CD87154679B1A508683C766F5DB05F2321CAECA462F3F1225156D4DF4CC6645C0ECA8E74B56CA12E5516F6AE290659ED568C9614F6068539850F819C91C8CF8641B565E0DA7F642566338165767135F6520259644B664C9F1281654A6AF497412416516B5FDC5F6A14659545A89A67B9638632F2E5F245ACEBD36B94B48B3A85BA4E9E1863BB583CE25FBC91AC411CC21635AA89E56650CA1BD1B15DF6A604B6BCCAF623AF2460169061C9277A97550C546400F8C8249195F57A4125376F5DF390ECBCC72C89433AB21E1B467385A39B1072A271142E803181EE19A4396C158E94F6C7386395C80776B011C0D10596D6D373993269AB25490C16982915B5CC2B54F1451C63413D7CAAE4029154CA073DC0EE6F6B955AC635B630689D6D49595008E6942B6736C2F9E62763D934725ED8638AA2463DA21844842A191CA4715AE5555444F452609ABA831AA96485851BCE5672D3398845E49DA9DCA45573DCF5E79573B8554737E5C8E545F4DB44D328F6FE994F4E8D517EDE28E2418CBCB2A2A2CD667E7F7492EF63903764B0CEE27AD17A4E925EAC50C09B6BD78537945C292CA3217000C9277B1C91B893EE08EB0BA330895F67834370F90F84232D81DAD932634674B1C6746119B15E8E46CA70BB5862BC48A8C7BD8DFEA6AB9FFF00D31F1865867C7C3288722BB1BC9CC80B7AEAF10671E79624722C27821DAB0B0254A59EA8A057F74EEF295B5FD8F547A25DAA69429DF151A3447F8DCA8AD457AA2AA235BCAA2F0BFAE53954E79445454E1C77D377AABD63D2BE532F33CBABC532EE6D7BA34398618CA4A26F958F92B1DC63A0E3124B1A2621C6DF270AE6B9CD139CAD2D629D44826B76D1D9760764442C5DB72F2107B6C0C4B6738083239C07FD1DA688FDBD6DA1951B67908412322304C31C0009206719E3F23AE9FDBD0BE2398E9E0E21B2BEE70ECCA01C23BEADD0BDF85C2219EC962320C8CEF7BBB14A927CE05277BBC6D6B908E501D6B74DF77AB71EC975DDFD346B7D79994456BECBCA3390D3AB782D15E35E57CC8D5596D528524B25418F09B62D13A23BB862647F57AE49FF00916EA29F92C3C3753EA0B8CA4A328A35F66B96DB3297148D257F94F6406023C89D31A327F70CEF6C0631AE731C646ABBD32AC0B6B69BEB4301B2A8B67EB2CB59635EBF730E196C1C822D4C9921ED5615B3042B1AD9B1C8AEF6E7345108AE6708EFC951562F43A3DAF11D32492091D88465AF3574970AA5D165655321380AAD9F1820E09CE7AFC4435CB315C1AE5267A2C1E394A4B148F0872A8AD1C68DBFC6A339272C7824A81D70235FBBA7E29B4F60E97B620F15CF6B5F678B563EFDCC0D6E7D42B18B1638E79482120EC1D1A595214E6B166306460E479C23731771C3E2DD647D31F58FA92ADF243930F5C516E0A18A2E4B2DB2F5165D062E4A288C41BDEE904C2F27C880BD8D47942120DCD70D5FC3BAEA53E953945A750B8E5243A105AD2C43CF3506537916B4F88D5D1C99D19E2B6CA6D6C648DF5156282128AC1591ED674B9358CAD1D71D240C8A04576AA8FA37AD1A5C2873719B4D6BB75729C028F27C36DEC2FF0010BCC5F64D3596036916B2DAD46CB456D1E4D6AD0CE85628C9D0091219392C4910654803ACBE9B5AF46B5F4C0BABD8D3EB4FA86A84A23EA4FA5B930D6B0E1F7D89E3880DD69A10CE92B44D249E20020E8FDA9774EB1DC29151B8FA2CB5E143A908DDE996B0248E157940DB1492895B706C832A1008236F4983A46B2145CBF12A2BF91DD5F2F209DAFB2B7AB3C6E1E3BB0A249C332169D0ED6B13C1519259B9FDEA8D4F0A2AAAAB111ABEF24A0BAA1CA6DB14BB138169516F3A86C55A22338B4AE985AE96D3204663F952584AD7B0637BD1CCF1231CAA89E8CC8D8BE5BABF6265F81E4215A9BE8130CE208C3789C926AECD63CE9224137BD15C52A9233DA4ED4789796A76395A496EDAFD57A936664BBD67B60E579AEDC8D55B7308C50CA3655D148D85455D95DB4C9CC3BDA2F3C0C9AD6E23C71BFC91633223B867735AD23EE90B1C3ABDB3758D181EBA5B31B026C49B02308ABC5C095E533B2A72115577B3EC424A6EA73793B7B4EB4A8649AA587A4D82368E0AE491C055300249E7D5B71C8C0A98AF45597DE52C4B8B9C8B1BC60D62D49712BAD2749872DF5E5631634B7C537B6381A65F2358C304655417739A9DC89EA7AA6B2DDB5B2F30C82C6F6DADED033651B87C70B9FE18CC6A23871C4AA1E1EC131E88D737862A7F4A709EA7A64FEF15B0710681A39841C446C4D7A498C60A8432BC2EB134855417318099CEDE3194D314A796B4A1B8C8531819E338079038E33FC75D7F16B76E6C8D696FD3960B8164331988DEBAD2DB5D4EC8B17A3C96E61A4E1DC43B9914850C1C832D21016D3DB535608E0B35AB6D694F3A4AC5701C1AF51BA6F636798466FE40C1B1B7C7B585AD0331E55951734C63ED1025462D34F8F6030C41554258ED8F2780C99233A3A0C29516518AF7E7A4E717B82446679AA6C6445BFA7AAB6A6A18976C45BC955B1ABE70EB63D26C8959BC4CB5F0AA5D288718A9B1F6478F6F18325F396194915E3A6B8B6DD361AE725D80DD312614DB2CD94D6192C9C86F6D4B99CA2C62D74EAE858FE493A7DAB815764199797164230E2C9B09EF71C44F33147E5C8ADAC4DA9C1DDDDB9F77A92697734F92DD4B93C55EB490CE958E9F0DB8E691041269F2296F2450CE19678E058A2566942EEC11CD058DB248D132E515BD2A911CC200DA412AE543A13860483824656B61B521FBD54D73D9E16945014ECFDB88C688445E17E15155AAA8BF1DED5EE454EE54E4A9BE0C3A88C869256478231A3DC67AA302C1A3515AD7AAAAA37B78EC5555E55C89FE7D5379262D2714D905598AC892583F7D041DCA58CF14D90A56AC6735792A05CAE8EE46F3DAC1F627E93BAF0CDF0287995355A5B4E7071EAF8E49F6A001146E9CD0850A16148C7F72C76F0FF231BFDC554676F1EB7D69DA82EADFA6EA6251E0B95D6779158489B645127A581C31524A29F62411F8EB5A76F3A59D17CB5D524124704B12EE098691573B88E0228C86183923F69F614AD7EC6C7AD2DD20503E6DBF85DC924C18672406237E3BD65BD8C03D9C23913B1C4677223517B7F65EE87E9C36F755590CFC0F4CD2B72BCA59592EC928DB6B5756799140CEF30412EE6556C1F71CAA318134B1294AA308DCE2BD8C7AEAC82EB2B9D22445C2F1F76358556A2478B6236A4459CE6728D7F84401F906F7A7EBC8D311795472B3857307FA7CEFFCD7A67DBB86ECF83673233E25D40FBEB146F3FDC6A02F69A5024456B93BDA6689AF1B5AE441958C72B9EADF97EDF2A3C32CD1453D268D87DB48DB5D8B26543842A51B83B46E273B41F71D10D2E45B52BD50E60B643A4561948AE8EA088C38719788C9B559F272A4E3248E865D83A937E60F9F4AD5B9B61B9AEB3B78329F06563B3286CABB204334CA35F0D79A1A9A6B1EAD550C889E68D23961A3948272117BA8FA2C74FC6C1B4151DD679A571EC17226D382251DF64D1A3CEDAB91D73C5E75BAC864986E9F570E5A9DC906A24150C30890AF870189182DD8B28FA9174B1BEF4B1A4D06DBD7BAFB68DE5749A0A47ECBA9282B29F309F0A58214334BEE8F65160DAAB5FDB2E2B643E27CB881320FC6F50BA83EB43BF753E55330DD902A1B2ADACB7978FD9C8870202BE048AA9922BA512BE545420AC2379E3B94671CB514A02325098F42F717AAFAE69B1CA29697A3C92C15D44D766AF2AD892377DC151A23B245001DA56663B00DAA0B2E7A22345D6F51D0F54694AD1BD2D98ABEDB924B0A6C8DC1635644510CA8EC8543C61814F76C3AF5D27F55FABEF367EA8CB30AC42C2342BDBAAA930EBA5908D0B5EF6BD2492B3DD3D59E04B158E31477948C08E724679482179489C97F54D89406E998BB9B10832714B3D7BBBB14AFC93057468E089866CE8749780C864D1100826C1A9CBE4D063D712AB009D95F7D4334246BA3A54A0FA6CD13D54D76FCAC816F1A40A48AC123C869DAABE3723DBDC9CA2F63D8BFF644EEE15AA9DCA9C39547FD53A7EB6C13A66CAB58428B84E359A1BA908793BF14C52592CEE2DB1D9B5F71607CF338298493597169676D084274944045872E1428A52466A13D4C755BBA5D9B82DBB0AC7CD144059C2B3CAF2C104359433655DD249422C6497323061B727A65D3F50B9DBDD9FDC3A05F5132DFAF5583C4EA22466983CB2CC0F330F3A5210908A61950486408EF149CBAF5738D6F9B5EA47785E0710B0C874DD76638C6738EE51518C514C4C7312DE94E99CC11DBDC32CA1E44CA3872ECCF5E1911EB6DABE24C0C785692AB56556B4FBD6AEA28592627AF72F1C004DD84B1974BD25D4CC7C37E2C6818E6C789978ECE1469130DEDF235A3D831A9E0C9754FB61548A4C925A57BAB4447B3DC4572DCFF00A7AC12E2BAF6E458DD562D79ADF6508D905D56D340898A366028A68A3C19081FB85862C5AFAB34D96158850C68704EE5138A02AE3D0F979B5DC0D9F0A509AD8F8E5E63B9194C4891643EAE08EE4D885ADB3126462BE03FDF5B627E4B28A31D857B442942785065454A7EF3D73BDF51EEAECFD360AFA76B3DA7534FD2F4DB966DB886F2D8AB24711B6C8A0D68E46F1212CCC156652DE85E730EA7135887BC74982031181C6A302C6A409125314EECA370CBEC0CBC6324FB0E3ABB6BBA2BC0E524E0FF0010932B340B1971A65E0B17C765364D81DCDB3B003967DD9678DF026581A03DB388B28CB1BDE1430BDCA40893D195AFB7EE9C5C6E3933ED77454F9098E7238B8FCE24D8B795C8AD1D4DECA9828F572A5594AAF18234E3DA24EB02161F2B62787ECD819EB3CDF83EB352BB6A9D987BAA2B15AC4904E90F6E5F9A11346E164F0CB5F51304B1170CD14909F13C7B593D381D4D13469645593C44EF557C892419DC15B383C8FF0083C82304FB9EAE1DE9A96F35567B8C47D93A52F71B143CBACAC312C39D8C6511E8A682D31D08EFE56336F2E0646B9058C13C78484AB8F6725F28F1D921AE745215E6F7E594FAFA651565BAE659D46A9A9AC31AD71E998156E199A60B3AD66A44AE0DA6395B79911071255B37C31AEECBED736E61C29AE0C6089E938027FD4BBAE3C9FAB9DBD0AF31EB2BDABC070BAB1D26195A963281E39257A48B9BD620DC27866D94970C2864469D20428A1739158E6FA58F236CEE2A242B6B33FC906174B8F3DD1ACE536F219E6C4F22443CB83783B08F3080F31BDBFBD11982715EF1B58F7BD5D7EAFF0040EE1D32E2691ACF9E95F792CD4A5DC2BFE6AAB452835CB3545581566DA92344F0232858C1C396E9D352ECF92A58923A8F1CC802332918092AE0B2C6FC0750C106DE338254719263F57FA431BB1D418F6CDA686C06614195AD343B81C3A4A6A9CAAB2641917524639D0A2C264E8F1E1405911A4DB493488F66F4A7119A5EF09029C17291DED004257A111CC2467888A9C39A8AE6B5A46F3FB735159F29CF722F771F29EB46CB370ED3CB2B9F5F955B06EE004E23B2036BEBEBC6F305C9D8AF043871E2AB883528868D1B58C57315A8A8EFC3571EC0A9ADB5C799ED8303EF2345F32B5232086C0B88D1C86A2B46E32C86F8DA428D0825546B88AD7A223F763769F7176DE87169BDC0F564B11D9534E2D3E433415615451B44AE9013E520C9E311058C920B36702B1D81A3DFA5A2CB62D598C836248854CB31AE8A236590C99C618E1C281E9F502093CDC392632739047277384C4EE8F1F8460468BDC8F5601381ABBFA7972355DFBF9555445D56A2D8D8A5BA91F1E419A48924207471B4AE04A5135A02386E20BCA26395CAF6A3B9445FC5394E16F7A7B1AFBD8227B883E546C1AB396B51555BDA8AD5E7E7B953844E7872AFED15794C35B6331BCE79A756063470BCC790AD4E05186884213F06AB915A3473B86B579F946B7F5E9E9B518995694DBA28F6925D4FA95C6390DB8E49C8C81F919CF243D41584256D4611D8B8DC188DA53805540CF0C001807803DC75EBD3792D40738D393F79D62E778D50E5F8FDBE511A0D640AB9D6C18B3446951E135AD58958E9715AE84F701EC70C057A3E4395CE7BBA64EAB3A91E99772E25955F7489A5E83A84DD38AD6C0B7B666B5E9D9FB34157018A11922E413E46052E96543145148868FF0074F13DC35F685E06EF1F29D3A8B37CC4626619066D2E2A8D472DED80091A7D845454471A08A5781B08076A3D58530D48E62791D1D115A8D669D1BEF7EA2E2B293A76E94F5E2CEAAA8950F20CC69F0885250F90C98A58A2B8CAF6566D7D65C59C89E44145799CEAAA3AF8CA0AAA6863120C7EBED889BEC614AF2C9185790FDAD69A386598B1491A5B3609CD687D1B5890CC7202EC1CF46E0559544D6E72AF1822B0219ABA897C68C8D0824C8DB5430C6D0081B9F031D36EFA7D757981EDC81E28B87556B5C9EAC71896B8C54468D5F50C53339F7106BE3B021AF60CCC208B00435644EE633956A89E4B6BAE8E93F5D752D6EDBEBEDB7AEB5046CAB10878EE477173891AEF2DB53D3FDC995336AACE0DC63528512032C2190D08F7490644AA9829260491791AB9C4C1292BAB5DB2325AAC7F18CC014EC939186AD2840D0CE1B9CE96C39A907EC4A76151CD395C7311EBC3BCAE6A317D2EEEB5F77DAE1982E82DBF6A739B01D9D9BEC7D6C1119ACF0D6D8E3A1A7918F9DA4417911D70CAECB0856B8EE6387063B44CE508E74635F03CB35AA1545D486ED6B095AE1FB8F1D98DF72E1E229E575219D7072557918CF462BE8BA7772CD5347D6E735609582B5887FC3CB4444B5F3BB2A03C91A020F19C05F8E88FD67F4EAE93F1AC2F1BC4AC7AEF876D63419E4CCF9B24183E211564A58D157E3F6B4B22AB24CA724AD3413C7AC1C80C8991CE48B37FDD346F731A8B8D93D3B7D2AFA4B912B2BABB3CA3A9CCBADEBD6BCF8EC9D894F61566024DAEB47BAEEBF0C818FC08827D856C19CC4B89762F7C88BFC98A5F1BD5AA1333CADF7C82935AF6BC1291851BC6AE46F0EE17F255E3FE3844EC73BBBE3B9386F2DF140BB2011807391EF7898ABC3B972911ADE539E7B59DE9DFCA7CB9396FCFF570728DAD42FC536A91D7D2A8CDAA2225DB346808AECAB12A0512BB33AF0AAA3250ED0B81EC0742755EC2EDAD13559A4F25DB53326D9CCFE1449A30B858B31246C5540520606E3ED83C74CD6C3AD8C4A9E4BE06B2E95FA73C330F0A7FEBA8FF00D35C4EC481EE572BCC798FA46B8E62B7B11EE545F86353B9DFBF53D2EF00493469204AAD63D55387211151538454546AAF0A9FAE15557E3F7C70893D165A1A8900BDDBCCC7962D7AC0249C6721640A3E785C28F6180381C13454F4A69B542A9C28FB784E002BC658163EC396249CE4F39E814956900CD2230A66F2F57A2351AAE46F6FEF85555E5ABC70AEF8F9E1513F6BAE588A14C62354CD2353854520D13BB8F96A3BB3854554FD70A8AE54472AFC76A09551B1320255C8BCB78B2696A03532AC1B3A615BC489ED6916252C70A2295F2A520DC8E71061181888E378D5CC63B090FA828E58439E6A8BD6C144463E77DB6412088ECE14A17CA0B4831BC4D731CEF2F8D188E6ABDCD570DA476ADA8D849A685643E5AB3B579D0C251E2B0589F0F20379414219325940C300401D47935FEDCBE58416E31FB782CC006DC78CE02863807209C60FBF4464FA18927C8E6B951155E22091CA88A8BCB1AE6F727F52A2A7C72D6B5555157E385ADEF6822D539ACC96A235BD3291860B8E8574982A9C77104B1DE377E4D4569150CAE7271DCD339AC44C2C7DE55D06BA9AFAD6A2FE0E37904A3C4A7C98B476094565320106C9D0E259F85619A5C17147EEE334AE911D8563C836B5EC73AF197698EE6548134696194C28D18356398F5455623FB5C8AEE515A9C239BFD4D772D722AFC21C86C09C6D9CF8E44CB297051C3654E028C73EA01B9240619C7C98D37548E0918549E39A270CB2C0B2EE0EA76B0664390DF8C819078C8C8C6BD89EE6D7D599954E1B5B6E06AD94357458E3539A343281A9D904928AD44490E62B95A1791E74F0BFBFB1CAD4799B11902C609185ED70E501C37393FE5A4627F5227C39385E11579E38EEEDE13E550E7384029E48EEE3B46932B26326C6903FC5EA4013BD8AE5122AFEFF00172AB95118EE1ED5F94532F5467DF7DC76B6C01255E23058E2B14BDDE22353C6413B9456A28C8D78FB55151AA9CA223939405AB69F95322BEE7F506936FA83160411838208CA9C9E580CF1C74D9A76A2D2B60855858021431CAA95C36558607AF248C719E38E7ABB6554CD8F05D590DC608DCD51B0A0EEFECB99F8B5AAD72A31CAD5F855E3E1111A88A8BC591AB715CFB1C280387A5C53B2D8A2FB9DB54DF5A5399E08EF79A38C82AE9311F2DC13BDA40FB8228C0F571181739794F1E257D48C7B0D60C6153F6E45FCB8737FC73F3CFC351513B579445572AF1EAEB5DD959550FDBD0D631A746B58D33918C6B5553FB9D8D6FCAAA729CF91BDAA9DEEE5CE54F422B4BE38E586489E77982AC8AC84899801B776170CBEC4A938CE4F3927A36272007042152A1187C64F3B549C01827273FC0F8EAEA876797D3568EAEF735BFB924D60A08A1D8D91E439FE47BDCD1C92BDEF3CB6F7BD5E9EE1E44FFA2235CEE49EFA9B6394F3FE9658127B511CBAB369EB9CAA378D8CF30D6440C8E86D4CC7AF0AC21817F20865E115EEE1C4472F08A3474BFACF29EA1F31B3B691E67D461F1E1D84BF231CF4913A69A40A143611DFC91276479263115BD810B1AA5FEEA3BD307EBDB1E8F27A2DB0C1AC1623C72B23C569CC18AC1306F130D632158D6358D791EC1348EF3997C85562BBBFC6C10D02EB10455ED6975D112376D4A9D99A181551546F036B85C12DE3249C83C363F824AAC9318A7B6EC582213148C727D3962C7393C30C71FB0F23F940586E42B658AD1C68C652234031A995CE771F8AF8D3F0FF008EC731ABF0D547773D1513E3D5F78362EF1C69777664AF89555E17CFB7B8BC963AFA8AC8435E4B2264E90E1042246FC239CE6AB95A8D631E47235461E9135F64396E4A4D7CD7BDF231EB0955D60F77CA8C5064BC5EE08AAA88C610436953B9785691BF28DE51759FA886EECD758EDDD7FA23019F1AB35D0B13C6F34917157EC6D9BB2FF8A4B36292C4C52C7334755444ABB1A98608844706747B29C490E4201B1CBBE99151AE6AE9CB1B599C4D62357936A08D7748F211824222950A00CB390BF0485CEE6EE69033EA76C3324691451401C82F3C81556367395541EECC47A429C6588C97F9AF5BBD2BEA37E3B55712337C8D99263EB93D55D60D830EDA8274065FDFE2B21C097673A9A72963DDE2D71148C3D78B9600451B8832B1EE9EA8DE9A73BE9FA0EB93D56EAC5AB6FF0023ACC9EEC74F2E68FC850E3D65ED2F963B1488AA835C92DF24968D455447CA7FFF00657224F435248C2A87B564371908630A0FA785054903DBE7E7F81D2D9D7B5773BD21AAAAD8603D4D8CEC38CEE19C1FE067FA8EB75D95A270CDA9122C5CA60C978624A35808D5B2161924AC98CD60436DD8369A7C262A31E708A442905EC1319380CEE450B323E96327C30F15F43418FE4F8B888E64E73238AE234482573067F06B2BEA6BA88C7900AF43CA853EFACDBE21CD5B059E213D1C416AE3B25A311AD503085091394776B5C42477B555DF08E1B84D56F289F90DBDCAADE557111B1464896D88AD72386650BF845E5ED62F0C5E7E5115CD545F8E5579545E38F5EA0774FD0AEC1EF8F3D8347F49D4EC936FF53D31DABC86CB9CB5A96243E19A52CFB9DDA32EE07A988F7C1547B8EF698BEAC3448C088DB7615B3C10786191C020F24F23DFA56B45D1DE7E5C7AD1F13109A28B95C26B216B1BFAD140D53985CC78B6D2E8EEA1E466C8ADB20A4B3AF5AA9E922CC7494B6554AA816CE89568A1999DC43A33C98D6B1477B36360B1F26802990A763F22A33B642B70119165C59B171CB748F614D3E494A1896CE257CE83184F972AA23BC0F84F623122D852E5F739AB245EC78F411A6D5D6C0A469644FB81B619E249AE87019FFCD7CB42980D13D5A2714A3714821B1EF6895B9B0DEA98F456DB6D96B8B635538E46913E9B516374726F320A780BDAD5B7BACE0135245E6530E32BA6BAA696B878E79C628423BD0696CB98BBB3FB29F77D48F58B9A0F7C21FB3A627D2E2934C12D99EC448CC63BCC6D246AAC6189BFC049AC4BE420848E3D8EE9A5F799967A65246A72285C4CF2B91B8EC5558DD72CC092449BF08368CBE4F40D6DBD4FB4F0DA191737D87DEC9C3CB34D591F298D5AC951407471C4005E47AF9361231F992591CAE036C9A912631AEF633A5BC4F63074D059D44C7736B9D6B3A6B5A62907695A033889E034B0A1A4572B9FC76C918DE296F0B7BBB1CF3B11548C7A23634DF94FD418245261392ECFCCACB5E62F4F5F92D4DC6177A0A091B0726C6ED63E575F16E9F91D943A7B3C66CDB067489FE3055656F7C7055C1AD64220A72D5CA3A768977D63EB4AC8F1F35C7599738990E7C6881640B4A01D3446A49BB844B7AD3C7862B02001DE39F16500B2CA760D15B2C2264E3E95F627D4EEF0D3AF56EE5ED4B5A4DC86C55A74EFCF058AF05F5324903D80B24786114891CB2BC4DB3C3292514861D56F4FFA84B47636A73421AB9633089D5A59A135BCED23C7BCF8C1556099003C800C863C9B954D5E5BC39559F83D387BD3955E113B9113F7C7289DCE554572BBF5CAA1198460D12F58C90AACEC1318F78C85472AFCF29C33B139E3B5794472F0BC276B5BC2BFF10BA783C3034749B1296C42D6A3463CBABE6D14C635CBF8B49614E2B98528AEE5BF9B60D70DEA8AAD1A39519E88DD45D396DBB99E18743906AF3ABD506347DD5D923B93954E5E59B43043DBC2FCA388D55EDE17E7BBD3A58FA2DDF5A74B246DA38F4B1679FCB0984940007477650A0804F2548C827907A7ED33EA7766588947EB0019006552B28954E012A63085810C4AF1BBD8E3271D6DDACB68E59A7586A6C56436057DB4E0C8B0410982248745E06C190CD6A19230D8AF6A3515C8D23D5EAC777AB1D78F563B9FEFFA73148B2E48D65C8B765B4C0ABD111E959552C4D2BD5FF9AAA9A7A2339FDA31EBF1CAF067E8CFA65932915758ED2D9114164921086A7C2858E363302AA8A2102D6C6FAF27CA39111AE7BC78A8DA273BC6C6978454BFBA8FFA56613755982AEBCD3B9B677731A4496584CCAF3C8A4C725451C5E403B3C691988D7B443908E208B6F5AC88745784E8673A33D15D3E99416F5FA35B54BF474DB0D60B59B53CC8D0446388BE6599E5488801005642D96C20F49E4DD9FA874EBE95624A496AF011AF8A18A03B9F2C14801C8392CC78299C3127DB3D7143D31F523B2AF3A84DF98C6257789E331763621B162459769E1836B04981E116D93B6262B64871305956530316998EC38E64912244EB9032BD83B0642729D5BDFA53BCFF00497A7ACAF6B63D916B0DB345599EE8AC4E1EC6C5ADA855471B2591B0316B4F69770E2141E0899CDA44A3B02C69817CD8691D9025810834203AB5FA7EEA0DED956116F925FC8D5D906BF0FF000CCE26B9A1C749F77C4619E5488B8CB623D0545573696C4F209497808F7038009B3E31AAE789F1161BA1E9C733B5CCEB3A7FD4D945B372FC03440E9930DBDDBAFAABEB7A98188444E2FA46545AC8561F7B895B1121032488F0D9C26B011AADE090AD13A9FDC5FD9FABC95C5CA7A92470D28BFCC5D81C8B125182BCEEEBB4A3D7716830ACD1A38601BC80B37023563EA1C9AC55974DB8B309AE3010A30C8AD2BD989957202B36D0AECE48C6328481C9E61319FA77757B96D3C5B8A6E9DB6FDDC07A3A332D29F04CB2CAB259A2AF8A4921588299809C1F70846A49135AD7AA2A2B06F6BC4C9EBBC5A4EB1B4F031EC66BB33CEB2BB1CB29F1AA0ABC92DB0F4B60D05BDEC6AB8AEB7B18492FEDB35ED358965314B320C7393C48E46287C4E74F49EBD8D4902AFF0070B509028502432EAE7C8A02624CC71227AC0DDE8555E78038E9963EE1644453A85462AAAA4E20C92028390652739F719F7FF9EB9682351B33266FED0178751F288BDBDD0EB08ADF94E3B7BC847A271F0E7B953F7EB65A78E275E895588BDC3011DFE5CEF1777CAFEFE553E7854E79FF00288A93D4F5E8668CCC604CB138AB2E324F1C45D648BCAA4BE541F5D7F703E4BE7FEFE7F3D6AAE8EC1944E4572B8726505AAE545546B9CA77BB9E117BDE47AB9CF4E15786FEBB53D6D43860B1C66F032D9E509A218241AAF2D78CA37239AEE79554EDFC5395E78FDF2BF3EA7A9E8BC8AA449955398933900E7320CE73EF9F9CFBFCF43C923C601200F1E00E00F50F61F1FD3A5C14B82D1D2D7DDEC8C73DDE3399D199AD2DC51903157228911E40020E530CB1E440BB08C28A21C89115B6421B94619C31B46D615F8A665737F8263B91CEF69EF2D23B0B223323F960B1EA8BCB82198F9656397FE5CE3BDDC7E3CF6FE3EA7A9EB8B620A1190AA084970768E3D6BEDC71FD3AE62EE65725D89230496249030003CF2000001F0063AB930A3C7B83C78D3EAEA8A37391BDCD84C111AD457276B483735DC7089F0AABFF00E71F1E99E74DEB5DAAAD1B9AE35454C7B7486582365BC634A86214B18DE620C71E4C39086541231A474972231CF456AB951C93D4F537EFB91DBB7B554677646A561594B12ACBC70CA4E08FE0823A76ED455FD529B6D1BBCD11DD81BB3EAE73EF9E073FC7472D6F561B565CF6418498CD1B5E356A9EAE98843A272CE7B7EF13AD808AA8E54E7C0AA8889DBC2F2AB4FF0050FB6F63931839A665F7939658DED200F632C105AD2348AF6B2B2BCD0AB511DC70A8E88E454F8722FC713D4F59CBB568D292EA3494EAC8DE44E5EBC2C7F70F96427AAD6A76275AEC1669546F4181238E0FB8E1BE7E7F3D288001979712E5DA2BE53C6AF378DEF540BDCD1B1E8D7B1BC723E5DC2B1AE6A2B5111795E5576CA1BDB08258B2C046F9674C355B9151C828D0E3FB5560E2898F6306ABE75472BD0888831A0D19C3FBE7A9EB554D1C6B42922A22A135F2A15429F50FF6818F81F1F1D46E392437AE12EE488A520966241DBEE093907AF7AD8CB63C888455FE6917E557FECA9FE53FC7A9EA7A9EBA12330918062006E002401FB3E07457730F6623FA9FFEF81FF5D7FFD9),
 (86,'wagner','dennis','Ratch',0,NULL),
 (87,'ullmann','sascha','Ullmann',0,NULL),
 (88,'petry','andreas','Andy Petry',0,NULL),
 (89,'erny','thomas','Ernheimer',0,NULL),
 (90,'koch','andreas','Andreas K.',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E000001050101010101000000000000000009000607080A0504020301FFC4002E10000203010100010304020104020300000405020306010708111213000914151621220A1723314142323352FFC4001C0100020203010100000000000000000000050706080103040209FFC40033110002020202020104000503020700000001020304051106121321000714223108153241511623244271092545525361A1FFDA000C03010002110311003F00B1E5FBBA57ABD0646B60768DDAF34BD08A5DCCE797D8B08E994A720D260A4E646A1CEE7C442798EC19DD7B87C506611163527AD653D19BCCB558A106B34AACF642988A956DDDD6C74CE88CAB37AC8063543433D793F41427CD7A393D332C90F25B7D8C4459C851199B31183E69F266987297242CF3CAF4622456EB2EE2DCAF470D7D15397570CBA068E4D7A1B8C6A0A770B2D7C5CCDBD1B46EA49816D5757609C627C818E737D0DE7A93E7F70AE0CD50CBB186E1C4BBFB66BFE267044E89CB0526D4BF4C89337AB4999B83D1976AF85AFE4E5592A5BB09B60D6FCE4FA7519CD5CE4DC66C63A0E39622999AC196D57B315C8FC31CB34D5AB63847324AF6247884F0A1569BBB3BA04EEDD74398568F1B3C0B46BCAD5848ACACE18CC1D479672F19054F91554B94EA012508653BEBEE968ABEC47A6C3918A12BCCBFCFBB23C6A5A86ED9397B5867155EADCFF8E8360CF14051A9929B3FCBC83825F1B0FB2A01AD0C008C0B8855E8E1BDB1962889E772DE894C59A8F41D08419FB9968D8B095F28675709D12F5A1888761D86640D52939D5C7E69E7DD732BD7E7A03592F9BF22AEAF06DD6E843F2B6BAE4DE5C97CD016C9F14D61AFD9F9C1DE8B7F5C1FB07D96BAA5483779C5B65A64356C1358C9A1905CAE3DA9A184116B0364899F896C4C6A13B66192EB421A0DF6C1B75A2207542C5EACD2BFBED6CFAAE379D59E44C573366C6DCA6A8E39D92A8E3978C6181AA125998C2716C4529719C7AA5A9DDF1F5859CAA5349EC264D5A94B25AB35DA7B86681E7759DAC5CD4EC455AF13060022CAD4B1791ECC35D1639CB9644ED2A5662EEAA13B8FC5BC823F64A9EABA04920FCEC78903AD76095E8B99F50A6AD7784416E33D3F1AF5BE18925AE4B4DAA7B6048F38807740AAF40CE25D7BC74CF50668B60BDCA7FC5FCA5F781C8054725475E5D84F60CA7A67A7E637387E7A53CD997E805D3BF3B649FD8C0B0E7744B5D154F080649E6813C4570EC68BC366C2C456101834C4B0C517B5A30D81D4B5F664F8F5E886FF0021D2E9140B87D6A9993B3A1365EE06E314A4C7274F01A2030D74E12B163B6680AA4802F81F4A38FE39102E87BC53F674DD316036D77DBB6F96AFBB2BDF28CABFB416ED14A6BBF9565A5B4FF17FEAC769A73E77063806CD825292A910A1DF51A72DC5905125E27F4F394722C954E538FC653AD14F81713E6390DDBD1D4E511591E7A5BAB8F588CF73173587AF8F96C5966AB5EB351BD59EB7469F6E3A17B4D12882C9EBB33CAD2B0122050231AE8151C23745EC588D961A500907AAB77A2D4312A9E630A6BACA4372C155603CA91D4A9052A1DD9D67EA0E77C8998258EA52E6CDDA0D70669303193030961683744736B9FBC6305BBF7A0FD02188B34798C53DF8D05F6BEE6350E182C5AF321B7C76A94E77D1B9B2031ADE951DD5F794387C941E2754CB9FD98CF7408A93ED2B46AB7F6BBF0C58FD9B89E85CC1836108E983264E8732B7AF4827A4F3471FF1F0C36C1339F7E959770AEC5BDA5441E39A45A332307B2BA7C90FDA99DFA3AF02C0777E5E844509AB09AB9E651CA976D880A2B6B15CD2D0CD2B5333AD0A809F43D7AB7B4E4199A1A791998943B7CEB7EE03E9CD6E394A8D6C562B8CD9B32D5922BD62EC92D0963B12F4649A49C63EC8B7E13B5904F2CEF63F25528AFBF9DED8BB559E499220EA40ECB1F412B2146464D83BD226B5B73BFF00A7FC7C0BD919F88F9C78FAC10ECE670DF43758C0B501B3F246BA0C567CA46B2B72790A7D90ED1F09CBCF45BDC78ACF568055DA17A727B67C15940504DCDE6E8FD7D5C679F201A798EAB4FF001FF5DA7CFF00C93910E9869F54FF0046A8D50D1766C60A20277CA656F98221592E8AB341B564BBD8A41AB3CACCCE04D60B0E17B87962CF151B4DE07EB699EDC668F47A4A7C9167A11F7503E1B34D591FCC97AD09AC5369C6A663B77A2035B5C20BA1695BAA48B9691A3114FF000BF89C8F2EF880CD8E7346F7C2BDEDB64767E69B3B739A0F2D73A8D31982184D2862DA0B6CF5ABAC937296E8F41D06887E7CC6A9533B59044B968B825059B24EE4B8E7219B9D18B219282BF22B558A6031D5F237F8F7118721878E45AB90CE5B82390E427B15ED4868DD9EAAAC13429562B223FB78489B5566880996AC9A922491542C802F899524326C10EE4F620E86B6630001A04C7C3727EEDE33F1CD179479F00387E21A7CAE8B074E934B9CC50B695B8D4B32427CECB262653DF4FCEE51745A8F69AD14C1259582C1BDD45AA034D398B7F93FA3F3BF67F32A83DB267DE99FD358605CF6A547A6391638FD0FA832BB274FA0EA75DA401B545157B292D892F45094523448FC2BDE2A142E2DD05A6F8B5F1EFC7B2B1D87A57B5FFDBC09FA889D08FA4FA0A363965EDF443AAA1F12018C3ABF1C47D08228A12B0543951203987450C08AAA347E6757F77FF791F2DA4F4AF85784D8609C639932F3AD90ED32A523C6E153355391CDF20B60A54B4AD1B2D0CC35220CC5F689990507519603FD75257E5364EBE4BC46FE5D61C864F96720C7262CD4BD36238BE6DFEDE6BC5EA4735EC8258A10BCF8EAB3C55ADBD6AD26ADC2B3C64421DCB6E9A29E17AD2CB204015234666568FB75F278FA4616403B06D330ECA0A90413B364FE2CF9879DABF3190FB4F48F8E3F18EF93E22C49E51A9F8F1E6BEF9A35C962A120F372E3D2BD2C05AF1B18FDED0F18FF00196512CA034D94D397E0AA3A3AF097EB3AB0F92FED5932D9A9C769B4DE6B9EE9DD3D7E1563939928CD56C4410CFEB925DA39B36B5A48F2DE5AA2820E2BB5AFB47EF492E7299642FD4413937F14B122A63F25F48E6A0AA3ECA5B74B3915A92AE8181ACC71C92C69398827955249103F60AECBA2461AD39624450382C74FE498761B1A6D771AEC0823D0D6C7F8F96A6FF2167E33A96664BD0189397CFC99AED7B7C18CCA86586288AAB1F33CD6DAB8A36ACD8EE9DF42109A626FF2AAB2AEC2035A5115531903CABE4FEE55EB9AB9A3D4349E6D8ED921CF7996AB5783CD00F9AA78FF0093C346A5D518FBDCD020757E05CB89A38F5DFF007E7C579B6CD815CE8C6594C73FA1DB094693CFD568445592F46BA0D1E8717597291EA5C66AC398A1818E2E3B888A083E8569B592136A409585552B6067D17C67627E2B7C705FEC4EE0A8C38246BF1089FE8F50EF51B10404A59D9CB6D85B76116A552CCAD75FD8F578A202BAE30D76C4A5BDA99E780329FC8B9A3C39EB44D98BAD1F21CEC187105E9E3A95EA57BCACCE2C4B04113228D97155A3B964C4C8AA0B234BD5CD46EB0C08D0991C8F5333A8466750ECF1A142CCC9D195998B2052DA61D4282E0F6FF54DAE377FB84DBB627ECF667916B917D656EB4EEAFD6E31B67045756953A723F9E2161ED55AA6C7BBAC9656B0366638CE18A682D6B0ABBD6F2BA1E94765B1ECD64F599071A2968B3598C22140B912D6FA64F6B5B1BAC35E2E2EFBD8069D49E5974B56A6A4005919DACC4ACE05763E8D6E1FCA2F18F03D07C8F5BE599DDDD8834FE6BEC10C3BFC015A06C9416B023519F40CA97F1DE611841EA09B95F8935218DAE2A86A6D2BAC5698DEF0BE3527BAAF45C0E133EFB4D8CD16AF9A1C23DBD76801AC966CB5AED8E4C260B2EAC79D9955EF826ABF26EF311B1BB8BD5A568CFF00914D1A5A572C1D92E1D90C8D89A97F25CA713BF763C7AD8AF3D7B55DAF55B756110363ADD2B369E05AACAD24B1CC63B0A414762F20925E6FB47925322C932453B246EC37D416D6D53A9F1BB2B0527D86D824EBD9F9B15FDBEFC53CD7E2D786D5ECFEA49B1883D03483B1D340854BE165B91C3B4B21FE3E248BB2F2AD2DF335731CED03584C6EF486362BAF952B0A13B2FA51F2CBC9E608AC3ADF97025D031151A3487229AC72D78070D64E42125D76F2DFEE920D1B01B0BA78433AA13B791AE73FD0C8F1DF873EBBB5F49F73D77BCFA13F03C71619A1C6F9867966A2ABC0619DFCBC0F346015D175CAC45A8D24A80C795D4DB7DEE2AFA1955D502556458E23CAF349CF648F25E6ED9C468A2830C642659B6996DC6F46523092830343215187C2844AADBF80CAEE5160D515D8C6F94FB2BB3438D263E950C5A5BAEC68E3E94622A65ACC15A115E0648E4B5332AB4CBE4DCFA6908959BC92194B9F8C1A70568614842C8123DC65E43D1DD90005C03B63B237B66EC47B0BAD6995B2FDC03068B6ED178BAFA4C2866B18DCB78A98043291E15AE1A7D3B4CCD78C963DB2F343FBA15992E4236D9C8D26F282081D85F23FF750F24C779094F09D0207270878D6485C5BF4EE58F07B463281EE90359B1957F9889D72A250B3F1F2CAB9F65DD94273832FD4BC2CF2C37D603F0975BA6767F7A7DBBC9D3F6DAC4B8D03729FC99C5335EEA1084281C0B05A87E524D208D6123956439DEE6F3E7965BD454004F3678B37CECAE375765B977AB0ACCFE45C005D5A10E994B1A02ECFF00D4015F0600787223C232A6A88D4FD2996C7C1DF2303BD5B2C238625F3B09A9BCA4900111AD7B333A29F603CB12B29D765DB004267F2895A959431A96915E38DA212ED109500B128AA5B4C3415BDE881EF7A323F2A7E5D783FCA0F34C7A48107E5FD471B895DB1C0376A947A2F8115A7E99A4CF2A28705C4D3B173C5702C17D5CFB7AB6C1247E38EC485B000C1D19ED179F2E53E9FEDBAC1B80E415539C150645C7A47F96EF37D97D09D62B2106AF3CA6D3B494320C301EE8782B53F37A06CB0934A51C921153DCA633668222EB7CD7560CABB06A80C81378855302C59094080D178E4533FAC2F1AFA86269BA99F3BC9C48FC728F61D943B77D9F9F78DE333DE4784B48F3DF71D7038F69B4DCE4731E8AD31A9A41ECC34D529C3293A29DC6483D0E7AEA13C1A84D3ADE5234B091C2DCFDF18F6DAB7F50B8E61F07C1703CB39A662BCB889ABDF86FE42EC8CF7A9364B2CEE905596329316AB6A7861AECD11AF55E086475E89F8FBBD99AD624B74268E3861AAB1C11928405674863494FA2A9DCC6AE46F64C8E7DFBD8FC3BDB349EF31CE25CD799347883C680634635CBE14BD769D71A4093CAD5FD6F911FE98579B354F99BDA0E28D1CE08292358B38D9C514D34DF75B4C70FA9DA7C8CD493E6DA9F01CDEBF779967965E17A321CC0E9724A700A8EA057EBFD831F84C639075E15899582BD06A682F2ACF26571CBC24DD0688FE970325EC5E3ED7CB6FD07A79C179A6298884373159384202C78972AD950BC01AB0D124B5C63B40CE9CBBAEBC677A9C6F9ADA88F3B91D2263FF008DCAAD6928F68BB6EE9D69B3216C9F8CBE48B00AF579BC6E71FF00A4D12CE8CC51DD5108E4C9012125CD2BE2F316B73E4C9FD5468979276809BE6ED60E808FEA2E67885AE4780E26727CA69DFA14F0786CCE43331D95C23491C2B938B3B3ACEEF63B57BA2D431E3158B300B1C35FEDBCAFCAF416BC94A2B32436A12D0C8A034522A6CC68DE5789D5C3ED14F4EA1D51F4FADEFE79743E05F1844BD789AAC6453340D3AF0A1D488D8FA6A666BC3AE42AE64AB52782635B17F04A6B5C22C6977484F4AF82E179FD550BA525FA86F4EF1E675C5EA94453EF39554316CDF1C82C1AF838663D6D182792BE3654425FE8AC322A24AD80DD654581D969B676FBE55D6BF4A0C4E47EBE9C6D1353974B76AFDB422B5B7A15FB58AE1504331FBDC6C96C878802A6CC924C575E476624B710C4E41B66BD9A7E02C7C5AB610740DA5D23B8751AD7E2C011FA23DFB0BA93D0EB9CB455DD8755BA0F555429ADC705609DBE51755A44ACD85981E2CBFF00A352F0E016DE9985AEF3FA65E1AF7565C2A881700C885B8C17C9EF6AC1A5CFC1E0FE84379CE38BDDE2FCEBD3CF59A3689F178BF52C7F734F512EA78A324B1F4FFA6E2BD4863095E74E667AB0CA6301079CEFA68C7182F2DB35B8B20A4BC523B00B37971A98143CB42498370C9BAA8C22319AD92FAD9CE572C33FB5834A575A34671E5FF74C1E519864D9969973CD39416740C2B879C174045BDCCB6B43581B40135465365CA29D3353EA536746756AD561B7AE8546151715003CADE5B76AF5964EE556A552D2C1F712C7621843B1F180A8B1B1D14332F7FB76790F6903A063CB0DB7AA90578D476447750A91B3F67FCC453921498D81EA7F2EC0A800F5DAFC2F399F9689FD67C7B41F1D7BE5DA7DC6C471F14CD0FBB95E90754FBCFF000753AC984444AC90ABAB49A5659D572E65D521CDD0B732A402098DAB004EB8798169FF006F3F89F80DFF00CD4CEC517A0EC3D507C28E976798D069FCE44C42819428BA5A129C0D455A76465AD16EAC8A4416B9AE80961DF869AB4C7AD972F202C7C73F75CCE257C4276BCC29B8C2488C2E998358E814664BFE187525467AB438E65ADE0F2711294BD4F6377CA5CAB6A1A0AF3EB42B583834B5FC72F9BEF3C13CE6FD7FC60C35B8A036076A70F639F4F7617AB68DC3E5E9525156A559FD4E999A3A931F7145A8C84EF6CAAE2E8818CED6C2DE20826CC5735CB26731B0E716DFDBD397CCB6AB63AB18A458C768E393233C3098A142E1E7AA84B01048AB626F138F8CAE09C7EE733BB263A85781F2429646ED4AD659D6177A95DA592B57470EAF909BAAA56054932C6803A962CBA81F977FB847C48F8178E187F67D7093D340089687CAF3558DA1DBB1FA73B21ED9AFE5948CA05B25D94AA66F2F5A391C8DBD5FFCCB6AED5DCDE7AAFF00D50FEC6D1E143786FC7DF39CFE7A3676205DE806E8352EADA7929723693348DB30BC79D90E467FC6E05776AEFD63C2AEFF0053E877F7CCCEBFD29219E99E90F1CBBDAE85D3762FF40FEE20E66CEEB8F9C3A6117DF39DD64E50AE5CA39D84A11AFB08575FDBC8F3F43C6D033A0B5E07217715CB92B7B3611A075E17DD5727294BB51B5748B23CFB7EB0E7D90FBE3CE47E90ECBECEB3F2F97BFE4F1C0D623DC42C015E3663E361D94C8FD77D9B475A65EC3D753AD93E98182A151709964EDD24466110497B2AB200DEC904EBB3686FF7FE3E6B0FC77FEA79F4E05B0837BF7C73C8BC457779C259796B2739E70143EEE7DD7FF0B46C34601FDE73EB180DFC857CECB918CCB8C7B2BA247303F2A3E34FEEF9536CEDC357DC2A21EE3749E77E9AB1681A0C929A3B3971DABE56590298F8EED545B4E8B30D98C1072565B61757577053B11191820614FF001225586F7EC8DB1BC8AE309CA9E439D97E4AE1CE47EFE4A5DFAC7E9DFAF63D973FF9E7EBCA17A33AF2AD680C305E8FA5C5B2E1D45B19E6692ACE7F2469D53ABA5F293C3AA7DAA5384A319C6738727F6C3B1E76728C26C727E593C766861A69EAE50C7AA96E58A622AF72B1C93AB41119FCB144CF240A49469915642232C57398E1F8FB15AAD8699D2B095659EA092364B2233F8432B31056333752E013D900D03FA3A54F9F3F14DCFC73D229D3E3BF960798B15355D96A750E4324A0D4A4E73F963BE2A03071587863CEB3AC19872C9F42BE8B8B3A05C4DA0719A112E5EEEE2FF319351A5BBFAF55AA03448DE657283A9C7E83EB445AB77C66DF3488F2873C5E0B501E8826957680E315498A98AB2C2109F37B07CB1F92FF0029FC25827F5DF5833D2D2D020C1093A56AE5775E44A75ADFB1ACC20E838E32BA089D7D91E4112FAD9677FF0027DF39758781CA7A32817CDD16764F3483BCCEC70B08E733C9DE6C496A21745C566AB5558E414DAD3C8FE2F11896D4B979D60C3083127B15E4425D1F57F318ACA7D2EE3B818AA450C98BFF008714F726926B376C75911E5997CD14924F296ED6446CAD25A21D115404F8B9CFF16C845F75999BBB4162FD6864F0C21A1AAD3C6DE18D99591772C918300527AA8D90EFBF8507CD7C63E447A807A7837D8B8C1E99783D539CD1EB340895A66F92663751A37B9BB46681AA71C1B4DA4017B85CD0E5AB6CEB68908A828309A115B25B788EB7C0AE7D90F40F0879999E77FAE0B3FE81FC16EF320DF5BACBCEA4C28C708E7707668ACB0D54AC6CF58DDD2D8F58CA969FC6156CFAA60DF72D2EBBC9FCF31CAFCC36FA5CEA6F4BCC99A0D6E767E666A37BAAD282E0A7E708F7A48F59614D7908A9EDDCC7406C426759E910446C6D20F9383BD43E40EB7D6B20E4874593BC6BE56731F4B5D539686C9F59E3CA194A96D9AD74F4E3AFCB344C8160D2BAB1140E5BA0DB2D220B3335A7B86080A9986C1E538DE1E45CAE1AACB0E42F3D2B991C65C931D5966B11C83153D586E413C52C162378A8064BC238DE5670C006318BAF70E1964826824B242B239D472A486565EC637605BD88E1559124203F7FD1249B965F96FA2B5249967FCA3C4AECF84630092D4085B032E0C2E3028B98ADA965A00E4ADCF0C2CBBD8290CD7EB82B2F8C447A6427DA455FAA01EA3F2C7C67D3DEADDBB007DB5F3D759D573D15DA2D7E74E3406A2C8A0E2B687413EA25A10295942E20576C232665F099D674FF002D1F6C57EB7A626ECAAAF1F1AC9518D957A52B2328F62AA00AAB04CF1669A269231A466898C44FB8F49A1F0D4391C218A32B812C3A2E98DEB0A5BD0F655582A93B1F881A1BD7CA03B9BB4C91BB417498BC1A9D166F29994E767D56514E343AC62D4C2C1D9991CC32C79CBF730FCC35AD81B433CA62C605CB4B12FA25F493FA4750EF4AB3CD41D22EDAC7CE1496C44C5216ED0347920750C0DCE89AC610D4717B1A629ED04506E6D0E306EE54C2B1EC8CD5ACB234F234F5E87B065385D0E0078A6DDFAC4DE93B0537E5552B5EC94DCF241679EB150A574F2B1CD14E6FB44043E73F8B4BD89ABD92F089B8516E60E4196DD22F3C704A1C30F575D68CBB5929CE481AD73466A5A5FD058375C44725DE98A41958F33F6263841637AD8B3A531ACC426D09C2C5D5AECD30804A258897B4EF2753011BD3B1042CBB70C5C4A612497258058B1859A691A472AD3BFB0C48D932760AC76368FE8B0217AECEB5A1B262BBD0201F1B37C966348684E7697E010627CD33EACEBD8E40211ECC4487E8F2E844BF7F7B5749A8BABD62166A1AE98157A29AE243A128346767AF8B3E99E4DE8DE71ACCCB6D86953FAD644B2BD116AC28555567D93CE8ED105A8710B84180E29CBCABE64EE70AA63C2E5541479AA61DA94D81CC4AB0D6EDB09A5D466719E937B956B8ACFD0CF5389B1B260CA0F397827A9353B966A8176B20A998E2D013BA601565BDA46203B98438BC9239603333CD760BF408DCCAB7899B13F8DF262AB2559C37001E88083D0D960964ADAFB6103B1A1A853A4BA48FE3D8BA8EF253B7188C4D386AA3D658DEC3859622C63B30DAA2615F146D0CF17962EE9230672EEE7B21EA14B2B4E386F2A9388721C4E6694B3D74A16119A5A9EA4EB280962684EC02EA85BC4BFA755505BD86F9A8DF995E718D5DE25F1A8D5228D43DD4F8FAA7FAA104E779C262D7B22D49B7439F5E70BB2AB8AA6E9F2B8F7F00C1F251E779F49051D8E6A62467DEF6770DF494FF000DDD84235F39FEFECED9D843BDFAF23D973BDB3E9CFBBEDFBB91E7D384EF79EA90F51F11F8E1A720D20E30AF8F7920595F7D018DC8179EB4DCC963D148318095C20CD49D287068570ED738F39553672554475E86126A4134CBF25D4D5D9575479CEC21D9CBBF5FBF9DEF7E9DE439DE723FFB87FEF9DFFE3ED3AD9369DA8D49E18EC4EED27FB9212BE08927709A9741B483AC6092A4803F5F969D6D352B0F25B59424332C32A175D4D319E38E50C1549605836DB649DEF7B236611CD6588FEDBF9D2FBE141D19F6BEC39DE55D84B9D84631EF3BFF002E7DBF6F233EFD792E4792E77FD7D7B2227C2D116D55A10A3F48FAF3B6125535975DB3FA73BD9F3E9DAFEDB3EEEF7B2FAF7BFF002973EEFB7EBCFAB810734E14C88CE621FD9CFEE16531C584848F6AFB631FC43F078D9555CEC6CE4BBF64FB2E4BEB29C650E45C5C89C0591752EC786556C246768ABF08E453C8FDB3E461094A319C7BF74E1F4FAFFCF93FF7F494BBFAF76B27561160A52D984AACBFF21544F192A4188AB7924209D7E43F65813B1B3BAB2424448EE8032B152148F6CC4AF7EDB03F1EA7646CFB1FE409B08524A7C03A8095C6C6858C3C84AEB1AB948B329BABE082D14F792876EBEF8C281FFF00B72CB612E4B9F6F3BCABCF3D05DE45AB2BA0EC45A35A6E711E9B2C6435A9B969348EC8EFE447538E97F7362204C20B35B2946C959EF3B68204C06820FD26AB29B5F574DE77945EE5A40D20ABEDAC558102370AB096368D02E3F9B9D946238D5FDB546E27BDB255F6DA635D764ACE73F54308CB6A1ABD2AAD8A570A186C18DCD2066924D948F4B675A801116E1895506CEF1D788C744B6CBEA2471A52A69A3F1462294206C21B9CB588CCE39AADD55861944934625552C6BC2D1CAEB5896575920085DA78489A14FC91D24D1F8ADFA8D98587135F8EC334666B5966C8DA11BF66863A75C45583A4447512195E48FF00B82BD811BD9B4DE85ED5BB74DF1DB7F236F351B6F2AC93FB41371BBA2C9C8E656D373266DF71934BEA002F6B8D9BF29CC985CBCC7AF9F35DC5EC982BB44AF8B50831C7FDDCDCFB139D5094799556E97D495D35E9C94E034D8EE3D33764386AC9E6B9F6749AF5BD78DDD89A17F288F9C5586073CBC612BE124D9D743E95DDE5BEF0AFE3009B9137D8FF003CF44F53CD6CF0AF3290DE6872FE859C5A8C11F659C779869918B15BB6621917B05E7DCB93F6131A20AAD3B84C554BB396D91E25F684BA9DC79D6EFD8F45679B65883C9A1599F1C3179ACAFAA79C26CE31B3992DCD5D042C8277C0D8F1B1FCAE82341CF4332392EF2D78986539DB8D074A1C565B0A953B496F1D152A4B05858BA549E0A4D1D9A623E8D24965E38961B75DABC33491F46D8791F454E0CB62211B5B8C2CC885EBB22A88A25EAA184921EA8CC077049FEA65D90002251C4FA58CA16963AFDD66B16B647C3FAF439DF24C4D6B6A10454AD640BE084A1D24412984C0B0D38615ADE374BBED221D9D845B75ABF55B3D1007B95D6B61907D7D250B7BE7A44BBFB063ED3F5EB5ED961E3BA742F5BE964A34177E4954FD158D6FB9337A4C5F7CEFBE8B0B257EA25271D7791DEA721EB59989807F30C70FF6B6BD3626659412A3644AAB203B0EAAC48039ADDE5665FB842158A82DE1D90A54027AFE3FA1FD8EBD1D7AFD5141B35216950C2F582D2169B852358D745FDB559E5D014D038C9A81D1650125C0EE209A59CB95B1889326E3A95D439A8361476076D6E665544854C4FB8A1C94F52F3ACBE8EA5281B7A316BE355F69E48B789F5876B814259DE504D7642AEDD2FCFCF194B69D69CF97817D19F90804198C24816C648D5E3FF007BF977F4F432B01AF94DA73139891F8175521A55CBF8D02A8854F4D710192C066195AEA5944D7A8AA7500A56E6623B2A108C9DA593802C4A14985D58F6FE7696DC25CD3B6DEC4E0A960C0F910F4F2413CB1519E12E5E2924D74789613A85EB24D276213C892151E304930CBB6FEC0B3488B1209CB33C88AC9FDFB2003A0120002A31F67FA4F55D1FDF53204CFC9B541150FF18C6D63FD14E56929D8234C2A2FE5DE3C173188321A1A4D24E52BF8446EB194200CADA6760B725940215A8E55D4262BFF003681B10A84670253A63C177121C9A489505A03EABEB4E567E2C948E225B1BC9A3A02548ACE8981C36CBBF8BDE0F0B19A15651535B61C12B026845A118483A820D20697A046356059574F0EA68EAF57C208976A9AE0411D60C0A5AD7A8126557E6F4199C9B3D914E855F0D1099C5E0A8251323D649848329B335C8346DD42A797C15D1DB3A885779B32E22E4AE2E78223A2F26B198FC7C98BB90CED3BC50CB6C4F6209A492C4713488C755FBA9689FAB463711088AB2022460AEDB2A54B52349E242F0AF6DF61D638CEBB7E07F13B5523AF5274C8DBEE367E125F8D1484F3E28F9B942B43D8F52B1DCE62F04D16CA24B62331135172D0AD95F6F0C1AA27657115131FC1C972EED7F87EFAFF0035EC8D079C2579D32A298B7525F7F353552335346AA15C65287FCC31C9A69B231EF7928D9DE46EFF005F48DBC8F7BCE4C1F19324CF0DF1A94506AD6AA25FF79FD0BB00DCDABAF36B8CB0BE2F75D0BA4ACC303E5571175BDAA3D2256F079D165958F7FE4A6AE27A5C2B1C99161D32877BF5E73BC8F7BCEC25DEF3EBF6D5DFAF3B1FF7F49F3EE8CBEEE73E9F5FF5DE99E78AB4EF7A1962904DE6304AD1C7357113CECCACA000AC429D16D6DC766FD9F96368D547C0E0AED5244831B53CC85C127FDA452FEF7B00AEC2FB014E8120FCAEC379A15D2E85A33D1FF2513ED5497C8CEA26C872DE11C913F48DB5DF284B9F646574EDB394CA557FB8779CE4DA83C9C05B68C3FF006ECDF590872BBF85B22AF0A3D9F7BDBB9C17B6F69FBF91B3ED95BDABB6FDBFF1E4A154610831D797D99BC952347965918F3967236F2C859C97D9DEC7BDAB93FAF2318FD7EBCEF3E9FF002ECBE9CEF236432B098E27393A254DD7479D9DD6FF00A9591FA72128C79F6F3E919F7B1E4A5CE739D8C7B19765F77D3F433EFE6C987AEAF030766DB2D48E3914ED4860C03951A62540201FC7D7A27E1188493BC75D4AAA90AD33A7E8A06008DB6CEF409017436C07CA47F225FA733550CBEBDD0A9B099AE0EC2C353AE5EEDE5AD2C5E40F0A3FAD3E0A989F0E9D68023246A9AC049ADA22CA67D458B192F82B167E54E1D84428B84DA19A906A598DB07B8E5A7A407B44BA4F6FFEE0C9D24B392F93C3811D50655C70D5921F6B57F8F97B8FE48F95361352FDE69730E8419F69F5E606FA563BE40A12B22C2D5CA425DF78978642D3015801C9AF5F0AAB12702657910ECA3F3AAD3D1A710F6CD08D8D4F3433CF7F72FB3FB6BEFAC8883674BB61A2CE5CBCB5AD075455C390B565BA3436653F854834289814D16041B916167C7C18C8C4390922B33CA95EFC716A085E39AA09A331CA18CD1CB1B4DE430969878A344545959FE56CE52DE7CADD966F2BCD35AB0518AB068E10E628E3EA7F404717503AB063DBD8D162E021063331A5CDF3D2315CDE815D0AF50B2BB26E33B0799DB785943AAB4A5CDC721F665BB1AB99FBD9276C0BA4C306DFA116A9ECA63033278CF91E9763BBD2ACC2E7BCF4ECC54DE96C5E31A216A765D540650E36572A6AE74555FA9094A6448746B2D7CD1B9BAF8895C61FCA3D692D1954D8C924D4B4D3EB341A7D138626B5C986BFBAACFDD9FCC5DA5506E7D8A95F68BDFE3D311BB603D5D0783D6116457224D31A06615558515F1E9BECE854B3CCE272582CCF9DE7B02C686DFE29B862ABD2CE676BA883CD2D37EEDB61C7609F1E62C083098E3043217372DABA1958CD687C78F7ADF2192C8E4616E298FB776FCDFCBEA35F9EA1806368C4DD2672904B3D7B352CD98DCC359EAC53448FEEC18004EF1F581A72205320895949902846113F52C0C8E7F13D58B80C7475D7AFE5B069FCEF17F1F4BC6222B39F1BF5654881ACBF41424F1E8FA7E19668AE26EB4E5BE6FA85B99D9833C55434C2BC40446F0186704BA90C08A3DD5726BF41C927CB1BAA5415007F8CFF001C585A1428B598F7041C0126E0E9193488744348A8E0D45170D53888A6D565D7D63842A88ACAF8BF4131D8CCF6328D4C77FA7A3B3F6304557EE2FBC53DD9FC0AB1F9AD4D2C524B34F274EF24B24923C8DB6691CB1624637AD0A245F68B278D553B9806DFA841D8ECEFF2D6F647BD93FF0071A39B68226D6247A9E5632A7ED4753DFECB86403669FBF82BD1E7CF194F0B2FB97BC1994A9A87C09D10D0512C23A0D7C3AC594F9D5E70520F2A9E13232375D77F26C57DB6CBB8BE3CA29AA3441DC1746B8F6DE4E5540885764797CED2691B95461D9DFC83E33FA5FAFE75238C22063B172CF7B4F9E29CD2459031F3365625B9FCAC581017CDAB3FA0D4DDD3AC82CB203C6C0A77B1E5860E3734E3F143FE9E8E82B721BDF977E961F92E70E0073DBF9F902291B75795F74FF2015DD376F461A72A795DB2633E52C46BA7CAACCCD721FB7597BB8FF058EF566CEE5F2B8FE3B85676AEF94BCECF3587A71F778AA50855EDDA78FBA84290AD7577092D889492A6531B725920A95E8D9B972CAA782AD7AEF24B221204417F02446087F4876C57414E88198CC1E39AB41D5E573188625E9E6310B0E612B20E8967160DC4B455CA13B10E514D58DCA6128DAB265B822DEDFF00C6B68AAF9575E90BC0FF00638D721C9788FA77A83D47E5E2FA83BC9E441C8EB5A1DB1D0D1A2D7062547E8CE5EB80C921CCCEE316DE62C50532D09AB81906ADB50C8DAAF22C3C0A7C37E1A7C6EE2D33E39780C74714E8CA19CBECF59F7ED1F116DD19CBB7EA1D8E7B89FF002211BBF95C07825129D9080F453F8E12E48557C89F8D1F303CDF49F17DC5CD7C27D0685DC9E4337AF94D43C50F537DC4A5779A6474451991001F08D9F6557F0822995D18F633EF655F0C16783C576FE2E94B1E52BDE992BA5ECAA12ECBE320B08609A7A75C34AE02C7E7B1298C324615CFB7ED1FA319A4E234391371AE47692091E6E533C70579ABF1FA73AD8AF0C967175EC366D6186435EE59B32D2861300E9B8D94790547EE63E13E6BF1B31DE19E33E6144E0AF30874E4336C50E1D07681FB168314DDDB2AD68C1014DC65FD88A20608C382A9704129006A00046AA01B0F8D26D10AEFAF967D9FFAE761197D63CE7D3ECEF3FDCBB1FBE3DE7D7BDECBEBDE7FFCF3F5647E73FB57CC3CC3382BF945E2BB3D88DE7E312A117B4F992B968B37AF451323F889D1405E56326D17698FE42EF2AD5F33E757E4B160B6F6775C2F63F34BC4B9C9CAFB75415FCFBA1306DC9B69930B3E9DEF6B9747A881BBF497791EF785C63F4E73EEFB7E9DFAC7F35C1F96C30B2CFC6AFAEDA468C63EA9B350A34AE615AF2D58E485A131B2B205D7E3A1A5D328F12E630B469D4C6D7BD5E7FB4AD1569245706290C4A3C8D1B0FD2F7621500D85D855006BE5AD4CA96D5094E63570946C977FFD7C8F7B1FF8C79DEF7BCEFF00A9723DEF3EDEFD3E9FEFBDEF790EC7FBABD5A3C7AD2B42F1986A12A6A3B7925156F2AA28AEAFA7DBF6F3BCFAD975D67390A68AF9DBAEB651AAAE4ED9463DAD28BDFF00D3BD62E8A5F8F9F1CBD6FD258133E523B1B33E4AECF0B65BF484082CD0AA6DDA86ABBF776C99B3595479F5FCD7D1C8FDFCB159FF00828E40A977B9FEE61EAB9FC661539516083C172ECE1749BB1A632B6B5A758AAD2ED6874A1F58580E76FD03CB689DFD9B5475D76DB1D9C47E96F25B528B395A9FE9EC6AB1362DE440AEE22243131D772B2BB05002F91513606D86C8F806D72FC750715E906BD91B2EB0D4A146296DDBB33BF558E182B42A6C587661D51234625BA872A076F96D7F69B7B9D3F43EFDF2D3E5166B3267C6CDCE53FECF6332DEBB6291B34D5354EC13ACD0421A997532EFC0E16834D6655F6FE46CD0F182BFA62B9591FA9FEDBD86F957B6E85E79EAD9549A2F42D2B96894315FE576D8F30E7AE46BD99B1D8E42C7073118584FB7CF36E2C39A097DD1306342E5AC9798347E597CB63FDE0F4F8DC3A3979FF87E12BA40C1E0C3AC706A952155C08370E015B2B0018B809F78EB56516963A71ADBEB81049451244FA9F0CBE483BF11DC02404D0F484DA7836AB741113A89526427D8C6C84B93E4795CAC9D329F25F5FB3F0C65CFA4B9CEFE8E7D4DCDE1CBE22BF1EC74F7E871A929BCC5999EBE4DAA1D587151D7C523BC47A34CA51A500B163A00DC1FA15FC38D9E45C5391C5F53AB71FAD9CE7159E6C0E3F338D6B17F894F56B5DFE468F9782D2B5292EDCBD2DACC5686B4CCAAF1564995E0F445BD9FF67BFDC83E38372F4FE3A985781D3F774733C40F21B747AED566A93E2201A1930DA535B15ECD9524D710AB1A3238AB0680D54E81E8158778C7A1F8DFA4A7D77CBDCC6BB619F6052559AACD1EEA4BBD4249C9536E6E4653FDA2BB9E1F664D467C6ED695B5D11BEEB13DB7D4354EEA633D4D7997EEB7EE39988D637628BD053CE34FE41F4214BA4FD3BF4ED9CA5B2CB442ABB671EF7B191323ABAFFF007DA25FEA3DF5FCAFFDC0FCE3E506233F9271E2B45022FBEF67A03344B10ED928E7F079894D401D7054B20A8AA8B0AB6F3AC522D51EDB0E5B742347E5989FE7DF49F3D86BF243F4FA8E173F3D0159B2B808EE52CAD8F0C4C2A2CF5EC9C941624491CB0782C4014BBB98CECAB2A64FE033EB763B94E3301729D4978EE42D1FB9E498E96B64B194628A379CCD62277C7E4A363D045147357F1CB33C68931FEAF98F3DAA0C13DD96B9CE3B398A6D9169A8D130CBB2DB6ADEAED41880D72712AA4E94649D50B13B2A43B6A1588160F41BC6039455F5FD8553292FD141DE786FC4573A329895E6C12EBC8AA8ECA9CE685A265564630FA56452BC33782532BABE43B390D5D55DBF4E5B2876D9D939AFD2A1B2718623BE493475D1B181D975A1A67328ECC343B1D0F63D00340315BFF0D5FA9F2317AFC9B8D3C0E7B42F33DA86578D8A9469225AF32C6C5482544B201EC776D12C6D53E270FF00B74F8D85A0F8C389CAE6F5A25CA545DB4D1251351AC635B585611A41CE584797F256552FBF80031091C6C8C3E8A7F1C235F063EFBDFBD7F592D26CB49BB7CE74854ED2496879B6DF7DF6D9197791EF252EC691E8E77900C31A34061510AC6107A47846AE2FD2FD672176ED982D4562DDA9E21956511CD6259630A0C7A508EECA146CE86B4367D7BF9753F864E3D809327C9327260F0EF928225A50641F1949AF434D6E5955A915B680D88EB2AAA81024822015404D01AA5C3FCC1F91F9F636589BD574EBA63112FC3214EBA9EC390977E9CFAD738FDD1FF5CEF632FAC7BFFAEF3E9FEBF520CBF714F92E7C03E6ADB6277F30E7590011B8C066DE9CBC8A6F8F2A202632107603DF0EF7EF8DD02BF2C67F49467CEFE97E97E82652186AF89EB451577623B3C11AC2EDB68F7B68C293BD9DECFBD9FF003F1E9C8B07859EBCB727C3E2E6B709658AD4B8FA92588959802B1CEF0995010482158020907D1F92793FBA9FC9E9A422E244F3032C0AAABECEDD93655F2D87E4857DA6DE09A41BE95CA32FA4BB47E0B3BDE7D7F273BD977B643C5FE506A3D74511C6ABCFFC9AB6374213916B72CCA37C67F6FDFC9C2E63A1677465CEF7FF00CBF277BFEB9F5FAF79CEF17E97EAF0FD0BBD76CF1AAEB66E5AB0AA1D5567B12CAAAAB1C5D54091D8055D9D01E86CEBF7F3E17FF1D783C26179D507C361F15897B5898A5B2D8CC7D4A0D62536AC299276AB0C46590AAAA9790B310AA37A0353EB5F43DBE923340B3457E1E1D85908B3C9AE476B2AE3F6723F4A79AE57AB5B54B9CEF7ED9C16F2C877E9284E32E73BFAAB3AFF00809E79E9AE2DD47A0FACFBE6C5FDFD9D7267A1D8651A114D529F3BFC70FA5E0ED800247BFEEB08188E1D5F5EFE31E1CEF7F4BF4BF4E5352A5B9A44B55ABD94FC3F1B10C732FF004A7FD322B0FF00F3E2B7E8649263E95AC9D091E8E494F55C85476AD7955917B2ADB84A4E15BFB81268FF0071F39E27ED61F1E6D842D9EAFD7FB29DDF8FBCE3FC5739F6C7B0EF39CFA79F7DDFFDBBCEFF00CBFDF3E9F5FD3CD1FED67F1C2B9D3649E7AB5D28CFEEE767A4CD43BF58FD9F4EFDC3E3289FD79F5EFD3E92E7D3FF00AFD3BFEFF4BF4BF533A3C7F01E24FF00C8F11FD2BFFA6D2FFDDAFF00E0FF001EBFEDF1A194E7BCE62691A2E69CB2260E4831F22CC210437A20ADC0411FFD7C33BF1CFF006F4F8BA279C16C99E39CE98A5A2D931A4FB5FA3ED7F770485BFF0092A4E7A8AE5CECED97D7918C39DE7D3FF9E7D7F5F1E8985F34F31C9E2D7613CB3CE1073401362D8B0E65826CE676D25F06846B70FBAD58C21CAA52E779D2272EF672FF009FD3E9CE2FD2FD2431F46947CBA6AC94EAA565CD055AE95E158157C169BA888208C2F601B4175D803AD8F90BFAA1F527EA2DCC7CB15BE7DCD6D4429424456394E7678C12F102424B7D97D8241F5EC123F47E671FF723C5E7B27F244886582867037B8D48F0E589A3504B22D24C9F28209141AAAFC2274CA138A4175D1185769D61457D919913E7E97E97E97EA5EF8AC5CADE5971B425924547924929D777776452CCEED1966627D9624927D93F2E57D28E5BCA9BE9B70A2DC9B9031FF4F63C6DB3392274B08551B367F4AA0281FA00003D01F3FFD9),
 (91,'m&uuml;ller','markus','Markus M.',0,NULL);
INSERT INTO `t_spieler` (`SpielerID`,`Name`,`Vorname`,`Nickname`,`TeamID`,`Image100`) VALUES 
 (92,'','marc','Marc',0,NULL),
 (93,'zilles','tina','die Hippe',0,NULL),
 (94,'schmalz','alexander','Alex S.',0,NULL),
 (95,'schanz','oliver','Olli S.',0,NULL),
 (96,'wagenhals','armin','Oarmin',0,NULL),
 (97,'gebhardt','philipp','Phantastic Phil',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001F000002020202030100000000000000000000090708060A030501020B04FFC4003610000203010001030303030205020700000304010205060708111200131409152122314123611617245171259132344281B1D1F1FFC4001C0100020203010100000000000000000000040603050002080107FFC4002F110002020103030303030305000000000001020304110512210013310622411451612332420771F1152452A1D1FFDA000C03010002110311003F00DFE3E8FAE3116871C10733359F78FE62627DEB335B44FBFF009ADA26B3EDEFED6898FEF13F5C9F59D6747D1F44CFB44CCFF68FE67E958FAB7F5CC6F1DF784F17F1D9DA10B63E7D35BA2F216711B6D2574ED9D9BA29732354138F9F7B7DADEC27B48BA1D86188C264182B5E7576118A0F66CA558BBB22C8C0BAA011C6F21DCE700B04562A83F9391B547E4807477080139393801464927E001FE3A62F9BCBE8AFD2EDEFBBBD6D103E45FF006B4EF9E98E72551CCFE42826C74A9CA1629341DEC49934FD915A4D23F902737FAAFF00E3AF3678D5DE0797D3376515AB432648EFD11603B4DBF95A1380DD88AD5AD0212C5D1153E32BB4F0E68E285A9EC16037B4F236573044C04C3300D4A104615EA41907788B5094BD666B6A5AB316ADAB331313131EF1F53870E036546515B81B06368018A90A4640E4B2839CE79CF5EA90471FDCF39209E79393FE3C71D73FD1F58A35DDF128ECAFCE3DD77349740E5AB45309CDCCC5B61ABDE6B14A2D9866A8E9EF79BD2295186D6BFCEBF189F947BE55168B47BD66263FDA7DFEB5496390B08E4472870E11D58A9FB30524A9FC1C1EB6EBCFD1F47D1F5BF59D1F5C737FFB7F3FC7F7FE63DA7FF13FE3FDBF9FE7FF001F5C9F5EBF1AFF00DBFF00CFD6759D7AFCEDFEDFFDE63FFDC7D1F5EF1111FC47D1F59D675D56369E2E9296BE13D9EFA4A97F16C4CD640D2C12D4423C83EEAF720BE750B0124D6B79F6A92B333EF3F5FA4DA2901902646450DB168A896ADBE67B44D6F7FB960D3E44A062B4B7C8F7AD4359F68B5E26D589477E877D64F923C89CFF008D3C6D7FC61ED6E9C025CEAE60B332F0E395CF689B185B073E63526A38A810A438772BA2E32B3D35380C51665992FA8953CF680B9BEC3C17919DD46B6435A26D9E6DEBE3A566730DCFEBE75449CED454FA0D934DCC57479E2D2C34AA2C770A6FCB69D00AB59A5EA126A958CD1D2B50CCB856AF68435A432ED0EF1AB4D32C5B823295679551999503F70322C62405378071C6463279C7C0E7E47C7E7C73D759E5AF52BCF633AAE1F0FB9CCF7A72E91B1BA5E6F0524BA6D94C4BA277746D6235D872FCF52B35BE6A0C0343496A223D58D469A80044AB49BFD44F90727CCFE6BE2390F15F3DD5F6DE65E3BC87D46B74DBF3CCF17F893CAF36E5595C39F955D5713EBE14532843CCB49517D9C7CB8FB34233D5A3AFF572795F4C1B3ADE67E73CF3D262BFD68B1DDD4DF530C77C1DF4AC1DFC8DAD1E9B8FDFE6055027C5F43E3EE84D90B71B9D8DA7BCB05CCE5455BB5A35D070D8A70F9FCA7A5E6BCD7EB63CD47E5F4FB7C5E0B33258CE775407E9B0F4F272F742AE2ACC69D2CB29D97423A67739A98BCB3CC5F429451A7A8AFB36473C984911DDA85D8D2B480B491C0D146A2255CFD3334B23B9B5210B2486B1945711671DD06358B0F2B84DB9DC700608F85E41073C96200E3711EDF692E660F52BEAEBD3AFA46E3867EB95C3EBFC96D6661B583C1A280F0572D6E2BE98FAAD7052EF64E0FE6E99DFD7FCBD21D7AC2E8BB2A5285A451B0EA5FEA47F58773C9DA6EE4F7BE4BEBB078D5F7F70B93E38E09FECF1B95968CE1EF7CD3360D54D6D90D18B451667A47AE9566EC5C0EAE2BC456A2FAB9F28F9A7D6C7965C3A5A3A1ADD3755B7B3D074A3CBB1FF0010646D8087039C43E643C218BCEE2C7EDE92916B51445308474F781DC5E7C6DFA2E798BAA53F2FA4EC6B90969D64E7C8A0DA65282122B312C2ED97F1AF7AFF009256B37899FE8B56D5F7859D4ECA6A4ECFA9EB02A545665A900600E012ACEE9224AB33305CF2A50E1594A331E9F349F4BEA13461E8E9C2D481409269547690B08CED504A83B0900BE58E77601030314D8FD4AB3C6B3E44788E89ADA41B8BAF9BABE4402A04AEB184659B45DC6C2698963D8206D4BFE6BABDCF58F869B24A7D99D80BF4D1FD7BA9A0BF1DE3BF381F67A0C5DD6D74F2F7B69F8D3E9F0A1C33632275D9BD16374CB20DAC50091D34D37924EE1A8355A4E8B8AABA3C6BFA03CE9C86DD376CA019B56B4990508C08E2AC4D691FEAD8523A7CA95B7BDED68AFF001FDED1EF322F6DFA0E763E34E03A1ECB0BC9099B5B945ADAFC6A196B926A769763F718A3136B7DC0DEA5AFB0C94F95AA5BC5AB1F18B4FD002AE8F0033691EA18EB5F89815712EE8E40C40ECCB0F6FB72C1BB0586000A4B96CAAB0B89BD21AECC624BD5EBE08648630C914A08CB6D8DC60973FF001F7C65B036E073BD6F15DA72DE44E5713B5E2B710E8F97E8911E863ECE69A0CA38B126D599ACFB56E2304B422ED2C6A0995191196642160441D728FAD1FBF4BBF5ABE69F4BFD2E266ED753BBD0F8A7A0E91457BBF1BF47A25755CF6B42E7477B4F9386E0A5E7B472344B9CF81643E09EA5E3551D11582C66972F77A55A5DE55675430D851C5C2D2AC06F0409D76075284C2BD7DEB719477ADE97ACCC5AB6898FE27E9CB48D49AFC4E93AA476EB9093AC44B44E791DC88B7B82B32B068DB2D130DBBA45292C8857E84D426314AA4649DA4F078F2AC3E1972323C60823CF5EDF7624D2188F798154969FEAFE98B5AD5AC4CFC7E33369ADBDA22D3688ACCDA2226936EAF23A1C2DF13A6C5D7CFD41673CDE63F749A131093E896E16D467EDDA642701077ADE848ACFB47CA3DEB3169C03CC9B7D8731C56BF43C552AFEDA19FA42CFC4FC6030C6BED3C8329F36BA3F7627FEA27A03E6D4A09ADEACA76629FE9DA209F490FC7FEA8BCD1E3BF37794F943F499C3CEE9131F70CA3B2AB65C6AB9B5D86762146B0B232064C5EADA4764282AA6775D1CF835B3C876DBDD6CEA6690BBF3D9A50C36D294F669998C56E787B7B6AA95215E432491A8FD43106C9C6C937024A95EAB5A40A7041FB9C63C609CF9E40C107E47DBA7C3B3D72596D0C13A7861A9561323FCBD25044288B37F81A952B219915E2BFE9DE917A5E226D524CCCD687D545F17F51C8478F79377A7E93A2576F6332FB6DA286574DD667678F51E6DA451CDD4B63B638415CFBAA35D6559612A523EF26CB6B9C6D9CFA963B55DE3472E14BAAB60BE080C148C82A7070C3239C1E39C73EEECF3B94671C1F23C707C7DFF00EFF231543D12F0FE4BA1394F54BEA555C1C5C943C64BA1E220656165A9A25CADFCD0BEE69F4ABE1AB9921E85F402202167D07C8F0490196F2DC005472DC765EB6BC11A3E04EB7CB185D9ED179344C7E4B674798C960FD660E9EC80598ABB9792C91065C3A4DEB22E24CA37288FF60E45C8484D8AD35DEE8FD7B795347C743F4F96E553F2078BB6B93C3CD574BA38ABBA599BB98B2B97A3A19BBEC35CF8177522E9A3A00C8DB4CCFB1AD197FD2D468B29EA4D9E9AF97E9BD3E71DE475E51E514E27A05A9CC7713D9692757784F20EB845CF6239AFCDBD89D74D710E43A9B0AD3110AB72BE7E71D9A434BD295F9B69BEAB6B91535D2E392A69694CA4F35F0F66D4D294052FD7B97ADE2EC6A23791C4FB59C0951218E3816341219830023CB2E0EE241DC1F18E785F68C0008FE3C92319322999C20707E4BF599D67915C7BC667B739C7669D2DBF263D4DDEDB174794C5E9743A46575957331CEA72C9649ADC16351EFDFB39AFC0476D322F1A49BFF505ECBC6400F43A1E20E41DE695EB41CD3DBB9BD25F5A767276A41B60EB2B7627A9D9C7DC57A8DC498E993D0AA48B99AB996CC029963ADD015B7F18FAD5D6A78ECFE96FB5E73C6FD27883175B17574789DD477F1BA197399F22E36DC676B092AF3F85A3A666926FA1D4FC99DB5FA7B0B29295A728FA2C32B07D6C2FCE8703907FC7DADA7D0724B34EFF00C49B06167DD2D6ED611CD1F484E66F9F361DF0E8CDFF001A9F71A6E8A36CBA346F44EEB59B8535AD3B5192BD2AD22C56A345FF0051A53D5854DA9AAB826CC32C4662B31998AC8A664640D8DB27702A1BA5C893DEAE382232CF8DB860EB1B0F1C03B4ED270493FB8E393D5A8FD37B95E6393F12EB76ED652DADD96DF45A34AE8BAB54C70AA1A022A21B1317914163EDC12B4B492D14AC5AF48898FA6500EF3A06855802F44ABED5B0C61981122D17FE3E55ACDA67E3348F68F95A23F9FF001FD5F492F91F36741E9A3D2A78A2D477330F5BB655CEB1C7757399D137E3ED68B36C8CE4120D6C46596C355FFF0095018D6A0EC3AD66DF74730BF8EFD7FF009AFA7EC06B8C85E896D37655CA3E6F37A18A9D6465A04A2FB2D8406F88EE618CF2414D696BD296B45A6225075D8756BD62D491D6B36A1AF2CBCC459218911D80507F6021707058305CB78C75D4BE9A96A52AD469CC42C9341085C95059B6A93B41396018E32030E7CF9EB656C1F28F4F055D75C24A452F026182FC3FA7DA6DFE6D11F09B5ABEFF00288AC7BCFF00BD7EA651791BAC750792D6B018CEB27699AD2F69ADA9615A26848F95C7F7227E3168F6B7CA27DABED3589B205F51DE77F535E16C7CB3EB643CB136B383B0A9B1452E8C4166B101B3103FE9A7C6DED11524C44DE66222D6BC7BE19E9A7F51EF316A6C6573BD376A83C4B6D9B21DC3DCE074717F3FED1AB573285B2CD489B5A0105E3E5452618ADAE1352A2F9D6669069FA98AE6DBD0B8208CA9361252E8B8C1C96886C085473B9C2E47B88F3D325FBB4EBCD0D665592772CE8004DFC2AB36D5760F90A77614312A091C609C27B8D85F93F509A9C9307B8D873BAE828AD024918D03E88A8F22618696825ABF9839A5A7E51ED0D0A4958F853DF7FEF4F24B97C09E1525CA53DEFE29F1FDAC6345E085B4F2B95EE4B45E22DFD53FCD7F88ACD662691149AFD7CF73D4C636964FAEDE9F44A9DDA4752DC86FE056F4244581D1E5E49E0E2A4C7CA6C3A81D2FDBACD3E5519A93F0989BD7E83DE9D32B630BC03E14C5E80720DBCBF1570486A2F333365DC5798CC09D7BFBD693175ED5FB248F8C7C6F4B47F3EDEF3D01E9289BE912CE015B156B4BBF8E5E55331C7C9055D493C8047277124F34FACB0351B29C652ED80BC60943B48382338E4119F0081FDA6228427AC50E219A9520CB5A96952560A1254A12456D131171169420EF11F2A5EB5BD662D11308DFF50C409E58F23A7E0FB6DF1DE0DD6D04773B0C2610C9E67A7F217991EC0C6DF3F3398E9A9A584F734A6E6E2235B954427E87A7D4D80958531C0045B6D77935B5AD6244D6B15ADA22968BFCA6F1F1ACDA6D5F8C7C26B79B53E3EF6F78AC5BDE3E5F1846BFAA574FE14F1AF5BCF7617E105A5EA27458CACBE1BBFDC7F7ED87CA7E6626C278F40AFF00BF60F1A13B5A60A669C9B7A62639F1EBDBACFD97680B0546DBE49921A979A424AAD491C44606B30CECA518D7B3109500AF3A064966293181712AC4CCA084A7C8DA4606187270703EF82AD9C1C12B8C119078CF4BFF00C65FA84DBD36F05CB7883AAF27F84A74399C95C8B7FC598DD7792B4AF95ADEFA99AC2FD2627EDE3AE5BCBB75D0CDC77B333B471966EA818070096D074FAAB5E60FD2D7CEDDCF5F3E41F1076FC274BCC79173C5DEB4EF17DF571B965367AB6DED73E4E1D2F9BA8F3F9D959ECE626A3DA6CC350B8C682E0065A39E383E9322F4C6B7DB8CD2D4F4C8EA322BD58CFA95EB76E070AF1462B8BB8842232AAC43211405048008144A570A617620E370EF60F2BEE1B46DE739E38F1F6EBAAF16613386BF3FFB0F644E67887F51777C842D62B75775C9ACE384D4CAC3C4CE5C00D556F8AAA4A015D6D0455D27F26F7B87255B2DF853B79557F15783FBDF2F7929EDFEABB52EBE3E5741E2B0E86BAE402AD07432F2FA1A773CF910D6471BC83C432891611DE2BE9B2A7E443499F1F5B3E494FBD065BA3ED363C6BA1D4EB7481CAC9E8B1BB8D5BECB45EAF8D8CAF1FBC9EF69741D1F23F05BF23232B37F2C66D5CE60F74D43DAAC50493BA8C2BC9FA83F96B80F37F94353538686387E7DE4B5D2D356E31304E8D5CC842E0D3C93DF0718DA5CE300403A2606E1B41E23E9E811A28C8507DDF8CE9D6450D32CD898D282ED89E3AD129AA27788A655AED69F052B948E78D3B5F4F1077EDCA8FF005284A57C44A44D295556760101249538C8DA79E070481B738CE195706942BE424D3E876B689B8C74AFF46498D0D0D375A6775C26BDA33E4498E0F2DFBAD658F045ED0A11B05C55FDBC631AD6FAC0795E4F7777A6EEB9CCFE47F6D4EEB39A2EE96CA2748BA6C2BBB666BBAE5C86B1988AE017F7B1D201F8F0D4CFE32745896AB580E591E4DB4459401156DD5898E1BB749366DCCE517B11E52F90444EC7BDD091E75A60D7FB6C7DB02C65EFF6D9CCBC75D06BF05D9729BEF0DC9C48BB192CA103955AE8447ABB4D05A6EC0464095949AB57E6DAF46D01D8115FBB4528188A016629CC952279641D895640CE7B8B0331658BB6A5C4A8BBCBC780A576BB10B9C5A7A6ECD7A7EA0D36D6A4864A35F51AE6F7B1994C0F201619BC33808CC4A8625F0003B8F4F0327C3FE27DAF09F8817EB4818D6C6F18727981763EC85D4EA4E7D096EC12FBFF00D394F7F9CDE0311788B4D66F6A5A7E784F8DFC5FE0947AB367F3A6A393917599D8D8D6D1B3FF00B68C97F60FDC96D827E3416E327E3AE18982DC7698A7C7EE5A28F7967C91D2B2AAAA724C1BF04B888462884CFDF50285D31516F9320B984412C0A8EB72AF62C13EDC5EB6B44D666A8DBA3E1B4F9C7B093F2A6A6479356D0AE8ED950374D47C2F2F72543FBA2590AB2C5F2AD6A92C35F4052BB4A7F55BEED6D6B4C865D5AC492033470576725848B3151BDB244BB14BC49BBDC48001C95C0C1C769699AD68B0697008E28EC5A8E18C472C68804A1513618DE4DA18BA8CAE4E4062C7F3B3FF0097D0F0F771C723B75631BA1CFE6B0C59DD0281B0CE7CD517AC565E6474BFDF12B124A45CA38F705A284B452BFD5F588F843C1DE95D9151C0D54D95346E135B2755F8D150450920E3B025BB98D5FB258A58330C57EDDA2B23814D62D081FC1FBB8982F3DD2796FCE772AC2CBD2CE02D940EE70B93201B1FDB31376ADE42F84725680B526DB0D9217B8EF60D83489AD65AF0B773D0626AB46E67A12EC702C68D89CD69DC871DAD5B336AD571CDE3ED3897BD2A551D07C84454B49F8FF13720D3BEB15A1D91DAA72846546483BC15B200431B3A28EEE140711B36F53BC0015C0364D7F48961DD6ABCB14D991503AC4D222003059D7780BE76F21860A119C31601EB23C798BABEAD79EE8F93CBC97F4391F1B701D3AD86E2B7694E850C3ECF750D4C8B5425110658CB3272B9A96B586518AF599F6989BB3D87EA25E7CCFE378CF22F43D323A3E38EDBC81B5E39DAE3BC62EA581E54C9673D7CA1632CB0F438F0300AF409B02D15EBCA37A9750775B2DDE831B6D9BDE8B6FC97EA4398F187428E92CA6EED79C7739CC6AAC510623339CE60494350386207738F53F2556B57360048AAED31F94F56F51A0398A92D5F31F92350B9DC2E8E3326D512575EDA5D56272A9E766AEAA5A1ADAE3D4D38CCE7463A69AD53DAFB2E281252F54A846CE40CFD169AF6A3058A112990B3D3A74D2BCBA8CBA5C51B8A85524854C8B5EC4D1CCCE50DA867AB340CCB223E108E6EFEA8EB1A24AFA5E9FA5C504BAA577D52EEAD762756676BF2C11D1D3E4C615E4AB5AA89D94FB91AD14621D5D576B8CEF5A9ADB3E9E317B7F0F717D4F967C8B6CD1AA2E208B65577CB6F8B762F41BA353698AB374964086BE4E73AA6CEF36C296432C01D54463431EB13D437A956FD41F433E69C0E3F25ED8E3382467C29E3AAB1DA73CF877F432D3C75BCAFB97D102BAF44F23A8D2C97678F716D51F44D63B581929B4911E9AE89F5BBDE39738AD0E3BC99B9B05C3C8CC07950BCCF43F6DFE856119ADC5393D13813CF1E363D520511058BD13B89A2D89F785FB516A9E1B34C7D417ABFEA7A8EE7532B339CE57195E338E378C789BA9CE72386C65F8E19906929AECA9861D474BD0672492D42790D1C8CF032D2960BF8E93AF36930D75BD75259D3DB4CBA77EA51A451FD76956A51514C134596943F6220F13AAA4AF199E433342F0A428BDD6F93CF60B46B86D8C186548186C1C360E32300E4819380DE5707ABA3E7CFD43FD437947ACC17FC71E32F1170DC672BC2F2FC2E1E4F466F14B8E30AF3A0623F3D757655D2BE1E7DAEDD91530B3DA2E5E7C237FC461F92974DD3EA9BE267F0FBB6D8E879AAD79CC4DFD9634B3F05DDE786CE507F1534FF001CB1B91B1A5242594B357219B8A148C5C801406E3210FA09FD6D0C2ED14B6CCF246DB1E66B97E069190AAEF684CA3B64E0164C00086C718EA3134E403B539E7C0FBAF3CC8A707191900E3C804F11FF008E5EEBB0B234698E7173F909E6358CE8A59D358A643F2855AE1B2E652E3AEAAD5ADC9B4603CCAE37C0F0456A3260A7F7BA4F2876F46D8BB0D1F1D93B19892D189F91A8B159F867242691C7A006B2D9346BF31AD06E8C88B568FA3460573DAD04FAFD3E47C2773D7CBEAB0F5B5DDA6F94CB3DCEB43619B8699EAA83CD717733B7155AADB745934E6CE50C1A51028AC8DAD98ADBEA2237281D4C7CA5F52B626B686BAA4C9DE441F978B54D7815594EE564DF7355939EB641F35ECAD33C18EBB1621219BC990EB88E66132B3451150D388FBD219275122E5C398E4C40F190F2C406C0C4AB7B8F55D1385E62641F86EDB2EF62A360DDFB7720DCA4ED392CC0E54672762874B331A16E7F402405A6825FF7165A5396CD465A7ABB769168AD7A6E3D40A855EE9B39EC652194CDA0ADDA843C7373FDB7418D8BDEF29AC6E236F94DE7F962746465743413DE632761BD6C0C9DB735AE4D7B207A46946B22A3789AAFADA0B67934D11D526C51E769D4956D3E638CCD57AB2B3849B18DBB7D7CEC0CF4A9D1875752B3999DB587D2554DE4819D5CDB4964B4BD5813D9B55A441FCB6274F1FF0084F63CEFD6F15E36F13705DDF57E4869E9C6479EC9C3AD317633450C1B4B6B51A1E8BA10ED66E88C96D5E9B66F87CE0F0F140469CCD302C265D344D0759B3611691769E6512D6304565CBB6DDE645950298E245690CD24BB63902191DE356673BEE7EEB397043E55977A60E0A9FC82C092005C1DDFB546EE32EC92137B159067358DA15E2F5D9E68E6E590C85F9DA2A890815E721BE7C61C3D252B41DAE0D4CE1004F2F60B24A58F731D89058F1A35D3F32AECE1F0B99D6E90072ADE2A923F9F65E930588B9CE91CB5A1BF824583F6EF0582445EB6B5A937B7A1F4EF97E00E5B5FD3B6A73E8ADDEF8FF94E23ADF20EC546279AD6EBFB34B5343490FDF45F7C6DE3E08C97E672514F4499C1AE5B9AAB068C6CB8EBF4634FAAEEFC74F4D79119CB9D7820AC0A8AC6FB51EFFE9DA4019F99262FF38A9075F7B526B16905AB1599EEE97660BD2C10C9235EA8765988C823694BA472B959031EEC643FB58901B01C280DD74AFA3F539F47D234A93521EC9ABC4C265025DA8C3F495D64561B920DA8C30436707C1233FF0007F88BAD7183E9751E0EC6C3CE5EA5BC9B4C71A1EE499B9FEF7DB6D730D6B49BFAED50597A962D69345E6F358CDD8E474363B0A5062A54777E2F7A807F01849627C26F14A4445FDE29F6EF35F6B5E6FF00FD5131331DF27E79F36EDC7ECF6BCC28E162ACDCAB3ABD882B7C66D49F98A695A7C66A3B58A40DA2D1691D4F6AFB5D82F81B82D4FC77FB1D150FA2DE323A3D2C2C11908CBEDE4E71B4565160D222669365BED044388B9AF359AD6B7B7C22BAC55B5DC49AF2C90C092298ABBD8EEE795CAC6492AAD286C6F719C7938CA860BFAE43ABEDA948899D86D0E912431AB31003B2451C6AAABE49DA771FB9DA0C57EBF7D1CABD2F80B90F37677943C7F93BFC870C9E6D7812E31B8DEBF49D4FA0D565A754DBE95ECCD8E93ADB563F64633C7874E7D4C5C058F9CF94FBEA3A55B5C26EBD9D57A9930BEFF439F4BE32805F653D85B49B004A945E8ADD66D16A22F307CF2C30D365BFE2FE25202BD982BA5F5EFE9EFAFF0030729E27F52A83131E2FEF78CCBDDD030FF7CD7E7F37B92EC6A3BAFB6E6688F18F26ED2954ECBB50D64ACC4683159A84290B4F396CF59D975981D4F32C72196971462F262E1F434B02F91CDA7B782F92EDB3A85C6C2AE1EFB0DEB60B15CE79273434C66CC680B2DA8F2E059646DBD7D5AA4EBA2CB6E85A8208B4EA9634EBD561950DAD3552B09A1B961D9A18EE5789FB2A628E6293068B72921CF2DEA71BAEA77E0B4DFEE60B33A59C3B11DD494F74AB328C877C8889F21C608278AF34DDDAE0A74FA2D9CEE81A63A6DEA09B5B6214B8579588A0ADA677F6136446CF03525595CC77FEB40930001B60B6BDC73463CB9DC2FBDE51E4B579FD0A198C69D9167E7272AE2D9B068D5D957253A86F8ABCD4D680AE2B017A2B281A642491D5BAD6DF79FB49CC84BC33D4F2FCFAA9792BA35BA9C4EC167F6B218C6B6065828311C3819CB5B4B1EFB0A11ECDD817449E86A7C55C4261B19C387F373565F5F5591E992EABF664F17411E974F3359AB410E458C501CB67296BBC3B66984F99C126A13ED303BE40D901CB562835D1F49D160935196E47684B1CFA658411C67286778A7AD257B90C8E8CB663781E0EEA011CC6359231E1DAB0B969005937F0FED2739055483BDB9F24E3CED2BC0F2BD334213C898A73FDEE6F4F698D5B8B54DA5D2E772D80D35522C04D332B9FCCF919EC6858B9E926539967F42E5D5269CB1A5A6C4174193EAA9737D1B7A59D272E959F8A326180E8EB43C1A2FED4285592BF00354A9D4BF8841C52D58B07E76214C42DEC7D012C13191DA6874C694B12EC64D4C6492A49C2C8CA338F009C78C920675EFA8246E878246493CE08E7919E783CF3C1CF4DA6FE3D6BBBC6E731F9DC560BD66B5C68F27C664734E3B1AD6184A92EEE7EF6751869C612D7313F2D2846685B2B784DFF0065CEAC302F4D7FA2DFA8DEC388C6FF0099B9FCF78F1326C33D1092EABF0235097687151174F9E1E6745A8AB76098F461569AC86547AC420AC45CDEFF005B2E7A72F4A1E15F4C1CAA1CFF008D396405A614469EA766FA891FABDC989F997F2B484B861346E6F91458B9434B216B5AD612706B94C4B1E43547FE63DFFEDEFF00EFEDFE3F9F7FF6FAE85D13FA79E9BD1A22B622935DB44A1366FC92C70425436454AB049190A5998992CCB2BB82331C67807D5D28227EBB64960DB5304AE0E402E460F38CED51B7002B91C9491E3CFD0ABD24616A5FA7F31B7D3797F6586CCF9F1EE61F27C94B8D2F51357FC3C7F7E8DA25AD58BD59274C0A5091538945893FC329F11F81BC2FE07CC2E07867C5BC578D7260144A47CC622693EE8A84B1667576AF426CEC9249ED69BE9E83778B7BCD6D136B4CCFEC5AD7A588388B7B7BC4CC4FBCC7F7FF001FE3FC4C7F78FF00DE67EB1DB0BF22F2956F1467ECDCE1ACCFB5EFF6C91F766B1EF16BC4496B13EDEFED131EFEDEF13F4FCB6264AD1D289FB14A25554A902AC159428C02608552367C7991D5A4624966249EAD12BC11B0658D778FE646E7F007EF6CB0E140C03800003A539EB47D382DE43E9B73733E6B8DD06F64275AEED57B32B376CE932D5CDDA18A6A685D71FD83A4E860E54AED3BFF004CDD0B031A3EEC7D20F9971740E2B7360DE4A2F7F66F19E459ADAD1331F312CD990D6F6B44C444DB3C779999898F9C7F3B60F7F871B2AB413B8BE36A64FC5F45C74E10A24A56228759A333341502CC4C8EF17253DAF61DE2F17A567EA1F0F8F95E817AB75413A97DE2A4A157AD476BCC56D170B0BFB518012B3040B22F988C1BD094F789FE6AEE7A6742D5E65B5690C578AA2BCF5E6ECCCFDB4444320FDAE3B6A006656C805777B000C753D51AB51AC29AF66D5450A2386CC7BFB6323011D5918283E14B10BF03071D6B9BE3EF4BFE4E294521F1E6BD181CD3EC4B420294A5FDFE5EF52E830B82B15B44CC5BEEC57E5131EF1EDEDF4E2FD2FF00A61E8F25087BBF95F297A0096BE3E7300D4D76E2E1BD2C3FBE97E4652D06A5E6963438D90536F6952F13F29BB7CA78C96498AC152CC17BDABF0F8D2C798989889898212B15899F688F97CBF9FE7DFDA3EA6CAE7E5E731952F6D238E82DA09860053A59C969E931F77F091AC9BED434E5EE2B102004D6F241D7E1424D2F115D27A27D3B148B2CDF5371D0EF54B33EF846DDA402B1AA86C9E007C83FC863C98BEB5D5D6268EA414E8871B4CD0C44CEA3EE8D2BB056F387D859739539008ED703C6FC821E34C9F18B7CCE239C62BCF2B805E59ECF5F430C99830D69FB7190768C0195691ED48A1EA5F7F8C5AD3378F97D2F7F501FA4DFA74F2BA6D68F8E95FF00931DCC089FB7EE6167ADB79104B5EC780B791AD6BB404EC7F85E038FA99810FC2BF158A3890DDA67D1F4C91CCF1C46BE2396AB1CBD3B10C56A94BC053DDA76125AD2E5405F7C4C76F008E3A52B1125A677B03B92396669589EE9662599BB8087CB312C7DDC9249CE7AD1E3D5B7E897EAFB8364DD961E303CD2BE619A32CFF8FE85E8B43FE1F5984AEA6533CDBE1C9DB09D2493196909A9AD4B9A86001AB2B684E35D8F3B71BD417518CDEAEBA1074BA3B98ACEC0F4EA5434187831A63F8D08C3CB926071FB80293F35D915A51A2E0ADA95FAD77D2D8F5BBFA5C7A66F5A7CEEAB1BBC864715E56B859631BC9BCDE70F3F40FAD658E35ADD8279F64C5D523052D6C423B31B0BC52BF81A6BD208130E3D35E8CD4D809688F4BDE5626A6A3A424926991CACAEAA2F696ED24B1C05A43BE6A129ED465C2E9F3A9554AB7D3DA27EEC24CC154FE93ED57CE300A48A154E38CA3A82D81FA80E73F2D0EADBCE06DB55CB8F8A56A8A423FC57D618BED8E01680844C10B4092C193D7F32D2DCC9AD25AD2B23A54FA6A5EA27D02798BD3F7983B3F1376DC8E6646D729A455C76CFA41F376B258BDDAC7E8B358539D628743673CA06D6B10D2710ED0B182A5C129AE7D2DCFF00D3BF505195EA369162DFD3B08D6D57786DD7B51A84ED5882CC01A1B10CF1959639A26292236F524367AAC014807721FBF70EC7CF190E8C8195C1E194804312080718FA682AD1E5B917CE7E1F76D3F1FF007F799FEFFDFF00BC7BFF00E7FBFBFD7735B492DFD53EFEFF00FF0027DBFF0079FA3E8FA67E9AFAEB592916256E1B4C4CDA226267DE2627E5EFEF1FDA7FF863F9FEFF0051AF974178E6C7B2A34D676AE49C6FE73E8DC633AAC8A2D35BD3EE88C3BD6D1EF4208A3208A3B5865A5E969AC9F47D4D5C033C6080416008232082082083C1047041E08E3AD24E1188F38EA827654D1F2FCC2FE43DDD6DF5509FBC9A9FFA6E6260647EF146FF001723390019B1FBCFDB659198C2F95A057A56D6ACF53E9ABAEDE43CD14E12CED9EC21B5393F17A3E6C59325C7158BD812B82C70DA0641B52BFE45EC2A51821C5371DCFA3EA2D4E28945391638D645B442B8450EA0C32640603700703201C1C752A9389064E3038F8FDD1F4CD76155900B0EAC1A0CCB0DFBD623E5519255A16E3FBB5A4D3DE2D3588BFC269368F7889AFBFD54A373CA795F7B727B93BBB00CF6FF00073D193516CF4442ACD22EB24B846BD18B54978B3134B17E37B56B6AD2D3593E8FA32A80F22EF01FE3DC3771BC0C739F8E3FB750C9C29C71E7C71F07EDD5A0E03865B073D6491E8FB2B20A5206B22E748E3AB0034888A0030C45C81052B11518444A0C7588A8EB5AC7B7D4CD5AC52B5AC4CCC56B1589B4CDAD3ED1EDEF6B4FBCDAD3FDE6D333333EF333EF3F47D1F5159555908550A01E028000E07C0EBD42483939E7FF003AF6FA3E8FA3E87EB7EAB3F983D217A73F3B752B767E56F186275DD32B8AA600759D2BE06232516DF75556F0936B0CB016349CB5084A58BF12C0E6F2318EB43E8FA3E9AA97A93D4556AC15AAEBDAD56AF0A08E1820D52F430C480AE1238A39D511064E1554019381D574956ABC8ECF5A076672599A18D989CA72495249FC93D7FFD9),
 (98,'','matthias','Mehr Maz',0,NULL),
 (99,'wedertz','benjamin','Ben vom Wald',36,0xFFD8FFE000104A46494600010101006000600000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001D0000010403010100000000000000000000090007080A0405060302FFC4002D10000203000103040201040300030000000203010405060711120008132114220915163132232441175161FFC4001C010002020301010000000000000000000005070306040809020AFFC4003711000202010302040404050207000000000102031104051221003106132241073251610814718115234291A109F0345262B1D1E1F1FFDA000C03010002110311003F00A385AD31BD6AAD8BB6E18F501C38C48C4A4BBFFD7F0FF045026513DA7EA20A2067B769F525FA1DCBF378E66F5032399E29EDAB9A704D8C7E356A1DF8EDC4E4D4AB58BF8FA464121E75A1A0DA735E7BCC8BD1270511F4C8E070F5EDF35C4C1A0B5F7D9B159712D6AD0A48D9681C135CEEC23098088ED2512713DE7C63D6FDE37F8FDAD7CD7B801F94EB5522142072055DC4A676681301B0C0FA8359C4F8FED051E86BEC30284042CA817E522B70160581F7FF00BFDFA1B34713B08185B905A320D7319EC7816148EC7F407903ACAA164AD5CE3F65F08F2CCB94DE8F92621626B7A0E49A445112A1949133FC76874FC91205DBD3B7D72E70DE5DCA7F1732B673AC549FE94AB746A674B746CDBF02B076AE66A6B7F505D4362ABD2B132F385A8A465C33E52C72295B2A942C20FE25438FCC7F6617C5310730445DC8A4BBCFEB1233DA3B17947D7A959ED1EBE82FAA5FDFE9E3381CB6A71303AA38BCAB157A181759AA8653B08729202EA17154FE7B55ADD624DBA8D85B96E13182F43674C86858E3C71C934092B42B21011E654FE5467B1019801BBB0B25B8EA2C9FCB6222E44CCE046051522F71A1D89B6ABECAA4D5DD01D383C4FD9B7531DAD91C575F8AB50AB7C6ECF23CCDEC8A9734ABB955EA0D9D3AD752D4D6B896AE3E4ECB9510248BE416CCCC7AFACCE8239D85C87A813B3C5AC71AE21C9C2A6D717CBBED8E6FA58AAA291B3A98A9FE9569458C9872A4C2FD8029721C51DA7B8C589B28ECF54BA7BC6E873EB517C391623308B8EF01CFD1C9A3C7B86D972EEAF1ACEE68E7D5E47B0C75A622A5B90B6BAFF8CB501E8302088DF157B54F6F4CE2DFD0F0B8AE666682F2DD2E72EEBA8EAD2568922242AEF9DBF8B8F58B0F3580CD6BACB255AD4A6B428DB0E84862F8AFC5593A9B62E5E9843AE5EDCA388AED8F1AA300E03B7048FEBA2416B653547A830B0E5D42622332324A1581916880C011EA3C76FA1BBE0807AAD0F18D43A9C7ED535D48B6DAD50D581FD4A926869BB10F4AC3FB6CA974C26FA056E19AB249169C78762957E9EA49E8F4F76F90F1CA7B173A5BCEBA85A9AF34ED63720B381AA8E2595442A7C56523F8B511F3EBBE0E3E26D971AD0B4A589126117AB06F08E9CF4DFA17A48AC8E2DC7EE5DC9CFEEF0E2B4A752F9A8FE18062E893F9469DC8AB5925A3A1BBA162F5B267CD7ACEA90B7E14C913E6BD2EE1F457C90ECDBFC9BCA43AD9EED9BDC9A5266B2FC73B987AEC46B67D7B11D856E4D23CB58CFDBD00BED37FD4F27260D3E58F07125C413642C8241B49962B52627DA4B88E416AE3B8078EFD19C3F0289A4667CB5467F4AAB03441E2CFB0F7F606CFE9D55871FA71CAB7B86F2E773DCAB9898DC71D8B570B2CF772F8EF6BCDB929CC83C9B6EF9740EA79A575D18D5DB698C6577B0E66B9AC86F7B99E325C4F97E5643B52ADBD81E3B9D6376B53658B15B22E34ECB159B365A204F7AEACA5AF258FC20C6C804CCC17ABB6F3AE2FEDC3DD471E8CEB997C4F43632D22CC4BF977F4F075B0AEA4C9D5F56B8E3E8AAE53F82CAD67E55D709362FCDC2C54CCCD387DFF00718E7DC13DC5739E37D44DC6723DFCC2A1551ACDB28B84FC14524A70972615AA78C56A63DBC995ABB5CD3635C0E3997C80F0A6139F101CE33BE3AA46649B09FCC31827D21A06716549AB1CB6EE680A3D4D93E157F0F9133481D1C6C47421873D81DA4D1BEC4D50AB27A808E636B91D93912608C7E84C91862E23EE27CA7B0CF97DFD4F7FBEF33133DA3D11BA3AA5F16866A3E40157E2A009895C099C499FE9332366591F23193E43E3313011F5EB06FADCDB40CF0839909985C84489476FA267F985F7FF0033F53DFBCCFD77EDEB1D54AD5A83623C90DAEB93918198F8D633DA5A47FB148F97F92FF5219EFD863EBD35BCA8A78486B490924F25A9BB9248BBAF7E4F1FE311910290AA4B8040362AF8E41BF73EFEFCDFB74E92EB4D8007052160988FEEE0A0D9991881EC0762F57690478C0F7950F73832FB999F4BD37C9D6BC958AA0E621622313F089F977013F2EE6053F7253DA3BC476FB88889F4BD09388E18FAC9E7BF3CFCBF517FFD1F6E84B15DC6C8BB3F4FAFFE87F8EBB8E9560EBF2BEA2550C35B6CD9532D5A50D728F97E3A6B612FE31930F358808148FEF3131D862463B4393D5DE9E725C2D6CDDED0CC3AD5393AE66A1B5101360EBA626C3455FAFC72C5403591E03F6E9EF1FAC76D6FB58BB6F8CF3BD8E4D5F369DBB19B837A867C5BA9364136AF5CA901358BEC13606AA6C0459391FA610794118C13C3D73D5E4FB5C6337436C9DF053D468679A7C4D693B087AEC4791C83602614B191F08EFF007DBB8C44FAB43239C6B5756111E410149A00F1EAFA8E07D87B0EB1A6CA90F8871E2DB5108CAFCC793211762BF43EF607B0ED1C7373C9F92F257FA5572D6F92F8E645EEFF0041EC73DC019F50530330311F531E8B8FF17BD12ADD53E40FCC7E75F753A2D0D2DFB15E90BB3E058F84D0AB64E1D5FF002EFDC35B3F06A2CCE194D765B681756B1FCE1CB8FEA00EB4A4EA3E05A55C2C1CC40C3E0A1833E4125211130BFD64BE864867BC4CF61B86FF001B3C4EAF453DAA715D4B346AE3EFF366696EC3054887D7A5A0469CD73DF0324ED4664A803E52225D517CC57382313903A864FF000EC4C994926491556115443C840247724A83BBB73C8E3BF574D3B4D8B53CEC7C69A14922259DF72EE0BB4022C717678E4D0FD6BA9FD678071AE13C569E64E720F1F3569A74F2C0EB116F6DFC26C4E29FE2AAB0273B2A925BA7B052A2A49AB5EBA170CB2C916709BF4F098BCF7D6E4376F58A8FA230D3005CD8D6A54746B26ED8AB4DA892C4CACD4BF372ABCB4AB56CF1AF25418EB92F05D4EEA2D1B9985C7ABB017A16E951ACD62DA5F939B5B6EDD707CA812120169F914AE489B3E37AD06D63248AC7DC75EA2F52B2F3D1BCCCE74AE1BA6DB561C47103335688652109922995A4516889A2B112016178C32626242E99B516523686968E41A50D2B716C451D84F27B9E79EFDEED3E9DF970890C31C1195511848EBE5007041E2ACFF7FBF1DD6D6ED695EEFE3727BD939F4316E231EAD01ABF995EFA9E535EF1695A7597D860849B69C34CA94E83816F96CA9681F9E3DC95FC878D650D98C9E6234405DA4C6A62B6956D07AEC22E4D48624ADE42B955463D772AB8412BB55E69598B04D0B55A1D50E44BE474ACB46D9A2C48A2A519909241BF4B76469AC92295098FC1581AE829F1037B427F7188F5BAC9EA6A38E899E5A0635732559FBD908707C8979A295B54A58758E1D5DA4E55AA8A339624A23C0A0CCE7D1DCCA18D6A109E0A82B6001563DB93FE3B1EB1B140F34AB6F65536382093C573EC6FFDF069E2C7E157FA6FD4AE9DF37E884E7278C6ADAB7579EF1B7699CD0766585F964EE6081E6DB3E3DB758DA599C8A854BB5731E309B44A901B921177F96EF68791D62E1FAFEE1F8DD4BF9DD4AE01C72B5BE65C5CEA49B790F15A21256B4EA2A9487E55AE3ED64C68D8AC86156CA05E8156766136D67C91A1D56C4C424DE4A9529DFBD76DA0EC2E53482FDB5318CA572B7C42B4D5D36D45B55F0C282B58B4E009016C943AD6BAC55F7AAE6D920B1A9678A576F20A59CD74B99BF81633AC65EB719D94CC78E8578CA659AB621AB69D9BB415F224EA581F8EB82453998B3ED58C44A565DA00322DFC9400E2F9B37C903A279786B918D2C6EAC55D77A86B3EBA00156278F63C002BFC51E2D541EE42C200911998189F8E0A227B78918C4C77EF13F5133E331311DE23D730F659967C149E010644A3603A7FF47C65725111E6B8889FD27B8CCC4CF6EFDFD118FE463DBDD5F6FF00EE2B7F0F8BD3A6BE9A73558F39E9DDC42C973FDB9B6EB02FC533511A5AEE3FA48B79CB81959C550A360E201FDE07ED6A49AED3B3E62724660A5909094C0CF8B0C267B04C4FD79768EF3DBEA3BCFAB9633C7244AC4D6F00291449BAE5A8F17EE39AE7B9E7A584F0BC12344C84152451FF00941ABFBF1575FDEFAF7942A7B76F0EE20B02EEB22EE400213305F7DE3F58EDFE23FF00CFFD95EBC4EF5712ED3DC2623EE20C03FF0067FCC1F6999EDDBEE23B768FAFF1E97AF4C926E3512917C1DC79EDCF02BD87E9C7D3A87CAC726CC5CF73CFBFA7EDF6FF0077C4EAF6638B8CBE0DD52D5846B5FD7D2D6E35C76B2EB51FCB4233BE36EF68F99A97172A9B34B331AB95C1994A6A9B546506EF21CCF70F46E171BA56E71C722DE8E8535DA5FCD60FE693CEFCDAEF757BAA5150B494BE6B9AD2442D818235C7D94C85F657C1F347A3F8AD6C4AF4763925ABB7F4331B08BFDF72683A954BD7C5A26014B1D39AE2521323076E1532444C9F5E3EF65194DE0D85733EA64869DDE5EE75EB622A2D1B514715C9AC16192536492B4888A94E0880211FDA7C63B2DA6F1ACA7C4B91E1E8A33233EA78F0C4C7BC51C7003305A3C891C1663CFEDD85556612EBE00F5794C288E6F6B0AEDFE38EC7A179C7972DD9A957E24CB09D58221A62B5318666B5C499C109013BB79C76648C7799108312F5623E71EE4ED70CE29C43812AFCD7BB85C4B8C62A979D3215CED151CF0B8F421724B9EFE23650C83840A915C3B176713ABEBC21882E459A772BD98526F5189AB9C5E2EBAB4595B054D8F03FB778C4442C664CBCA586033E5E89575231ECF2BF705894685B86BB99ECE5E3D3A70F2F9A8DBB8ECEA209B109920AE053E42B5A864491FF00294849CF7B5EB51FE6530E376A3B8B955237384553C8E6C022FEC7BF4DAF0C3EDCB66DBB5B6253915B41701B93DAF807EB60FBF5610E90AB8EEBF01E5FC9B64ABB1E3D2F5F3FB7A9748DA49B1AD4B91BF185A5122E11AC8E2F0306B6F7043591E5D9A32233B8B3B9C755B9B702E0EFADE16B9CE29F3CD2A4AF229C9E3B6B907E2E3B49B2C90066B3D06D58BC67E4A2B238F28F167A3EFEDABD9E72AEA074015C1773717C29DB9C4B038072DD04E0AF5F94D7C0C7C13C8D5AD9C7A4C5E2A2D69B74F5811A2FA7753512E8B28A6D72A01926B83FF17FD23E9FF367F2DC3A9CBF7767413833B9C8B916BE69A7468F14A2ECFE35C6F3F3685747E162E7A9CC29A29A346808C2D40AF011990186E924F3D4523AA951BB7EC05940534B600E473F5EE49E3A7364E0604B162ABB012A2F2A28953C71408362F9EFDCF03DABD7CF783B3A43BD4716D7CC562D685379FD48202056DD0CF8544C2FE18B6B8BC0B933211B3499265F290417A750BA57CA336FF0FE6B569FC7475DBC5E9E89C99482EB5AA4C6665B69AE64CA1E1F24A1B12D9274D7829F89440476BDE77F1F94BAEB8354B28ED60EBE63C44B472A0FF34F2A6CA09EA5AA146BB76AA36A86967A2D4CA19617359C415EF3A477DC17DABACFA09D33C4E7193983C828F4F78CF10E6943428DAB59F76DF19A9F852F152ECE758542ACA2C68E35E4589B757FA8249C31E4D50E56666642A6E590854E361200DAC7935DF8009B078ABFD31B0F46D3CCE240AA6360490F41830ADBE9BBEF7F4FF27A141D7DF6FAEFECBE579792A2AE7428B790E46A2A07C6579A8D46EC556308A0DDF1A154DC435E7CE09E4D5B24242047F7467ABF5B3DB8D4F76FAD3C92959B3467E532888A2D6D91ACF53E7B1B06DD37019B18C8909A64A38939229B0B75CBA66B5F4FDF808DAB56B5F2F3DD19BA2CAEA43AD7C549949F434D68395DD4EBE54A72F42D3160FB9F12F42C36CDD4CB6C5223A99CA35F8E752793677E4D9AEDC9D2D2C93519C792C93AD6C0205FFE846855A64458912868C47EBFE23D07D2CC99D3656D9403038E1D82900A8202DD1DA49A06BFBD750F89B1E1C28A278A8294008E051DD57CF71EDC9E01F73D3C5FC90F50A875078DF436DD1BD17DD5ABF2ACD47E418C585D1BA5C62D5544C1141C32AFFD843208C2561E4A888FF68119A6C751B26A9FF97E00F3816F991ABE49EF1F698EC533DE23BF6F18ED133DFEFD4E8EB3F1BB81D3AE176F95D6DFCF6EADAB3C8B8629F96DA953432AF4AD7A9A40ED10493F37E4A6D096E6CD9532F3D664D115DA8F50AAE533B96EDAABB2B38D15E04D133FF2F789F93CA222241ACF0899881EC231F51F7F5EAF1A5CA25C674756478A5292020A825681EF542C73FDFE9694D6430CC919C152455B0AF9C0741D872C8432F7B041E4575CD4D951CF997E29917D94B4424E0BB7FAFED113DA3EA622623FCCFF00EFA5EB795974E00BE4448B7CCBE513088216768891F109F11888888888EDFF00DF68EFE97ACB6C908C54CAA0A9028BA822B6F041E411407EFD042CA0D12011C1048BBFA7F91D1A8F6FB9D85941835B35E4554F9DD8F911734AABC696662DCAFC673B3AA36A9B6BE90867E1A0CEC98CCD826CF7FB1933647DD9EDFE6E1715CEA8884561B7ABAE8AF5C45CDFC4111A55D286A617F1AFC2CC9C814325AC644F9478762D37427474D753A3D4EE64B0618FCCB4D86D98413A4AE3EFFE7ACA60D50B12744B97053041231312505E9A8EA1723B9BDACD8D9826B32B2E2A229B8FC0AA1323E75B09A8F9150B6140B565324623FA4CC144446BAE9FA6E78F1DE66AC5D9923CF9A7DCCDE90817CAA422C1E6996E86D0081CF145C18E55D6E69772AA067AB3F3537B71EDEDC8E0FEBD46BC77C8EFD1A833F37CB6EA89204C1EC433CBCFFE4090380B0B80890221EC99922912EFF562CF697EDE99D75EB67B11EA526A58AD95D45E6DACABA870199D7AFD3CA6CE473A97D875D5E61A752B76AD32925C9D723177C1109F401B2B815F2DD3B94AC2346C333DB611492E651B09769FE5574DCBA4E188422B530B5A8F6194C2A8532B472A8F186DBF7F858D6CCBBEDFF171AF254EE67D09EB1F19E418F658F87D80E0BD65C48E296EB356F8FF00AC399AF8D74ABC2267F255B160A7E35D72063832B3219B2F01525B920C79BD2A47A9D907039E473649009F7F7E9C3E0DC8C6C8D6460644E15B230F2044A2CA995515A307BD5153EC6EC7521BDD6FBD4F701ED4795E9F1DE37BBC2762B3756E5EC6E07438AEFDFDDB7944D31415B762E0EBF8BD3F01FC4DB2D0EEB9F2372C7B47ADD7B6BFE7007A87A797C47A97D29E6BC0F6B50C2B51B8356CDB56A3D0C55779D6A76E9D4BC8484356E691814081CCA80A22020D6754FA0BC7FA9F88975FB15320DF5D46D31A349666621030C658584D9FB964C0AE27C3BCC7688FA9F515F87FB21E93D5E63418CBC5C875EA5DAF62D4DB71BEC8212CF3F15542B364AB8F788186B3B7948447C51D8446482D6258BC8DB248376E51F520F3D8FEB5FB7D7A78438B0C88B92D3D2817206B043F00837C707DFB91CF37D69FAFBFC8770CE88F086F2ADBCED9BE0487598A0AAA197A6D00AC3663C435FF0016B88340E040C5A5325DA066267D0919FE752AF37E585C7787F4FACE5CB582A4873ADBC2C30429A2A67CB2DB1A68AAEF900E3B4FCF3E64DAE046B170141CCF7A3EDBF8575731707174B26B329E4A3C0E6D57432B050257C52B945913534E2223C55664933E3DA246267D40DCDFE2E78C5C395862F13D1CAB75BF0DEE6F17C40B56330E172ACEBCF152EDC217203D800595E645663044032333AE35C91CD8ED310A46DFE924D5126EC05F7E073DCF15D66B62ACB1C12634B1A6FE5C33156E2AAB8AFDAF9FBF63E5D2BEBA6AF5F1EA6F22E23858CAB15E5E8D1E3DBA8D8A960969383698D6B57AA430CC2496751C623E51E6C08FDA6AF9FC8D7B64B7C63DE7F20C5E3885D6A7D43D3C1BD8C838914276395584541AAD298EC295DF836CCF94494F92E207CA7D5D0F8AFB5EE9DF40F8712F078C60E1155AA10D3C9072426204A5852A33244B0E64A44940AF39EDDE063B0C0D6EA1FB74E23EE3FAE1B9CE36B3E6C3B8252C44F1EB5FD4C69A59C86A2B52C4DD6A87E50856196954BD6AC5C21AD5CEAC0C039D00301B13CAC5D5A49A080450CD8E12684B5970BC2C88071BC30F72280BBBB07C646971EA898F85912A91F98473206B0163A66572012118027DCD9E41E6EBD9FCB4F044749337DB874CF4F42DE85FE3381CFAA66D8B375CC9B3C1AB69F16CEC4FC6AD6CC955B32CEA50DFB359495AD6504E332081229052E6A2A6D1DA5CC8ADE4A05887689099815F715C141148C9417879779FF58FF3DBD1E6FE64FAB3D39E6FD61C9E9AE1723BFC99DD20C2CEE1BC9F9265D4A7E3CAF6F0DDAF7EAD2FEA5A55C2E64D0C13D7DB1D04572D41D3D1B42BBC28664814073E19C1F22F55BFCBF91342BF1AC9B7E3611240BD2D7B9F113C70B1C5A0697DFB22B5C13A5675A825A57AC4C84295367C1976604B2BEEDC25525194EF90BB5D8EEAD567792DDFB13DBA4C7C40CBC7C9F13E70C58E24C7C538F891245C249F96C75C4330142DB7296B35E93F5E3A74FA4DD076F5278CBF942176AC29FB16EA831789AFA113356BD316413E8A650242D26412E66583DA24FB4978C2F5BBE17D52EA265E39D3E27C9AE715E3CBBD6E7338D67869BA8E257290ED4AB59AEC4C5CFDA0AC58B6D8373EE3EC999C478AD6BD2EB5193557CFCB68E70B1B6448514992D54B8214D211607068917547B1E94793953AE44C03AD09180FD2C50EDF7AFDC7EEF770DE3B5A8726E21C7AEB6E379C63DDC88D863348C43FABAB319B7B0895F695B5E93F1A84FF0039AE8123577901199C0E1DC6388DDD7DBE4FBBC59138F83947ADAB5681DC454B0D4148E7D17B2BD951593D7D37D4A6DB0CB2B015B1CC019F8A47D763A7D70CCD44F28E77A7A5C9B843B5F90DE6F1EE31C5D159D839F59F264B6E9FF7093997ED3553E17ED5A0F9ACB4DE6DEF5CC162D9D6F729556AAF85C8F8F62F2DE3999A3917D99F9B4E785DEB35F0ADD8B09CAD20C5559CEB39F6DF699F9A14EA56BF7205703754113DACEFF0EB5C4C65C9C7CFC7926C950D2C55B29A4018C61837A0863566EBEFD6049A26534C248F26908DCC17862E402403EC2FB0AE071D387D60E161C238AE3DBB304AEA9F55EB1F23E666A468538E278FB0D56966F16036D98B43655917B2EB929C8A44845DD2CB5A9AA409B26EFF00151D58EA774DFDC8F0DE3981AD994B83751B528718EA1D2DC4112F530312D0EBAEDE58385869BD4350A9852B64724A2D3B081286CB2550B73F9AF1CEAF721E6DCAB637533B7778B1D9A542DDECCC9D6B5CEB5B62B959B09CC6C31377073C2E6DEBDD4D16B6CBABD4CBA4B4CB8E61537BD9B70DC5D5A7D48EB0732E49C8BA7DC4BA651C333B3356316DA756C8D2E434B535B89E05ABB61995A5CAF5F22A20B454EA2D0A0FD51B92D8A9313E85695E16F153EAB8D830E97979BA819FCA8628119BF30253B291C13654737CFD7BF52E0E7CDA76A78593E73622E3CF11932D8DD46AE3CD5B23DD78EDF5EE78EAD61D5FF725CD3885098AB9B7362E6D6E3F8DF1CA02715EA84D719726C5DD1B9E143391F8B5DB6E6E59644C0878244DA631EB71D2FEA4EEF4030EDF35E71854B9258E53A752F725D855C11B58AA1A8F14AAACB96E8B19EB0699909305CF6B01AA269AA06591E8BF57F8AF5B383714E448543F1B97E5D5D25A746AAC2ED3D334929B5AD547C4CADC99F96959188809F8E63B92D9D8B37AC7C2539D46A9D3EA8F53BA778EC9853B338FD9C9E43C4894712310DE31C9ABD9FC168C47E37963EB5440283B966340BCA2C69065E06A191A767472E3E7E24AF04914FC18E48D94346CB5CB29E2AF9A15CF5BAFA2E463EB38F8912C90C78B9B0C7279EEB66456553B95AC55FEFEE4F1CF5DE6E7BF7E0FD5CE475B85F19E0FBFCADDABFF0051DA14A128CACE64FCAB066859BA4924A408E247C01AC19F199584C77F583C77AC7CDBA3BDF8C6BDBD0D2ABF1A632B4F45CE60BBFD6069B6E32085EE133010292896CB045425233EA136264F21A7C8589E07D6AA4C8B0E132F8FA31C4917E09931E533A07BB46B0B8BEE458194C3F3ED3E5DBBC13FB4F05FC7AA5AE43CFB98722E6CB782CC7136C32159A16EB1F9D35D1C8C8A5429500228536E40CDA37CA83FEC0C8C8FA933FD2AAF130F31EBF97FD5C15048AF617C937C7D0F46750C38B4D548F761CD1B15076B066E48ADA01E059E7BDF7AE474ECEE7B91D9E763A5C536B39B9AC1123FCAF2F254AC3B44F660778816478CAFC44FB8CFDC7FE7A17DEE47F914E39ED9FA4DD4DE2DC778E39BD4FD5ADCB97C27935ABCB550ADA7A49A59E7B29A920F383E311A0AB692702A596416AAAC839362DF8EA273D5D5AC4BA03E7ABA32346AD74A0A48DF798084878AC7BC8C9B165DC4FC0016D88FD7B48D613AFDD46CBEA4FBAAEB3F477A90D653E1D539BF26E1F95CC38EA1C7C8781CE1DEA48B16EC5365C667EC71DB3771C275A93D4BB8116EC5BA56D0D5A50643C25E0CD63C55ABC587A781F9E915CE2C2F7B729D0077818903CAB5AD8E7BB12BCF1D2CBC6DE271E1AC06CBC48E3567DD1BFA198471B801A5F9853017C82791D8F3D44DE99748F5FACFC86EEF732E50CE1FD3AAFAD659CF3AB1C85C76C2933E165EBC8CE9BCF5D9E47CC34966C30AD50ECD82F9074746CC54089B7A3F70BC4F89F0DFEC1E2FC6B5769F65781776AC52B5467273333075AD83B8C5A9AF242ED0E49BB9B56D720DFD3B5533CDCDDDA95922352AA2B2A76708F6EFCA733A813C6393A2B71EE1DC78E96E34F88EAA391A2CF0A3D058F0AC8C426A5F47674B9EEBE72B9CF24BEC48DCD6A384845F4D44206A2D8BD5E18AEA2759791EDDFC68E71CA3679053D0D9A69D1757E9D74BF2C86C54C8E37B9B7793943CE396D2A198DC9FED9E3D7E96486C50D7C5AA5B96E85BA95B1B2E3D434ED7F3349D5E2CAC3934679127D38C422912567A027336D2CA850AB08D58D700F6EB5F06A2B9D20D4532572A12AE508F99DE637C9B364592BC0AFDFA653A5DC0397F29E2FF00D4B8E26DDCCB5E9DEA8B706459D09F3492CCC0DCA4B200C61A3DD2730C5C4C790C414775E895F47F9A6FF06E99F0DA3C962B645CD8C85F21A79944CF8ED3AB91A0E7272E6BE566853A15D36EA540BCB2AA885B46D43258E611B4D7A58666BF9273324AC51D79F257A09E37A81FD5FF008F71C5F153CA9C364CED7572B1A37C5B0E3BFB76FD2FEA3A159CC2B8AB83E65502205959D0200F90E23C3E96010331224662131DD85053DA624BB7A6EF17CCAAD6D3F1F2B0B62EBDF4478CC902CA7F1DB007E47E6403E065FE04E3C8BBFDCCBCBCDF2353528F19C1C9CAD2D7D3FC2F9D599954ED69E95C2741131D5E85055AB8F57CA44232A4191147600F19129EF7A53ECB3DCB73AB04C4749F92711C6B6FAB5D5B9D49CFB9D3BC9B2DB25E095503E57569696BC9C345853899BA04099F391864C2A76E469197144B23E34D040E42C73CB0BA44DC2ED657614C0F0411C1E39E3AB9C6D149C473C324C3E78D2447954D2DB3C4A4BAA0BE5D97681EE78EB85E9974F2E759F9CF13E9A61426AED72FDC9A15AD3D5619590C3435CDB9A314D2C62F3B36B20EF685E9842A852ACFB1619F0C4C89DCE5BC17897B73F6B9C6F22CBEF5BC0E3F5AEE9623397DE65CB3CAF6EE0512DDEA13F3AE681D7CCCDD7608A786E456EE39187529D9B3F93A4F45F8E4BDAF7B14BFEDCCB5F97F50B91710E43CFF009AD47F1FE39478D1EBE857E17C429301FCCB4ACE9E9D2CB26EDEF346BF19052729C8A346B6923F30674DF2B913EF2BA0591D7BE9DF0AE3D6F6EF60D6E18B525A196306B0A0BA8A4328DD5327BC57F3550B089909964575A4C242087D6F8FC13F8512693E049FC62BA76365F89758C7CB97498F363B6C1C6F2963884248215DDEDC49C5015B86E3681F1BF8BE0C8F15E9DA0BB343A161C8AFA908C83E6E4060523729FCC2B62D826EA17747AE1FF871EB969727E09D7EB876B42DE670EEA561EAE6E132C1BC47036F07F1AFDFCE5363E45BC75F1D9A049635B3685F604C8191E3EACAF9FD4FE9972FE219EED9AF8FB34F4699B17362AD7D0A64450B16836BBE08218B813895B248C3B10C844C48FAA8BFF1A3AD9FEDD3DC3F573A31AD7EB057E641C74B16D93229D6D52CB8B6CAEC13B503E4C78E93CD8B5CC8FC9FA0814F6F12B1D62E01D44C8A96F5BA5DBBA54F31D2575D8065F3A5AD21F27156435130B998ECDEEAF0F393EE430525EB98FF0012F743F10FC4306A24459FFC5F25721C03B44FBC7988028AF435ADF635C13C1EBA23E15F0DE7E1F857C35A8B81F93D4B063CDD3E68C37932E24DEB8446CD56C88C11D2832B290471C141B1C83A15C7619778DF1FCDCA697D30F333EB679D864B2001685C92422249830424B111199EE51EA3D756FA8BC6EB566581B895A6AAD9E02D216B4DCC50B3E394AD902302471E0D398F38EDDA267BFA0BB739D7B904DF3ACCAFC89B72C0AEB1CAE9578984118C21825F14CA532511DDAA95B8FB7764C0F79F5223A6DD30EA772EB556FF0037B6C5C490D98AB24CF30016C7686087914C00B6219233FF002F698612E3EFD561F17051864364A314EE038F7A1F53FA7B0AFA76EAC3998D92DE49258F176549AAAF9B8E0714C49007B9E9F9E9DE7DBE69CB6D733D8039CACD981CB44ACA144C53CDA56856213273205235FB0B084E63C7BF7999AFDF5DBA45671FAB3D4EF73DC2F41F6390714F735CDC399652A498FA998DE4EC5841D5F8566DA77ABD8B02D6B2509726D488B816332566DBB5F8F74C7A7DAFADABA353332B0F21F72F69BDEAAD573AB26B935ADF9CD84B2331128AF23DC5872228631930303E38C74C385F26C3E4A0BAD96E4F57B62E7503918D1FC6F9F58F92BD3AB51766C542740CD4CF8A99E9003FF802BCBA005B619EB6ABF07DE194F1AFC40D754C4AFA7E9BA0F9A728380F8B9724FB715E0E410F2BA98DEF8082C9008E909F888C96F0BF82B4BD5A569524C9D61238F6A868F2A04C769326356E5582C40BD862B636825FD3D3963C52B724E8DE351CE12AF67778FECEEF147542D002A3B36B0EF65F22A39F5683D5592ED7C6D6D06E0C8B1E58F76C5E3CD054BC3E381FC7B2F81460F22E2B6BA73C63334B8ED2DFE2BC379971B7F502FEB62F15DDCE6D2DE72B133454AA3CD994746D642482B7E106569DCAD55F9F45CDB0E2494A86F5CA993C733EA67E6E2F19622E65AD551ACD2F9B24409484DD618BEA03C16EADE601E4F2332EF3F713C1752BDB2DDEB6F34E5FC8BFF8DB80DCC6DA467DBE25C9AA7B82C7E8BEA6BD19A343FAE64D9E314BAB7C0DF4F6F2F651A346B6E1F1C9A3BA962755ECB965EF2F4DEFC667E1EA4F1164E8DE37D1F2CE93AA4C8FA6EBE74C566FCC3C4A66D3F34A81CC926D6C3651B89814B38BB234DFE16F88E7C9D47334593363C7C42D366E2ACEEB616CBAC5B892BBD4100ADF7E2AFA66687B5FE8273AC4E396B6FA95C6F1F438F71ECAE1CCA5C8B738FE0DF1471CAF14EA36322FEE2A2929B525244AA2A0CE8B5F933560BB999AF58F63F821B1CB5A5C82BE2F5504747B58621BD5EE91F2EFC473220D9595BF5F91415E42E4A254CB4DB57484A0ECDA719F785EB9F63F0FB9C2849AD6AECF7EB3E5116D6B668AD8B27B7B59FDDC1FC3D652641AB6090E4B03E7417C907B16BBEDDF9BABEE7A9B9D4CD6E3BED57895DE2DEDDBA69D38E92AEFF3F7706B1C878C615D9E68DC5CBD03A50767986AEB696FDFBF7ABA006ED9D3BD7620BB9D255228091957EDCBDBEF4DB967B567FB99E774B6B9DF3ACFB7C99D5B1F91F24DA5F13FCDAF6B5109D0B35B02E61F21BF6C154962317F92D9AC126C30AE27F192D7A5EB703546693374FC7919A48067622881C9684286401446D6816B8ADB55C55752E2010E8F9B93101164B0991B2231B2764D9F2B4AB5215FFA4B57DBA8B1628E2E8F28AFB7578FE2E09DCCE6A873706B369E4D4A9572AB692A956AAEB169855CAEDC73DB36DF6AC35932D63C9ADB0C772DB14D0EB15A0C67C35283D37963D841D0BAE4E533C7B7EAC51148810F68F0811212F18ECBD2F5D50F08AAA68FE1F8D14246BA0636D4501517D0BF2A8A51FB01D6996B1248DAEEA0CD23B31D4E4259998B5ED1CD924DF40A3DCC67A78FFB87CBBD8EDB342E2A8DD626D21C4161279F6ED3AB129D110C020242E2260BB88C48848794F72A5ED8BAF3D47E7982AE3BCAF511B08A34D015742C5698D5589809CF9DA068ADD31E523E4F434A46060A4A63BCAF4BD709FF00134AB17C68F178895631FC7328D46020B3E59269685924927DC927AFA41F80587879FF00841F04E46762E3666463E9F0AC13E5C11644D0A9964B58A5991DE307E88CA3A7B59C82FB45971A151B669DC6D45B4EB07735449363E51191032F2FA92811EE3F5313FE7D77BC4F96ED343420DEBF0A5586CAD40A1528C8618C10682A422570403FA87814C77EE53FF8BD2F4A160083601E0F71F6E963818B8CFAF6146F8F0346F928AD1B431B232B32865652A5595870410411C11D049F7BFEE23AABD50B8FE0DBFC84E8F1092BC4CE3F830ECEA164A9DB62927720AC5975C3F008823B4E71F6EE20401FAC15BE8B60E455E31C5DB5A92D1F83C7B26A550026C826BA336B216A1933367615AC7EFCFCA4BC8E67C8A6657A5EBA27FE9EC88337E2130550DF90D2BD41403FF127DC0BE939FEA79878981E01F845160E2E361C4D99A8EE8F1608B1E3370420DA42A8A6C120D8EC4FD4F4F720A52CB0E0EF06C1154F63319809928ED06042CFA899ED327331333313DFD79E6D7555CC4D848C0956E4F62900CF6382ADAD41BF98B69144B5B046A4B4089B24B6257233E2103E97A5EBA5D9CAAEB2ABAABA86C620300C01A3C804100FDFAE2D2928D03212AC44F6CA76936093645136793D4A1E2F7EE4E0E6B22C3809B5972CF8D861066A18ADF214094776301026D29FB36919FD77ED0BD2F4BD272782033CB70C47F9AFDE343FD6BF6E86492482590091C0F31856F6AADCBC77FB9EBFFFD9),
 (100,'weirich','mario','Mario vom Wald',36,0xFFD8FFE000104A46494600010101006000600000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E000001050101010101000000000000000008000607090A040502030BFFC40030100002030001030303040201040300000002030104050607111200081314212209152331324116172542510A1824FFC4001D01000203000301010000000000000000000506040708010309020AFFC40037110002020103020404050204070000000001020311040512210031061322410732516108147181911523093362B14243A1C1D1E1F0FFDA000C03010002110311003F00C97756FA476FA23D4AD5E176ED71FDA4A27F755BB8DDC7957AB5AE4B2C268B17618CBB4599D0C85B917D72F94024BCCBE58286B5DB65473AE65DDA606FAE2734980F1803821131EE270A82318282920128EC5105D8A3EF6B9FA8253BF791C070954F8BE3D3BD3C9F70AE52A0AAF7B52D7C94EA441DD69C7CABF160C9C07FE5F1C9BA7BFC3152BBD8C2B5D7A8A621F6555A64E408D9E4D8380741838A4E0088C243BC4C140148F71EDDAABD0B38EA1858CF98CEB971801E8388888400D21B007AD8505E4FD8017D2EE21C6C918C4B379CE3CC288C3D3E90C181EDCF620376BB143A7A74D100BCCD863EE55AA7A8A05D6AAF908B32B096B60A4CE644A18404A15C079F9C891C0C768F5C942EDB4E59E651D3BF287CD89FA05B5F00E32398899AC93112F93B4112BE231EFF00E7DE07BC71E4653290589731CE1AF5D55E0EB0126B2D8E95CAAD318499644248896B1860C4B20A2627B0F7E7CDCA9B3A8494EAAAB46699126C09B809EDF8C8FCC08A57D988889880F2F1EDDFCC647ED121638C4F9B96F921E291A2631B12C10A51401289E4FD2FEF7C51ACDF2C633B484858D031B05947CAAACAA0125AEAE813743B75E574FF004B533F46DA6BEA167C32A58B3729BE60A2DCA1A40A4AE8C830BE7F8CDC4164254BAE25124E9F2ED1EEEDD1B1BC82AAD87D3B9627E5684303491031040A357D85AB291FB312B2858948C2FEDDE678B8B231F476F90EBDDDAAD93630E895C42EF2EDCAF600EC2A90D2A234295F745C926ADD2BB4DA94E142D2FAA8289029CF2FA43D5FE7D7B3AAF4ABA6FCF3A87A97282352BD2E0FC2392F2FBC74AFD83AD5DCAC9C6CABB7C864964F4C92CE1911F84CAC667D77642C8D9918896513AE34721211820F72012003B855D13DAB83D2FCD893CFA8838D1049442A1A568CA82694826C28E05F6E05907ED0CF094BB85730C3DA7AEC7C94D3553725758D0D6D52994DB865370829A6DA60410D239801286CCC9841148EDD8E53CABA8EDDAC1E3B6F4F8F67DA0A235AC66FD4D66DA2CDB7A43964D9505246E5F4D1D0B74734D8FB5606B302925E40C30BD9E837B12EAAF04E8C73DE67CE7DB775932B85A47175791E67503DBE723DFEAB732D1A35C6B167F4D73ACD5E21A7C5B2E5F614CD0B4D9B1E7F0908B0E98598F55BBEEEB8F7BA2E07D7CE5FD3FC457533538EEDC62F2FE3DAD638D98F33ADC44323E55E4B430A5B7A73B870B2C51B198963032EF5197A1741EF90B0A58DAD0CED72457C24C79F0B1E5863CAD4637C581D0323323174F29E5B01A2656BDB6403EAAE7F2532B3E44F0B2CAA9E534AD1B6D92335601375CF23B71BBDBAAF2EA6BF8F2E33F478ED2766690EB5CA9AB8B6B32B058C9B322B779157B2B63C2098C39431422B6081790C1AE0A63C639D6869597CAA4D8996108F800939AC301395CCF782215C7940C8C791497DA3C63D4BDD77C7D8E94F54EC0E7E3D5E2CBBD858A3668A46DD79BE99A2AF934153B9586DA4B56CA8AE1CCABCE1F26B9210F212824AAB5F61368C89722A1FC2260FFCBC8BC7EC5E3DA3BC78F68ED11DFEFF007EDEAC6C530E462C33A2D47246ACB2A92E37850AC11AE994B82C08E288E78E8963C0D045B6CB2152C8E594D03B6D7D24FB0AF7F9689F6EBA30EF5D5F22B946B1B24AFD398F8C259F6202898618AE4E7C15FCA53E313E3303264B0F23831781E6F4833DFC56A66F1DA9D54E563C971391725A3CCF4AF71DA97272097655C672DF350B8D0E16C5C38468686DDABB65B51566B2F3EB2DA1A6A283D8A746B9C726E8475AFA8DD3766BDEBF93AB93C777388D1BD858BA5CB2FB2DE459CC5647299C61D8E3946862DCDB3D4468EF332B66DD8AA318D6C6B801F4F16F6B9C6377AE96B8E68F06EAA59DCE4DC4747A9785C12E503C1D0C9405FD0B5ABC4EE31C34A779B874292EBD17E42154F5A62D40839E2B094CF13788B171A5CDC70328B69E884A61147C8C83E5091A3F24BA9281433975EDEA00DAF42350CA1B28F983630216340E1F95146CD8F73DBF4FA743B72CEB73AEF34E6FA51D1BE93E03B5398F22D1B5858DC3B27471B16D5AD279BB2B26D55D3A14D99D427B56AA74EB8D56AD70F5117CB3D97AB4CA3C13A6DC16AAB0373A651C56F8415B2CB7674958F8ED99316FB2CAD5ED2D960FEEA6C15AB0DAE499A8C60957952D7A498FC769B136E8B92576AD6E7526BD1DFD7FAFF3F7E7A04D13004D293C953246A45EDE0A970C0F3C82011DA8122AB7FDCF705D7E2DC3FA716390ED42F49B7B914D0E2E8B5AC7988E3F7C335B4F630B3AE02E8E5A82F036A5E5E6D7AD4D92CA44104D5917A0C6853D9ABB15ACB22CCFD6A0AE26C367E536D751182AC0133E42F11302F8E0A07CC46607EDF6F567BEF3B526E57E0BC7AF79561C0E3F71AFCE97AADD7483C9084FC062B36F847D33BFFCC6F349C2D7303E5DBB020BD4FAEA4FB9A4DA6B3A54EBE6D10110034E6D5FE1AC1E6B52A627BF72EFE2726C22641CF947778F0FC92C5A4E3C2F18902AC8AD29BB903C802B0B37B8FCDCF26BB76B67D2A369B031A69115247A2695148142EA9413575C1AE2BAE7E465778BD0A2ECEBAEB6DD42A8CBD2CFA762BC243CC5861225E1226A118192908111985176888E560BF8D504E8451AAC66FD5714D8B4BEE1F03A9195B6297E71DDF1658B6438BFC623B124822172CDE417EF3A99D606C9FF000802A622660C8667C2207F2361444F611ED13D8BB77FF5366FEC3FA0FC7B9D724ABD4BEA2E7AAFF4E7A3B5E96DDFCDB5523E9F93F364A42EE2F196D672E16EC8ADF4ADD6E4A98338B09AF4339F00BD329F47E1D32268E18D537B493FF785956F2E83A82DC5007D23F7A15CF4425C7499BCB0772EC55657A65E0AB6EA0013447B1040AF7E7AB27FD203F4ADC6B12AF711EED70F32E704E5DC7E8DAE27D20D6D46639EFE55D7BED55D5E7566BB6AD8A18BA8214AD51C0A967EA6E526458D98AB59ABA76B667D22E63D31E9C717571AE9960F4D3A79C6F32A57A54F8974F33B8DE067D4AF594BF8E22A61A2A2AC4788C10D999B0E61C14B58C7F97AC63F53BDDAF377DB6AD7C82D30B4241CD605960AD548A3E52180592D6A400565A7E992B54CC7F12C467F1F4C7E1BEEFB99E3E82CA8725DBB3B160A229D65D9B4F187B266466D4C132002B7847C0313DC4A21A723033325DF487924F31A51152AA2857714AA00ABDC6EFEBC7B8F7E99F4E9F4CC3511361ACACF4659DCEEA66DA292EE80FDFB77EE3ADBB6B6E69734B5218BA8B635AF08642DE2E380EE51E44530B314C418C77EF11FE51113313E9A1CC3DAEA394663ACEFF1DC2D973EB1A2CA6D575B5B62A9C89102EDCAE6C8CFF84AFE372BE298985B606607D524FB28EB2F56F96F36E3FA0E7ECE94C5D92BD6904EAF994C5910B95D837DB74BDAB9835A924C083635D32A920FC7529C735C2EE3D35DD113B315821B27E3E47DD633333DFBCFE5F6EFDFFAFF00733DFD00CDD3946E598A4C492A5594386B040BDC1AC8049045106BE8474D424827895A3C385E1E1583A2B02287EBCD73FA5F3D62F7F521FD18FDBAF512DB39C71FE55BFD1AE7F1F216863A5BADCBF8F6B53A89108FA6A5B2676702C2FC021634F55B98F9778954A8726D2CB5FB8EF6ADCAFDB76C53C9DDD1A1B58AF492E86EE6D5B7523E55C494D1D0A56A18CA97BE028B6BF86CDCA16150D9AB75B359C2BFEAEBD5EE88704EA9E55CCDDDCAA867600C02C8A44AC2A4BC4A0C59231E3E24105DE6667B8C7FAFB7ACCB7EABDFA4CEFDEF6E1D67E6FC31D639A4F4FB876DF54282D74D67C8E93F8521FB9A09CF85C1358A671E0DA17056EE46827A847E63121E74BCAC985A1C395F76323A205DA06D8C95040DA028DA84FB503C9F7E83EB1A361CD88D9389188A640CC6201768AAB00285A0793FAF717DAB7FF4D5C5E3197ECBF8C28E850AD1CCF90F22D0E46BC97B2A6A7229A5B77B392FD7D245CBEC0BC09A956AE7A0B3ABA6B22BC1C097913C880EB97B56E9C720E7BC0FA878BCB5DC2798E5A6F232F46FDF4E8EC0D86A56DC9AD3BB782EC3ABA18B684534A13F53F544C45847DFBC37ED3F09BC57DB674878DC71F94A678A53D3768D61AA36197F4A1BBB6218B1875D3961684398A209AFDBB94442C6262679C6D8EA058B15AB5DD9C9CEC981BD73772337E2B68BCA31B75ABD4D207E58341EF54A1CB5DAEE3508A410623E1EA97F1099E6D6757C85765864C9CB11CA1C06558E318C02B0F510D1925B9284D50E0DE7ECBCA91B2275F943398810A41011BD47DE8F2458FB76E3A60667B3EEB2950AAF2EAA0DDBB695F55A8ED9D0D69B1FB8BC88DCAAEE56976B3514B9482EC182498C1740AA142B225E9A9C9FA9197C12C66E4723E65538B5EB1929D15E44E415B24D675ABB544C9AE77CB046FA6F1916499CF879C9979F7F4BD018B1B50F2D36CA0A855A251AE805EE7DCF1DFF007F61D0F314218D6992482F890CCD6E2D69B9B36DC1E4FD3EFD5487BDD55D775434DB67E8A9541CBA4D5369421036EC5AB1649D594A44FC2BAA0503F8A90B22F9607CCA27EE39E071FD176045FE3B62AAF54D2E5B54C4AECA6D57707839169462D8EFE073205E2320C9120982889827FAF7B59BC8BA8756ADCA747447F63A84A59968574FD44994BC56EA2EAF2C607C50B132234A8A23E653220865915516F292BDA4D02B3916189A27F0294639AC0425449BC0A419435CB88B15AC0B5636444A6621DE6317161E4CB8FA5E246A6A44DA1198D060A14824736C40F73DCFBD756FE8CAD360E213B3FC90A42A9165B6B58BEC05D5102FB1E8157647215EC2B2C71A6EE80DCAF502BAD6D6FC070C5829DF1AD326425243312C94ACBEC2C6047E53789A5C833FA3DD23E29D1EE2AC8FFB0D385F2AD3192516A730B860DE4DB0D24BD82736746CD84D46309AC8A152AD659314AFB01FAA28ADA0CD4A5555F310A0E66261367C259E41244D16C0C432624C0945F8FE33DBBC4C4DBC6EB379CEF5F7D89B86AD5D2B0BAD5A5EA62ABAE1282409CC408F89CBA3B40CAC3BC1F6281892872D0F52198583855963551202E01622893540006B8FAD9AEDD4A8B15927286D6F701E9240AAE783746EFB76FF00A78F6A791724BF2FACDBAA430995AC5A88FA8F34F98BA1500905FC6E614FC4273F8F94F89F7EC5EA41E96F1FBCBD743695DB8CD4519C35EF17167E6A8E64E58C252A4BEA80E27C0E22207E3EF0B0F0992D207B46F669D23E2BEDA31FAA35B8470AE6DCEB94B37B56DBB9E60721E649E3BC4F8DBA7133F0388E066F20E39F4FCB3936B85BB97F93597DBD5AC2DACBC86512A8F36D7BF5EBA11A7D1AE6876F2F8CEC6774F39E37134B8955D14C37478ADADD85335383DDB93F517B4EE55D5658AD9F71E5F54CC11AACBF79E68B10D2193AEE1C192D8A4969230A687CBEA0091BA8F6FAF23FDBA7AC5F046A3FD260D5CAC6D14B2328446DEF55B848D19DADB78A2481B6C727B74627E9FBCD1DC33E2FDDB350D5958AF346D9AFE693B1F33E5CE373D49B779ED0147C6354A69D699841C9363EFA4DE9EF536A6FE555BD5D91072A19126C907C9F840C8C770119882891EFDC663B7680FF005EB331ED53A71C939372FB39B501AAAA8595973DDE269A6A90504A1110F06CB18972801F23F0004BDA963E0227D5DC705C69E1D4EA542B0D64A909AEC9531A631E2222215FE5648040F6FF002FFD7629989EF1E94F55D44BC8A5558339F46DE1369AB34055824724D1E7EDD3068F8178C639404DAC095FAF0011DC7DA87F1D1C1A1CE27BCC90778199182061404C4C4F9C8C4177291EFF007818EE53FD4FDFD362C73DCE7AED54B915EC57B55DD56DD6704355729D9194D8A76D4C9986A6ED72621C0C085B52C628FB89947A892799F12C79176D722A7597311F85D7009410FDE427C667BCCCC4F69FB8C4CF69988FBFAE67735E09C9507FB16ED05E9048C2E56E5B41B0270520722D895F88C4C09F6FB4C47FB98F42E093277FAA55B245FA85D1DBEFEDC7FDAFBDF4524C5C3D8D1889882BB795A06C83CF702EC0FA76E3E99EDF703998BD23EA572CE17C228D8C8A7C077A73334684A2919608D509C2CD360826DFC0AC0BB529442AE241E2306DF26444142D9BCE6E6A6A53CFCCCD1ACD6C944AFEA08DB0BF98C99E56ED3C2B7C4BF23EC9730858D9F09385FE3E89FF007E7C733F1BDC672CD9A1F26A377B0388726A4CAF7D6BAD474EB62D4C4D54BC09D2666EB380CB6A98867C90E1815FF98801A5AECD0B8C62F31741A3242FAE6C8B26644050B62CEB42894B2EDF99FC8B1064F63198EFE92E7C2FEF66E348405B98ABB7AFFCD20FD455107B1EC6FB9EB1FF00887146278835482D904595218D4700063BC122FEFB6B8E07DC02E0EA6FB6AE1BD4AE54FE45C839ADACFB2BAB5F36B51456810AD56B4B1C612541F355B2CBF66F58835C0788B85523DD5E44BD7E53A99E6091BE7A75ACA542831A40A6219F1CCFF2C135D2524533233313205E10613225132BD01FCA4E84AACCC554D023B100AD1EFF006BFDBF5E86B6A4E091F9751543E63EDB45F6F7EFFB0FBD524FBA08ADC73ABCE8C154D545756531D58CAD3CD6CB506D354ADDE6C520DC507DBC540526C19120289F4E4E3BC9695942B8F53C3AD7F2F690361AEFA6730D7B32962652C11711A928219859B208D4731E2F90915A617EA6EFF21E7BB3739B7232A8EDEE47B936F4A3398EFA1A536AC3595A9E6135AB95A73D43152A88CB14B85012A667ED242F4B3189EFA96452C62A824C9D78C91112E85CF9296B9827B8A0FBB24A6C2609BDCE7E59ECBF56547EAC183CC28648E24528AC080FB54351214704F7E09AE2AEBABAF48C3923C5809BAF2A2018701995539A1C531E49FBF6AEA2CE6085E5EB5D137A135C935ABFD187E102E90F2630FCFCC95DC85D107E51DC6207BF7EF1EA49E855EEFC8F131BE9C98BB255D0D1447CA62D65838F2901299FCAB428A3E49EE53F1C0C8FE404CBE6B4AF2B91EB59F333A9A020A2099EFF002A2BB61B3F87D3C1A84E448E62659FF97DE46623D171FA7374A6C756FAA3D48AD4EB4A6BF126717D10B0D86429057596652B8705668828CAB47CD26705225DCD1F1CC8FA35A2EC12CCF411A3C342EC36B1605C06279ABABA24DFE9D1689D9B3F1E1A3BE593CA1B4725A859B0057EA2FB9FA75AEDF6F3C415CEFDAFF03E2780AD83B8ACF27D8A3C776BFE35A5A2A37DABCB42F4CED521A136B52CC95DB296C9ABCA3C81D042BF5CDD54E8763753BA0B1C0B97D8FF008B750B3B6C9ABFAE9D0B2877EC7A7034D556F936C68D8CD7638AA85AD3824B748C6DB26B47CA606EAE9B709D7C9E96E6070FB678DB59B256A81C19C56998306C556C0316C652B4B158B20666601FFC1330B8818D2CE47316F27D1B9B034D656EE85A20A8EB335924B44F7008B042451E7F2C80C84AC46402222222222EA534259A665FEE4876B11C008B40302013BA8FF3EE2C757C61C914BA3C31365A29C7500455521703D486BE647AA6BA041B20DD0F5BDB4F431DD324DB9D8D3A3C874AD7C48ACFCA0B8850D550A56A87AED281BF2C0AC17DA27B7C6031E731DBD4B5D6FE9EF51F638FDA9E27C95B8665E53E0BB1A5485652B901632C50A16AC92847BC1286004A6427CA4A3BC7A5C3B912B8E889BE03E408EC6647E111E131E21111DC7ED33310313F7ED11DBB7DFD4ED87CFB3350015642BB067BF61B52330C8FEE620460867C23F29081292FB9F7989FBC341F9F500C855D400837102AC55F3744DDD0EFDF8E81195A070442299C0F48F63C83555DC71FC0E28F59A9EB4F4A3AE958EED6A3D43C2E4BC84EF4D51ADFF50792C95345973136DEEE3D7F1B33582CD659A993582C5DAEF8195CB246256249FB7AF6A7D5BE9EF12EA77515FC9B915ED6C7E9E6FF0020E3DC7E762DB7335B6B3B12D6922055A4671505A759605124A09964049477281B62EA35BE84615D77236718C6BFC8E15618A3CCC7A96755C94099BE40A1304B4A23C8CD933E2B1829EFDFC40A75E9B59E2F7F8D50D7BB678B2B1B4F37B7D3CEA562ED9B6942449B02F258C858494A4C003B4CCF84908F94C10C7C1F341445532A215560C006207A771200DC5E81249F4F3F6E88642CB2E23B6343316914AD88C353ED054AA842C1410B74DF53DB9EB2A7ADADCC79772DA57F7ACECF2AD0244A57A36D7558DD0FCDEFF094D44D5A4BA7485D35C1A2A9F1AC886C4B1CCF39F8A7C37629EBD25EC2D9FB7D83BCE55A0525D5D6D87422BD722AE932331068D924B3E27C9C4C449297F7967ACBC813EDDFAD9D48E8F09D7E47838FC8591C6F91539CA23B58DB752A6B60539612FC9934F2B46B52D34D5369BAED77C014098F61EFFEB83B47AB219E9D2C5CAE17C3B016CDAA74E90CEC6C6F5D2B308C843742B8CA6AD26C32D5A0CC8ACB7BAA821961E7DD63476678B9FCF9F0A4C37198731A26456DCC1A1964898315634AC630540BB52091CD758775F9F2E1D5F53FEA10B4B9BF9C9D257663CB092C1A1F2809B401408AE47D1DEDE07C9EF48D8A789BD42B4808A115422F2C951DE56E274ACBC58F09163131330992F8C7F118F4BD48B3D6347C75C53AED554140C511AE4BF826A49192C931E71E2A9226780F887E3DA7C23BFDD7A16DE2C74251B1C8653446D3C11563E5F626BA5E3912124ED1C9BF979EE3FF001FEDF4E73556D76737F67CEBB5569967ED4A31B312006175EC8A8D5CC348622C4C430218424412451302C13F44AE12B729D0B13983015CD0A7B95559F4C502C08877CAFB4EB4B6B613E62242A5176544324A7B4FA8E7946FD69DB93CDC5E33A37773940B351F52ADCB5994EBCB5115F0B01762ED780A5928AC9A8CD26775BD6A5408CD4F9D96CDAE25D3FE49B5C7EA3E72B3F1F2F4168529A3949CF97F9F82C898D2350B6B84CC914CBD8DB50409426C7D440CDCED345160633E5C6AABB1D9D8BA59DA80DEC500FCD577DAACFBF5A2F067F230B0E29D1E1DB1C6B1B48EA1A6318546091916C58D02A2D96FB0AE054DBCFABAFA1A99B4C984967C7F46C3AEB13A891513B46FDD72AC124D6A6FC8E1911081AC0607307E621A42FD17FDAAA38EFB76EA475B6DE3EA223AD3CDC11C66E698FC573578874F6BBB8E86B2AB29496D5A7AFBCED9B09A80CB4BFA7CF879D93EE1135E5D28F679B1D4FEA2F07E96DCC4D9C2E11CE794E2E4F27EA46A69E6F1CA95E9DCB221F43954995CAEEC33558B61AE735AAAE815E621C47546E29DB4AA9D38E27D30E9E70EE9BF0ACCFDB78AF04E3593C5B8ED1AE433F4B958D4954A901998AE5EF95AA1B65ECF137D8639EC8F91A51EA6695971CD83973C2BB7798F1610B55ED24AF27FC406D1480D06B1EE7A75C5F0B6BB8197A56ADABE979DA6626A11CB97A4FE76093166C98D584472521C88D0C98FBE97CC50548E54F2081F4D07818B34AB4B8BE9EB4A5622230D74A606223F8E23B93063BC4178F6989EF111311E87EE4162C793AEC87F0C348CDB1102481899EE0C0063044E4207CA2220E21B1241031F9189730E6DC301F1E2B983167F208C914F8FDA627BFE45FD97897E5DFB477999F43773B0CCA552C5585AA998B5BE4CF115D722FCC0E24505DCDBF1C440133EFF008F66778F1F1FB9D8B63F24330A0B601FA5FB7DBF90058E3A7BC5742443E58677A3BC01F607B71C9ABFFEB83357920D460B1D6442B44CCB3E4289ED2B9922ECB021291818FF0039FC63BFFE5DA26638B3CA2CEFE8368D1D376766F98AE6CADA0C335CC1490A67CD63D8C4E6461B0C58C78CFC645DE2583D42BA0A618AEC17C4C828921ED2045327303DA0BF8E3C4647F29888FBC477FEFD4281AC73E34AB68FC2F6763F088231F8E3EE50322332263E23E313FF00B981998FEC3ACB21914229A5237B02406ED645576AAA0289B35C0A32F843CB05C0560410E7B29E2C91FA7167EA48F7EA5CE29CAF478BF20E44FE47D3CEA858A336ED56C8D9A3C5B92F3746A64A64861C87F11CFE40756A1CB56659D66AE6D9167D9E92131F0AA5F793CDB86F4DF9670ADBE0D672F8CF31E71C9D957069DDE277B0390E3676634AC723E5269D6CCCED1AB9F5EE3F2E82C5A322C758B14A0171FC856D2BD3E7D578F7FDBF5A33BF6A40387903DCA9A75C4A7F8E2DA0FBCB6B80F819882A5C4211005DE7B7ACED7EA0DD58F703D7DF70BC77A7DCB6AB8F2FA39479754E25A26BDAC82D79D8D1C9A5B1CC23F7B219CCE3BA77B0EA67719649D55DD4669DE5CB62FA8105F266C63A3E544659B1A6F26430B19511A594537A13891CA8F604D77EDD00F1CF8821F0E78473E7C2CC9317529556081D26946D6F4B48E8A6231A8038660E02961EA5240EA22E4DD42E6BADCD7960DFD7B1ADBD957AD236B7F458C2906E7DB0A245E3658700D7CAEB22956ADE445DD0B5088F978B56CF32B1F500DAF7110EB5A15DF605CF1B4FB76E82893E60A2185840BA4E20C7E4296476F264C1147BBCCFA6DA595A5897349EEB9A9CC716BEED9C6C5B5582FB39050CF0C8DFB1A9ABAEE755E3F4F3ACD3BDBF66FEC41B97A1AC275E808210670BE0F4AFA81CA79CFED7C6B8EEAF922E94D3B115F433B1579D58C8DF6E3676D14576EAA261B2BD279250D580CAD43E7085D2CDA0C1FDD9A1C8114CAC9334921FEF3E4300C4DB5B331BB34483CFED85724CB979134D34D2CAD348D906476259CB2C6F2C864E7CC1B9BE7626AC28200004DB57A95CA8553017F75D1065F7A12D5575FF005FC42BAE9F887C23B76F181EEB909ED1DFD2F4D3A3C26298DAAB63A82559D56FDEACC8ABC776ECD461D6B2C41B2ADC65ACBFAFAF04B24AEE2EAC29F0AF253181113E97A85FD0F2A4F5B646E2F4C4F97273746EAC55F26BDBB7D7AEADB10344B820D11B178EDFE9EFCF6FA8AF71D1A9D23F683C3B0B7A8687563A8D8B995B2ADAAC378CF0BD3473BE4D7AC8C309D5DB7B882F73370F36587F1B2C2997F498004362BD65F890583E8DDE9360AA9B3A77D3146DEAAD415D1C93985FDC84E7A55100B464E26C94D8270878C8B9DC7326B9C4B242EF99988909D54E915DE9C732E57C0AE5CB58FB9C4F5AD64E955AAF3B7496E4114A5F14753CDACA376A9A2E52B30C387D2B151C7F09CCAD7DDD1CF687EE2BAE67B977A65C5F8F729CBE3F56C58B7A1A88571CA966DA172C5E3E6EA8A1556DEF581ED0AA926B5AC98B3BB669A9AB32B266C1D472B2A4D3B1F172A69E3122344227768C01B594B313B8A8043355706B9E7AFD1CF82FE107E19FE1C78574AF1AE7C5A3CDA42E261E7C7E24F1665E24A997165AC326318BF351AC4379923290C2AA58301B1BE5E850D4E55CA35A047EB75B3B486CD4BF4994336D50555767F6655754B416AEB05886C433C98DAF1E603085440F815B77B60FD4E78FDDCFC9E987BA2B83C6390575233B2BAA675AC33077149924D6FF00950D459B31B48D6202FD54A673DE726EB439F3312CAADE5357778C6CEB718E6BC0399E0EFE3DD6E6EBD05D934373ADD791F99172A3CD6C0919FC9632D8194C09819A9CA363634E9714DDAF29725CB8F8FC246D572F967BC7DFC863E5F22FB78CC476EF3DA60BEFE502B0F51D4342C8CA531897CD9506562481D05C4A1140048D840E430E2FB9AEAF8F1FFC25F877F1A7C2D89A76AB851B438F02E6786BC41A3C908C9D39722249239B072216C949B1258CA2C98D2996192200796ACAA46A435F92D1D4A15F4B8DE8E4EFE0E8883B3B5B1EF234E8DD59C410B536A9F9D67C1078F90A9CC219FB148CFE221DF589D7101745CAF15BD4532E16411D416CC494C899C9F69FCBFDCC844F61EDFD7ACF346D7563A432CD1E8E758396F036419D96E451E4934E9580F93E459DAC8BD60B22F0FC8325F168536FFAF199F298F51BF39F7B5EFA791ADD976FAB99F790A5124AF5DE31D382BC42233DC034F271BE426768FC4A59F28477EE005DA65893C4B879103C72473629501FB099558D1A063A2A2C776B27ED5D630D57F02DE32D3B3FCCF0FF008A340D534CDC7CA933A3CCD3F355382A9240B0E5C6CC0706449B6B56EF2D01DBD1DBD64EA52788139F1A50C5A88E5DE6A7399DE0667C80054C30850910768EDDC624E4BC63D009CB3DEB74DF38C5B1CA139BA0CB3F4951828BB612EB62DF8E54C9A95AC8C04300A3E62FC5642C339F119880CB9756EAFF00511D6ECF32EA6722E481617FCD9F5B62EA728FB77EE25492D1A33251E43E09A62531305FEA3B471CB7A2876F8D54CE25121815CAD2FB2E442AB93252A58CB6659DC84CFCC8CBC9A6D32318991F1E88F3B19A55AC8768881CA0504581B5882BC2FEBEE4727A75D2FF0008D978582FFD6B2E1CBCC45F3123C20CB1975DB6A64917710537A9EDDC1A1C0EAD4B27DDC75275235B8C6752CCDBD1E3D650ABB85B7B49C953293441D47591F55E69D5CF69C929515AEA445A482B6CAF59E252E7EA1F57BFFB0BF14F5499CE73376A29D9D9D67078364EC60648DC7C1DA4D6BBD2CE1DC6353CC8A0555ED5CDFD9B88A20E5A9D1166C432BCB8867F2BC0E21D34EAE641395C8389A97C47924CC981EA642809748AD1AC84D8A75249D271CB45904AAED9EEC50141FDC6BA95AC55B276ACCAF5F8CEBC1825A3F2FD466D831932A37618E3529F524E0BE42F1F90205CA644CCA570F52783264C72CA990619258A372BEB8249152995C0DCA48702C1ECC6BDBAB547E137E0BEABA18D3B5FF01E16ACEF12CCD3E5CD90D9A8EE91B4AB8D324A9E4869178455657210BEE2A3A95F47F4FBE69C8BD95AFAB5C469E16C74F303A86EADCEB66ABD7577A9E4ED5DA6AD37F2CC2EA3D5E3BAB432B3B66716E466335B431EDB7415B3A897D1A8235074E47D38CC2E0BB99993BD472F0B819656564EA70FA14B323939B1CC48D3B2D44DAABF051B7F1691B2A67AE85A7564B2BD6B3FC223A60FD1F3AA7577747A97D0BE4628D0C5E6DC56793D0A56CA1F56F3694AB0F7B3DD5DB3F91D9C8B950E7C4645F56A1194F7EF3345BEE8B0F27DB87B99EB5FB66EA75BA68C8C2E636ECF4EF4F9667A2DE14F1BE4485EBF05D42D96346CE4ED27075F32B8693116B266DD4BD59AFCC7206E0346A3E078355F0D43AC68124F1E7C6126C8C500CC27FCB9316484736C1850A524800DF20F1E327C57FC3B43E15F8EDE2AF857A1E5E0E9789931E60F0CB6B798B061CF0E7620D474B872352994796E641269A2461EA9A38912A8935F983D2DE139F8B9D42F06DDF7D55D90FA9ADA156DD7603342E581945DE61C538D6C5D5CFCD25F531908A26444349D6D2316DCBD12F3439671A6BF3EE4576D8371DA2B2FA896B2DADD0235ECF9A5969720DACB4FC5E176F2FE38194DC7A6565E97A4313E9E9492E4AC52A52C9136E0D1C8BB03A37B5AB0A3FF00AEB25EA7E09F1A691A9676979DA1EB18D99A7E5CD87950369393318A6C790472279A8C12550CAC56441B5D4865E0F5A1BFD60B8A6471CEB5F12E6D88B6E6F20E49C1AABF66D563000BCFCAD3B9995DEE57C730C6B28422A583323F95352B0F61F8E7CEC9FD827503539C7B6FE2371997C7B8CC54C74544D4E279519B47CA884B62E155B6ED109BD6BC05772C476F90222562A6443217A5EB4468B1A0F14EB1489EA18C5BD23D47CA2D6DC72777366F9E7BF5E9BFC4D272BF095F015F289C975CDD5E1579C999962832F22286256937111C312AC712021638D551005000F3BDF2F423A4DCD7A59D57EA4F23E15977B9F71DE156BF67E58A9B34362ACD5CAA5AF4E58EA0FACABF352C19A6BCE926E7C744D94BEE87381994BDC011669286207E9DCB15320461A3F2A8DD33E503DA64487B0F71EDE333E5045D8A17A5E903E26C308CF8184310630CE4911A024AC8BB4935648F627B7B75A7BFC3B355D4F33C0BE25C7CBD4B3F2B1F07C49A6E2E1419399913C3878CFA74CED8F8B14B23263C0CE0334512A4658062A4807A1C35380E06C19DBD2FAFB2F701B4CCEE18C49C9A3BCC000880FDA3B7E231331F6999F51D974B383AEC1B67152E60AC8A0DF32D9298289EC7051D8E3BCFF8944C7DA3EDE97A5EA9FB225650485A6F48240EEBEDDBAF4C94023900F27B8BFA7D7AF7D7C671AAC28114D601E31221021E0BED33D8563E1E223DA223B76FEA3FBF5E1721CBA651497F14404B860A07B0F94307C0A0BC623EDDA6263B76FC84667BF69895E97A938C4F998E2CD34F12B0BE0A922C11D883F43C75F0E4F9D1727E723BFB79321AFD2C035F500F703AB2FE8D7B7BE92F3CF62DD63EA63F8C4F1EE4DC01D9B9757F60D5D73CBDF55D6CD737F20CCE457790D68B49958BEBB38FC602D6E928951267E18AFAE8ED708B5C8B8DC91964D8A575875A647B0B120C62DAB811800609CCCC18877FBFDFD2F4BD3F78BA28A1CFC358A38E257D2A191C468A81DFD237B050033D00371B35C5D759E3E066A7A96A6BF1346A5A8676A0303C719F8D8233B2F232C61E38830984189E7C927E5E10D248C2287626E773B6D989B72FD31367431BDCB744ACD07929A7C8F578F3A648E46C64E9F1ED6458AD607CE05B0224269928FE262525113E1DA7EBFF00944F4EF8B66F21F6CFD53A14A6A731E5383CFB8AEF5E49002F472F873703538F4BC217F215AA16394ECAC1D2E982AEF5288266BA0817A5EACEF862CC7498C124819EA00249A0638AC0BEC0FB8EBCBFFF0010E554F8DFA0488AA8EFE0BC12EEA02BB95D6F38A96600162A492B64D126ABACF2FB7DEAD737CEE9AD0CD8D24DEAD9FABB55287EED511A8EA74D7A0D95D2AEFBA2E6AEA28C98C55713F8946E6CAC460FB42F4BD2F4ADAFE1619D6F55271318939F9164C111FF009A3FD1F73FCF5627C3244CCF87BE0DCACC45CBCA9FC3DA6493E4E4A89E79A438C96F2CD28792473EECEC58FB9EBFFFD9),
 (101,'hees','volker','Volker H.',0,NULL);
INSERT INTO `t_spieler` (`SpielerID`,`Name`,`Vorname`,`Nickname`,`TeamID`,`Image100`) VALUES 
 (102,'ilg','rainer','Rainer I.',0,NULL),
 (103,'weng','andreas','Wengi',44,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001C00000203010101010000000000000000000709000608050A0403FFC4002B1000020301000104020105010003010000030401020506070811121300141509162122233124253241FFC4001C0100020301010101000000000000000000050804060703020900FFC4003111000202020103040102040603000000000102030405111206132100072231143241082351611524334291A11662F0FFDA000C03010002110311003F001762F867C85C3A8268E5E79822299DAB160ADE51D811340B66EA4299F70AEC9166432103F9AE40D73A8C89782D2EA888DDAB789D0F3A147A24DD93573D518688A351B418A64A54067E0A6AA6C90D54B4DE43D9928C14D45AC16AED062D548A58ED31422CB502D03B07EA3250D411175EAD0AE468D370689D437496BA64ACB081E2C0AB4BAE317D50428D7747FA881C8F90F24B9A025B96E912FD64873D4285167E7B97BA0846865F402556AB793769FCF444E0B184391FEAD4C1AB2AAF05440D29FB70C95A2AFC94062B176193E0BA0DA795D42FD2AB01C63D36CB0001AD45871023450471912285749655666D1DED423100EF607D302341BD06F8FC70F4784F170AEC5D887A99F9EC3F82FD95B18B5CFD90874181D8E9FF000C7AB142D1C292EAABA0CC820CB557ADE088EF8EB435C7CB751B7C662E0763914DEA6FEB66C0D0B6AACFBFB3FC46C0E530A1931A838D4FE0C8EE8A8D909CFA79034BF41F8D244C6FE1F90EA38AE0CCAE5A55D106D38A280222B67DBF990CABA8A11C59223E0D208D913E9AD6B28944806D586305BE1136E5ED6FEC0F3889F508154CC4D03E7EF076AEC640429D1193ACB34D05476D63912748169F190AA85A52E2A44FEC16A524F6EC7E30A91D4DA49188250D646D595086D181B8121B6FC19575E0AECA8066363607816B185D4328063625A3EE2E82EB9B3856E3FB94009F903B0BEB386E73DAD9DCFCBB3CCD3F606BAAB101A1525D77322B22FB565253BC2D7B8DB7EA07552584F904D5D628A61437C73AFF00080659C9D6FE096E6F63317D6667401CD06EF2F9A375BB142B31A50C63ACD19B55A4CC9D51BC4B40B9ADF6D8342D352EA76BC466C32554CA20BBEB34EE85EFA091E6546C8C189265742AB6BA206CA5FB8F61A4B8EE5B0D9B7D469B7CC780F571E0CC7A573AFE45F18466254602066CE8DF7734E33D68D82B9EDAE26CAC2841C7BD85FB8C45BE40BD60B6BFC8ED1E989F211D692494556455095FF225E721D05569E1292F363C11CA91CE41C89E4BB3E8C53F6E321763332575AD0B71609299595D790E25542121764006409CCF11BF91DD5FADCF454CFB67611EF8DB6A7F1CD9FE23356337E6BD966725B2BC705E341DDF23596DD60436B4467149CEA8617A2E175AFB3C3E82EAA61C1D7C2224ABCE3B28AC3DB5F508966A7A2A2CC1D0558BE369952380E997598D72AF1AA8B4DEB2A2519BDEBACF509CAE93096DF2DDF66771CC518A383CE510C01E8EA68FEF2C00256611C64D5A66E608ED3EA5144ABAB4D5AAA46F402504414B7CC743C776D0EF35D264E62AB0FDA94D5AAE0733CD51B803670F6D7A2A071291BCA84AABB726BDA2A02496D415A4A42B67DBEC8D3AED722869E4E192194CF2564296A19108314004A222CA9CBB8AA7CBEDF6092750F21D0198A6F22048B621E68C6230999760F087995664DEFE49C793A852A5868E6FE52DCE6F686CE971D8BF4F41ED74AB1F730C65D99DBCE25131CD5C35C8A5D84AD642B4ADFEC3D674901021BB8297B6B26AE8FDB8EDD4A3D15C0DE5395058A12C00FA76B06E43AC3BDD78AD9311AEE58BFEAA9C13489854F41ECAC9F14F8F4AD7BE7356C12B1FC4662FA49E6D814A1C085DF61EB9D768C570B3A13AF4CB0860E71C11B63E2B55A82C573ADF17A296A68F3D99D972A1C309DA68EC5815CAD7FE034DB3AB9C47DE604665A65A01C8F9A3F6BF40C66561D140A6849699ABBB513288E4B2EEAFC2C19D8453C8BA6511B31ED2C68AC390902CAC808000D861567C248B0B6A275EC96127348D836D4AEF5C94C6C853E45958903C81BD0CC9A3398771AC8E6349ECD76989C6E61346E6149D31E48F9F03EA2154862B67A7A354128B414962D5C6086212860C4903BD378E79EED57C8E8F753CE3BD90401995D68657A69F3C56DE591C8D0284595A4CCBCB2EA5B4980483417D52EB594D217C06353585FC4E9D3632000ECF24D06733EEC0987D48D02FB1F2A5FA0342163A8A7B92A79919CD55C7F654B5AC4562284BAF8D79AC614BC154BA0FE32A55AE64F78751D75BECA93E798BAD24381D68FA3A4E35F11B0A0CC01BF6100E5F8946F76B473476C4C16E0918433C6F2BCC8878A4B06A3913B8AC8CEDA94E9CE98956936629C67E548AD3B2C6A2403B9B258FC3414007E4AABA20B78203E8FC86D77687837C47B9A5A2C150C2659038455F269743D2D6F3A9F1A33AB75449DC9FAE931A4CB4E0156AF7695FD9BAF7B9043092F3F37993C19C4AAFEABA3C3D1CAB6E3D5D732D5D64EC2B9088A48D580DCD04B12A60221B10D581518620C7A0E609F6127E72FCECB2FC62CE3AC635C1645B5CD57E3A0DA771B1B3FEE6FF006F93EA2C94A4EE3ED61DF36FB65DFEA1F7B6077E3F703FA9FDFD1DC58FCD68D94B9D46B5157D4AAC059CD19C9FD9728D2CCB2C6ABA66BF5EC16883FD1CE22CB80929B7147E5E0B25B0029D6F4F97CFC2266B8AD2C366AF0B273F57FF00BC692CF9F8D155971CBF140CB1AAB246820B2592D2D71149664EC145467ECC4F248213BAB919086CFDA8CCA18EB8DEB0E0880E0D59407751512B24B66B132B2AD8DBFDA4C67B2291837BDBF57FB3DBE8F154593C9D7A1DD1202D5CBD4BB6054724D8C7B9C20FE5A180A2D8C818A292D0D6035629832B8CBF41466E35A2C4A3FE65478CBC5CBB30A45C895631AF703046E2C0A904A85E413C2802ED2C35497647EC3C20ABC8225607F4E806665D7062421275E58702536393CEF9C749E232894BD86B8C6F90CAEA43136C17C7A0AE7BD9FA35D024D856474927403CD3A46ACD6D9C623951D4ACA2B0BBCE9BBE4AD1EAD1F17706B6AF73DC76C7D1779F12532D87054CB62A9137F419086CA66610186C96268B231A0A32C38B7D716457527F7EB3AEECB9D75BCFE6882C8A316CCD0F8991AB3FA99ED0C625DB0E58C304719C9556D09CF38BF59647554240AADC4518BBFD2A1CD17C5DC5F442F13DB8D225E3ECD0CF2654F194DFE7D09CD16D1F9FB380AB9601CE495DC6A1A6234ECF9ECC6DA75DCABAA8F36F707AC2CFB7B827CF61F073E76F258EC63A998E38A90B72C6A21B36A4ABA92C5649A50EF046BDE902B8696246122F8C459C741D418E4C8D90D5CCBCCCD36922062449071038899CB12DC64555054A90DCA357F3B7E8C7D18395ECBCC75F519D6AFB9BDB6A6125C9BF8E9BCFF358AD55AD43F4F9FB7B5A59C2A303718FE2AB3FB09A1987AA8D5DE21A6E9FEAD9FCD7E9DFC13ACC478E9EE7DF0F75E3EAC1799D6C2E6B1B0737271B76E8BFBAC7399F5D8CF06889E22AAADA65AE78E21866CFA4C9467BB0739671F7F73BAECBB2CC1BDCA46A6D14D8EA733B7AF7CC456020A628CFF4B67B8341B710CD55971E3242FBCF3F2128A068058370278AC5D8EDDB477CEDBDB6D7EB189B8D5E07A6CC84435851FB4118256F806941C0C3F5D663E64BD66F624CDABA1BA53DCDCD673A7BDC1EABCCE36B493E36ADDB98EA70CD56482D2D548129AD480AD348C4124914B604B2C8F1BBA4913F7A463F547DA9C974B74F61F115F238FBD9250B5E77506A23A492CC96D9A3B324323F655C2EEB1E01DD54175555231E7853D2A65B1DCF018C9E61453ADD573F96C5B1C453EB565DD34D7BD0529B2B32ADCF434D2ED8DB19530DBF662646188FC669EB4BD35F8EC9D5D11E57A6D0CDF276D68B0E729999B9A0CDE6B3F91E67197FA705C9BAD2FED3DB0C87F96B2EBC873CA76D8CB5F3ED2D34F3C78F1978A94F1AAA1EA713099BE827A9CDEDB74CBD01AFB1AD18CF26DFC86D317B8C8D084BFB0C4D182B3B21122D944A12C5164DFEAB9EA0B4727C91E3AF3770BE0EA379DCC96A0B3FFE896AD32B5F9F1B1B49EEE6251AB652F9DDA258FA2B379CD363A0B1C0C10A5F84C53E9AFF000E92FB6304D251F70EED46A991B85AD2E55D2BD181D2011D36697B865300699DE49926AECBDB70C21521DB00FE39BACFAA3AC7190647DB7E9A7C6374C607229526A86BDB9EC486CD7B4C6C429596246088C90C45ACAEDA4753C99D3D06F9AC0E8B8836FE17739BB2AE5F29B0B296D01199205133C1507974CED0136AE6814D24065D818EFA743AAAB58AC8494234FC8AEC9B9E2EEB55323BB6D80A86CFC81328904B0DC12D629A9563EC864E5597334D9C9212FD360158ADDB93D7F70EC3FAF045C1B5E0D5F9AF26E27EC8750539E5E776F21869E385DB7C2E97403B8CC890946AE34916646BA9F42E06284202563D9247987D326CF8D3CBCCE1E8ED2244FA24747A3CFE7737A371D579636C30FA399862FB7112660317BBE113277822573D4464932B8745A0A03EED75BF43DAF7DBADBA1BA332D8495B1B91B4309362332B94A393C6C4DCBBCB20ADC84B1440453F72578A49212A669A440F222BD2BD4D98EACC053CDE430E69DDFC4A75EFCAFF00084DD2816C978868433C927910AF30B1BA1246D41A73BC9F165745D57339E2618C801E8DE56A7339AAAAEFECFF00C940AC6584B2F9C4CE76955C8D5D129AE00C15B24C3A98A02FD4F099BA9A038CD3EAE21EEE4FFAAC600B3CB7351361BD4CB8B06A57933D21E58A3F766535DC096CC2F2A816574429C9F39C76C6A815F21E96ECC7D4C2986EAAEAB4FE2691224EB356996D5A3EF7C0E29294AA563EBA48976FF5E26F52E9F195EB2CAF22AD3AB5F7CF2DB99E79CFA11C5429EC2CD295BBA780202A68D57822E5294FFB0A32A882321332B4B8E9A1B4E560916BCCA4710B3568A747F2A4CAADDB3C09556462881800859980DFA376ABCD247B921AEA1C7111BF170C5491E0ECB0DA83C88D1D03A2BE3D5430BC4F47F3E87B791F2F27E17B2B0B6E67A4476D294554B960E66F29838A0A1B87EC655B1EA609837618FAA0B69F952EA7C4DA787B4DE729E41E9256A5BF681573946B65A10B4E6DA740B0CE697E909C75722A754B5A3423412E71064902A4FC865ACC6787E3618703C473AF3AB80BC40E4AB5D40200F20281E3FBFAAFB42CAC434145483A2A4C1B520AFC4F204F8FAF3B3E07DE86CA9D5055CD5156391CDCB408AB70DA206A5A73F88334A994706100592955A500EB2C046704659DADC15CE34D825894A528677A04270763093169A04CB57535445F858B399B0B6A4AC1AB02709990CEB63292656A4617B2D25B0BDBEC342E488D7E6B3419CAE23EEE91EF550E37CC38366B06C8580A5864A2CD82EC1595730025806395062EC24234117252B6E8F24F638269A3A2AB886F836AB782B6112C4731319C534D6012615A8DD622CC30890089DB209813C51D0936830A15BB762CE99C559A3EF3A480B970CCCB1850BF94AB294E04A968DF44FC79867001F9274900493B6E8D2FF34FC5549F0415E603383C8F8E64FD6F648078FB48662EB0B1CF540D35D6291866D2BA435007336C6764AC99DCB4D89083D93623F07D0CF38C6A91221490CCB207F2DFF526ECB5BC47C37558973EE66F9DBA32F836FB8C67C31CDE04EA79695E78DB9AAC25339D7ED34B99E776B3B0CF63D18465ED2DC067289B0AD9D30F9FBA1C7E6FC23E5DF25AB899913CAF8CB6770B70C2A549273170B63A5CDAA6BB371949FBDA3888886DD4479191B98FD60DC9F6C24CF1FF00AA0C3D1FE9D5C87A49EB573DBADE2FC81CBF7DE2C692494A8EE8E9F7F3DF942D9A9586ADA6A1353AA14B97FF00B300D8C2CF52BEC27D88647D83E95E92EA2C57B9763AA3A631D97C7C7D36B8FC41C863D67931776E19A46BB4E56333C5621922AE03C7C5BB6EC86400B83CD70B53339BE9D025150D3CC53B95C47C2386F080AB4946769341E29D174C3903CF8005C84018B763EB13C5BE152D39ED37749DD58A52C7AE665CB8A2C425477BD9BD09BD155A829BFC26B24B316B45EB50DBE36983762F9DB6FBDF18E8F927C72807697CB5E8C5A08238434F8D266D3F3A5A2F79A5FDA2E01DAA48F7B7B7C2D1331917C83E85C3D8BC6ED6EED35B3FA066FA22B39BFA19990882D12300A997963509A43104904AD0DA160307ADAF201C7CA21AA7A0AF087298FE3AD9F1D2D22751608E56F51DEB6A149410AD42569F23454B7B518B7D7F2B13E1F01DE6F3133F9C571F560AB55619A569C8D4B1718962ED9504F699077574343CFD1FD2481E9FAC35ACE397367F1E0A6F0FF9471BEEA900722CA091AFB60436FF00F54D8DAE8F0D7F51EF3D3FDEAD93D32B8E44DBB348E6E2E3F19DE3406EA95BE06B7DB888F4759681EC31D85A2D66822E7ACDE2B3317AB8C5C697A80F1EE9E775FCA6A60935B3888BE1D3CCB2571D5D5AC3FD84EC6925857B589EFED5F79A7FE7BDBDA6B5CB3BFE17F097893CB344D8B6AE06919AA3B45A7435D1CDD0A31337F9AE129656B50BED6B5A81F8D67EBBD2D489AFB0DA5733FD89A1C606F86FAA435121CD017302E5AC0A9F31D6667FDEB582C45BE73334B4DE62FF00E7E55AF8B70529639238018944644E934ACE260C0291DA91400AC09D9E4E49F3BE242FA93FE1164412CB7AE25CAF33B284E0EFC6370392C85DDB68DF5E5574085E2BAF4887AAF5EBFD447C65EAC69E368E949E4FE178922AD6AF1DAFC7F3CB0FB6CF6B025F5C39FB5C8738AEE26E2652DD445FB15F1A7B4824FEDA2DAFFBC933C6F5B3FD4876B99D9E0BC87D2787BF89E6B6A9856E8B771B75BDCD2CFF00D6DED03E3F442C46049C93141930647639DB9C778D125D8482040944DD6647E0B95EE3536B636C09E3E8F3DE4D274DFDCAA2758DBAFF006FA5CDACBA9567E7EC2C66273881D4BCD6F6A01B648BC41CF628D167AE4E3F719EA3AAE17B1CB2677F17A8C1C1CF54C06F3727274475D1C74D36D2B951D152B98F2845DC54A71B1524B5F74918B5AD53E90FE193A5BAE3DD9E95EA7C3F4BD3C4AE329DFC7F5265F190DAA61ABD9A16BF139C54A7AF49AC3CF2398AC598A49155845C1D523E346CEF4EFB61D11ED17B8163231D283296296FA73170DB4C64991C9CF93A90C2D5AAA2C8B75686972164083622AEE2496332C7247A8337CEA1F2A71F87D478FF005717AA4280535EAC28B5EC3DC5322D6E8680B3E92D14CD642FB57159762A26C7A79475E9577E37917695F38F503731D538769D0328B7AFA8760623D964F4728C64114E6ECD5BAD35340CD052154E3AC3405180980BDA0AC208E2783F25F86375BEBBC1BD5E86193EDA134B92FDE3C739D004579990B8897EE4FF006BDABFFC464CB1E83BCC09811D3230B18A9B5EACBCF3E5EC00F8BFC7B851E3CEC32D6714F227921D5A6CDF3F8ECC0965337925D901AD8BAFA52176CD30B6868D0365E5DC5673EF2A4E7691D53FC2C75BD1CCD28F0F22E56ADA956B47903764AF2AC7DC2E0588FB72C7A8A303B8C0A3BC7DC6484E8AFA499733465093427B622441684EE7BAAABF4C14FDF22CAA3B6B27EA6074C54973C97AA9F0078FE0FCEF933C97C062F6752074363276FAF5D2D2CD2E8A29B5541859CDA4AC2B255BFEA7C402BAB1F4CC00C5AC4DBF27E207E4FD20F066CC2B1D5D1AE8B6D97DB61BD771D2DD976E69A5C863DEDF65AE429A4A5BDED79B5AE4B4DA6D6F7B5A7E68B5FF00849BFD88BF23A9ABACFC13BCAB8F8E455934BCD43B24ACC01D804C8C4FEE7E5E06B6669723E6CBECECB88A350C495D90A5890093E01F3A3E7EF47D1AEAB492F9F90741ED6C5D8CB6ACBB54D0F78BE863FCA8E8584891F4B36BD56404031135FEBAC8DC62B4526E1B35F2E478DBA5B1F21B47A5D14F373D7B3A9E3B3A486A633F77938ACD6B7FDA6DACCB9DD671190E8654AC4BD725E51B86CE556A0E268B3FB8FB979135B791A2BE2E5C1D91D98EB3334182880D595CB207286D66308E8671CB2ACB4C21535377E95059FA0A31C2CCDEC0CB53AFCB13FA588CE926F94BAE4C32165354D261AADE46AFC1D06206BA0C5DC130AD75595EE8CFE8C22064DFCA26AB15082C959227672879CCD0B495942852A1A48C1103152AE79946207255629BF458E453BE4CE93089224026585648F9104EB9462421C7C401B520A13CB435E843FD4646B70DE8E7CB4DA1D4EAECB3DA21C2602C6BCDC7983AB3E46E7EBD3A0B8285250779052EAD88CD986B6214D4762AAA164A84F3C3FDE5A793B7CFEC649441D1E54B82DE79223E4003DCFF00E93697C8779F7B8AA55805B0E6FF0019A47D77AFFB4CD9D2FF00505C12E7FA53EC1250BB504CDDCE3A35ACCA892F9FA1994EBF355CA2D994982A8CEAB0C0C2DD6EAA6BC5F3A226CD4C06E02A158B17F69EA97DE6D4344CC57DA627FE551C7B44FB7B562071EFED1FED131FE263FCFE37FEC1C0ABD339AD4404592C8B8322A18E29562AF123151A8CC88F20907360FB70DA240F5DE79941A56AB34886BCA648C95E0524531B735DAAB2956D329D06F1B048FBF4DDB9EA42BBDE2EE3F7732A45399D8C2E79F0D96AC963310D1C95DEB2B15A7C6B43829694A23FD7EA284D378881DC7F965F157AE5F24734F1B33C77CB206CE510FD1C839165147ED5550FAD62DE467B8D9356F5A7C4F78A5AE42DA4F34B126F29B3D2B7A9AC8C6E2F4BC37DEAF0EA3755C531C96BC0AF7CB764E79A0CD33ED0DE3B85B955999F722672D22B10BFB19B4F3DDAE5A5C4650BC739FCE62E95C61F710D348C43C0C111F6D2F51FD5135AD0C29B107123B1E2F17B0FDE628795C44987CA5DA56D2654FC975AD2A965492B72E50B06046F7B50CBE406E48402080E274CF57AE7E8E3A76BA46AA4714D0D68E27952C7109329591D51096E5E74C48E2C0713AF5A37B7D4F533E70E13F78FC4B3D46D5FFDD9D2645F69041A30C3611D1CD82A4BA60524D68CE5724B365BEEB40466212624B5E9DBADE978EF1772FF00DE0D4DFA036A6A00D0C96C36418B7D26575D76BD8B232B0A82B34609EFEC485E09798B45C9520F8AFCE28725E2E555EA368EC6D682B420A8BD3FD14A58C10CD6662D44918A58B1137B56296B17E55BD476AD6317796BC9781CFA6B1D1D7391E41AD5AAD90B8C03BB02743A146173CFD514A865F2B2025E26E1AC495CB18A5A8E20559816DB45141176D5188127166673BF2A38AAFC011F4DB0093E7CF83B93CA414672B149654371531CB3A3B3712A79B0895220C078E3F20AA4FDFAA0FF0050CDDEAFB0F1BFF2DE3ED5E8049E67987053E995C0D1D442BA187B1C575ECE829B37CE65796920E860624982E108A4B75012C282D57B4E3137773DB62C7DD73918C9493CDBFEEB076895F65036B7FD593B133306B5A9F0FB626934F6BD2B6AC8E36CF7BCFE6735E843C8DDBF92757673ED1D1E0746D6DE52637611D4D476791C1BB39CC33421B0ACF75092FA5555B49B48669D25619327FA3A0B4F13C7DE46F0EF4BD578D3CAB82EF2FDA67585A07CCD3380A53676858D286AA4D8186157B334C15ABF95A4B1CCA6966329E92456126C062B4FFC3BD6AB2D8BC44913D9C7096B95E2C1F8CCB00FC8EE10A1D431684E99DD0320708B247CD68F7FAE5F4AF868E55952A5F8A2B681E5E51F389E50D0AC3C8957219242C638D5BC9566757E3C3A6A1B2ECF4883F640AF7B5A266683FF009C7BD6D37988F698FF003EF1FF0093EF13ED1FE3DBA1C202A3476B66CB0C0DF4BA766895F7F6242C3AD40AD3E5159FB2263ED2D27DBFFCB13ED11EFF0018A8750DDC0EB095AD49192DF227C7DA664136F95ABF28F7F7F9CFB445A27DE22F3311315FF1C4AF93575F12CB09795DD5992AE1A06B33490452B002D7E56F847B7FB47C6B1ED5F8D623FC7F88679F841291230511FE93E194B00BBDAF9D903400D1627FBEBD2D603489B0A489186F5BD843F5E7C100B0FB24EB8EFEBD1D2DB7CDE4FB28D5C8563DA085B509334ADEDFE2695F84C57DAB35F6FF001111EFEFED111EDF93F32635B4731AC564A5B149ED699924C7B44FBCC447BFCA7DBFF7DBFCFF00FDFF003EF3EF333F3C8B7F5FCB66FAF235E47C7CFEA1E4F9FD87923C0FDBD089B43C3FD0F0029D0F1E37E7FF00BFEDFC29ACE755B8CF479FD5171F3B3CD09144ECECAEF693168433749909C560654AE965E730D3432073985597E33C4809462421F8721EE788C176C8A6CE591ABE72CEB0D9EC26952C3F96D25A2A20F9068E40CCD8E078F51973D5D4555DBA4A743AA7B5F50F8CBD3E73BD366F425E7B2B96C8C15193ED75E5DA1ABAB919BCBA6E1C95D0D1D1E96350963D833AF0867AEA91CFE44A8A70CCA8AC501BAFC5BE89F296F1A64F92BB9E75ADFEFF00732327485CD735DA69F25CEA6AFEB8CD9ECA14C70F33B25D7BE77F1F0F17F931D8ADAF662E9CB8CB4C5BE4C74A7436533F5A0B91C92418AE0AF2DD4AF5D05B89001318EBB191E59F45A386660B123A1E4C595D7D6CD562122F6C48B5F9CBC0B94D472B4A0141DB2536EA80B33F352768C595640AE99FD5678A7B4F523E983B8F1278DF92070DD4EA79ABC67AC20F93B6B13C7CC743C2F3B93E587B6BA557175CC9688216D5D2E0D2B2B4C357A1D823016CB94C424E370997C93FD30BD56F0F0EEDC60F17D225F0A1ED4E5BC81CC693FF00592B6B0EF5CA3368EB1E2D15BD3D8695E62F4B58910388B47A66F3C70BD6CECA39F46FA8738FFE486122BDDE8B9D56FF0000680B6764595D59477DD679EBC5562DB275353583992133684DDD6000AE6169FE47B5D0E5785E6FA3D0D4641D9D39BF23775754C24B87E72206D5F5325AC7B6CDFA051654F41883A28E6934372A6CAA5B097A5F50DBDF4AE7BFF1B80E17158F865C7C62596133384BA1A3651334FCAD4311D73E72491C6221C9B82E82C6B6AB1D154E5A70D86BB6239832249FCA9A7ACDDED7168FF1AA492297642A91487916D2F27E6246427E9D3D20741A1A5D1792FCCFCA7418DCAF8F55DA9CAE53468C6268773DB299F63676496979068D79ACE64A06379ACF1CDF42DF561AC70FEC68B8818953F7BC5E3607738B9BADBBC4ECE301F44C8967418E69D3D471B1CCB94FB86762D89AE06F27F6BFCD8F0ADAD6B7DA525ACF57D56739E3FF0017781F59AE229BBBDB1BAF62F8FF0082DB6F2479C9BDADB6422BF212F583B5A64167AACB1F719EB18BA6C264356B6B5BE6B831B9AD5F4FBE6FF30FA67E885F257074F33AEE3E1BF79ADF17B7CA5F435D71D6FF00E9298FB4175635E9ED68A56B6112FF0060AD3611D436B219892DE71A00F4A9B4354D71C96BA445873922206DE667954BCBF20CA0279403779E90A38BC78AD8133B4391BBDCB75AE15EDD8EEC489B8E4463F1ADC36AB13AA317DB695D77EB34E6F9E7CCBD6952E739FE5B51B862B0BAC62A4EC7D6539854B560F6144CFF00D2D5AD87615AE3ADE63E5333F29DD5E1BF4CFDE6AE9A1D1F94DDA92663EC952F52D49EC42DAD2AD16B122403A166D783FF00B90F52DBE53379ADA2F3C358583AA2B46327505AF1681895AFCAB6B5E7E76A96B59F7A5BDE2D3FE2222FEF699FF3ED4D87CEEC8B40A0AFC2C381D6A5B5627DE2622933158889B4D69ED16B4CFBFBFF00EFCBFF0023DA8F3DF6E0D1D4AF1C018162C58B49A62010A5882A7FAF003C9FB3E3D6AF8CE9745B29632D3B5B643C82120C4789040D0DB30FDCEC93F43647A167AE7679CC0F42FE5BE24E1148F738BB61A2BFC3EC9369518534106A297F6B9A56D045660159AD6D321A444D67FF002FFCDFA7DF117947C6FC3F8CBD5D74597CCF93BC11CAF236F1AECCED35C7EAF4DCF0F8C527A5E3E3AA3E4EB663797AFB6B08BA5CDE86926ED7A052BA3CF3A838FF0042CBC2DF20702F7A8CEE14F1FD65DBF37CEA2FF4DD030AD4B7A2F0B117C7E7E9101F79BDCDD56C62DACAD285236881DA0A97989F66C7D47A12F599E1ED84F7BC38B8BCA83E13A50EAF32D6A6D646AFF3E8E6B76B651B5333A2D7CADE074374856CBE957A8D8CDD350B5A5686AFC243B8FB311C7468E4ACD9B898DB962C47671190B0FC23166A10AF0392A54456C388E7DF9645D1D01E307F7FB2467CE74E2D2A9FE250E2E39532F8B84A2BC952EBC4626F2595C5710B308F896D4C0F1D03EBCF17A54F07FA61F3575BD807CE79DDC733A87D1D8172DCC733D5D30714415859A6307FB87A7C0D26ED9FCF4EFE4A04D1D18F66E04CBDAFA1961A59C3F1BCB1FD34B9EED87B84F4A5DF84BDDE1DCB27F07796BC89E257FA0D65A85FF8B5C4792B8ED94F92D661AA7FB2F8DD1E2F313400AD50F45A6E5E8A9190D7C4AD78E3D41796FCC7EB37C09D6F36577C7ACF6C0B24A6CF31959BBAEF51B94E898E72BCD513C992EB16F80C6ADDC5DBCF421702D4340585E9226F4D1E43F1E792FD4AA4978F7288F8903EC76A650BCF91523D819740A69E2F4C9B65DB976B1A7B99CBDC93B2C2AF36AD3442A634904AAC4729D5DEE452925B98DBCF76CBD9960868D9E37B1168C561E176324E23922A8E8A6412D2B30CE81938F243CC8EB786F6BECE42C470D5B34701257A59159E4861AB98C525CA10DC7A01694F3D6B73D79A53555AE403BFDA32B8AB2F2813CC6F4B6EDF97DED6E6FA5E67531F7F01F6B236327517325A199A39E6BAAE20E285F8157615606409845AD494252D5B56263DBF27E7B0FF003AFA6EF46BDFF7EDF4DE49F0C4E9758E22A0DE76BD0E165DCC25EC71AD428757BCE1B5892A8E2130DF492D8602AAEBA42E81C494514427E1E87DD7C888A217FA43AA92E844169692D39AA09C04EEFE34B2598E478390262678D1CA6B92F2FBADCDEDB74ECB2C9250EBBE9734A472F54DDEFC573B0C54C42CC71C72469385204AA9232871E0EBE8DBE0EECB94F1774DD2F8B9C448D0FA8E227B4C8EAEC5FAB23A3D6E2261D3E0A0285142889A604ACF4586ADB4AF023857511FE4590FE18BBEF585C5E7A29E56A752D28712C9B2CD407875328F3EF1622220DA4E928C4584B8EC30DD45E91F7FC8504F85443616DF84FAAF15F00976CF35CE77DB7E54DDCEEEF1F6AC46FF00B2FA5F1C99CE4CC694F2F3CD2B1E71F6ADA88D98BAF85A22FB0CD4B0F64E6AE9737CF1E9CFD25E873A3FABB5D9806384CAD4F8AA1C9B2E54E359D71F590CC4CAE6BE7A8D1215D06C40D8B20D49176990C8999AE5791C5E4CE0DAAF4DE5F1183AE54AAD7B301E72D2F884884910E3596B977893417BADFCC7937BF47B08F89C6E669A6730598C97E02AC64D1955AB477501DCC89372363F22348247015C2463F968CAC3D0234BD70F8F9C47A9F09626755E63A8659D3577F6EA3BD6AB35472341D1846367E96C9A0D2568109CA96568BB5FAE0FA7DCB9B7D2F37E49F4FF00D96BF178399C3B5CF757B6CF49BBDFEE01EB691C1305242FA08322D9C3DDCA5E485A6257386ADEAF3CE34CCD82C1978B964FA1AF49BE71E47BD4FC35EA31C0F9A12CC5B47832B9A0AE46E29D4E7FEE9905858EC171373413D02D68869D144B424C93061C24E5E0218C982F127ACBD0E3DFC407983AEF19E8CE7BC8B94CCE4B9CCC79B9BC546D151EBF1F9F8D707C8AB0AF5771D8CDFD9918D99312D7825BBF4E6022C163A35B492E72D988BD9BB5ED875590EDE48D22445EDD7909F8C689CD882D23B02157BF55E63219ECACDF80F5B058E95A38571F90A5623B0420884566499C3FE4588DC1D16923851870481541791B16AF1BA3EA0BCE9E0BC1EAFBD6FA6E3F87EEB2BB91623E35C6880A96864BD00422A9E604ABB1A4AE6AB02266829969B64FD5042E33DEF8F3D63F039FE60F5EDDC7419418CF7796E6713C76F522D5858FFC46729B5F72A41FCFE552EFEF7597086FF16282A7DA6080A6200541FE9B1E79478AECB2F83F38F7AB537B8D97F3CFD6759A975D0E92E891C0E46937D4C0F505CEF45985615C6B33B64164E9002BB1A6472BA3AF9566BFC9E578D7CABA1EA333F96732B6FC8FE71229B1CE790B98773BA6E2B98EEB99CB63733425D3A96495409AFB10BEDBC84357A0356CBD131156B9BF2C5470B8FCDF4B64AC54C9C55E1B4CC5E3338EED6B2BC443525AD204B51C65C33C864857E215A37F92A88872599E8AEB4C357CFE0EC7F931DAAF624A2D5AA5EAB318E5B57E1B91F3A73CAB5A40408679194968E65E40ED7B607880E75689355F86C67DAE3B5A9F38A3001CD7EB3FD961FD75B5ABF1F98EDFFE495B56B6B56B17B77D3C76B9D4370A798111656E2B32C16B50AD5A8ED729CA4BCD461A00516B149724C56948B5A62BF2BC7C6AF9BFC9D8DA23E6B6FC0DBDA9DA2DD5139875FCBDB572799B66AF86C15DE95D7B444CB5926174A1273CCF26C8341E56E49696D6D40D470731A7E23F2275BD77078FE47C9E5E1EF2417B6A739E3281BDAFC77357E439AC4DF2EFF925BBCA0DF77A89DFA2CABE6F31A7978BC32C7A5E3AFE5FA62500B2B8755C55D96FC34ECB415A36725EC24F14E638D5B4EBDA85DDF91208092F688DFC8A03B0D0E47A9F1B4B1D2DC8629A69235658E168A680CEFC0483B124CA91CB070D377A132A14DF1663A539F3D2379879C6BC8FAB93933ECFF69DCF8FB94C8E934A6008B2825D1247069A50722F04C76B6F5D0D2BB26B53F90CFE7C2E297AE73A03B4DAFCA9B3EB3767ED779EF5287CEC958B7127FD9B441B820C21FAE48F5CDA4E56E43D7FE9F085C13599F6B8E2F1333E757D48794BC74C79C3CE5909AF9F9BCA743D768F33FCA62B0B0CF945CCE6F4798535CEE54E65F3D35A357EF1DBFD6CB3A80AEB7EAD48735729E9F98BB9F4E39B5EB3C63E74EF7098CCD4710771557B659E7582ACC107FA6DA6737F05A714B8E68386BED0454042128520A17230984E94EA85C2E22EE3FA4F2796C20FCFEE64E3A74EC56A691709DEC5BFCD3F8F042F0E9CC92208F90ECAC8D3131846FAF3ADE99EB0C940F907872191931EA228269E0E323C490A544685A39A568E40623C4EF4BCCC7C0862E43CFBE7CF51D8B927E33CE3DEB5E46E534DB8E701B17CF12FB5822D97F3745960F5924673899D2E70E9B2B5C2225D9BA77A33134208B6CFE9A5B9E29E1BCC3E4AF26EA72652E166720A6368E8DF8F4F592453DCDE5CCA34FAC80B46A8DF54D936FA5876B0420D7629591C2A7FAF1078AFD62777E7D5D6F117A82F1D429DC6F78F27CA5807DF275585C974F9F90ED09813D065A20AF57CF2FAC6FA1669BE69E7136ECC90EA13156B106B14FC3DD0F9DF117EFF009CE6FC41CCF078BBDCDACBBACE19F43A2CFEEDEC6D826863E3B1A585D36D3CB173B35F76E9CB0DA4C263B55870D56183FCC867F279583A76CE353957A1A8E475831D5A0B1119648652D055882D7915D995A6684712A5DD8291B5FDD2789A3773F472369DA6C84B23C6A66C8CB2413A4492441A6BCEEF3452448B208432B28758E3E5C5B45907903CB3E3EECBBBEC3A15793C5D3E65FDE6C9C3B9A69B2DD8DC7CD457CC3A56AB0390A0D9EEF3A24EC31C26564EB0441584008E7E167C4587D8EDF8FF009DD36FC81E2BF104B19C8D43C5EB765FDB4CA635F3D45C84AE36C67EDB6A884D099CE8251BA28E933CAF2A2B859AB4CCFC5D5B0DEE558769E2CE62A28E562F1C4D0DC8DA3462A550A76978950402001A207DFD9661F27ED7D6735DF15947787513B7E7D69393205566EE0470FC8824B7260493E4E8EF38F63A8CF4196A7904F50A5D76D731827D1D6407F0FD9BFF0069D51664C9372E679EFA41CB17F2CC30A19AD4BB2ECBC73D589AD40FE31F2EF659FBDCE78C825C9638FEB3A5120FE46A62E7EDA2A88897DD04CFCBD90BF8A130C8FB978B1B319A18AC10ED8D9667EEFC9F93F197EA9AF5E1C35078608627FF000EA03947122368D7A2C4725507CB3B93E7C9773F6C76ACE0AC4F2750E69249E674193C9908F23B282966DAA10ACC40E0A8817C7C42281A0A35B73D0F7A7AF09F6FD579AD5EBFC61C56F110EC19C451E37378F9DA0B678D145CA8D4670D2CB9409FB4529BEECFA2848F940E2D0110062FB34F8AC5CFE93CD7E2DBDB474B9FE3B4D7C6C77B4B49A37436CAE8B9E068993D0D70DD7268DD0FDE228868B4326B9161889A9A1A6FFDAF167E4FCA1DB2555B89E3CA00ADC7C725EC83C5B5F6BBF3A3B1FDBD6B7D372C92B43DC91E4EC4B5A6879BB3F66616D00962E44F6E403C734D36BC6FD2B2F5B3E96FC69E30F4B31E68E68DD17F7EF42C29CF6869B6E65D63F8D71AE7ACED056CEC6CE6E2EE55D6427B15C3524249A5294F79995FBE8936FA1F1165757DD78DFA3DCE476DFD6A64ED0B25FB8723A1CF541074C3BD8F35B21A66448E3739EF183FC8E7D5A64693601B2C54B3F27E43C956AD8FCB61A3A15E0A49670B13D84A914759277E01B9CCB0AA095B912793863B24EF7E9C1F726CD8CF7B63D433E7279B33351EAD8E2A5365A57C8CB4E23520063AB25C699EBC6478291145D78D7A6F2AF49D1601BC53DDE5ECB22EAFABF1CE6F74FEB32B6669596EAD8DBDA46FB2929A6838843748444E2F77157214D299D05602C8D72038383E17CEF28A552F7BDF7967A2A7B6C7D0A35E40D6167AB4E84EA03704BA0A42EA40F581939817EA5096590A0A0CB36A2E28A4FC9F91B171C7DDBCDC136B95B1C4F15DAED977C4EB637A1BD7DE86FE87A5073B62715F0A8279821E9FA4A5448E14AAA95552A1B5A01D801AD00CC078277F474BFD2ABD2437C4715D4D313B649F1F6BC415C556ECDC263EB0B71CF93CA68E43CB3A8CAD6904FD7090923D7EE35AC7BDE6961AE67BC43C9F9905F5F5B3A01CEDEF3CE6E16964635D04B3CCAE809FD378D127CE71EAB2DBCBD9834FEECAF6B34D57F5E284AD693F27E3FDD1F2CB1FB7B9CEDC9226B18D18E0ECBA4358ED07123487436BF4743C781E969EBCA750F56E0F756B1DC1F9077045FEBAC91159FF004FFAC092449FAC1274DE7D340C8E139C1FAC6D4C7D3487D2DF99E3F92E571B67A30A7A1B8A731B6E73A37B02AFD155EB3996BE932C841F44582D404E3245855FCAC78F5B773FCDADE409D68B9597CA7626433D8BC100BCE6E3B1FA14ADA2B53DA8ADA0761FCCD6BDA434A16E4158C32CFC9F89FF005D12B6A48549584C55C188122223EF4631F13E403F5F637EB5DE828D1B074A7644332D9B61662A0CA0708BC0908E63ECFD1FDCFF005F44BF4F9457B1E15DDFE9514F5B51CEB7A4A9186077F7A080D5021006B42562811D6936AD27E5F1B5EFED314F8D6B3F27E4FCAC8441E02A803E805035FF005FD87FC7A9B6E69BF2A71DD935DD6FF7B7F54FEFFDCFFCFAFFD9),
 (104,'zilles','lisa','Lotte',0,NULL),
 (105,'zwicker','michael','Zwuckel',9,NULL),
 (106,'','daniele','Luca T.',2,0xFFD8FFE000104A46494600010101004800480000FFDB004300281C1E231E19282321232D2B28303C64413C37373C7B585D4964918099968F808C8AA0B4E6C3A0AADAAD8A8CC8FFCBDAEEF5FFFFFF9BC1FFFFFFFAFFE6FDFFF8FFDB0043012B2D2D3C353C76414176F8A58CA5F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFC20011080064006403012200021101031101FFC400190000030101010000000000000000000000000102030405FFC40017010101010100000000000000000000000001000203FFDA000C03010002100310000001CEE5E7A61149E68BB6C4B9A0684052C44750E0D5F561D2E554A239BA6ABCFCFD5E65E39D2250C8E98BE72EEACAA032D0744A276D39F67279FE8F1B73816B6C2E0CE9B736ADAA8C0BB567D159E99CCE9C84A83254B2C4ED889D178565D33735B639B66E6AD804C02B93553400C014E842DA76800D420D736C0A40418534034C25816FFFC400221000020202020202030000000000000000000102111031032012213041132250FFDA00080101000105025896FE247D3D8A2D8F8DA55DD6A5A871D8A3478AB1C6C9711E2D0FAC88378BCDE39216574BFDEC659E4BAB8A64953C7DC5FA290B47A669AC726C9688EECF02C4C68459F9093B64B62632DE20D178931BEC991290D0B76377F05965FF003BFFC4001811000301010000000000000000000000000111301020FFDA0008010301013F013D9C58E03B5611FFC4001811000203000000000000000000000000000120113040FFDA0008010201013F0134CA871B3FFFC4001D100001040203000000000000000000000011102130400001316061FFDA0008010100063F02A2D86274215A73A879A1E760FFC400201001010100020202030100000000000000010011213110204161305171C1FFDA0008010100013F211CFE1F6DB7C77BF696A7C752B82A1E3A3C78CB2CF405CFBD2239DC0E007C07FAB8B8ECF60863E9F1969C02EAA5B336D89DDD0251D9E9A38390B7BD9483B6126DB0C44E36A1BE3A2D5DDF23B961755D8870F082601F70700EF83663F7F0E74DF34402EC1EBC1FD49671DC632C8A36A3E1EF864DD348CB86576276F325230EAC72D1F196CF8DCC97197C991249E1BC4E0F60781C63F78FBDF665C956E7D49F60F563D8FCA7731E9FFFDA000C0301000200030000001033BC793FE3EC532C545BFE39CD4A4D38B96F149D00CAD0B3248F379F197B93EF2287D8A003FFC4001A110003010101010000000000000000000000011110202141FFDA0008010301013F102C991C3D28FE8CA64685F19062CA355158C4CA273109CD16BE1BA62CFFC4001B11000203010101000000000000000000000001101131202130FFDA0008010201013F100B3A7A5C13E3438A178CB93450D454E950970BEBFFC4001F1001000202030101010100000000000000010011213141516110812071FFDA0008010100013F10B012AD62B5E63E30FB6CB4F64A328EE0C9EA2D640CF32A82AFA94F5114B1ABA8317FA3925E3C08999A92D753D4AC7C149EE58CA82AA5B54E66BA1C584F44004C4B60C0F0E628165CDB9835B87A44C847244C449543C4AC92EF10A0A0358858D33A25E1211A19A63DAC3C8198BD21FE913E737296FA62C2EA34084726A5B59D6E65008D50253BC4AF093DE2B254DFD216754EE545156350695E210103170A4B526EB3550304A978619223A622653187923BCF93F4546D581BC6FE55539C4141388952628D55C61443A180785405A82377F9C0C0ABB623E97988C569E223B79D5CB8955D845AD1372C0BD4870A4B5EE3B6C71EA777E20D0C40EE39993899F87281732E988ADCD4CA5B258D8ACC071ECA62A937E97132E0F8F10D45F22B22666621981670C4AAA7EC4D6FF087A618A6580326A11E21A8BDC734FB72E98AAE673B1EA623A21AF854C4B2257F0333506DB8244A086BE307112E27F13A22864CCAA21A9FFFD9),
 (107,'geilke','michael','Fjen',0,NULL),
 (108,'','masmo','Masmo',0,NULL),
 (109,'','giovanni','Giovanni',0,NULL),
 (110,'mozer','simon','Simon M.',0,NULL),
 (111,'wengert','nicolai','Maggi',0,0xFFD8FFE000104A46494600010101004800480000FFDB004300281C1E231E19282321232D2B28303C64413C37373C7B585D4964918099968F808C8AA0B4E6C3A0AADAAD8A8CC8FFCBDAEEF5FFFFFF9BC1FFFFFFFAFFE6FDFFF8FFDB0043012B2D2D3C353C76414176F8A58CA5F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFC20011080064006403012200021101031101FFC400190000030101010000000000000000000000000203010405FFC40017010101010100000000000000000000000001000203FFDA000C03010002100310000001E3B45CBBCE6595D5712B37144AC970DC50C210079E9BDE31B52257C8656F377CA79B195DA8109B8D62DD7C3D2566E561E8C994D84E961593A50197736C1793C93BF305E9CAF3D4AB4282564EB4C166C3589D1073E824DF1AD74D98C9A7ACF4C31C50D1DE37473D859BA39370A7102D65D6CBC7A860686FB7842C2A06800A00AD02B7A40B00CEFF00FFC400221000020200060301010000000000000000000102110310122021313032414222FFDA000801010001050220ACC344E24BBCE5BA32D2D62BB962391DE5F10FC38487A6ECE18D5782314A3F1C4FE92E44ED4E3BB0FD9F2EF34924B822F99FB6C8BA6A439511C4B3551A965FA964F67E5B2F94ECE921FB4BBD9C0A44B0F829894991CA5BB0FDECFE4D284A8C4E1A74779AC989D3522D6564DDB2C964BB7B2CD4CD4F67E4846978BE13F51F863EACFFC400191101000301010000000000000000000000010010201130FFDA0008010301013F01A28F661B33D8C1A724EF87FFC4001811010003010000000000000000000000000110203040FFDA0008010201013F01E2363060AB1FFFC4001D100001050003010000000000000000000001001011213031404150FFDA0008010100063F0262A7D7184844F438CEC2A5CD96986AEA4EA1EF397AC47C49D4EBFFC40020100002020300030003000000000000000000011131102141205161307181FFDA0008010100013F21371104BE8A6B41C3A3A5926782C3004A25F0F9C852D23A444A4141742C3F25BB20D8A48D50FA13238531D0FC10BCD123D6A891096C103D1588523D126D06B5E2A9AC9A2B9D1EC5F28E9035425151044884773B6274E11C2C140826C9284C9D917993A5BC172133B3592C742D030BABF8246113984B62AA20E86FD119A12564C8BA9C2785A1B166618DDD2924A6228351D1EC4A5298CEC6842218924142C3F83850626E7DE1642C31E64240D821E2D71B4D8DCB1D792CAAFE86A19A45F808EE45D9FFDA000C030100020003000000103EECF722433DAD7755142ABFC9A3F7303A13EBB74DE31884517F787215ECF0389CF1C88103FFC4001A110002030101000000000000000000000000011011212031FFDA0008010301013F10360D41F49EEF0D455C3C8D458C5686798709C1B4D8AE171E841F9CA8FFC4001B11010002030101000000000000000000000100111020213141FFDA0008010201013F1067C8C4868B17B3AC346532D361510C0E953B0725560EB9AC7897B7C63FFFC400201001000202030101010101000000000000010011213141516110819171B1FFDA0008010100013F108C8B3E4A19ADA57E4AAF027EF12BA906EE0FE71C0BC89419BE66A7F21A95948C69F31F2EAB311053BB5280C137477125B6AE7E35512FF846A6F6772C7FD9C88E119A30D7C271F2D516DF52AE8439A9A4070A946A8FFD8ACB2B4F711519A9997E90D7C205A032C704ADAA45A87C086F0362F9F2205979E364BB27D831392F62E1EFBBA2208444E186487C0958AC33184E995E1018298A5E0BC452D126C5B9861FC1328B063B2AB3B9B24708F6108008BAF6A237438476574EA23514C6C1D10A97B199237D2460A282BD7116AFDC34E1B84EA59EB5DFF608D6EA747809B8F44F03B96845A2636632F4E48E87A8E07C9CC0B63B2BE0445114701187936692D744A8B9785B1BCC415B1322752C238C43364A0816CFE952E824D06FF90D5C591D80EDF1A35421BC512AB63B261477C731860C19FF00104CFB396796C69B9E0670A606E0906A1C12A5E98055ACA14998880652581D3348C1A9E93908255C798F105594B9D9F0DB68BFF0970F6C7F15F4AE7E5A59EC278C5E9D46E93151DCD3E3F6B135F8E4894DF1012BC93FFFD9),
 (112,'traub','matthias','Nietzsche',0,0xFFD8FFE000104A46494600010101004800480000FFDB004300281C1E231E19282321232D2B28303C64413C37373C7B585D4964918099968F808C8AA0B4E6C3A0AADAAD8A8CC8FFCBDAEEF5FFFFFF9BC1FFFFFFFAFFE6FDFFF8FFDB0043012B2D2D3C353C76414176F8A58CA5F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFC20011080064006403012200021101031101FFC400190000030101010000000000000000000000000102030405FFC40017010101010100000000000000000000000001000203FFDA000C03010002100310000001CEE5E7A61149E68BB6C4B9A0684052C44750E0D5F561D2E554A239BA6ABCFCFD5E65E39D2250C8E98BE72EEACAA032D0744A276D39F67279FE8F1B73816B6C2E0CE9B736ADAA8C0BB567D159E99CCE9C84A83254B2C4ED889D178565D33735B639B66E6AD804C02B93553400C014E842DA76800D420D736C0A40418534034C25816FFFC400221000020202020202030000000000000000000102111031032012213041132250FFDA00080101000105025896FE247D3D8A2D8F8DA55DD6A5A871D8A3478AB1C6C9711E2D0FAC88378BCDE39216574BFDEC659E4BAB8A64953C7DC5FA290B47A669AC726C9688EECF02C4C68459F9093B64B62632DE20D178931BEC991290D0B76377F05965FF003BFFC4001811000301010000000000000000000000000111301020FFDA0008010301013F013D9C58E03B5611FFC4001811000203000000000000000000000000000120113040FFDA0008010201013F0134CA871B3FFFC4001D100001040203000000000000000000000011102130400001316061FFDA0008010100063F02A2D86274215A73A879A1E760FFC400201001010100020202030100000000000000010011213110204161305171C1FFDA0008010100013F211CFE1F6DB7C77BF696A7C752B82A1E3A3C78CB2CF405CFBD2239DC0E007C07FAB8B8ECF60863E9F1969C02EAA5B336D89DDD0251D9E9A38390B7BD9483B6126DB0C44E36A1BE3A2D5DDF23B961755D8870F082601F70700EF83663F7F0E74DF34402EC1EBC1FD49671DC632C8A36A3E1EF864DD348CB86576276F325230EAC72D1F196CF8DCC97197C991249E1BC4E0F60781C63F78FBDF665C956E7D49F60F563D8FCA7731E9FFFDA000C0301000200030000001033BC793FE3EC532C545BFE39CD4A4D38B96F149D00CAD0B3248F379F197B93EF2287D8A003FFC4001A110003010101010000000000000000000000011110202141FFDA0008010301013F102C991C3D28FE8CA64685F19062CA355158C4CA273109CD16BE1BA62CFFC4001B11000203010101000000000000000000000001101131202130FFDA0008010201013F100B3A7A5C13E3438A178CB93450D454E950970BEBFFC4001F1001000202030101010100000000000000010011213141516110812071FFDA0008010100013F10B012AD62B5E63E30FB6CB4F64A328EE0C9EA2D640CF32A82AFA94F5114B1ABA8317FA3925E3C08999A92D753D4AC7C149EE58CA82AA5B54E66BA1C584F44004C4B60C0F0E628165CDB9835B87A44C847244C449543C4AC92EF10A0A0358858D33A25E1211A19A63DAC3C8198BD21FE913E737296FA62C2EA34084726A5B59D6E65008D50253BC4AF093DE2B254DFD216754EE545156350695E210103170A4B526EB3550304A978619223A622653187923BCF93F4546D581BC6FE55539C4141388952628D55C61443A180785405A82377F9C0C0ABB623E97988C569E223B79D5CB8955D845AD1372C0BD4870A4B5EE3B6C71EA777E20D0C40EE39993899F87281732E988ADCD4CA5B258D8ACC071ECA62A937E97132E0F8F10D45F22B22666621981670C4AAA7EC4D6FF087A618A6580326A11E21A8BDC734FB72E98AAE673B1EA623A21AF854C4B2257F0333506DB8244A086BE307112E27F13A22864CCAA21A9FFFD9),
 (113,'stolzenburg','wieland','Wieland S.',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E000000060301010000000000000000000000050607080903040A0201FFC4002E1000020201040104010402020301000000020301040506071112130008142122091523312441323316425161FFC4001C0100010501010100000000000000000000070204050608030109FFC400341100020201030303020502050500000000010203110405122100223106134132510714236191157124426281A1163352B1C1FFDA000C03010002110311003F005D865A8D798145286758390B215DB3D88448E0661EF6CF32501C14C114FD4904C7332731907312AEB6E111CC4AC4C6EF4389591972535FA4040C705D4A4620620463EBB22D360A1415CDEE635600730A582487B362560A327178FA04009AA27B475EB113DB98F6DB5D94C9143088DBD4E18CF32E060860A386417533E0845612133E5858CF52991F9CC99A6CA9A92C1E55A4041F90A1092428AE6C03447903A8C51C7715E2C9DBC511B7E3BFC03FB0362FCD956318C2E8736F1EB38EE470481299EA45CC831AF3E44FA70310B22989983EB31C7AD47A9556ACDCCAE53E0A1332E6BCD8AA74D6A82825B58D252515971CC0B22C9A40488664BA4AE252939AB7528D816D7562E9568736C4CD525A6569832EE5F89C4CF4E0D922051305111133F5115356EEFE0ACE53256330394BB8EC4804268272038D453B2B5F0BAF5DB57BDCB375E70E73EDD3B98D551AFD2BB596DDD5536BF4BE952EBD972C7ED4D0E34015E6C8224277315D91C6AD64C84EE3DFC0AF04B28EA6B47D37FA8CC54EE8E08E8C92282BCB11B514B000B1F9DCBDB44ED268753099A9B472EA2B255F54E2B218E6B852FB38CCD637326A4FC56BD7E4563AE3C524460B0186D95084B60CA5412531BA9D67A7A8533B2390384C801436F22962EB841942955AC5C7DCBEB4494C7905A0AB49938E8F35141AC6A3EE7BA4C962DB9D6E1342A6963FCF56CCD7B55E28DFB7945F88683DF9A65BAFA932D903F1A4D16CCD369C98135812204C7553EEA75567DB66727A2CF1CE181AB91196CE429BE2206580D71BD17A834679965660E48C888FCFC320404B58DE86C281017C69F21811724F308D81EDE0C5148A3700C28ED22896045F56EC7D0B4951B5C3CCF64EE2F28F079FFB6234E00E49049F8F17D5A75DDCD0AC94A7F6D6E32F5A2894FEFD6C6717914B3825B2B6671952B5368B55D612E545AEC4602E0ACA8978ACF4F67D99DACF8AEEA2BC85509F978F62A5F6970C816FF1CB6E479024089CB741DA5313DE22791E3D41FD17B8C2FC6D8C46590E0D3A6B73B0D7ABC62E7F6E95F276A6905CC8CB8712726C83AF349B5EB192AD59AACA8620C21B1A835531760F08EA542D518B728B3524C517E90322480BC12142A7E5D1C0B555C4ABB3596574FC8C58CF1CAF4AE96F13C7140B8F2134B209656747FF002B06690AB05354A776D04826A8F4F5BD39A7CD03241018E42AC5255790956A047D4C6C01E43791E081D5853B377E9B5891B544A792697435A555E04BB0A8EC2E624AC339EEB5265E61E40F37801A871FB1CD3DD51162B4D7B313C412E41BE5514C4F2B1FCD802C89671DD311DE60BAB27B722CE6CE6AD465B06584C8E3C939BF902B97BC21F672161B4D2CB0D06144C32D9364C98311E468ABCEB022F20FA711F7871EF6D72B89224892F80A2516E1660270B9E253DA04C640A4A03AF499FE8615024F5162E46919061773102A36B37E604928200DC257B81B7596A40AA87F4FB88BEA8BA8E13614A636216BC13EE167AA058B3A88E8D1204668585E48E55752EE765AB910AE29374447916F33899801ECD29359092CE4BEE43A0C7D109971126CDCA4A0D70EB572C1C0943EBD699F8AEEB3CC837AF8DFE4985F625489F689299E4A23D36F39C658642B1E76BCF1333C5961C26572B315C122205896914C4042D9DBF22199891899C717750B9C351F915D1AEB64041A5EC18E2619C194CAA5C400D89E244991250725C711255D5CBC97BA32B061DACC69286D02B7528076F0403C93B430E7A8B0E4F215DE80ABE478140581C723C0343C5D9B757E463CF82B3466A9CC0C8A9D2D96742182EC52C31399EF263F711C75E23988E647A6B594E8AE445F934137A411CB2F7E7D8B92989FE40E2392FA8E83311FF2893EC523D20CCE0FD4C3E6833102E8D02B185207355C57FC28330E3DA3FCB7EDF65AF9F8F3C7DFADC1AF8F65636A6BAAD425212C58FC96BD64210B387541F1B00BC6C0619F1324471DB9EB13EB3371D015C954BA2617D0BF90D15E571E520205AAD38219D8E18262107332B2EFD264B9D65533A15AD20ACD9358C43A4A85CED2F225AE1920B4A60CE25F11C2A2C48AE20657C4410013D1CBB71436D9471856D6A0631B0DB40D35A20A192C715C60A812B222F2D9B3656B08380370B4423D3A887BAE8B1E309637210B4511DBBEAAC146E2CF046E45A37E39284FA9163841DC40ED4A249DB5C80479E3EA1FDF827A6377733D96C259A5855E4A92D5E36DEBD7EF14A6A55858B5B5AC294A9ACDC859F34F744073531E49B391B6D124639CAABFDCCDDBBADCB2B0B837325CA53EB5ECDE35732F3282632C3F1A0F96D6C62265B21177975D159936170C60AD6A5DF8DF1FDCB75356636C3EC292593945F0A42C61BD55C0585571FF002FC708A2B5327E231835EB9D73164290B29AF10932FB9791BB91B8BC5D08827BDB00B4F96C13056661E3B2F281295A6264168AD084840C440C76E4B49FA3B415D3F4DC68FD9018C4B3BDFE98324A03967DF7DAB54A2EA94EF23A20612A61E1430AB1123905F629663236D25540DCF62C2DDDF245024EE7C91AE958B3A8BA74690564C35B69965F60AEBAD37BB5AF5BCED7CEB6F7914B2C642F29561E665E50674864A8475FD5C9628515115283200A5209AF249691C7245071161B1D8E608DCD38E4E07F38888926B344E90DC4D68D14E2F16C5849099855A6DAC9181092643604896F644478787F9017F9F20CED2B1B16D2BEC2F3591D109D41A8AE303336EB9B62A248952B54A485696109199B042419C0F021D3A440A88A3D58B332B0B12B74C4C81870921700D5F70DD566CF209A2451F9365D3B4FCECCAF6E12919F9742A0F8AA3575C0E050FB7156D3ED6EAD6E66CE39A530EBF5D78CAD342A581B00BB9428228132B8417628682D8261D261A8810826C84144C58D366582BE0DA838BE22ADF426B832BC928E1F29061C40B5805E068F49223540C44411C8413A3ED63DAC6DFE222BEA1656ACFB09C660A642D285B09CCB1F756FAAF16930E5E894ACFAC42E201A0C91628C4A6486E8EDEE3918DC95B9B3150D35589AC9A68402C2B4AA08D630D4BC625A422CF344812E658A0957918674BCCD4D0649F648096A05D8140AF1B413E6E81366CF3E79BCE26813A610794024A1602B91C1A63600E39F3B68DD57CD7355D537F4B5EAB7299B412B87F814E311B35D9E46BA2A83246536AB4A2B0DFC7B3B492054FAA8B698AE858CB9D05BAD88DC81AA39EAD139655182EE2C58DAB3102D803B04E57F3BD60A8873565E61865353C21B602595E5AE72524DD4B5A5EA5162724F6BC9643DC90B731AA35A8A24E652B8CA20A047B4AEC4022624E78727DBC6BDAD435C60D5E412344312A94AE2B4B0842E565D851048C0CFCB6346E25506D029AE4E8005578846B9A645AAE8998644579040F243DA8C43C685C10ADDA4D85A04D1B20F07A1E6BF8C9241958EE81B646EC8DB6D9654A2A63634412CA4117DC18837F162F530716D92345F63155C1812E6E4616A4088CBFC4A4342BC39AD39288989AC64C808930999139CF774CD72E45B947E505624D58004A6BF8C7ACCC9B5B0838F1F79862CCA7C91106A11964FACB6B2C391107BE2C27CBE50372E6A349ED0309FC9620D382EC7E1E4C3CDCC17625C47D695146392A51CAAC30D8B82843EC12F22A3838EEC04D641565CF7219E61305107D88447B1CE750A85888A3DF438948A560383403ED61E005086AB68A249E8496092421AA3C9F3400F0A2C5F8AE0D78F37D142B18F1821550ACD541CC2D834D21071D46667822514F2525D4A42391EB11331113E87ADAB56F082F647C1168F6FC09D9541BBA47E230DEF5E0C59F5C9097331CF2332123323D24634B4086900201036D503B4802DC1A00102C0E2BF6A48BE2DDEF8BB4177DBFE9FDC7F1FB745D7B51E96542285097BEE91D5670AC69043A0CF925B152BF8AE51B2601BDA62497E09EE1112E821C8A2E393653FB74A6B5954F2053906457B10403E6109BDE35B9402A6299E3E2BCC562542E153319C6954B0BF0AF1F566FD505CFC8B36322AA6D00872C9B54049CCAA205C8933E2FD37A08731323388B4E95D79B472F6EEA16126CC7A6D58A93161726B806BA6C1B19012265662CAA7F2EB249098030978720D031CA0066620C6D7DB6ACAAD1901998581C03DBC8BA0A5499045B2945E48063F0006165B7005B91B7B478E40DA3AE7A372C5397F723B998BF3A5C3FF009167B194C860E167349ACA22B594C0CC768A409939111164F02020323EA4EEC0FB71D3BE51C866C3ADBB867012D82224246DB0E49082FE34BED2884A0CE1901F83096F8080F4CAFBA3D36BDB5F751936E3C053432798C767A94F212249CC52AC570A181100D15E787315E4A398934434C889925EA736DE5F71231F7610FE7C0B611473D1BC8418CF1D4A0A26267988FF00F3FBFAF5A132F3E75D234793065630656998766FB98C51AAD11F0DE0B0BADC4837668E1E80C7C3CF526655678BB91C8FA564546B279A6B3448362EB820753AB45681D1982C722B62AAD0AA5E1F8E0AAF5E60860972201DE27B0CC48C4733332511D8B92E7D3A393AB16ABC51002C7D49835B2D25B7A9DB91229E4AADAA390A04B2082E166E45B0028FC90631004C960B55A71B52A158B235C3F1320088860408175E5645CC948FDC7211CFF5FF00CE54F675BE012B1C9E4326055807CAB0B04B8812198FC193DFC3DBA91703C941F3F7D78E7D558BE439B62E5C9E6F702C4907F7B0791CDFFB73D197171302023BA3297CAEE0059AAA502FEFE0915F22FA7DF4AE3309A6D481C252AC0C11819B650DB16CFAAA1304CBF64CEE586423851131A45E2E03981E63D136E9D8B7774D5D2999164259D644A4840A40B8964F3C48C444CCC1CC8F5E64BEA3E9921F787EDFF4E9A68E57504DCB812C53978C359B6AB1530B30B0AAA8258F69FF00AC825805110533025E9C5C67B97D93D5F5BF6D724853795D2ABE18BB7E4260F10462882F148F71821E0BB4112C792FA8F64C3C8203C8AC0917651AC8B07CD571CDF3600E40E0F4F5F3B4C991A28B22205136941C593C1205F07F7AE3FE3AAA3D51A76DC166B20E96AEC654ECB1A2D195082CE9E465B270C8E3F1AE5604C648A57647C7C91A186494D99AC75350F6B77555DF5E9372AB5D863807230BBB15E6A0BAB444C39A3D5D4A5A0C4CDD293B4275419CDA96E06C2D5D4983CF6728BD4CACDD3EF6E22C215D12015C2ABBA3E07EE1EC54E4618E6F69358A570432502CAF5D1DA3C30BB87434F647099527EA2C6E4B178CCD0F50C7D19B94285AC5B816310D1B2BC856B4D86CF00744C242608AC044DC59DFE072164A0563018773008A02B5F375B2870413CD0F1D0F8FA6A2D4B56C7C3903BE3E44C22768C90E56491119C141C6C326FE01E108EDE6AC8E8EBEC2E2B4EE3B236ED63C5415E9CBB237439154D8AE20D0B8E764AAF0F1829390709F2BEE71042325E8D2A6A6C0DF59D80FDB320C4B8EBB148B75AB89F79124458B02730424993EFE564F93C8B5ADB113052D35FC3E951A188C458476B95E8D7A3998CACDFB754CAA8A43205150EF2941E72330A25050B504B252B5CB1A0D2C91D2B4ACD62A2F4052844A8FC2A6570B530C98ED628DA42C8065A0A159F88CC27CF6C1AB18F240432B1B1E59321A49655DB3491C2AD1A3464B153B06D400B07B1B77914159803C759CF58C35C1D4F52C3120906167E66224851424A20C868C381440242860031E0837F05E8655AC6725075A80F25015821967A08948F24C55831ED3313C47E33D3A4C0C0C8CC8F51AEFE146F5965A45ED4642E99321AF6DAEACB3299290AD235CC41503225E3832E1846533C94C40F4A8F1B4FD89BA621B6AEE0228480692C5FBEB7575E07CF03E2394E3D0DD2286A1602700F6F03BD78F03E91E4F03E1F5A46E49366DDDB4D5C560EC66027714A42EB576417899D25849937192FF008E4CC6004583D59B87566ED55DBA815F1FF2C16256B2D5D9760AB11AE46EC8AA0AAB4EC2C18CF8D61A1DBB2CD8B031310FB392C5A192A5D227BA1606772FF9E2C7793F18B7B0D9838518A87B48C94C2D900D221E913ACCBCC69BAADB262AA40CB8175AAC4D87082590D9AC6B8FEFC70C250CB5A2D8982641890CC327CA3564C0819C068A001230A8AC433228474A553C858AEC9B2DC320D01C94E4FD29C0B1755F48E41E36ED3F5737D560FEA1BB456AFE3F4DEE36258572C69CB1FB765F8AA687C63ED5BF934B2112AAEB50D1AD932B6A39173085B613D7986B3C4C8EE26F56A2D158CC4694D3D60F1D9114D1A7549098B36DC44A549B8143C14912880E3CFF001AAA40BC8FB11F4036DFAA36FEE6E0E2729A6536EB331398A2EAB754F41B4829E4172E49CFF8E27055AD574B06BAA246421E51211D862302B6270F97B4BC2E769291AA303528E32DDD5C4AADBDB56A2142FF0098A95B094E584355CC8C10320A420E2620BDE8FD7619F4FC6C2CD8926FE9D24CF0C6B22EE6C6C931C8AC51835AC332BC4E180F2A2A995896BF0F23C9CB8B331F0A64C7CB64AF6EEC9C51ED30994EFDCC559E489CAD6C2B1D9A7526B4686ECEFEB6DB6D5F0D4162B13D623394B6D413224BA8926A5508AB129FB3290B0C101FCC1C613F95B2ECA6CEEA6DEAD8C66732362CD7CC18348161E36458ACB71C191AB883630A0261607CF522E07F129EC89C9EC0E92D3352E66B34E9B675924C03BD698E24880F681863CCB8899FE85511D8A7A173FD14D9F65779C8C6126BF31554560ABAC59D55E16C0C0FC84CC79220C88F9811FE2119E679298F561D5F331F2CA9C5C64C628EAC7DB26CF6960097B0492373050A2FEE05F469F4C683389A5C7CFCE9F2956096488BFB608903474095514A0352962E4927906EEA4F557B55D5D47561466AAE5F2F8AB95ECD44A2A45DA48AC4FEC31695E0B555077533C1D71779D706512E5107F1CCCFF6E7EC3B4B64598EB791C267EA1D570D90B56B55E5119267E095CF9558D6857F080A47855886044CB0E07B35A47663BADAFF0048EDFE3E752E7748BEC6980C8AF177AFD42AE669B4C26079A31ED572FAE4E532227CB073FF0035ACBBAE3D68696DF8DA97206FE9ABB55B558B1358296BAED19FC6244804A2019DB99213088129E27FAF5C3FABE43628C5323C31B0DA5422A2C80100956D97CF923783C82D64DF4F63F4CE17E704F2C40CCC481335FBC0165F00B1541E40602CF34459057D94D194F4AE88B3800EC355144935E1EC2B2442B4F411B064C99B1333CCB24CC64C2239E3AC94C6FC2E92D3195A58DD43AA12C43B038BB2CC4DD01B3278DCD3E863F1CDB36800010C0C8E3E948D522379C5C628BE2A651E56BBDA9B7469EA2C5782B4C145C984C181F12A59C0C917D476E2623AC4440C4C73C768E066376EAE3AE32E63172592B746B63EA662BD1AF66C0262ED7B5798A10AE868790A650938EE120B78248A79ED2159C9CA1818D3B85797680234500FB85C8550C0F840C3BC837B4B0041A3D30F51FA8B17D18A7578F15F2A5C246831E38FDBA3993294884CC5D76C2ACAA67DA247A3DA86C536BA93505F9CD2ADAC795E41E44DF121B3159AC93124901F7633E5DA5AD727585615851126F6F30644D7EE66977976C328A738EE108B784C9802BC312B6A1A710D81635807350BFC75265728932648FDCB61AF36ADA066662B655ABE21C555F79D8FA80B52D46D10AEA7573ACF7AC8C05E23E0878CCAC896682E556C9D4B00BCD62A46BC0809E42BD2A16E95FF00209132F2629318C5111C835C87AD66A6BC0092E359108EFF002F9D9263C86C88000CEAE1A586D90B16A3EE331B6B1BB6F8FA2AA89C87336665CB2644F247EECF2BC92C84D16791CBB3B2EE001762CEC2A97700B6A0027A594C8A8109640598524456EAB89CCB80C488985D8AB9D75C10B8DA223E21284C2A664B98291EB3466001B6555B1794BD5D2E8055D63BA0D9124A5A528542A49484318750567025DAB9908CAC80C87A9153828AA8EC9B9400D590A05F6D9A0C00FB91F1447C58E8A55401EF2715C6EF9EDE0571F1C57DC7FBAD7045571EE756656B495891A45E249B2E442D95CE43FC639738CA15005F262C9B667A8CC98CB45637F51B6DC12AA43E64E6021C38FB001F1D600C832EB327DA7C2D8005A256964483648C87AB6F4AB64AD59AF37EE6348DE4E627E1815DB696A7E2498583F8F20B55614434CE5AC1969F2B29794119A3597D6C3B94EB652445C159D5E31E4B879D8474FE072695A24A9A042713E6051C9B1B032E90F0D47DC571FA31C88C37025A34162831161550D5D9237000D02029E98FBE4A858D0A0005B10A5CA8A26EAAAAF90013B6F69F1B8F473B5862BBACEA65B2170EAB6535EBC4CD8F1F46298BA8BE18EEB2A121B91D7C810024A0899038C9BCFA8339A7F36BD718E22B940EAA2A669C8AFF00199598999554BC6885ACCD10885D675BFE5249857F94C863C089DE7652AE2EB0B5F8A5929636C8BBDBAE17B926051B1092602664A05A432EF139EA290910382957AD3BA188CF53CA61ED796E51CAD4B1135DB96F3121192A95A81AE49EA5CC253E7858C35250D92832022198999D0F577D37518725E1B8D54C32C52FBA1E7899A2F74461049B9900B8DD88A90034C18A89CF4E7A8737D3DA963EA7038DD1EE8992532959A07D8258F6927C8A61DDC3856A22C755D5B85BCD95D736A960BE45A7D2111B36D491640B45722210C3544C8264E39E20BFD7FB2E27D485D8FF0075181D1367294F3CA3C0DB879CF72974D6657996386C5562F989018262C960A97CCACA4971D80BD44DD51A423059ABFA52CDFB58ABB4EE383159AA8B492F238C630E51250C06D66084843173304233366A7904C260535A2F11AD599AB08CBE5B2FA87E2BDEAA8ED33474FD5B6D5476F1A6D63B2959957B13062B9B06CB0061E56604856B171F71B171F2E13ED3294D8B2C54CEAF2248018E68DB66C657522C3532F000BDDD6A5D1B57CBCF3166E9E24C832C425231218E6ECD8A4A883DE8E6254B065112B935BDA85756CDA6F767576FFE3EE557454ADB785665F42BB31E6AB974966529B972CDB73399398960AC6BA6172C604936648E632EA4C250D3FB869C1E99D534D198B766A15FC0626C8D96D6A56DC2A0C858ACB2685518692B9274D6F32FCA4A0792FC647BA3F4AE22CD40C75FAFA8AAC76E3E56AAD4354CB88BB4AE4AE9695C29C619655D686D1F90F81ACC5D9B056EBBE24904F660367B45E0ABB0748E2EA5075CB2172CDD52F9BD7ADC749F9366D9C13885600029039E0004446163CC7A89D4605D3E3791A6A9242160C6450C05D7EA4AC4B1A0058ED2CEC45ED5F367C88F38E2A4D9B0CD86492517302479932000B32C1133B451962107BAD1C966BDBE2C2EF4451B78D5D7AD6EEB2E380418C3ED311DE20BFD4F303CC1733C447DC44CC48C444AEF75F1990F8BA47522ACDEA38D0A078AC8E4830E37B1D52CBEDA994AB59C8300954721721AF9C7D496458BD156E4294F5D7B3D11D8DAECC7D9AA86365962C3060439FCA67E8648A7EA600607FB99998E22399E62266F694C0DAD7DB61BABB4D588E6EEE6EDA6A8D278080998956BBB189B5676D324A099882B588DC9AFA5B28829993EB59A0890B0696047E269906BB3E369B97967106A524788994634710C8C54413491B2D18BF33ED8940DAFEDFB851D1C06038F58E9B2EA5E9CD571E052658625CC0490CCE6192399D7B8596F6524039DD64107900D6146634EFEE538EBFAC72356D56C73AE5865765FA18FF1994247CE5606B20ECA818C6BCD8B3884C37C4120C35B17FA6F2F81D64B7E27199793AB4BE29B2AD5C7851B7D66FDD420DD0A474626D87369566BCB2B1D69816583649A01B1F6BFA83477BA8C4E3B0BA7B0CBCCEEF2E99865F6C28D355BD55A9E2B54F35FD41A231A58F18D46B024145BC1615993D4D8BA09B1719878C1D27E68A5166F49EA2D1C5FB764F1573453688AEA962320BB18DCE02C58C5A5B7A85F426D5718AEF7356612C061014888B54982AC6A3E9ED5743071352D3737164858471CEF8E65C7B1687F2D3054899372864EE201DC4DB48C7ACD6ACA8BB6C92A05521600102D46E29C2D0E09A26E85B74842D37A0C18DF9B67242F26B2646DD5A423D60E400EA4945733AAE1187C318959CBDB62389181291E962384AD7D49B36401AC35CFE776F6354FFB630990427082E3CE4D9199427EA7E83888221EA17DCD46CD1980BE2962000B1543DF0450FB807817CF9F04929A224A1C50217FD3FBD5703C1200BA342FA67AC6532754A321A731B4C9AA042AC562BF62959B500CA8CBAE4BAC10B5E46CAAC75B1850412AB07573A16B589E57D5D954D8412934AE3175DD9028B392B5482CBBFEDAEB21A2D60D91AC6CB09877860CD44C159B6145E32353A8BAB8A9B7C2C521F963F3181316609D356C7CAA7D89361630B5B162B4FC6F8E28036F9392932B8C0E926B041A196A6EF8D0889AF52071BE0913ED30E96BCD256049232762C397601EB64569EC992AF88DDD11A3CB2AEA58A45DD65AD2808D5594721942EF05B6DFD2DDEC8282037B8A9DC2A3201F3B4020770520DA0B9002400051E4DAFEB06E5580ECAFED6878AE02DD6A4B465C7E3DA74AD7598DE5A97A59162190B9816C294422D6CCAA27CA0EB29AB9C5DDA145ABC7B94D077C784B59FE239087930E589F0A27C32AEF61053024DF2F516097E46DE102A0E0717C64A26C309B4ACAD116D0B6246ECF002BB0F108B4A08A92CF157AEE21517F19319057634CB595D4362FE404326A7531AB4B18FB2DC612FE335B71F4C58C98BAC0635A29388389AEC88F1C4303D716C7CF2D1AB3A396923608623335068C7B62342196494B9456DEEFDA085776B093EFA95AD8DB763B70187045AFF94AB1F1B97751AB041BE9BBDF4D25A7337A54B3D9EC868FD2B1A6B1FF00397A83F705D5A18FE10366D54C83205A6EC55B7488D4F091CD4B96018952CA6D55B30C34DD1C7EAE4D2CA69ECCADABB31029BF85C8900B464E444C2C552E8E501771E67B0F1CCCF051F4A9D3FB9D1BD7ABB5AE176FF68B25EE3E96DF64D35F4361739E5C1ECE46400D9DF7277732D79B4A85AD3955C35A8682D08EB8B8D465FBDE4328D55AA982532BCF63350EAAC06E6EE5E9C3C863948C5EA1C84C56D3963E6696AD951C8E4D56BF607298C5370AF8AAC2C7929C6A7D4457B0A9399332D2FE9CF44EBBA77A4E3D4355CDF6B365659A0C131BEDC3C57A1ED4D2B1DFEF4ECCB334160638B475595A4A25FE1F7A9A7D3B50870F377BE24AFF00A7F977DB2634880BEE8D8904A3282196C10496522D835BDEDBEDCE52A64D77F299DBB7644C0D4561962D07511828E209A424631313324B898E7999FF00917A99CBD45430145405605F917288057D4783E084424446678338EB0103DB9129229111298AC0C6EEBEB1140AA1AA119111165682092EB051310525131043C7333DA63EC7EE22261E4DB3CB647319455AC85A71B4883B9B8E4FA00FFE81331D0639EC5253D8B9EDD604663AC26568D94CFF0098CC75289402AB06DF407169C28B1C9BB23C0B3C680975ED3E5454C269B227741FAD905C95B5144FBA4B3117400B5A362AA8CEAD3E897E41590BADEEE391EA3131C2839E66079E2799FECA788932E0BEA22466C1BDB9984EE76D52E1AB5446E0693C819B087A063B4CE5AB6ABCBB0A79FA0AD86C25FB265F502A591CF1025C56EE1AF0CDA422B9F93AC014144C48C7F5133C73245333CCCCCC447698E663989F4FC6BDDD60D89F6BDEE2B7F18FF8D92D19B5F97DB9DBD2238173B76B7B6B3B6F70B6F1D31310DB9A5B4DE5F506A8B55FE8869201E5042B98977E9AD2DB52F526938AA09439B04B2951C478D8EEB34EE47000486276FB0DBC915CC06BFAA2E9FE9ED5321DE89C49A252D56F91909ECC2147C932C8A5BCD283678E39C9F6A3AC74353F73BA2739B8BBA5AF761F4506A9CD649FBB9B5B5AD3F586D9E45F4B2ADD25AA71756848646CD1C26AA6609D9BA78C62B27634F064ABE2DCABEDACC1EB3348EE67EA55AE1F81A03EE13F4D4FD437639966B0E1B35AD9480CEDD410AD685E40B4869BC7DEDB9D6C4A8816BDB922754C9149DFB972C0BE19CF0FE94FB09EEEF5A6A4DDFDF8F6BDB3FB7DBE35B67343AB13B95B5FBA184A9A834DEE6E94DC6758C5E4F40D1C5E446BD5C8E66FE231596CA8554E5315912A788B0BC73ADDDB35711927B37330FF00A4E6A5D668C5EF7FB7FF007ADFA7E6E6158EBAB346E9A95EA9D0BA7F26D3515CB78EA9B814AC6BAAF8F1B326D0C7A34D545D2AF009A4AB5D7A969F18F16545334F146F1CD2C859255FD3653B5B61701D0F2FCC52C656807470CEC3ACB1BFCDF201A3C803E393C558FB73F009E3AEB5B4BFB67F6B1A8712BC9EEDFB5ADCCDA0D7EE69C6A1D1FA3370B23B97A482E7006CC969BD4F88CB6558CC4DE630FE352CC53D3796ADE1322D3D5F1EDC7DFC90F5CC4D0F6D3B3CCA5559B15FAEF9E96DB56244F0581D61AB3506DEEA0C684F3DEB5FD3398DD8D0D76AB141E25F9674CE396CEB22B5F0B9811EA1FF00E8CF4C392E7D35A412CC58918DA680492A4B73183C9249B00F06F9F1E5BF91FDFCA8FF00C79E011FBFF3D66C7D35646E659B624FC8175B5A08246395122C3020864482654C81208EB025D045A2D08EB292D4FA8B258FC9A6106125237ECC9B3CB332DA376BAEBCC2C1AB487411E6256A02129ECB20981EA3D0F5F3B232595C312C37AF0DC8E2686B83C7C9FE7A6209F6CF2790B7CFD9E3AFE2CD7DACFDFAD8C9645D5F2742B0828C5B4A8BFCACF2FC851B3F98BC0E068120225EC0105F5105F101025D88A57D8D0D83A7B3FB4DA3AB964978FDF9D1DB9FA9373320391B239ECC61F486B0C1E9EADB794B322517309A0F3B5724E6EADA3873A59DD4CB01C1E5750BF4A3EF69EB63D0F5A33F073171A7F51C6D363C13345A519A269618E468E6531059A32EA4A4AA1D809169C06600F71B923C462B8EC8071F63E47F6342FAE763446E2EB8DF5DC1D37EDBB2DA9721A0B67B5DEE3E7F3FAA749ED6455D21572D91C9649F8B4FCC29AF92F974307A731384D2BA770F706CE1F0D82C2D15D5A239065FC85D3DF6EFB65A4B15EE0FDE4683A94DFF00B0EDD16A11D2F0EB04EBB5474BEEC54D278C87DA3199B33386CADB45A330863D842CEE13DA0C7A1EB41EB60369B9FB86EDB0F6DF35FA2CDC5F8EEEEE3E79F3D4868648D5702891FE2E31C1238690291C7C15241FB8241E0F524EAE0B1E9B248059C289667D7BFF00443FD48F031C7F73CC7DC4F3F7CF11C2DB498FC4B210A92EBDC23A91171C40C1C44F490998E7FB899E263EA627D0F43D0432092289246D5344922F8175E3C747CC1003250AED5F1FDABFF5C753036E5C766FA09B03FC688EB031D63FA89FBE2799FB29FF007F5F5C71E919FACC642E691F6E1ECCF6DF08F656D2FB859CD6FB9DABAB4CF67E6356E1B48EDD2F0F6ECB63A81A7155B70B52D3A292514AAAD942E58455C4C87A1EAC3F86AAA75CD558A82C9A549B1A85AEF6883ED3E5778243556E048360F503F892CC341C150CC15B397700480D5012370BA344922EE8935E4F5D58FE8BBB11B73B01FA7C6C75BDBBC4B2A64B75F4969FDDDD7D97C83556F25A8B576AAC4507DAF96F522A846271B4D75B0F85C6AD42BA58EAA0666FC9BEF64ADD88EB2DA6DB2DD0C3851DC5D03A3F5CE35192B38F9C56AED3786D4D8C7D1B2442756CD1CE52C821CA0129854107608FAED31E87A1E8EB8FC41111C1311248E09263624923C92793FBF3E7A06A7318BE7B54F3F73E4FFBFCFDFAAD6DD6FD137F4C6D5FAC6DE7EF7B5BD3588B77D0963E9690D4FAEF456041926E992A9A734AEA8C4E0B1F05CFE41431F5953C0FE11C7A1E87A1EA4635531A12AA49504920124FDC922C9E07F1D2940A1C0F3FFD5EBFFFD9),
 (114,'biesinger','lars','Lars B.',0,NULL),
 (115,'schmidt','markus','Markus Schmidt',0,NULL),
 (116,'benzler','matthias','Matze vom Berg',0,0xFFD8FFE000104A46494600010101004800480000FFDB004300281C1E231E19282321232D2B28303C64413C37373C7B585D4964918099968F808C8AA0B4E6C3A0AADAAD8A8CC8FFCBDAEEF5FFFFFF9BC1FFFFFFFAFFE6FDFFF8FFDB0043012B2D2D3C353C76414176F8A58CA5F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFC20011080064006403012200021101031101FFC400190000030101010000000000000000000000000102030405FFC40017010101010100000000000000000000000001000203FFDA000C03010002100310000001CEE5E7A61149E68BB6C4B9A0684052C44750E0D5F561D2E554A239BA6ABCFCFD5E65E39D2250C8E98BE72EEACAA032D0744A276D39F67279FE8F1B73816B6C2E0CE9B736ADAA8C0BB567D159E99CCE9C84A83254B2C4ED889D178565D33735B639B66E6AD804C02B93553400C014E842DA76800D420D736C0A40418534034C25816FFFC400221000020202020202030000000000000000000102111031032012213041132250FFDA00080101000105025896FE247D3D8A2D8F8DA55DD6A5A871D8A3478AB1C6C9711E2D0FAC88378BCDE39216574BFDEC659E4BAB8A64953C7DC5FA290B47A669AC726C9688EECF02C4C68459F9093B64B62632DE20D178931BEC991290D0B76377F05965FF003BFFC4001811000301010000000000000000000000000111301020FFDA0008010301013F013D9C58E03B5611FFC4001811000203000000000000000000000000000120113040FFDA0008010201013F0134CA871B3FFFC4001D100001040203000000000000000000000011102130400001316061FFDA0008010100063F02A2D86274215A73A879A1E760FFC400201001010100020202030100000000000000010011213110204161305171C1FFDA0008010100013F211CFE1F6DB7C77BF696A7C752B82A1E3A3C78CB2CF405CFBD2239DC0E007C07FAB8B8ECF60863E9F1969C02EAA5B336D89DDD0251D9E9A38390B7BD9483B6126DB0C44E36A1BE3A2D5DDF23B961755D8870F082601F70700EF83663F7F0E74DF34402EC1EBC1FD49671DC632C8A36A3E1EF864DD348CB86576276F325230EAC72D1F196CF8DCC97197C991249E1BC4E0F60781C63F78FBDF665C956E7D49F60F563D8FCA7731E9FFFDA000C0301000200030000001033BC793FE3EC532C545BFE39CD4A4D38B96F149D00CAD0B3248F379F197B93EF2287D8A003FFC4001A110003010101010000000000000000000000011110202141FFDA0008010301013F102C991C3D28FE8CA64685F19062CA355158C4CA273109CD16BE1BA62CFFC4001B11000203010101000000000000000000000001101131202130FFDA0008010201013F100B3A7A5C13E3438A178CB93450D454E950970BEBFFC4001F1001000202030101010100000000000000010011213141516110812071FFDA0008010100013F10B012AD62B5E63E30FB6CB4F64A328EE0C9EA2D640CF32A82AFA94F5114B1ABA8317FA3925E3C08999A92D753D4AC7C149EE58CA82AA5B54E66BA1C584F44004C4B60C0F0E628165CDB9835B87A44C847244C449543C4AC92EF10A0A0358858D33A25E1211A19A63DAC3C8198BD21FE913E737296FA62C2EA34084726A5B59D6E65008D50253BC4AF093DE2B254DFD216754EE545156350695E210103170A4B526EB3550304A978619223A622653187923BCF93F4546D581BC6FE55539C4141388952628D55C61443A180785405A82377F9C0C0ABB623E97988C569E223B79D5CB8955D845AD1372C0BD4870A4B5EE3B6C71EA777E20D0C40EE39993899F87281732E988ADCD4CA5B258D8ACC071ECA62A937E97132E0F8F10D45F22B22666621981670C4AAA7EC4D6FF087A618A6580326A11E21A8BDC734FB72E98AAE673B1EA623A21AF854C4B2257F0333506DB8244A086BE307112E27F13A22864CCAA21A9FFFD9),
 (117,'ljubicic','marko','Richard',0,0xFFD8FFE000104A46494600010101004800480000FFDB004300281C1E231E19282321232D2B28303C64413C37373C7B585D4964918099968F808C8AA0B4E6C3A0AADAAD8A8CC8FFCBDAEEF5FFFFFF9BC1FFFFFFFAFFE6FDFFF8FFDB0043012B2D2D3C353C76414176F8A58CA5F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFC20011080064006403012200021101031101FFC400190000030101010000000000000000000000000203010405FFC40017010101010100000000000000000000000001000203FFDA000C03010002100310000001E3B45CBBCE6595D5712B37144AC970DC50C210079E9BDE31B52257C8656F377CA79B195DA8109B8D62DD7C3D2566E561E8C994D84E961593A50197736C1793C93BF305E9CAF3D4AB4282564EB4C166C3589D1073E824DF1AD74D98C9A7ACF4C31C50D1DE37473D859BA39370A7102D65D6CBC7A860686FB7842C2A06800A00AD02B7A40B00CEFF00FFC400221000020200060301010000000000000000000102110310122021313032414222FFDA000801010001050220ACC344E24BBCE5BA32D2D62BB962391DE5F10FC38487A6ECE18D5782314A3F1C4FE92E44ED4E3BB0FD9F2EF34924B822F99FB6C8BA6A439511C4B3551A965FA964F67E5B2F94ECE921FB4BBD9C0A44B0F829894991CA5BB0FDECFE4D284A8C4E1A74779AC989D3522D6564DDB2C964BB7B2CD4CD4F67E4846978BE13F51F863EACFFC400191101000301010000000000000000000000010010201130FFDA0008010301013F01A28F661B33D8C1A724EF87FFC4001811010003010000000000000000000000000110203040FFDA0008010201013F01E2363060AB1FFFC4001D100001050003010000000000000000000001001011213031404150FFDA0008010100063F0262A7D7184844F438CEC2A5CD96986AEA4EA1EF397AC47C49D4EBFFC40020100002020300030003000000000000000000011131102141205161307181FFDA0008010100013F21371104BE8A6B41C3A3A5926782C3004A25F0F9C852D23A444A4141742C3F25BB20D8A48D50FA13238531D0FC10BCD123D6A891096C103D1588523D126D06B5E2A9AC9A2B9D1EC5F28E9035425151044884773B6274E11C2C140826C9284C9D917993A5BC172133B3592C742D030BABF8246113984B62AA20E86FD119A12564C8BA9C2785A1B166618DDD2924A6228351D1EC4A5298CEC6842218924142C3F83850626E7DE1642C31E64240D821E2D71B4D8DCB1D792CAAFE86A19A45F808EE45D9FFDA000C030100020003000000103EECF722433DAD7755142ABFC9A3F7303A13EBB74DE31884517F787215ECF0389CF1C88103FFC4001A110002030101000000000000000000000000011011212031FFDA0008010301013F10360D41F49EEF0D455C3C8D458C5686798709C1B4D8AE171E841F9CA8FFC4001B11010002030101000000000000000000000100111020213141FFDA0008010201013F1067C8C4868B17B3AC346532D361510C0E953B0725560EB9AC7897B7C63FFFC400201001000202030101010101000000000000010011213141516110819171B1FFDA0008010100013F108C8B3E4A19ADA57E4AAF027EF12BA906EE0FE71C0BC89419BE66A7F21A95948C69F31F2EAB311053BB5280C137477125B6AE7E35512FF846A6F6772C7FD9C88E119A30D7C271F2D516DF52AE8439A9A4070A946A8FFD8ACB2B4F711519A9997E90D7C205A032C704ADAA45A87C086F0362F9F2205979E364BB27D831392F62E1EFBBA2208444E186487C0958AC33184E995E1018298A5E0BC452D126C5B9861FC1328B063B2AB3B9B24708F6108008BAF6A237438476574EA23514C6C1D10A97B199237D2460A282BD7116AFDC34E1B84EA59EB5DFF608D6EA747809B8F44F03B96845A2636632F4E48E87A8E07C9CC0B63B2BE0445114701187936692D744A8B9785B1BCC415B1322752C238C43364A0816CFE952E824D06FF90D5C591D80EDF1A35421BC512AB63B261477C731860C19FF00104CFB396796C69B9E0670A606E0906A1C12A5E98055ACA14998880652581D3348C1A9E93908255C798F105594B9D9F0DB68BFF0970F6C7F15F4AE7E5A59EC278C5E9D46E93151DCD3E3F6B135F8E4894DF1012BC93FFFD9),
 (118,'wannhoff','jens','Rio',0,0xFFD8FFE000104A46494600010101004800480000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E0000010403010101000000000000000000080006070904050A0B0203FFC40034100002020201020503030206020300000001020304050611071200081321221415310923413251162433426171179172B1F0FFC4001E0100020202030101000000000000000000060704050208000309010AFFC4003911000202010303030203050509000000000102031104051221000631132241075114326123427191F008151662A1243443525381B1D1F1FFDA000C03010002110311003F0095AF58DFF1AAC76AE93E6ACD68FF00D4C8EA8F8DDDB1C814F264E70762C64630A477833E3E19178F75524F8706BFE62A7C7D84A98EEA16531B6A3600E1F6895E774E0706118BDAA099EB02A3B3B6B470BA11F02A42105C5AD56B4CC1E2701C7F4B02030238E0A9E79520FB8E0820FF00C0F02EF50B56EA2E53377A3C66CBA5EC7829668EB55D73A91D34B3B0609248E1F4A78A8EED8EBD664AC5ECC53A48D6F1B624AD6BBE24458D631E3410FF00675D29E4972FB2B5AD7341C98C29AC6CC22256354A097476E45EC0FE3900027A7E60F7B365C8B8DADFF74AC6C8C51F3D6758E420C63D357871F2844ED669E7F4A1F690D229A1D4CF83F32197454FBAE13079C8982AFD561EDD8C45964FC995E3B1F78AB62465E4F6C46847C8F884040125E3FAF7D3CB91B9B6B97C25911BB2C392C7774523A292A91DCC64F90A8BEA1016392DCB5141E0C8D18E48ADDB1A665EAD76C8D8E8866295556612EC3D01EA74392A01D082F2BEAFB6B620A0504486AD6C258708502865652D3C742BA376FA8194CD5FBF9ED873FA060EAA19296671D471991BF94694A1C658BD8A956BDEC7C3FB5F56F0C751A491648268CC24FABD10F67FD64EDDCCC7826EE1D2F57D39A5024975AC62258A1565DCE2586A79980F0BEA92CC0292BBBA9F93176EE5AA6DC4F4E69832C2FA46A3879F03BFB296F1A7C98A220B292B2AC6C05DAF1D4E7B36F189CC436B15A8E230FBB5DC9C8D7B319FC842B92C0416E48EBD61528C8E8AF7A3A14A1828C2D4E58618D6B44D61DEE493068E74FE835186FD8CCC742A6167BD399AC8C263EAE2DA599BBBBE4FF250A3BF219955A6769027C0B10012616B3D3FA6F3C1471D88AD4EB56091AC14E14544500048D23882A2AA0E07680107B9E08E492875AE99470411F3563E1010500563CF0580627F0DCFB32F20F007B027C3721C46228C9EA581EA0019626228DAC6C48551C902CB0068B1AE8CFB6BB734BC18967D46159A4753425646A06AC02576F048E54724127CD902A0D2F78D6F8BDA6F5037CC35CAE8EC92D2D83354C12584810B416883C3A2B963F22513924850B2D68BE7DFCDBF43244FBB6529F58F5AADDDF51ADEE7EAAE61A04321231BB5D75190AF63D95524C84794ACAA3DEA963C782AF2DA1596ACF1C5120EE0C0FA71A2AB72391F0058FE381EC7924FFD28157A83D32C953F52735BD68C33174280121B9041E5071C123924F1FC9E0F00651C59185389F067970A607F3E33340CC6C11B9A320B0FF2B1652053291D49D5FB6742D4A290498189247B6ABD35F516E8028EB4E9F7B53C1F8F23AB28F2FF00FAB6F947EB4430E1B66DD2A745BA8D5C47167344EA65BAF84929DA60C3BB1B9EB2D061F358E94A3357BB5E78DC21536AB5491951ACA70BB0E0761A50E470797C66628588D26AF771976B5EAD34527F44914D5E496392361CB23AB32B7E413F93C27F9AFF002D75B77C264737AFE3D2B6D98086CE4AB848508BD5E24736A8DA42A7EA2BC8A1D65AEFDC8DCFC07EE13E23EF261B16C52D4B75FA37D6AEAB7972EA9EAB20FBF6A7A76DD93B1A8DE4F58AAE5A2D3B3925FC008A5953D3C963D7192491170AF27A3347C9AE0F7D6A783083A998F3614DA0CC6068D878172BC27DBCF05D719C59A2413650BDCBD8634F9CB69F29F41DB88A66B31120155DE01DCA79A2E54FC127AEFCB2B80C2672BB54CB63A9646B3860D0DCAB1588CABFBB82922B0F97FBCA905FF0E0A823C02FD74FD36BCAE75DE859ABB274FF00135A69C3B7AD4AB4312AC84BB878E3080D63EA3024D392AA7683DF14849E69DB48FD483F512E8BC5041B861FA47E6A35CA8144B38F5FA4FD459A0411A9759E94197D6AEDC2AACC41C3E3609646E03575F9034FA61FAEAF956CCCD570DD7BD5FAA7E58F6362B15A6EA2EA9672BA5A4FC856306F7A7FDF706958311FBD956C4B76FC8C64F216F60EE2ED6D6D1BD68D6291C00ED185727C70FE8933151E499A055AF200E82DB1356D3583A89A3DA6D5A32596C57BB72DAA9AFBB061F617D534F997F293D2DF2D7D5DCEF47F43D5F1F0EBFAC50C1764B6E9A642CDEBD7F1152E5FC84B3DEFA99D5ADD895A410894C50AF11C291C416345E08AF38BD44D23ABFD7FDC7A8BD38D9F03BC691B2C182B7AEED5AE642BE5B0998A31E16957FA8C76469C92D6B50A4F14D03B44E424D14B1300E8CA178F39FBC75644EEDEE64C7C92F047AF6AB1C2CA5B6B471E74A8846DDABCAA29E140F3400F1B21A26F7D1F4B7941695F4FC37919B925DA08998925AC9BF24FFF0071762D8E1C0D06B812695FD895AD0ACD2C50FAB0A4F6FB247484256F5907AB61D2A452CB0B5A912B89584353EC1A9D1969C191BD570799CF6C33E1F07471D5C59C9E725AB5A3C9DBB751B49FF0D4B3D5C4D6964B19DB85AE63F14B0BB5AB25E586378FFAC15735D4FC058C2EB1D4CDBBA5B6C64A85E4D87568B007232D3A115C4FB36420CFE0B69C6E470990B530BD7E87DB69DBB12255A92597AB0BA49AEE9AE837753C9E5BAA5D46DD24EA7EF363198DD5F1FB1C987A1814A9AF620C2B8BD675DD6F18EF8EC5BE4B381B37B059A4949F61CE1C6BFD1D4C7E231B521F4A70B031F4AC0025601D57D49E8B6F67DAA402C576EC51607B89DAA40009B1AD33CF36564DA0F692AA808BA00904800A9B3C5015EEE49154667DCB276311AAB606B5ABD265F370D2AF2C362DC761A8DDCBCB1D48A856B9F4E92C92D9B93491ACD69A699AA54B32FAACF1FB9B3D2DD5B1FA9E9DAF6A74A18E278B11DB7563555592E5A30CD6E5255417677450AFC29EC5427BB924D57F983DBAC68D89E96E66E4ACF25EEADE09F3E212ACB3BFDAF2D712BC4C57BCD6C78A71C55C23426430358705E49164B3CE89ED636C82B64446F27AD5FD6EF93D8451BF676067202F6FCC1F8FF4AA8E47E7C2C756C99351CC6364C6C42C495FF0D1C5BF1F2CD47E3E49FB74DBECBD3923459480195C33BD81B58000004FFCBB88038E49FF00B943A7E1F1D8C883CB1AA4864EE66501598F771C161C33B060DF81C01C8E073CF89A71D92A28C8890C2E385253E65405FC153EDDA0FF003C7079E4923F019DAC61E8D896B8B993A511624046B50C7DC7B4B76F6B9EE661F265404124724376F208BC774DAACF5A2B151EACDDCA143A488FC9F624FB337E7DB83FDF9FC8E789787A764BA811A0F685B535B88B02C8BBE7C9A3FA574D5C9D534F8218864CE5686CB1645D290095BAB1F3FC8F17D46B96CBE3997830441D7B79014B16241E02F713CF773DAC47B72380DEDE233CFD6C5E66A5A8DD23128122AF7C63B7F0780C1947729078F727FB13C827C1279BD3701AE63A7C8E6AC2A945631A4615E52EA39558C128BEFF00C8248F63EFCFB009367EBD749EB6C3635C3766C75F21D526BC16BC13B467B1A18A68CCB14D3820B0894F79ED60A4A82C3997833C6E44C63562376C02DC73E08175F1FC3E7CF58E2EA781363B36399DA3DDB0CECAFE99376C236603701F347CF434F52F4782AE512CD5448982C95A731AA81244E07C88E179EEE7827BBDC02091EC051F7989C56C1E5F7AF58AEB569B8EA4D58C3355CED4922916959A76B98EC2DA8E959A523C4DDED66325E2292550DFB8645325E5F50FA9BAE53B0B05CB508AB796214F29DD2B516697BDA05170A7A1EB371DBDBEA900B0E589214D20FEA0DB966B171E21A820B535DBCB423AD3C9E9C6B5E006E33A057581DC45DB2A3B7EE3B451202DD8BC414C613A4D8329655C982789587054BC6CA1CFCAB213BD48040280D1A3D516BEA2481A78D52540F16E49072C0904006850205137C023EFD4FDADF9B0D73394AA59CD6BEFF4F6A28A65B9AFE4AAE4E07122862C28E43EDF24483920AAE42EC9FC7C8F8956AF547A49B75534A6CE60A44914A363766AF1E3DB82A3B9122CEC115499B8079FA29A707FDAE4F1E2B2742E9D439FD468E4727AD505C8F6912E475A9AF6AB7A420122571859E2C53CBCF2499F156412DCB17F727E329A1672806389DA731578FC51DA317573B54103FA3EE787FB35F40781C33E2AE381F90E471E123FE1CFA83A7D4B83A9699AF635968D721463E5ECDC0A8F571D909702C6F31D13E7EDD09BE4F6F4ECD1CA997A749744A8F5610DF7A21851374770E3E7E3ABBDE9F74C3A35BB603EAB1FB06074AC760ED1D728E1B076C434248A8D3A7667C988DAF4AAB364EF5EB76E61018EB0790AD686184246ABC73A591EA8756750BF6F0957A459BD8A282667198C0E6A9D3C5DCEEE104B5E0B166B5950C91A31166BC33AF7763A0ED04AF16B076C6AB3C49364768F6F2E44A3D49BD6CAD11E532B90D2348F2C7EA33BB92EC643BC936FEEBA8667443B22D5F3648D68232C5940141B76ED0B3850000000A00028015E6D34753F21888C8D9FA23D56C2C1DC8677C354D43A898A0631183228C2E63319CEC222E0B0C6C521425C2ACDC37890B07B1C3BBDAA59CA90DEAD82A6A65C64390A36F17766C94B176D9B7771B76382DD5971D133538E1B30C7225B7B3DF1AC956323419EDB20956A61F1372097279795EBD568A68A5921AD1A07BD7C22B37EDD2AFF00B8C5876999EBC04879D033A31BF498DA55EAD6016386348A3507B9BB40F62EDF9691C932CB230E6495D99BDCF25EB97AB6A1918CF0CCCB520E0A204623826F6FC1236DD73447146C6671A3CCD1BE0E91169B2C6D6FF87CCCAC8C67045AA2439B2644D1383CEEFC4B28140AD9B03C79C766BD82E90535964027EAFE0ABAC71AAC924F34D85CEC31451C7CF2495790970084504F007C96C07A1182DAB68B991D45B62B9A5EAB8D7AD5EDE5282C4B91C9588E081E626695B88AB45F288292F1191BD59E2902A2A41FB8F4A20DA35CE9B7523253C1F6FD4BAB346E2C278791E4A789C82B095187A71C12453C9D960112C72C0CBE94AB31643AF1BD2EC3EE3A4E2F1F82CB5DC24D9585AC65EF63275AB62782DB24A634B0D1C86295BE44CC10CA9EC5190804D38508629255560ABC2EEB0773291B80364004F17763F5B2CAED8D3A7C7485678C3C79304799180A5808E72EB16EB50036D4F8DC0EEAF3E3695B57F2FF00A2EC159B3BE66A95FDB6C642348F1995CD62A4C9C8F6A65153195A8C46690ACB334505735608E5B329545265711F8383A77D4DAF83BB88C41BAF362326666C46523361EBD9F44ABCF09F5C43324D182CED1BC64768239F6F026E27C9DF4431BB368BD489E3FA6D93A794B1D5F04F5AE57482D362B2873B8F9F62A94E894DB2FD7CB917D2D65A0BD6E4B4A25B324F22C7246F4ABB25BDBBA8F3D4A35E58F1B839EDDA924B72979EDE5F2EF10B579ABA04AB4E4B4956322BD582248E21CC83BA42B1DB4F2E3C30A4F8F3B89B8A0005142A8A8DC4807E411CFC31E3A32C7C07C874C592245C7742B9076AAAA485DC288CEDA71E988DF7921C3974319550E48EDFFA851E6B63B1AF56B6F3D2A9426CE652629DEC98FABC062B0B371EFC7249E1117976E07E41AEA4F9AEE97747B7DD6B45D83A29B0E4767DAE6C13EA715AD73131B6606C77ECE3F1191C7FDE24A36AC84B552759AD63E0B51534786679521B30BB4D3B2C7660DBA977244971E196A4524D17AB53214AC71F538BBF5D8059A3EF549222BEE8C23917E4A034A5FF008EFA7FB4BE232DBAEB872BB0EBB5CC3ADDACC2B65A3C2A4A5A4963C3D8B027345198B3AA44F50860A3D35E0F88F89978EFEBC995B9E5258A2B385BB3CFE652090A7845365B96B0789793A74983E9C502997102346162FD9C818C3B227B8C1242641479A902BC21915E3637D083B26CFAAF980C766B4CAB8293177A959B98CC96BB6EA255B98AC846C629B98018C235790485D96050C089EBCB2C6D148F513E7F3A359993A578568C359CEE0765C7D2B55520925BF6D960BB528B5692350D24F6EE475EA089C832BDF68D64064E7C745592D0F13ADBB66F1142AD6B8819A194578204EC11989553D38D5846B1B3008CA47B9E47F6AADF3079C9E6EA66B74AC24290E4F71D3AACCAF54DC8E2B1676DC4A54B114251C99A1B7F4F2C4AA8CC1818F86572445832C2E5ABC8842B3BAA6EDB611C10B640008E45FB4DF3EDE45576ABA74F9782763285061562B40B159137F041A005D1E429A05B9BEABABA79AD6F1D36D669EB5BE61ACE13331D58DE4AB69A197E4A02CC8258249A269A19398AC45EA33C3202B2704F3E3F5CD6462943878918373C72BC91C83EE3D8FB0FEE3F3C7FCFB189FA815CAFD278BA55AEDEC5588AF64764D9EBFDC6D955B366BE4E9E3F3893CDC468D248D24BE837A8A0992BCE7B413E0069EF993E7FD4AC3DB9E073C8247B03C1E41E7FBFFF00629C63478AED0C658FA6013BB865DE03D11F156401F06C0E967DD7A5AE91ABCD8B0BFAB03C706442EDC964C88A3938AF69A72C0150011CF2D67AC796A5395CBB46A09FFE1FDC9FF78E7FFDC7F1E178D7C96BB9B93C73C0FC9E7DBFF63F1F8FFBF0BC67BDBE09FF005FF2FE9FD57F1A1B09C0B27FAFE8FF005E6A6758EB76630F7E5CA68BE61BA7725CB69E8F397B9B763EE2D632897E8A1BFBA60EC356A6D2AAC86947995A825ED97B0BA87041EB9E6BBCC5D4B34237CF74F762C7CF7A8539B258AD8F09B23538EEDA86A9C858C7EB595C866FE8E9897EA6D9AB869E586B472CBE83F695F1CEB557A76526785A9078582C8119EB3AF733F6152C220C5821E0C6581F7FF807694EC5D8D99A1BF90AA072C4A6465640AA5BE441661DBDBC1E783EC493F93E1A92F6FA16B3981F685B5CAC0605946D35BE168F658341954D5D80071D0E2679228632292294C338344D73B5C3EE208F17C11C9366FBA2F2F5D70D8FA9BE4BF3992DD35F9B03B1C3D4EB58582ADCA77699B14961C0652B6620A97E18A6506A4D91AF14C2356447914BB2B4A82E0FCB7E3FEBB5DC2A3B1EC5A30A9F54711B9F4A307E6141562030014F1F32CDDC00E38FFF00D2F7AA7420F29FD42D472FB5496F3353AE98DCDAE26CCB11BB431193D5F138C82D22BF121A991BF45AA23889A35961942486550A3B12F2AF78CDA761FBE0E54D5AAC814F71712AA11CA9E38ED07E2791FD5DBEDEFC8666638873E78D994A63ED00A0711B061C6CDF6E53F76C92783E4F5B13DAB9C92E9FA7CF22FA646978F0A5BA1666899E3DCDB490080395BA17C8038E8DDC468388AF8BB79CB90C6638606644EC58D25740488C960A597BB81DCDDDC801B90BC7806F44DF741D2BA8FD9B458BDCECF94CADDB53C746D3548B2314AD23E25B242B4942BC91573E9C30CF221E542C2246F5B826F79DFF00233E326C1527514ABDB100290347E9708A8F0CF29760CCB30776701000423212BDCECED3B0FA641957B9969F5F195354102D2D269EC069555D7D261EACBDC0282A411EC7904331F192470CD2C2204440812CCC037A8F419B72F1ECFDD500D95F2013D10E0BCEF1E74994D365C9233A450E2962D8D8EABB436E5462243B8B170BB95B90DC75126E1D4CE9E6E9B76730F462CF62CE2C432E1732F8DBD5B1F76FCFF50F0C38BCA4D5E3AF94922B14E6859F1FF535A3B507D24D2456248E17B0CC262F1F96D53137E678BEE9F6CA8D7668A311A35B1563F5FBD17FD290CA58B8ED039FF60239682F394B495B35A296FE06AE4EBABAC348CD46B4E2BA95ED1154043A0258F6A0EC23820027F2EDD0F62781EF636BCEB696055319493D4575E3B4321F7773F20496F893EDDDCFB78E0C7483264475825128F72800056ABB55BB53CD0FB0157F78DAE969B070A58065E14B8DB3699B791908C0464191D0330E012C77027FD351D40AEE9567512BB1822625C13CF0000A85410ACBEFF2F605BF9E3F3E28CFCDA4F7B11B263F3941923C9D0BF89C863FD41DC23C8E232753234A4605B8902CF5237219C03DBC31E4F06F2377C98B542D08D0FA843A05F75672080C5885E5BF3DDCF04237B02393CD1779DE921C5BE46EDD9E2AB568D1C959166C12F1C229D19E733304F903CA00A4062BEDDCAC39534F943F2B21E0352DD8A65A3557760D71668F03C807E7E248C2F49C025402DC29B042927E451F71E14DD57157D419FAB4EDF9ACC67FA0B36CBF495F292EC1929BD0A964D88A7823C54DE9D9AD64CAED62BAA588A29256589D6706378BE2198308F2D1B411F3210A228C71FC96EC1F8E7F23FEBFF7CFBF803FCE9FEA79AF7981EA474B70FAD6BD948B5BE94D2BB52E643232D6B990CD672EC742B5D9289A724AA311522A0AB55E597D7B524D2C924508441260E37CE274E2DC7125DB17A83FA6AAC2C55954060A01E0AF771EE07F6E3FB1E7DFB72B0335B2249BF0F23095636045B13C724FDC1BE050AF8E39E95FDE1A862EA1AAB4904F14A9043063EE8D4C680C314694AA401ED2369228160C68DD93DBEE31F24870793FCB7B8F60383EFF009F6F0BC0790799BE954D1893FC51493B893DAEC030FC7E4370473FF43FE81E7C2F15E70B2ACFFB34BE7FE9487EDFE5FE1FCBF8743036100FA8BC8BF23FF7D7376B88B3E924567EA2BCCF6658A48A45EC2BE857791080EA4152598291CA1079FC107C7E3429C91849DFD5ECE1D847D81966452470A001DEAC470400CA7F1CFF0069E63C3C57A30245591A3EEF4C48BFD0C57B1D94805D49462A7B7F0081C9E3C34723AF5AA9F592D78A6963FA668C44B3470B5708CA4AC6C007547504F78523D8862BDC4F8D83C95CA8379A3244DE0F0760376AD62D4515058F80A79F9E82F125C39DC992309201B82124073C56D607937C9048F1F35D3ABA0BD40CA6B3D55D57291BC35D9B250D491D552B3451592202A8C1A25EF5E50C60B2113056EE3C769F49AF245D56A19BE9074BF67A924762BDBA789AF7983874412C51857620F03B251C03C85ECF7F753C8F32DC2C770DD696938A7620B341DED2324EF03C71B31915D900FA8E5557D81E24E49F65F1D96FE8CFE64A6DD3A473E9996BAC6E6BF93B18B921663DE7B4C56AAD8556FF0064B1588D810000FDEB1FB463905EE3C26B8B528A20B0844C79E8B31BB0E8C451E2D8AD8BE7CF9E19FD9FA8C01A5D29DF664383931281C1A0BBC71414B0A2473B8591C03D7507D6DC162F35AF64A9E3AD5CA32E69E4BDF5386B9350BA24B0A663E9D8AADEB28577E44887940386E472A0244E9AF4D3A5D4A1BFB943B5EC96EF859CADFCF4934F2FEEB77192EDB85EC398F9E65296158968C7700EA7C4ED8DDE2C5D6A35E66F54D6409F260DDD190386EC3C8039F8840A40FC310A00187D59E92EC7D728F191E225152BD28FFD44B0F1BACC81A45863863400ACAFE93C93349C19230191E307C04CCD92BB9F1E2F5492A62514D4015BAF1C30F23C1F1D3BFB7B58C9C0C4F470727F092311F8898322314B1C97650C085DC032B861E411D6B342E9AF4AFAC316C75AA68B362DB133169E7376C9B13B1B0F0C312CB39B532585EC76B0C2C3F0EBDAAE847689C3A45D1FC26819C8E5C6C77A8F63BC6AF6B2991BFCC2DC135435DB92AA40C510B44914710700AF0C070E9E9974AADF4675BFA6A693D89EE049B2D6ACBCADF5765BB8BC85A4662CA65965651EE1010A0F6AFCB3337B50ACEC665F49A32A64640153E47B9A4055B9055782E0280C57DB93EDE3090E41F4CC913C53821A6B5D80AD860B4A36D01E4803E7A91A9770E7E6E3CD8D36A1F8DC370562F52633FA6C176B70E58F06EACD5550E38C9EA2DCAD164AA52A4E045DD3B4EEDC101234EE666E003CBCAFC9E1979403FA7D88E62BF58FEABD5D5742D884161E3793D3A51C95A43DF1CB6EC2A878D93966711C323205562580521D49E6F7FA91D44A78CA392C94D2A3D96AD2AC6ACC018D5795676EE1DAC1D79088147776F2C383C9E397F567F32719CAD8E9EC18BC5E5AFEE38CB73CB3E4EB43706BB8AAF93A7E9647155E5FDAAD97B2B42F51A570C72353A73DE78152D182786C30709F54CFC5C554215A40F27C522D3486EB81B56FF522BE7A5F6ABA8A693A366E63B6E31C61222C412D2BED8D05003F79ED8024800F2073D73B9341B7E23256B62A3979CDD92D4D70FD05822C44669649646784C68076B01DE8807686E4A81CF0F7A7D72EAC15860B372966A26042266B5EC3E44BAA820A99EC559253ECA79E6407907F9E39FAD7F177364CB63B115CA09F2F721A11B4EE04519B4E153D4700B2AA2F72C9EF21442E47C80562FB59F21DD709359EA76774DF2EBB3F5CF4ED23591B26E5D48D7B07B84D4F49A4D51CDBA94E7C2DB831AD95C1BF192BCD2AE62534057B33E3E3A06C2F864EA1FDDCB938DA6C98B879BA94D034D04124302CA6085E38DE5591DE18D5519D405F5164736115981216FDBDD99DD3AE76F6AFDEE3D7D33B3347D571745D4FB8E55CC9F031B5AD4B1B23334FD2DA1C1872F35F27353164D8F1E23E3C16AD932C2AE9B84A6EB3EC6588B7D3CD1679D4F0F29C1DDAC58FE7DE2A96A0801F73C148C7238F7E00E17893BA75E5A24DFF0056ABB4AEFF008FD42B5FB37A3A78FD8F2F5EB5CB35E95A929B5FAE896612D4DED41669ABC9146FF554ED2705111D978A2C8CDED6C69E5C79E6D3E39E191A2963DF9A76488555D3D92B25AB7076B1008201E0746DA47D0AFAD5AE69981ACE93D9DADE5E99A9E2C39D8194060C63271325165827559A48E5092C6C92233A29642AE05107A8B27CCC70C2C31C61676050CD248230AC579E635908F902381DEAA09E7D9B8E0E9E4D9A4641159822EF500076E4B17E7D31C7B29753F22CCA07711F0042F25A95E40A65A966068649448B17AA0910C85F9EE087B5BE20FC7DC02A79E0F27C6E27AF14B10804B14BF4DECAF0858833142CC9C290EC2372400DCB769257F250B2A8936CC49FD3C7C7EE93C0AF1FD1EB5DFD32A41A1E0557C1F1FAF27EE4DFC7C5F59502C2C2592BD686BB4D27EEB449C2908DC7A84FC10370792414E5D881C8EE6F16E1FA49F56BFC03D7CBFA959BE6BD5DBF17059C7C72BAC667C9E1247965AF19EFF69AC62EDD99876AA922900CA56201EA2718F6963B523C0D354A3E9CB69A3048ACB62C475E091D9495ED9679A385793DBEAB22721B81E263E977DCA966727B76B59A935ECFE9D81B1B76BF96A7232C95B258CC9E2618A22CCACA5A68EE490B2347244E5944C1ABB4D1B629A23EBA8FA4C2AAB2652C823B2829A38DA606CB2ADFECCF2CCA09BE45F52A0D68E819306AD33394C5921321B6666499E380AFB43123DE07E56A1668F8EBD11B19949DB1D8BD928CBF5114D1C0D32201DD32BB463D940E4CEA470A84132056ED23E5E1F9ADF9C8A9AED7BB53194639ECE1AD7A135A646103CCAC165AE564512C1322099F931C91B46526127605079CCF255FAC474E339AFD1E99F984B27A75B3C95463EBEE13D7B3268F6F2B1AAA57C8D8B35C5BB3AD3CAEA2691AE40F8FA53485CDF58486497FA87D53DDB45D857357AEE3370D333424B55FA85ADCEB97D7B2D166631253C87DD31CA685DBCD344B529CD4FBA29E42F5E6AF04C8C92A6750D3F3B4B26392378CEFDAB222DA50651B8300548E41F6DFEA3C81B0BA5EA78DABC7EA604D0CCCCA3D5C667DADB48069E2B0411C8AB20FC583C5FEE53CFA56C852A5562A0D3FDD2C1AA8919369AB4F32FA90169AB095666B11F03D38D2358A64B11C22448C0567DEDEB66DA563B6B5ACE3AA98C076B10C903CCADC952C8EA8F1A93C145E03A850F204E7815B7E50299CE6465DE73D67274B53C5C2C70B42CC31C2B7F3172A7A62FC9218FD73571D4EC182B1FDBF5ACB991C178A6EEDFF0099EFD487CBC740EADCC4E677BC56476648DA38F57D71D33D9C8A4604016E8635AC7DB013C1EEC93D35766E4B93DC0720C5C9CE21638E49E46342C166206DF2A6CAAD73CF81E7C1EA4CD3E3E042CF95910411A92CC011120BA3B49E14BD93605922D4726BA90BCC06F51E1B17631A2EBC96E78DC90650CB5E355612C85DC9291AFB95E782141EEE010DE38A9F3ABBE45D49F307B8E4EBCE2D6331B0D1C2E2A457908305380BB4B183F1ECB162CC92ABB23772B928439E498DD66FD42FAB7E637A892E3B50D72DE17A6587B2739B7C35AE08760CC6B9426579AB65B34DFE570D52EF6AC7F6BA3EACD7DCB53FADB50CB2D66ABEDFF73C76D1BB6C1B1508D20AD92C9D8B1108D56448A38CA2068C4A5DD4CCE8F288D8AA461D5635544015C7A0764C1A3F69BF726A4F22EADA8EA8BA7E958AD0C8A8D81042D3EA19B14F5E9CDB321B1B11951888ADC38DEEA0227BB3BF9F5CEE24ED8D2E057D234FD3BF1FA8EA09345633E59E38B0701B1C319E22D8FF0088CB5924551281114348F6ECE82F457A91E613AB7A1F45BA2F83B7B57543A839EA981D3F5FA76E9E367B99293D49A579F217AC55A58AA78EAF058C8E472B7AC414B1F46A4F76CCB0C11BB0F424D4FABFA47E84FF00A596974BCC5E2E8E57ADB4302F48E938DCA57BD6B7AEB2ED962F64B278839F4BB93AF93A58924BE6F314E5969C786C7D511435A16A302F9E5741FAF9D4FF002D3D5ED33AFDD18DA1B5FEA774EB372E6756CB4F8EC664BB2C5DA963177629F1F9186CC17ABDFA592BB42D567A9DAF52C4AF14F14DE9C91DFCF9C3EA5F5EFF00524E8D74CAA79D0D930B1F56BA7F99DB770D42CF49313F64C657A3B9EBD8687FC27B460F276B295B237A9DEC1529466F1C893D416AF63525BD132CCA11DE7AC687A3AE9ADAC65E3E2264E43C71308A49B3A40AB52240A91B8108DF1995DC054728487F629777D02FA3DF54FEAEE66BBA4F60F6F67F7269DA3E341AC6B382DAAAE9BDBE9345EA9D3A4D55A5C9C649A794C591163C1086CC787F10B0B428D24A813607A33ADF9C26D8FCC0613A75D37D7E2DF774DC7317B4BC5E7774C761743C965762C8672C6AB84A55F270FD362604CB4395A914A66641967104BF462AC512F1577AB7563A99D35A97B5AD6B3798C3568F2962C5FA55DAD550994582AD1B0668A2283EA121A35E090B80E3D1546E3B000BC09EA1A07783E76549A7F72C71E0C93BC98B1C8A8CE90390F1AB3194162AA6B730B6A0C6CB35EE1768FD52FA238FDB1A0E3774FD178B27B93134CC4C3D732214C98629F53C48E3C6CB9A3863411C0B24D1B3882302386FD28C0445A839E696C3AFAAEECD1860AE5DCB00FDCC40E58A80189202AA8E49241249F19D4433DD8A02EFD8EC88C476F770ECBC91CA950DC33007B7D813FCFBF85E178762F83FC1BFF03AF2E801B1B81F92FC7CF1CF5B031816A487962239DE112163EA1505802C470A5871C83D800249007B7055F956C5D4CC7522C602FABCD8BCDE9BB463EFD7123277D7156BDA1E994E3D393D58633EA0058040071C03E1785E0D3E9BAABF7CF6AA3A8647D734F47460195D1E60AE8CA6C32B292ACA410C0904107A09FA88EF1F65771491B347247A3E5BA488C55D1D235647465219595806560415600820F4C7DAF1F0E1F74DA75EA8F27D16133197C6D39645805A6AD4B216AA45EBBC30C314923471AB48CB020697975553C71B3C06EFB9EB74A7A780DB364C352B104F62D52C5E73274295A9E99A53D4967A952D435DE4AD339961711AB2B85249E3C2F0BC0BEB3145F8FD422F4A3F4973729563D8BE9AAAE51555095B42AA80A001400A02BA26D0E79D7134F996695666C4C4669448E242CD021662E0EE2CC79249B27927A7367BCC87980CDEB52E0727D6BEAA5AC3564B0EB8B7DFF6A18D9628850AE9567C6AE5463E5AC11DB94357BDB928F2343FB5E2109329654F2E21B1258AF14F24D62312CA6476EE760CC78E589E496563EDEC7F3CAF0BC408912300468B182A961142837B6EF6817767F99EAC32E69A67FDB4D2CB4E2BD591E4AFE1B89AF03F9746F74C522D6FC9F752B79A10C4FB1E6E0CC456AED95F50C70CD94C56A91C35CC661904746A652C6471EB34B37D266163B9111199ABCD5DB5E14B53C759F98E3FAA821FD9ED8CF6C93C31B123B4AB38595C867563CF1CF2071E1785E1BBF55008BB7BE97C51811C4BD8D1CCB1A7B23134F9B3BCF2845A5124CE03CAE06E91BDCE49E7A55FD1C027EEDFA90D3813337D427819A50242D043838290C24BD9314484AC719F62292AAA0123AB10D0BCA474E33F470D94B99CDE63B3661375D6BE5306B0896B08A58D5567D6E77F48B1F923BBFB05ED2A473E2E02B613EED9C0B265325596A41459C55FB7F75D31C690A2DD96CE3ECCD244B5E18A0586192085114B246B3492CAEBC2F1E737D57C8C8C89B4AF5E79A6D8F9C13D695E4D80C98C085DECDB41000A15E075FA6EFEC05A4E95A5E177D1D334CD3F4E39189A21C8383858D88672989AAB2198E3C71994AB1254BEE2A492289EB51B3749BA5CF99B76C74F7518ECE4585FC8CE985AA25BF909F9167217246567B176D18D5ACD9919A495C7731F0BC2F0BC2C1350CF2AB79B967851FEF33781B001F9FC000003E00AEB7634FED9EDB6C2C676EDFD119DE3123B36938059DDCEF776638E4B3BB92CCC492CC4B1249BEBFFD9),
 (119,'zander','sebastian','der Jupp',0,0xFFD8FFE000104A4649460001010100E600E60000FFDB00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFDB00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101FFC00011080064006403012200021101031101FFC4001E000001050101010101000000000000000008000607090A050401030BFFC4003510000202020201030400040504020300000203010405060711120813210014223109154151162324326117427191333543A1C1FFC4001C0100020301010101000000000000000000050603040702000801FFC4003211000202010303030400050403010000000102030411051221001331062241143251610715232491527181F03472A1B1FFDA000C03010002110311003F007370C02A347D74BE27FD3D82999F9F9FBEB33D17F5EBBEA3E3B9F9EFFE2483C7C2FA9F8EE26623F53311F1F31DCF51F03FD7AEBCBAF9EFE3E862E1BBF11A36BC325D7FA56F5F31DC776EC4C44C44FF004EFBF8FF00DCFEBEBF7E7CF52FC7DE9938C72DC9FC876DA38EA2414F1989A5ED9E5761CD59064D2C3E354C205CBEC7B46C6B58609A9594FB0F280578CFC4BAAD696CEA7621863796596E4B14512292EEF24BB635440092CCC40000F27F791F4CC0E91D68E590858D604676620220080EE248E00C79FC78F007462D404CC44C444CCF7D78C771D478F53DFEBAEFE262223E3BEE23F7F5D8110FF889EA7E3A899FD90F5D4477F133F11DF5FF00333D7D640772FE399EAA4B703CCE99AD71B60B4B1B0E5D0D4F2384B99B7D8A93E5099CB673F98D1BAEB4B8E8A5B8F0C5A0D9131F6B2BF82BADF4A7FC51B88B9CFD3BECDCA7BABAA699BF71AD64A77FD1D1600CEEDEBBE6BC25ED3CAF340F218ED92C28AB564BDC2EC4DE559AD926C540AD93B93EADE82F5369352BDDB5A7F722B12C35C2D3916D4D1CF61D638619628B73AC8F295895955E2323A47DC0CC3AAF4BD43A55B9A5823B6A8F0A3CAC6553146D1C60348C8EF80DB541623860BEE03CF560FCA7CADC73C33AA5FDDB93B6CC4E9FACE3C96B7E4B266712C738BC5152953403EF642EBE6261552957B164E208857E2072355FC89FC677D28EBA43FE18C6F226F4E44B9B5998ED7E8E271969DF6AC582596F3393AB72B07BAD10730B16D250C19829BF889D3AFACEF50DC9BEABB673CFEC374F17A9604AC2756D111DE47178EAAF854CD878078A6DE62EA52B2BF75F5562C350A2B8D742E1501AD8E2DC83E9E2F238BA8E8152DABBA229788A259ED4A96A5B3CE66A1B7DD6AA23B158B9A098012888D3FD3BFC1C89A94363D41358FAC91448685492258A28DF03B734CAB23B4BF0ED1B2A29E119B1DC64DD4FD733FD5490E991A7D3AE5059963676908F2C8A5B0AB9C140416FC804E16E9F50FE3788CC6DA9A3B67051E2B4C7DB250E4B03B4332B9AA340C8612D2AB6F17469645CA08EEC0859C7C14C1FB62B31103B22E36F585E9CF989F08D3B9230A398BA9AC29C06C12FD6F36C6A9B6A1AA451CD0529BCC1F7553118F3B5042625FA8998CAC63B8DEE54BD55F9AD772C140173257714BFB3900EA0A2C1C2D0E86C2E4FDCB4895359202E806AC82609F97B03ABD5AAA8355CA2BF7DC0BB4CBEAB335DF1112B75AA94E0C6AD7B7E2B9511D508611345B20B5C3FE9A6E7F08F489937D2965D2248D546D6925B313E36FBDD6C6F7E4E32D1CC8BCF2A00E84D7F5B6A70305B48B72363CE5046E3F4A50609C6480C87E064679D6664DCA2FC87C4A3A9EA6262627CA3B8EA7B2898889F8F1898EA3F73DC4FD461B25980AE290EE0EDDBAF4C47A8EC81AC1FB89889889990A81619FA9F909EBBFAA19E14F591CD3C19388C5E5EC58E4AE2D6F8A9F8BCADC2B79CC2AD47283FF0FE649CC3AEA142C26AE3AF31F8E39114293458E1B45727AB7226B3CA982D7372D4724BC960B2155F7927D7B6FAB6E406B3295FAF332CAB7A94BACA2D5764F6B38F2591AC96C244BBE99D4B409D63B88AF13E3B16A3398650006C03E51F1CEC6F760FB4B0E7A71D375AA7AB21781D926452D242F80EA71C6DF89103606F047246E553D3B3206B88288F88FD475D7EBA8FD4C4F7D77DCCF5DF73FD3BFA645F91FCFA19EA60A3BF8EBA888EBF53F8F7F3F33D44F5D4F453DCB8AEB48866248BB899898FDFCFEE3E7E3B9EA7F51D77E3F3FD63E9BEE083F2F8938F98F9F8FD4FE5F13D771DCC77F333D7CFF7EADD4508031C83C71CE3191E07ECE39F9EA29D0BE31900E3E7923827F38FFE7C0CE3A6739712C299F8F9FEA3FF00333FD7A9FEBF4BE9C734C0E66484E27BEBAF1EFF005FF8898FFF007F4BE89F763FC0FF009F3F1FAFD8FF003D55FA42C73B8F273E48FC718C7FDCFEF806B4EF489B8E670D46F17AB4E56C78D85914554262413E2C30E80C73AA89F2F1F299800FF77711FDC14FE223C2FB1F19EB1A7D5FFAD3C83CB72CCA5AB591C66CB8CCACD3C5ACEACAEB64AA64BEEEFE260FB87D6B1549C16FFCE49AC7C25B336EDA39DB1C062E21F231ED1FE31331FF00E66FEFA9888FDF71FD7B8EBB9FFB595EA1358D1769E2CDA91C8D93C6E3719186BEAA793CAD96D7551C932B322859AE0A997D8BABB1025593552FBAC2895574364E547C258B14B5686DB2412415AD1768929D28DD972C9849520120600E54AB076C637649CD88E8437E81820EF0B562BAAA1135A9497654E04464656DED900152B9F81F19539B731122E8EE063B5F5D44890941CC48CFCC4F7031F3F3D771FBEFB307D3BE2AFBF5C9560689D9B59CCC8D7BF66513272AA73DD3A8A3F19FF4FD9BDED80F96491F94C2D7043075FE3BC74DFB64392B2F4CB4852CF01F98EFAF73CD8A51189FC9C49A527E331061E5131F56E3E96B47C5D2B1A4EBB87136D4C354A419267C4164763B225632AD707C04A6859C8BAB569811260CF7D4CC111EB2B72A58899E267221512C836B2676A332A8DC3FD60024648F38DB93D296A9E95D77416A6FAAD74AE7519BB15D4CD1492A9CC65DDD2366DBB15C6558F05B637208E8F9F4D3E9034DCAC50CA6DD872CCE42F126DD8A4C208AADB2C98826387A991F98F15AE5930504C614751E3F56FF00AFFA46E16B989AF896F1C6BE95D450449A28AD25D074731160BC88CE4A0BB9299882229F1EFB29FBE98740C653C5D2B39100168A1730B98FE9D414CCC7C0414CFEA26266067C3E227A2B1FD6755A2D1225AD42A23219F2198F22389391EE207A18F2EFCA223E627A98FC84A2A76B519C026629BCEF11A9002AEE247C79CE0F27F3919F07974EA10471AAC79D83DCEC301D8150467924919CFC6318247906EF7A6CE257E3A718FE34D5EE27A00054632AF51030511305ED81F94C7C30A24BB8EE0FB01FA0CF957D0B70AEC78FCDD08D12BE05D74ECD9AEFC7915785D96AFA86CAE6490E5C4A96423E1044300AF21E8486FA5BADEBD56A791293EEF817E125D18C78491780AE0A7BFD4773DC765DC77D47D0D7BCE011925B022B2D63E6F1911EE7C4627C63C48663C4E2624FA39F89EBBF129119BD66DEA15B1FDDEF3C1D8407072AB95390739CF3F8E7E071C7F2CA560498836E48C487D8A181C008370CE40F206391F38EB19FCDBE9AF75F4DF7B3277B16BD8B4F6D99A3533496314074FDC63062CD502F1AF7C53D089C91CFDC5767B732071DF2FD39739278CB6C6652BDE7D2D1F396AA52E41D62D4CBEBE21EEB018FA5BCE30C4A3EDC6A5BB35D59F8F0126635A5EF8D82A541A1797EB0F4A5BF5ACD56BF594F582592097819A0C941032D2818323F01982811EFA196797E25F59E2DEF4DC6E2F1D93B3418A0BD771D90AD7A85371B56352580B3AC759C726925C926E2CE208195D33EDB67A70FD453C516AFA6B453A28122B078B6AE5255E639A17C6E57562AC06718CA9DCBB8050B4BFC9F53592ABB21528E1812558311DC491492366D0413E3C1183C0BD6665D6CECE0A246667A9FF8EBB19EFF00E7CBB99899FF00CFC751F02EACE227C87F5D7FBA3AFEF31DFEE67A8EBB8FE9FBEE3E7EA26E36B679AE3DD1F30C221664B52D7AEB44C888A1CFC5D46387CCFF0033886C974451D9FC4CF5DFD3F569F1EFA3899EFE7BF9EE6623AEBBFDF511DC44CCF513DFF59FACA8D211FB73865E0E3E304020E7046307CF3E3CF4F8B643223630195482493C30523E7F64FF00B63FE1C317551FA912EFE7B99999FED3DF8FFCC7EA7E63FF005F4BEB852B88F8F7A47A8F8888EFE3FA7CCFFF00CF8FA5F510A838F9F1CFE7EDFF00BFE7F27130B3C0C0E303E0FEBF5FBFFF007F5D47FAF5C0C469439478CCD6C6E32E5E740408B095522C3CE024A4460A05730325221DCF65311F3144DCD9CD5B2F336D97F379AB766BE396E34E0B5D879951C2D28FC52A4A3FF88ADB4044EF5CF0865BB0453E428152977A35EB2B39C7391C622C28A72382CBD2F3060488CD85DA47976133D78C94F7D4FCCC4C47CF73F59E1C96A7B3B12FBF4F0992B08413C66C2A9B8D0C84910B44182120D18989EBC267C4A23E6623AFA331C309BB2BBED2401DB276EDDCEEDB9F04FDFED519F233E793D683FC2D9A8455F53BD6D60162AC74E389A665531452248D2760C8C007631A838F710BB49F71059A6506E8F298FF0078C7C47EBA28EFE2663B988898F9FED3FDFEAD1FD0FECF42D6F4CAB65A118EC10A5AF73CC4441B74C9C0360E67A09F765831113E4521231332313F5538AB84EB1D2E6641711064633044725D904AFF0041E132425DF45131D4F51F1F56F7E90B8D9F96BF66E46B08C2EB858DADB1E6F234AF5DF2C86346F5DA75EDAE4EDB0416558116C898C4CFFA8607B3EDAA0C9A285605275799210E1149707255D86EC00A7903DC7C64E01C73907FC55B4F6A5F4FDB8227B11A4F7C964DA631215A8F1B6FDDB70DB5F6B0C821588FDEA03D39EFDC5D9309C6FF008DB5F8CA566A3BA3399A2369910A164FB3566C4BC8625933DCC0FE22451DAE3CA2CFF56A18BB1849C9633229B73EEFB44B025992D623E2C21989EE7E7B1F70BBEA44886627E27303C76CE17AFB5E858BC0711EE199B5B58F9EB99AB196CC57C3E4591952C43A6EDAD6B66D6B338F85DF82018B3360D69F1BF5E8DBA13F7476D5C57CF18A4EE5ACE8BA86072BA551C46332DFF50B13B06E83B914657056F5E450ABAE5B46130D91C405A45BC87DE51DB0365BAB3AE22574A22560FD0E8B0D0A905892581639106C6962921DCA5914C8AC43862A587B07B883C28C8EB2FA5ADCD72C495455924912708DF4D2C363FA9B1DFB3DB3209477044E432A8405186F0460D88E7729C5FC7D891CBEFDBDE035D3BEE295AB2F97A74EC78094F4035EC301AD88FC60A570C191302EC227A1097927D4F70653C95D461F72C4668856C325E21E168CC47CBCBA10998105C477265E3E442623327F87D0E3CC7B9E179977BDEEE65F8F755DA31FA9ED773058ED633B9FD870FEE52B2C6DAC6067AF6372FAF035566AD55D8C9BD17F0F4EBFDC2692BDF23113EE71573871A870E0E4F2FF00C39388209FB14EB7570FACAB91ADECF52AA5721633991A77769B1961A176C3128A795AB6EC1AD956D13A9DB06F954210E8D4F51AF60BD88A15AE8198C112BC8090854E279AB87EE6E56261DE4EEE0678E86D9D72E258801AF6196CC8CB08755EDB76D8C640303BF64C6C8CBFD7111C839C924F51172365754E72D63601D773D5184B41FB16D3E2535DEC54B225EA8E9AB21891170B0407F3839868407799CE5EC0EC3A7F345CD536EA95AB9958BF4FEF2B8CAE85E99483D6C598C2FC5AD9FB6712BC4C7C1A64A9953FCCB55DCB1C7F8ACDE271FB5FA64E25C270BEC57DF5437F4EEDB4ED5B9EB191C0B71D6FECC75FD49982D573782CED7BC332C6E4768CBD10AA6E0557373C1C9A1CE52F4F1CA5CF5EA693C7398DEB54C25EC7E2BFC4593CAD0D373BED7F2CC4201561F8BA153259CBF7EFD64FB69F62C5AC4D3B02C9F26A5A29F75522AC904EF0C3762B70ABACB03AB1573B6450F1BC4E085603C80C413F6962580EAEACFA9763B74674B12C82AB06D8177B82636571216C12A40DFB723CE001D47FE98B5CC1EE34352A21B4328E575E6B1998A167336BC66A55C85FA98852A90366552218E807476849080C90CCB0267D1CCBBFEC187E40C969A96B31B9A4BC52DCA06C09FE516AB5A50DBA4BC72EFBD6949D8A6D4DA9F1A6A72E12C19229EC9919722F09E5FD37EF18AB3B4DBA191B814F15B0603CA92E9C370596CCE6A8273268F71F1DDABCAABE06F64B6B1B8415222B16178F4ACA65B97794BF955FD6E85EAB4F0B5997DD90B89C4956A566C31314AAFDE32B83E6D031CC86C309B5D8A442E4964E49E5FEA3B28B2EA94C54599522212730245242C195F6A6306C644A0FBB6B3651115B00B6A1A6D7D725D3F4DD6E3D674EAD7344B0D424F4C59963B67514A11C15AD98EB3979202A9343359920464AE0493968E56468E3DCB6FF00C90BB0A36EC5B4D9FB8AEB7A9957379DCA0C24C982B5BAD63EBE2EA7DC04048B949AE40B28EA1ED898985F528AF1FB369D6B2BAF9A75AA1F6197BE81AD672566CF8821BF6D0CAEDB255CA6B3BD89700AC5A9023305D9B023EE92FA4210D61C762B260FD8D69559395F6B292FB59780C3730046371193D6773FAD7D4893CC8CF221495D0AD5D2BB9586D70A7E9E495848F09C131B48031439600E4741E70B7216E9AFBB0596C66E36A89DCBC552CD171DCB0AB2A6DC28316D39B13F7805E72471621A47D78F9F632524EF22639187DA76BD7EA2915F1E8B61668D6AC92AD591472B5139242ABD49819AD5D436FD904488CA603DB988F1EA050F4BC8CA73C672AEAD844E3B18EC2455CC6C8BB36575508C5C5E4AACDCC5AD53F76F96932142AA899629A40362C240C5F25973E65F1D4B9773F550F052EBE370F4ED817420361340081624644462151D5608985E527E411E5E1E53A259A06ADC0862ECC92C8E0C79DCBB42AB07518DB827700E073927E4F4C7A5DF8E61076E7130680866D9B4E405187F713BB7020838C73C648EAADB6CAE585DBF3D4493EC29B79B76B0F53024AB24C392098F8EBDC8684C4474260433110331F5A27FE1195F1FB8F15E693942458653CADED6DD59C0644CC5C22B5BAD44CBDD58823DCB4E789752644C3132F01500527FA85D4E2AEAFC55BECA14846C6EDDF0E97ACA61961181CD567572740CC47C5DCA65C019FEE25AE07B958AA22CC3F837F204E2763DE356B2CEEA15ED7F34A513BCA625EABF4AC1C0FEE6226B52829F128EE4462448E3B65A2F1B889A4E41FE94CB93B4B44DB79238C6501FD123CF4E4E5750D0E013ED91695889931F72A126060768CAE44BB739391C8031D692F56D16BE994C6CE370D85AEE154C26E853A837FEDFA58FB169EAA624EF1185F9791119FB705127D794C65C6B8CD8360E4CDCF677ADE75F1BEFE250E4565801B54600CAE00511215EACA94B80F7089670C497F991D41E5A73356CBEAECD832026B453A4F602EC2FEDCDEE4C3013E40D951CAE4C65853D4CB1703E3F070500A7176E5C9BC7991DA35FD75988CF63336765B66F5D4248D57AE5A758B77A8D96B1C1692E78CDB65738C75EA8E26002DAA6FB82D05279BE9EBF79E58143CAB12B6F2A46D11E4160A79C9033918C9F8CF1A7D5A14EE3D814D7B90A14025FB43CA3B67058B13B23DD9DBCE5901C2EE209FE3EC5D4DCAED8C657A948B378D730F2740D535EF5C5BE10A6B182B49C5EAA50AAEC95BEBB968679D88909233FA2629E1AD53456C706BB51308989841B6DFDAF80911BBC409271E713E71F9247CCCBA89883EE062E1CFE718CE4EC2E7B69CB54559C7DCF31CA62EABF1D6AFB6C23DA0AB7681BEEC56ACB09316306F3A1C3010008EFA1B0CCBEE755951CD3451758A37A52FB8B4AC22C2DC32C513054222B648CFE702005D84CFF00B0E226CC31488932DA6298DC447B495DA30B8C060149182A4820E3DC738041DFD2692588BB708923994CE1D242A8256620838055CEEFBF07765F85209205BE515EB78BC3DCC965EDD6C27DD8A11070CF6512F252EB229ABFCB33B0D6B84C9200B879B1B2000511F9015C41A8F1750E74B9C809C372366B6FDDF143AAE1B23AEEBF47258FC7EB8C9AF672ACCE5AB192A658E063DD5E5674EA5EB24C1FB665382699A27EF52B9D5EC5B769F831708E271EDD9B70CB44C10571462F14386A7EF3067C67C3219D53D4311245610B08F18382FA077843D4BE675BE6B0CE6335C49E1F098CCDE4CAB6272D95D5ACDEC45505552AF772D8ACA036DD93444A094EA653E4E1B095D96A254C19359AB0D88DC809BEC145755DFF00D3112991B6161CE5C63F182793822808DE19A36AA23ED80AFB5881FD48FD98562085EDA6E05882324302482A6B6BF89B7194D0E78BDBB6C19CB83D6BDA76B1ADE9156901E635AD67189C8E031239DAF95A7431016763CCE07259B456A6DC85989C98D87B415304B01307C5DA82337AD328F2067539EC8127235D2CA7896B693018A756AF0CB175F0D35FDC87B80A4FB20803295FB0B9F036FD6EF3E60B9F398792B92F0B895E9D17F33AEE322E65B2F9ED957956EBB8C6621D9465FC8DD1B5692CB5548687B426B7D5AAB18544BE5C818F8EF71D657B1EAF8EAB87C5E17375B1CBA3736ECF64B3166E8D64CD2946369A9F72EC632BC8ABA52C52A37074276C6B74048DAEDB9A4B5716AA40E826923466A32BF76258530650EAE8C81B71C440C84911940143349A63E9D62E6B925CAD49751824A7F493C3634B5B31CAE249659155E086D5DB0582B3A24C0C61B777436C46E9E2F197F3497E42C73A655165D7AE7DCAACE0B5EB520EF7CC8A14D806AE13104302B410A5650602B54C12C57D3BF2346ED9BF74AEE312771776EAAD58C264B2278FB8D8B6F2FBB5456C8575ACDC0612D1986308E25C6612DFB74AFA5F02C607F6FA3781E34F7C678F0056C019F0070070339190FF00CF35B42512698A23155DDA6C80ED560003DB43192010094F6372CBC15EA85BD3E722378BF98B40DC4AC6415431BB1E3C33218DB7629BECE1AD585D6C95733AE50761055D84D7523F24DC84C566C781CCC1AB9E46DDEA439DF2581D38EC20760CDDABD7AEB7B1561301558158F23906ACBFCB1A9505212951F9D8B66AA88926343C833E0BC2632EEC7396B42DC9DBC4F9B6B611142DD836348406BDD0B021F664D06930114DA70E23887AE27DB828B79F4D1A9E4353C16D9B1E95AAE55FB4E62CAF2FBDDCCAD2CAFB380C320AC7D9D0A816A61B6327907B8DF4F1B8D5DAB579DD2558F2555F795A6EAF0CF3DE0D4E859B96AB42628D6188B23493306F712554242ABBCBB1DBB4F91C6557462B5A9896D5DAF5EBCF2B92269191C0882AAE080DB84AF940AA090CAB80C5B0183EBEF1787D2F40E0CE30C09322AE06724EAC4C4A9961B5F198EA1426DDAB45F98D9C95BBF62DD980095DAB04C7364494A89F2FF0BDCB9D1F511382B60CAE8DC350CE60F1F6BAE92AD8AB2D398C381B623DB5117D859F6A19D49B3C006264FE5F1B8713F216DB3B06D393E21CA6F78AC53D756D67832994DD198073641E382B595C4E672F84C667C4FF00FB7D4AE52AF9FA492681E2F1E6A4B2B470AD7B6AE3DC9EB16E8EBABD233B8D761F7FD16E371D6314EACEAD6ED7B4E427DE5C33199472CAB5D8BB55CFB35D4AB00C1537CACD8A5E96D4AAD2125A2A93159AC3C7DB7662F2C85FB6642A885886DA1977A873C123CB4C1EBDD2E1D39F4BAD5A799E52239676B30A47BB76EDF1C0BDD958C6A14843DA62570460646C5AD5ACA5AE13D573753EED94AEE3139428C78B1ADB1792BF69D4582AF03F3AE31EED8449441447849327C4A21AF4E7BB63B94761C8EAFA16B166FDEAB7AC63B215F64D8303A4E4156D4B12BEAA388CF5A0CDDA124C1CBD95F13280491396E3620821A7E91F9F2391F8B69E073B4DBAE665D8FC3ED6ED4F2CC10B3571FB7222E8DDACB89122C69DB355DC75D11045DC0E63196C4021840335E93C5BA9A4ACE5F25AAE2F23950B0E023B0B88B16964C5925EB72C20E47C4A1843D77D011C14F6C1229A44CA9615640EB22E63009DA5181552AC0A9270EA415241C8C64631D376977EBDEAF3EDB48B618A9A92C957EBEA856443FF008F1DFD3C97241024FA92A801063624912EF306E198E23BD8BC6BB51D0729B23D48755D6B5ADF4F33B1D838A9454A27505EB6B6A82C85B8443E046A0CD4B6DF702A56F7E268D32EE7F2DAFD4B9B3E097ABB9E837B3169C8165409AC50B3D865C5A9355A35259E0B242484086416D25C4F974F11A0EBB5314BC8E2B59C361ECBD3ED01E3B1B8FAE603E10269B162BD744B260A181305EE3262045B253D78F8F91F61C7E030A9AF171554ABA228AD2B1EA06D5C895CC0F800C8143266488C87E7B8F29EE20486B1F6C8048C49CEF1B98AB2E148CF903900E46304E3C1EA8DB9EA53A35D33DFB8AE15ED083E91482C30895458B650007CBD891D8AF023DA4B857CE1934AB2FBBF8324493C7F528134060FDA8D836328196CFE601E7FCBEBB466417072221127E72315E190D7370ABAC65F7FC35CC754E37C557B180CBDAA18CFE5F93B19DC4E35393C964736D32CDFBD45355D5EA57B554B174DE6193B16A855691B58596FDCBBAA3735EA01A5820DB31F8DC1F146BE902B06981B65932AF75A962263CD941F756D95F9C2E4D910472500C8848B96741D1F863D42EDECE376EC1AA653155F8CD7AF067A9E2C6BEC7B4F12ECFA1D8DB31D2E55D6CB9790D89BB0D83950B2CE4645C240C5B5315744D2E8DE963176C08D40B0CF1A2BF72148E46733EF29DA217646A4672771C03E066BEAFD6AF52AF0AE9C24570F5D03AB6D591A7629244BB64575661B887C05000C9209E86DCE6B9C6542DE3187A1E8D90C1B25B585734AEE5903693594D814DC5EBD8E4C7DAB6D47DB4A2BDA40C0013E1A92196F675CD2388B3395C755571CEAC0DB77AAD7AC2FC480258562402403ED3580B4F16D82248392F52C27C809044044221718E4B6DE55E4FC7E97A2EB6DD96BD895E4BFC075763C6E0F70C9E4ED1EB942E60B50BB7B60A25B1E6C6D8D78A518DC76432FF6E376CBF0ECC5CE56830C1D9372CB716F316BD872E1FE42E3F1B3674DCBBF45DDF1396C7E7F52CC99AAADEA36B6DCF6171D8DC925CB41E48DC1EC53A56ED92AB5B656C69A03D6BD396E5856DD0C32A4E81C05601A37318774C26CC0215704A3E5892A769E976A6BE6094D5BB66C066A8CC999BEC917958E41DC326E656E5C23A02BB4B65972496538378DF537AB118FE32D72940D71B36D58A3DA1558ED58634E1A4B9A0A2069D58ABE5E63E4402B39EA0A0457D6B0388FD4D7A77D3B8C342C46C2EE04C5EC05AAE16D66576B75D6137EDD93A29456C96445189CABE6F5FC657A162C4E46C2EF0C9C2890359758D8BE8FBE815F71EDD3D4644070B224F54A38181BD480C36B1048E4F0467907A1B1EBB294532DA412100B832DCC8638241C1C6465BC71C71C79FE631C75C55A96A614E861378E3FD3F1B729D4B793B2AC8EC0195C72EE5516B86EA578B6DFCE645098916D3C35BCC443E02835CA6CB005CD8FD1F5ECE1E5E311CF3AE54C02724928A1C928DBB57CFB8D531EDE4DDADEB1439070DF8C1322B3B19B2E5ECFDB08CD85D4B4CFB31796E3C69C3180ADADE50373DBEFEA5B9647276B4FE46C650C0E46BE2F114D5446E6A5BCF1CFDDD2CDE337CC1E56E827662A9B5FD857C63F159ED6686D785CEE26F31BB638F788B3F9EA789D1B988B1D90FB2716472FCB5AABF45D5F2EE45A5AEBD7D72EEB790E42B559A55CC9A53B7D6D62B12104736D170D58E2270D3EDE10C1096C9057EA02C9965460405914EDC0249019640772332E18FEBDA1280C669F0338FED4F6954121831ED30528C0A152CAC847318182DE10E0CCFE6333938D1772E39E4AC792156B2F93D7B666EB3570EB9264B9B99ABCA58CE3CCC55A15D61EF58CE7F2C3D7AB09C43F30B689A87D7C75C4DB3EE1EA0358E27CB6571F92CF6F1BDE91A8466B07B46077BA0F9DAF258EA0BC854D975BCA6770D9595064A1965D5B27666B5843ABDC155AAB610BFDB25E9D36BB17143A4ED1C77C9B9315593B983E3DDB1595CDD2A69591B72058CC8D3C43AFE39022476EEE17F9AD7C72C7DEC99D2448B648FF00E1D1A4DED6FF0088670F60F6E0C6A0755DA731B6E51B4B2F87CF62D54357E3BD83771C853CD60AE65B097EB857C657B28B942FDAAF0D918F784C0A0665AC247AC8F5E4891E6855D8BEF8826F50E17283C20C677B7CE48FB7A8E4B5DB86CCCB62195A1AD3CA8AA81262638F219C873C6E0071128C11E7C92AF95779B76FF880F32D3E3AB0AC34E86CAFC49A4E392CF6713731FC158DA5A416B2D859784D1C9961760B687AC7FD2DA7859547B600116A5E9FF9C35ADF58AB393BCAA16B18B0AF99C2DD95D3CC54B758256FAD7124D031B6A7418134BFCB6C12D804C12898CF570BEC2FDCF9E477BCB662961F2F98DBF69DD2CD9C9D9554AD7B2798B390BD7B1DEFD83158D8C92F21753517032566E4A90B096BC04AD9B61E31D5B299EC7EC398A37135B288AFDE7B0B6EDE2F2955B01D0C45FC7B12FF00089FD8358D0990E8D67053DA46A9BE1D58DD30F720B6DDC651C0EF16DACCB81E080BB948009C1186DC4BEFA5EEB51D3E1862936CF56315F9C9DD1F6E32A7FF006120639CFF008EAD8337CD9A1B31D902B76ECEB190C3566291163215C6AE4EA78B212C85ACE00CA4644C4C5CC891F35CF8B44862B4F92F98F6AE66DBD1A771D459755582A8B72E26655126C6415BC835D05EDC2D0100BAEC929961FBEC503025446E9A1E99F8A7255579AD8793372D9B1EA4C3231B95D8E1FDC04C129120B4AACAE067B0EE6CC17731E5D77E224770F681ADE2DF191C3E0ABE0F5BC58CC57442A01F7CA484A1ED232996F978C36099DF94CC1FE665131E98B59002C4232E06E6382EC8B8C642F008E14E396006073C92B37E7B0226B0E1961E542924B487C9E700027071C8539E40E000DC89C7EAE2DCD653462B7F70EDA30B82F302928B172D8BB1B973C9F7E67E7FEBF13DC1F7EE8A9AD299E84E482BCE64F283E92B9DF6159959A75BD436BF8C26BACF418D5E270BF618F4D6AED493451645A9B0703048799082995ACB5ADFA95BD74FA80C117AE6E1FA582D8AA5AA54556B47BCAAAD2B158F69CF51CBE169D6B315C4C48B11195AAFB1302614DC2F6B9A2DAEC1109733CBCBAFABF25F0C598C62755E48DDEA6CF632392BD994B75BBF42E8A51950A78FC6BA7275D497576BCB1677EF8269BABB311616C006DFD26A9A66679540530DB8D4B70733464C79E7C1652493F0DF207499AF4FF566A45180E52C546755C31C4322F700F9C919C2B024E01F3C181711A4D47E7711936F23695A8BAFE2D77D2DB7636CCAB4F65A971D58B1CE56B1A6652F6BD71EE5A1C9B37699631A4C9751CCDB1060562FF50F53BC838ADB76CD0B66E64A1CAD90DC752C5E055B2E56AE476EAB84B7AB7F29AC1695B7ED18AC26C1ABAA86271450BFE4F8EBC9B6BFB5A190B0B364B8054CFEABA4E1E30779FC97532572D662A6471ADD6F03B1153BF50DC82B35AAAF318DC31FDD22DD6B8C5A9CAC5D4AF625B5C98C11125F27D37CDDD739BAA67F40CC3B19B957B6FCB6B594DC35FD6F6BC1B30958D568AB64B5ECBD3C8E2EE5C2702ABDDAB7685CA2E5BEB92A12DAE0D75A87548285DD3D6CDBAFA7559A658EDDB33BCE21AB13B2599DE383BE5CC51069762C4EEC7705562A3152AE817BD4721D3F4BD3A6D5F54B6F155D2E876E2AED62FDA9234A75639EC888277A7EDC3B9A548C1704B0CF3ABFD0347D738EF54C3EABCB3C51CC3B46C34E863EDE3B6BC3EABBE6F78ED9B0394C753C955CB537F14EFBAB6A9AED69BF6B2746AEB4B3DA2DD7AB491952DC3394F3148D0BEA857D4273E73B46E98B4D4CAA70A8ADA8612BAB07AB609F84D4B0E9165F3AF4B56C05E6E6E307862AC69B81469641949B72D5CC902D0EBF6120BEB4E1AFFA3C616A69DA85DACB8582E2EB9AAC0B6A3528AB6442E59A1138025ED12366EDA1500D8106F7A13D6BA7DCB547579FF966A9527920D434E3A069D29A36E27DB3D532ED71276240D1F7048E1F05C3B821BA10FD3FF12EBBCB18AF5056362BF9DA45C5DC17B17286BCBC25AA35556B61C1EC1AD632A56CB8DDC6E44AC62595F2F666C229950BA4D1492AFA44580D1F6C0C7B155BFF007CCFCCFF007EFDB899FEFDCCFE5DF7FEEF99F8F8FA5F4BE935C009010002572480393EE193F9380064FE07E3A758598CD3824901E200124800C0A4803E327938F2793CF5F5FF0092D073F253243FB9FD42C67E3E7B8EFCA627E7F5FAEBF7F527F1CF23EE3C37906EFBC7F96FE4FB558C16CBAA2B28DA74B2074315B6E3B2BAE66E71CABF5DE9A975F88C8DEAE8BA0B97D43B2CB15896FF00160AFA5F5E8495957692304E30718E14F18F1CF3FEFD7360068650C030283208C839DA0E41E0E4120FE4123E7A6260F3D984E56904DF73951646CC2DE292E9F5E02CA8E1C2A0B23E2C5C8F88BA07DB331F1EFC2434B3C05B164B67E21D62F6649569C78EA4C3825F6B22F6165332264731DCCCFE8A26267B8982FCBE97D2FA15A8AA946CAA9FE98F207FAC745B4C27BC064E37818C9C6300E3FCF4566BDA9EBCC7AAECE2A945A28067BF15912D83E8BF21612C8C4BF188F212898EBE2627E7E9ABEACB90F66E2BF4DBBEECBA6594E3F33568D3AD52E1A89C75272569545B65112C181B494B8CAB34BCC56D813203F188FA5F4BEA952550E30AA33B49E0727F27F7FBE896A0CC238C86607DDE09FDFEFF0043ACA4F34AA11C73C69BDF9B1DB5E6773D8724398797B96B12FD5CE84D68C41FC7B23916E445F946DBFBDB4C6D0A514AC5154DD5DD7C6F694BB699ED2A5C05CCB800A962100AF72C38130531272B51008ABC8C88423C648A223A5F4BE8CEA4AA1180000356A1200001386E4E3A55AECC59496248BB60024927036E067CE07C7E3A8FF6D61C6228AC8A4D741E9A75165330B4A2CE4B217DA22212313E56BB6CF97944C94C144C40F8CA18CAC9D772B81D8B14135F2987D971B52BB7CCE56EAF9C4572C82AE27CA17604E7C24266048096B3EE4E24897D2FAC8FD5A48B9A1A03856B9715947DACAEA55958782195995810410483904F5A07A524921166C42EF14F04F4A58268D99258658A65922922914878E48DD55E37460C8EAACA41008D0DE0DBA8F2869DA3721F20F18681B3EDBB4EB22FCB64DF5362C509B31199CCEB4A24D2D7764C3D05CDB4E1032978A6B19B72D90C8B5468A47528535F4BE97D6BBA7D5AB3D0A534D5A09A696A5779259618E492476890B3BBBA967663CB331249E49CF5F57DDB76A1B966186CD88A28AC4B1C51453491C71C6922AA471A2B0544450155540555000000EBFFD9);
/*!40000 ALTER TABLE `t_spieler` ENABLE KEYS */;


--
-- Definition of table `t_teams`
--

DROP TABLE IF EXISTS `t_teams`;
CREATE TABLE `t_teams` (
  `TeamID` varchar(3) NOT NULL,
  `TeamName` varchar(30) NOT NULL,
  `TurnierName` varchar(45) NOT NULL,
  `TurnierPos` varchar(45) NOT NULL,
  `Spieler1` int(10) unsigned DEFAULT NULL,
  `Spieler2` int(10) unsigned DEFAULT NULL,
  `Spieler3` int(10) unsigned DEFAULT NULL,
  `Spieler4` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_teams`
--

/*!40000 ALTER TABLE `t_teams` DISABLE KEYS */;
INSERT INTO `t_teams` (`TeamID`,`TeamName`,`TurnierName`,`TurnierPos`,`Spieler1`,`Spieler2`,`Spieler3`,`Spieler4`) VALUES 
 ('1','Dom Kölsch','','',NULL,NULL,NULL,NULL),
 ('2','Porsche','kc2010','b4',NULL,NULL,NULL,NULL),
 ('3','AC Milan','','',NULL,NULL,NULL,NULL),
 ('4','Volleyball','','',NULL,NULL,NULL,NULL),
 ('5','FSG Abi 2000','','',NULL,NULL,NULL,NULL),
 ('6','Porsche II','','',NULL,NULL,NULL,NULL),
 ('7','Tesa Power','kc2010','b2',NULL,NULL,NULL,NULL),
 ('8','Beck\'s','','',NULL,NULL,NULL,NULL),
 ('9','Deportivo','kc2010','a1',NULL,NULL,NULL,NULL),
 ('10','Sauffpark','kc2010','c6',NULL,NULL,NULL,NULL),
 ('11','Gold Ochsen','','',NULL,NULL,NULL,NULL),
 ('12','Wolfbräu','kc2010','c4',NULL,NULL,NULL,NULL),
 ('13','Küppers Kölsch','','',NULL,NULL,NULL,NULL),
 ('14','Rothaus','kc2010','c5',NULL,NULL,NULL,NULL),
 ('15','Gastrupp','','',NULL,NULL,NULL,NULL),
 ('16','FC Marbach','','',NULL,NULL,NULL,NULL),
 ('17','Ensinger','kc2010','b1',NULL,NULL,NULL,NULL),
 ('18','Früh Kölsch','','',NULL,NULL,NULL,NULL),
 ('19','TNT','','',NULL,NULL,NULL,NULL),
 ('20','Malteser','','',NULL,NULL,NULL,NULL),
 ('21','Captain Choc','','',NULL,NULL,NULL,NULL),
 ('22','Augustiner','','',NULL,NULL,NULL,NULL),
 ('23','Condom Kickers','kc2010','a5',NULL,NULL,NULL,NULL),
 ('24','Mollutz','','',NULL,NULL,NULL,NULL),
 ('25','Sion Kölsch','kc2010','c1',NULL,NULL,NULL,NULL),
 ('26','ABBA','','',NULL,NULL,NULL,NULL),
 ('27','Air Combats','','',NULL,NULL,NULL,NULL),
 ('28','Tipp Kick','','',NULL,NULL,NULL,NULL),
 ('29','Lange Glieder','','',NULL,NULL,NULL,NULL),
 ('30','Sparda Orange','kc2010','c3',NULL,NULL,NULL,NULL),
 ('31','Zechpreller','test_cup','',NULL,NULL,NULL,NULL),
 ('32','Bergmacht','kc2010','a6',NULL,NULL,NULL,NULL),
 ('33','Streuwagen','','',NULL,NULL,NULL,NULL),
 ('34','KSK','','',NULL,NULL,NULL,NULL),
 ('35','Extinguishers','','',NULL,NULL,NULL,NULL),
 ('36','Waldmeister','kc2010','b5',NULL,NULL,NULL,NULL),
 ('37','K und K','','',NULL,NULL,NULL,NULL),
 ('38','Schmoll','','',NULL,NULL,NULL,NULL),
 ('39','Olympiakos','kc2010','a3',NULL,NULL,NULL,NULL),
 ('40','Lok Prellbock','','',NULL,NULL,NULL,NULL),
 ('41','Die drei Fragezeichen','','',NULL,NULL,NULL,NULL),
 ('42','Dynamisches Duo','kc2010','a2',NULL,NULL,NULL,NULL),
 ('43','Hack Men Group','','',NULL,NULL,NULL,NULL),
 ('44','Hulaboys','','',NULL,NULL,NULL,NULL),
 ('45','Dürres Duo','','',NULL,NULL,NULL,NULL),
 ('46','Maggi & Nietzsche','kc2010','b6',NULL,NULL,NULL,NULL),
 ('47','Juventus','','',NULL,NULL,NULL,NULL),
 ('48','Sambuca','','',NULL,NULL,NULL,NULL),
 ('49','Gaffel Kölsch','kc2010','a4',NULL,NULL,NULL,NULL),
 ('h1','Reinz','soccercup2010','',NULL,NULL,NULL,NULL),
 ('h2','Beiselen','soccercup2010','',NULL,NULL,NULL,NULL),
 ('h3','DWEKD','soccercup2010','',NULL,NULL,NULL,NULL),
 ('h4','rubinion','soccercup2010','',NULL,NULL,NULL,NULL),
 ('h5','Fundracer','soccercup2010','',NULL,NULL,NULL,NULL),
 ('50','die wilden Kerle','kc2010','c2',NULL,NULL,NULL,NULL),
 ('51','Oransina','kc2010','b3',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_teams` ENABLE KEYS */;


--
-- Definition of table `tabelle`
--

DROP TABLE IF EXISTS `tabelle`;
CREATE TABLE `tabelle` (
  `TeamName` varchar(30) NOT NULL,
  `Spiele` int(10) unsigned DEFAULT '0',
  `S` int(10) unsigned DEFAULT '0',
  `U` int(10) unsigned DEFAULT '0',
  `N` int(10) unsigned DEFAULT '0',
  `ToreP` int(10) unsigned DEFAULT '0',
  `ToreM` int(10) unsigned DEFAULT '0',
  `Punkte` int(10) unsigned DEFAULT '0',
  `Gruppe` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`TeamName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabelle`
--

/*!40000 ALTER TABLE `tabelle` DISABLE KEYS */;
INSERT INTO `tabelle` (`TeamName`,`Spiele`,`S`,`U`,`N`,`ToreP`,`ToreM`,`Punkte`,`Gruppe`) VALUES 
 ('Bergmacht',0,0,0,0,0,0,0,'b'),
 ('Condom Kickers',0,0,0,0,0,0,0,'c'),
 ('Deportivo',14,0,12,2,0,3,12,'a'),
 ('Dynamisches Duo',1,0,1,0,0,0,1,'b'),
 ('Ensinger',0,0,0,0,0,0,0,'a'),
 ('Gaffel Kölsch',0,0,0,0,0,0,0,'c'),
 ('Hulaboys',3,0,3,0,0,0,3,'a'),
 ('Maggi & Nietzsche',1,0,1,0,0,0,1,'b'),
 ('Olympiakos',0,0,0,0,0,0,0,'c'),
 ('Porsche',12,2,10,0,3,0,16,'a'),
 ('Rothaus',5,1,4,0,1,0,7,'a'),
 ('Sambuca',0,0,0,0,0,0,0,'b'),
 ('Sauffpark',0,0,0,0,0,0,0,'c'),
 ('Sion Kölsch',0,0,0,0,0,0,0,'c'),
 ('Spaten-Jungs',0,0,0,0,0,0,0,'b'),
 ('Tesa Power',4,0,3,1,0,1,3,'a'),
 ('Waldmeister',0,0,0,0,0,0,0,'c'),
 ('Wolfbräu',0,0,0,0,0,0,0,'b');
/*!40000 ALTER TABLE `tabelle` ENABLE KEYS */;


--
-- Definition of table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `TeamID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TeamName` varchar(45) NOT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` (`TeamID`,`TeamName`) VALUES 
 (1,'Deportivo'),
 (2,'Porsche'),
 (3,'Rothaus'),
 (4,'Tesa Power'),
 (5,'Hulaboys'),
 (6,'Ensinger'),
 (7,'Dynamisches Duo'),
 (8,'Maggi & Nietzsche'),
 (9,'Bergmacht'),
 (10,'Spaten-Jungs'),
 (11,'Wolfbräu'),
 (12,'Sambuca'),
 (13,'Condom Kickers'),
 (14,'Sauffpark'),
 (15,'Gaffel Kölsch'),
 (16,'Sion Kölsch'),
 (17,'Waldmeister'),
 (18,'Olympiakos');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;


--
-- Definition of table `turniere`
--

DROP TABLE IF EXISTS `turniere`;
CREATE TABLE `turniere` (
  `TurnierName` varchar(45) NOT NULL,
  `AnzGruppen` int(3) unsigned NOT NULL,
  `AnzTeams` int(3) unsigned NOT NULL,
  `SpieleGruppe` int(1) unsigned DEFAULT NULL,
  `AnzahlPlayOff` int(2) unsigned DEFAULT NULL,
  `PlayOffModus` int(2) unsigned DEFAULT NULL,
  `AnzahlTrost` int(2) unsigned DEFAULT NULL,
  `TrostModus` int(2) unsigned DEFAULT NULL,
  `HalbZeiten` int(1) unsigned NOT NULL,
  `SecProHalbzeit` int(4) unsigned NOT NULL,
  `SecPause` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`TurnierName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `turniere`
--

/*!40000 ALTER TABLE `turniere` DISABLE KEYS */;
INSERT INTO `turniere` (`TurnierName`,`AnzGruppen`,`AnzTeams`,`SpieleGruppe`,`AnzahlPlayOff`,`PlayOffModus`,`AnzahlTrost`,`TrostModus`,`HalbZeiten`,`SecProHalbzeit`,`SecPause`) VALUES 
 ('cup01',2,5,1,0,0,0,0,2,600,55),
 ('foxcup',3,8,1,0,0,0,0,1,555,55),
 ('Kölsch Cup 2009',3,6,1,16,0,2,0,1,600,60),
 ('pinkcup',2,4,1,4,1,0,0,2,300,60),
 ('soccercup2010',1,5,1,0,0,0,0,1,62,0),
 ('suicidecup',2,4,1,4,1,0,0,2,300,60);
/*!40000 ALTER TABLE `turniere` ENABLE KEYS */;


--
-- Definition of view `foxcup_v_spl`
--

DROP TABLE IF EXISTS `foxcup_v_spl`;
DROP VIEW IF EXISTS `foxcup_v_spl`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foxcup_v_spl` AS select `t1`.`TeamName` AS `TeamA`,`t2`.`TeamName` AS `TeamB`,`s`.`SpielID` AS `SpielID`,`s`.`Team1` AS `Team1`,`s`.`Team2` AS `Team2`,`s`.`Tore1` AS `Tore1`,`s`.`Tore2` AS `Tore2`,`s`.`X` AS `X`,`s`.`Art` AS `Art` from ((`t_teams` `t1` join `t_teams` `t2`) join `foxcup_spl` `s`) where ((`t1`.`TeamID` = convert(`s`.`Team1` using utf8)) and (`t2`.`TeamID` = convert(`s`.`Team2` using utf8)));

--
-- Definition of view `foxcup_v_tbl`
--

DROP TABLE IF EXISTS `foxcup_v_tbl`;
DROP VIEW IF EXISTS `foxcup_v_tbl`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `foxcup_v_tbl` AS select `t1`.`TeamID` AS `TeamID`,`t1`.`TeamName` AS `TeamName`,`t2`.`Gruppe` AS `Gruppe`,`t2`.`S` AS `S`,`t2`.`U` AS `U`,`t2`.`N` AS `N`,`t2`.`ToreP` AS `ToreP`,`t2`.`ToreM` AS `ToreM`,`t2`.`Punkte` AS `Punkte`,`t2`.`Status` AS `Status` from (`t_teams` `t1` join `foxcup_tbl` `t2`) where (`t1`.`TeamID` = `t2`.`TeamID`);

--
-- Definition of view `kc2010_v_spl`
--

DROP TABLE IF EXISTS `kc2010_v_spl`;
DROP VIEW IF EXISTS `kc2010_v_spl`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kc2010_v_spl` AS select `t1`.`TeamName` AS `TeamA`,`t2`.`TeamName` AS `TeamB`,`s`.`SpielID` AS `SpielID`,`s`.`Team1` AS `Team1`,`s`.`Team2` AS `Team2`,`s`.`Tore1` AS `Tore1`,`s`.`Tore2` AS `Tore2`,`s`.`X` AS `X`,`s`.`Gruppe` AS `Gruppe` from ((`t_teams` `t1` join `t_teams` `t2`) join `kc2010_spl` `s`) where ((`t1`.`TurnierPos` = convert(`s`.`Team1` using utf8)) and (`t2`.`TurnierPos` = convert(`s`.`Team2` using utf8))) order by `s`.`SpielID`;

--
-- Definition of view `kc2010_v_tbl`
--

DROP TABLE IF EXISTS `kc2010_v_tbl`;
DROP VIEW IF EXISTS `kc2010_v_tbl`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kc2010_v_tbl` AS select `t1`.`TeamID` AS `TeamID`,`t1`.`TeamName` AS `TeamName`,`t2`.`Team1` AS `Team1`,`t2`.`Gruppe` AS `Gruppe`,`t2`.`Spiele` AS `Spiele`,`t2`.`S` AS `S`,`t2`.`U` AS `U`,`t2`.`N` AS `N`,`t2`.`ToreP` AS `ToreP`,`t2`.`ToreM` AS `ToreM`,`t2`.`Punkte` AS `Punkte`,`t2`.`Status` AS `Status` from (`t_teams` `t1` join `kc2010_tbl` `t2`) where (`t1`.`TurnierPos` = convert(`t2`.`Team1` using utf8)) order by `t2`.`Gruppe`;

--
-- Definition of view `soccercup2010_v_spl`
--

DROP TABLE IF EXISTS `soccercup2010_v_spl`;
DROP VIEW IF EXISTS `soccercup2010_v_spl`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `soccercup2010_v_spl` AS select `t1`.`TeamName` AS `TeamA`,`t2`.`TeamName` AS `TeamB`,`s`.`SpielID` AS `SpielID`,`s`.`Team1` AS `Team1`,`s`.`Team2` AS `Team2`,`s`.`Tore1` AS `Tore1`,`s`.`Tore2` AS `Tore2`,`s`.`X` AS `X`,`s`.`Gruppe` AS `Gruppe` from ((`t_teams` `t1` join `t_teams` `t2`) join `soccercup2010_spl` `s`) where ((`t1`.`TeamID` = convert(`s`.`Team1` using utf8)) and (`t2`.`TeamID` = convert(`s`.`Team2` using utf8)));

--
-- Definition of view `soccercup2010_v_tbl`
--

DROP TABLE IF EXISTS `soccercup2010_v_tbl`;
DROP VIEW IF EXISTS `soccercup2010_v_tbl`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `soccercup2010_v_tbl` AS select `t1`.`TeamID` AS `TeamID`,`t1`.`TeamName` AS `TeamName`,`t2`.`Gruppe` AS `Gruppe`,`t2`.`S` AS `S`,`t2`.`U` AS `U`,`t2`.`N` AS `N`,`t2`.`ToreP` AS `ToreP`,`t2`.`ToreM` AS `ToreM`,`t2`.`Punkte` AS `Punkte`,`t2`.`Status` AS `Status` from (`t_teams` `t1` join `soccercup2010_tbl` `t2`) where (`t1`.`TeamID` = convert(`t2`.`TeamID` using utf8));

--
-- Definition of view `view_kc09_spiele`
--

DROP TABLE IF EXISTS `view_kc09_spiele`;
DROP VIEW IF EXISTS `view_kc09_spiele`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kc09_spiele` AS select `t1`.`TeamName` AS `TeamA`,`t2`.`TeamName` AS `TeamB`,`s`.`SpielID` AS `SpielID`,`s`.`Team1` AS `Team1`,`s`.`Team2` AS `Team2`,`s`.`Tore1` AS `Tore1`,`s`.`Tore2` AS `Tore2`,`s`.`X` AS `X`,`s`.`Art` AS `Art` from ((`teams` `t1` join `teams` `t2`) join `kc09_spiele` `s`) where ((`t1`.`TeamID` = `s`.`Team1`) and (`t2`.`TeamID` = `s`.`Team2`));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
