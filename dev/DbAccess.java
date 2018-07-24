package dev;
import java.io.File;
import java.sql.*;
import javax.swing.JOptionPane;

public class DbAccess 
{
	static String 	strHost;
	static String 	strPort;
	static String 	strBase;
	static String 	strUser;
	static String 	strPass;
	SystemOut		sout	= new SystemOut();
	
	public void init()
	{		
		readConfig();
		testPing();
		connect();
	}
	public void readConfig()
	{
		//Pfade	
		String				strWorkDir  		= System.getProperty("user.dir");
		String				sep 				= File.separator;

		//Config-Datei lesen
		FileOpen myFileOpen = new FileOpen();
		try
		{
			String strConfig = myFileOpen.ReadFileContents(strWorkDir + sep + "Config" + sep + "config.txt");
			int intBeg = strConfig.indexOf("HOST=");
			int intEnd = strConfig.indexOf(";");
			strHost = strConfig.substring(intBeg + 5, intEnd);
			sout.println(8, "strHost: " + strHost);

			intBeg = strConfig.indexOf("PORT=");
			intEnd = strConfig.indexOf(";", intBeg + 1);
			strPort = strConfig.substring(intBeg + 5, intEnd);
			sout.println(8, "strPort: " + strPort);
			
			intBeg = strConfig.indexOf("BASE=");
			intEnd = strConfig.indexOf(";", intBeg + 1);
			strBase = strConfig.substring(intBeg + 5, intEnd);
			sout.println(8, "strBase: " + strBase);
			
			intBeg = strConfig.indexOf("USER=");
			intEnd = strConfig.indexOf(";", intBeg + 1);
			strUser = strConfig.substring(intBeg + 5, intEnd);
			sout.println(8, "strUser: " + strUser);
			
			intBeg = strConfig.indexOf("PASS=");
			intEnd = strConfig.indexOf(";", intBeg + 1);
			strPass = strConfig.substring(intBeg + 5, intEnd);
			sout.println(8, "strPass: " + strPass);
		}
		catch (Exception e)
		{
//			System.err.println("DbAccess.readConfig(): " + e.toString());
			sout.println(2, "DbAccess.readConfig(): " + e.toString());
		}
	}
	public void testPing()
	{
		//Testen, ob DB installiert ist
		//Ping ok?
		Ping myPing = new Ping();
		String strReturn = myPing.ping(strHost);
		if(!strReturn.equals("ok"))
		{
			JOptionPane.showMessageDialog
			(	
					null, 
					"Zielrechner nicht erreichbar, bitte Config-Datei anpassen oder Verbindung herstellen!", 
					"Achtung!", 
					JOptionPane.ERROR_MESSAGE
			);
		}
	}
	public String fireSQL(String mytodo)
	{
		String todo = mytodo;
		sout.println(4, "DbAccess.freSQL(): " + todo);
		java.sql.Connection conn = connect();
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
		}
		catch (Exception e) 
		{
        	sout.println(3, "DbAccess.fireSQL(): \n " + todo + "\n" + e);
        	return("Fehler!");
		}
		return (todo);
	}
	public ResultSet fireSQL_RS(String mytodo)
	{
		String todo = mytodo;
//		sout.println(6, "DbAccess.fireRS(): " + todo);
		java.sql.Connection conn = connect();
		ResultSet r = null; //Initialisiert für return
		try 
		{
			java.sql.Statement s = conn.createStatement();
        	r = s.executeQuery(todo);
       		return r;
		}
		catch (Exception e) 
		{
			sout.println(3, "DbAccess.fireSQL_RS:\n" + todo + "\n" + e);
		}
		return r;
	}
	public String create(String myScheme,
						 String myTable,
						 String myLike)
	{
		String table	= myTable;
		String scheme	= myScheme;
		String like		= myLike;
		
		java.sql.Connection conn = connect();
		String todo = ("CREATE TABLE IF NOT EXISTS " + scheme + "." + table + " LIKE " + scheme + "." + like + ";");
		sout.println(6, "DbAccess.create(): " + todo);
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
		}
		catch (Exception e) 
		{
        	sout.println(3, "DbAccess.create():\n " + todo + "\n" + e);
        	return("Fehler!");
		}
		return (todo);
	}
	public String insert(String myScheme, 
			             String myTable, 
			             String myColumns, 
			             String myValues) 
	{
		String scheme  = myScheme;
		String table   = myTable;
		String columns = myColumns;
		String values  = myValues;
		
		java.sql.Connection conn = connect();
		String todo = ( "INSERT INTO " + scheme + "." + table + " " +
					    "(" + columns + ") VALUES (" + values + ");" );
		sout.println(6, "DbAccess.insert(): " + todo);
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
			sout.println(5, "DbAccess.insert()\n " + todo + "\n" + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String select(String myScheme, String myTable, String myColumns, String myCrit) 
	{
		String scheme  = myScheme;
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		java.sql.Connection conn = connect();
		String todo = ("SELECT " + columns + " " +
        		       "FROM " + scheme + "." + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.select(): " + todo);
		try 
		{
    	  	java.sql.Statement s = conn.createStatement();
        	java.sql.ResultSet r = s.executeQuery(todo);
        	while(r.next()) 
        	{
        		return(r.getString(columns));        	
           	}
        }
        catch (Exception e) 
        {
        	sout.println(3, "DbAccess.select():\n" + todo + "\n" + e);
        	return("Fehler!");
        }
        return(todo);
	}
	public String selectCOUNT(String myScheme, String myTable, String myColumns, String myCrit) 
	{
		String scheme  = myScheme;
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		java.sql.Connection conn = connect();
		String todo = ("SELECT COUNT(" + columns + ") AS Anzahl " +
        		       "FROM " + scheme + "." + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.selectCOUNT(): " + todo);
		try 
		{
    	  	java.sql.Statement s = conn.createStatement();
        	java.sql.ResultSet r = s.executeQuery(todo);
        	while(r.next()) 
        	{
        		return(r.getString("Anzahl"));
           	}
        }
        catch (Exception e) 
        {
        	sout.println(3, "DbAccess.selectCOUNT():\n" + todo + "\n" + e);
        	return("Fehler!");
        }
        return(todo);
	}
	public ResultSet getSet(String myScheme, String myTable, String myColumns, String myCrit) 
	{
		String scheme  = myScheme;
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		java.sql.Connection conn = connect();
		String todo = ("SELECT " + columns + " " +
        		       "FROM " + scheme + "." + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.getSet(): " + todo);
		ResultSet r = null; //Initialisiert für return
		try 
		{
			java.sql.Statement s = conn.createStatement();
        	r = s.executeQuery(todo);
       		return r;
		}
		catch (Exception e) 
		{
			sout.println(3, "Fehler beim SELECT:\n" + todo + "\n" + e);
		}
		return r;
	}
	public String update(String mySchema, String myTable, String myValues, String myCrit) 
	{
		String schema  = mySchema;
		String table   = myTable;
		String values  = myValues;
		String crit    = myCrit;
		
		java.sql.Connection conn = connect();
		String todo = ( "UPDATE " + schema + "." + table + " " +
					    "SET " + values + " " +
					    "WHERE " + crit + ";");
		sout.println(6, "DbAccess.update(): " + todo);
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
		}
		catch (Exception e) 
		{
			sout.println(3, "DbAccess.update():\n" + todo + "\n" + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String delete(String mySchema, String myTable, String myCrit) 
	{
		String schema  = mySchema;
		String table   = myTable;
		String crit    = myCrit;
		
		java.sql.Connection conn = connect();
		String todo = ( "DELETE FROM " + schema + "." + table + " " +
					    "WHERE " + crit + ";");
		sout.println(6, todo);
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
		}
		catch (Exception e) 
		{
			sout.println(3, "DbAccess.delete():\n" + todo + "\n" + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String dropTable(String mySchema, String myTable)
	{
		String schema  = mySchema;
		String table   = myTable;

		java.sql.Connection conn = connect();
		String todo = ( "DROP TABLE IF EXISTS " + schema + "." + table + ";");
		sout.println(6, todo);
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
		}
		catch (Exception e) 
		{
			sout.println(3, "DbAccess.dropTable():\n" + todo + "\n" + e);
        	return("Fehler!");
		}
        return (todo);
	}
	private static java.sql.Connection connect()
	{
		java.sql.Connection conn = null;
        try 
        {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        }
        catch (Exception e) 
        {
        	System.err.println ("DbAccess.connect(): Treiber \n" + e);
        }
        try 
        {
        	conn = java.sql.DriverManager.getConnection("jdbc:mysql://" + strHost + ":" + strPort + "/" + strBase + "?user=" + strUser + "&password=" + strPass);
			conn.setAutoCommit(false);
        }
        catch (Exception e) 
        {
        	System.err.println ("DbAccess.connect(): Verbindung \n" + conn + "\n" + e);
        }
        return conn;
	}
	//Default-Operationen Konstruktion
	public void createOMatDB()
	{
		try
		{
			fireSQL("CREATE DATABASE IF NOT EXISTS " + strBase);
			fireSQL("USE " + strBase);
			sout.println(3, "DbAccess.createOMatDB(): erfolgreich beendet!");
		}
		catch(Exception e)
		{
			sout.println(3, "DbAccess.createOMatDB(): Mit Fehler abgebrochen! " + e);
		}
	}
	public void createOMatTables()
	{
		try
		{
			//Neue Version Spiele (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spiele` ( " +
					"`SpielID` int(4) NOT NULL AUTO_INCREMENT, " +
					"`Jahr` int(4) NOT NULL DEFAULT '0', " +
					"`Art` char(1) NOT NULL DEFAULT '', " +
					"`Team1` int(3) NOT NULL DEFAULT '0', " +
					"`Team2` int(3) NOT NULL DEFAULT '0', " +
					"`Tore1` int(2) NOT NULL DEFAULT '0', " +
					"`Tore2` int(2) NOT NULL DEFAULT '0', " +
					"`Team1Sp1` int(3) NOT NULL DEFAULT '0', " +
					"`Team1Sp2` int(3) NOT NULL DEFAULT '0', " +
					"`Team2Sp1` int(3) NOT NULL DEFAULT '0', " +
					"`Team2Sp2` int(3) NOT NULL DEFAULT '0', " +
					"`S` int(1) NOT NULL DEFAULT '0', " +
					"`U` int(1) NOT NULL DEFAULT '0', " +
					"`N` int(1) NOT NULL DEFAULT '0', " +
					"`Kommentar` char(1) NOT NULL, " +
					"PRIMARY KEY (`SpielID`) USING BTREE " +
					") ENGINE=MyISAM DEFAULT CHARSET=utf8;"); 

			//Neue Version Tabelle (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tabelle` ( " +
					"`ID` int(3) NOT NULL AUTO_INCREMENT, " +
					"`Jahr` int(4), " +
					"`Platz` int(2), " +
					"`TeamID` int(3) NOT NULL, " +
					"`Spieler1` int(3), " +
					"`Spieler2` int(3), " +
					"`Spieler3` int(3), " +
					"`Spiele` int(3) DEFAULT '0', " +
					"`Siege` int(3) DEFAULT '0', " +
					"`Unentschieden` int(3) DEFAULT '0', " +
					"`Niederlagen` int(3) DEFAULT '0', " +
					"`Punkte` int(3) DEFAULT '0', " +
					"`ToreP` int(3) DEFAULT '0', " +
					"`ToreM` int(3) DEFAULT '0', " +
					" PRIMARY KEY (`ID`) USING BTREE " +
					") ENGINE=MyISAM DEFAULT CHARSET=utf8;");
			
			//Neue Version Teams (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_teams` ( " +
					"`TeamID` int(3) NOT NULL AUTO_INCREMENT, " +
					"`Name` varchar(30) NOT NULL DEFAULT '', " +
					"PRIMARY KEY (`TeamID`) USING BTREE " +
					") ENGINE=MyISAM DEFAULT CHARSET=utf8;");
			
			//NEU: Spieler für Spieler-Info (z. B. Club 1.000 oder letzter Schütze)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spieler` ( " +
					"`SpielerID` int(3) NOT NULL AUTO_INCREMENT, " +
					"`Name` varchar(30) NOT NULL DEFAULT '', " +
					"`Vorname` varchar(30) NOT NULL DEFAULT '', " +
					"`Nickname` varchar(30) NOT NULL DEFAULT '', " +
					"PRIMARY KEY (`SpielerID`) USING BTREE " +
					") ENGINE=MyISAM DEFAULT CHARSET=utf8;");

			//OMat Spielbericht
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spielbericht` ( " +
					"`ID` int(10) unsigned NOT NULL AUTO_INCREMENT, " +
					"`SpielZeit` varchar(5) DEFAULT NULL, " +
					"`ToreA` int(3) unsigned DEFAULT NULL, " +
					"`ToreB` int(3) unsigned DEFAULT NULL, " +
					"`Team` varchar(45) DEFAULT NULL, " +
					"`Spieler` varchar(45) DEFAULT NULL, " +
					"`Event` varchar(45) DEFAULT NULL, " +
					"PRIMARY KEY (`ID`) " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
			
			//OMat: Torschützen-Anzeige
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tore` ( " +
					"`Spieler` varchar(30) NOT NULL, " +
					"`Team` varchar(30) NOT NULL, " +
					"`Tore` int(10) unsigned NOT NULL, " +
					"PRIMARY KEY (`Spieler`,`Team`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
			
			//OMat: Turnierverwaltung
			fireSQL("CREATE TABLE IF NOT EXISTS `__turniere` ( " +
					"`TurnierName` varchar(45) NOT NULL, " +
					"`AnzGrupp` int(3) unsigned NOT NULL, " +
					"`AnzTeams` int(3) unsigned NOT NULL, " +
					"`AnzPerio` int(1) unsigned NOT NULL, " +
					"`DauerSek` int(4) unsigned NOT NULL, " +
					"`aktiv` tinyint(1) NOT NULL, " +
					"`KCMode` tinyint(1) NOT NULL, " +
					"`Schuet` tinyint(1) NOT NULL, " +
					"PRIMARY KEY (`TurnierName`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");

			//TODO: OMat: Teams --> muss obsolet werden!
			fireSQL("CREATE TABLE IF NOT EXISTS `__teams` ( " +
					"`TeamID` varchar(3) NOT NULL, " +
					"`TeamName` varchar(30) NOT NULL, " +
					"`TurnierName` varchar(45) NOT NULL, " +
					"`TurnierPos` varchar(45) NOT NULL, " +					//--> wird evtl. nicht benötigt
					"PRIMARY KEY (`TeamID`) " +
					") ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;");

			create(strBase, "default_spl", "_tpl_spielplan");
			create(strBase, "default_tbl", "_tpl_tabelle");
			create(strBase, "default_tms", "_tpl_teams");
			create(strBase, "default_tor", "_tpl_tore");
			insert(strBase, "_turniere", "TurnierName, AnzGrupp, AnzTeams, AnzPerio, DauerSek, aktiv", "'default', 1, 4, 1, 300, 1");
			sout.println(3, "DbAccess.createOMatTables(): erfolgreich beendet!");
		}
		catch(Exception e)
		{
			sout.println(3, "DbAccess.createOMatTables(): mit Fehlern abgebrochen! " + e);
		}
	}
	public void createOMatViews(String strTournamentName)
	{
		try
		{
			//Neue Version v_<Name>_spl
			fireSQL("CREATE OR REPLACE VIEW " + strBase + ".v_" + strTournamentName + "_spl " +
				"AS SELECT " +
				"`s`.`SpielID` AS `SpielID`, " +
				"`s`.`Jahr` AS `Jahr`, " +
				"`s`.`Art` AS `Art`, " +
				"`t_one`.`Name` AS `Team1Nm`, " +
				"`s`.`Team1` AS `Team1ID`, " +
				"`t_two`.`Name` AS `Team2Nm`, " +
				"`s`.`Team2` AS `Team2ID`, " +
				"`s`.`Tore1` AS `Tore1`, " +
				"`s`.`Tore2` AS `Tore2`, " +
				"`n_one`.`Vorname` AS `Team1Sp1Vor`, " +
				"`n_one`.`Nickname` AS `Team1Sp1Nic`, " +
				"`n_one`.`Name` AS `Team1Sp1Nac`, " +
				"`s`.`Team1Sp1` AS `Team1Sp1`, " +
				"`n_two`.`Vorname` AS `Team1Sp2Vor`, " +
				"`n_two`.`Nickname` AS `Team1Sp2Nic`, " +
				"`n_two`.`Name` AS `Team1Sp2Nac`, " +
				"`s`.`Team1Sp2` AS `Team1Sp2`, " +
				"`n_thr`.`Vorname` AS `Team2Sp1Vor`, " +
				"`n_thr`.`Nickname` AS `Team2Sp1Nic`, " +
				"`n_thr`.`Name` AS `Team2Sp1Nac`, " +
				"`s`.`Team2Sp1` AS `Team2Sp1`, " +
				"`n_fou`.`Vorname` AS `Team2Sp2Vor`, " +
				"`n_fou`.`Nickname` AS `Team2Sp2Nic`, " +
				"`n_fou`.`Name` AS `Team2Sp2Nac`, " +
				"`s`.`Team2Sp2` AS `Team2Sp2`, " + 
				"`s`.`Kommentar` AS `Kommentar` "  +
				"from " + 
				"((((((`spiele` `s` " + 
				"join `teams` `t_one` on (`t_one`.`TeamID` = `s`.`Team1`)) " +
				"join `teams` `t_two` on (`t_two`.`TeamID` = `s`.`Team2`)) " + 
				"join `spieler` `n_one` on (`n_one`.`SpielerID` = `s`.`Team1Sp1`)) " +
				"join `spieler` `n_two` on (`n_two`.`SpielerID` = `s`.`Team1Sp2`)) " +
				"join `spieler` `n_thr` on (`n_thr`.`SpielerID` = `s`.`Team2Sp1`)) " +
				"join `spieler` `n_fou` on (`n_fou`.`SpielerID` = `s`.`Team2Sp2`)) " +
				"ORDER BY SpielID; ") ;

			//Neue Version v_<Name>_tbl
			fireSQL("CREATE OR REPLACE VIEW " + strBase + ".v_" + strTournamentName + "_tbl " + 
				"AS SELECT " + 
				"`t`.`ID` AS `ID`, " +
				"`t`.`Jahr` AS `Jahr`, " +
				"`t`.`Platz` AS `Platz`, " +
				"`n`.`Name` AS `TeamName`, " +
				"`t`.`TeamID` AS `TeamID`, " +
				"`n_one`.`Vorname` AS `Sp1Vor`, " +
				"`n_one`.`Nickname` AS `Sp1Nic`, " +
			    "`n_one`.`Name` AS `Sp1Nac`, " +
			    "`t`.`Spieler1` AS `Spieler1`, " +
			    "`n_two`.`Vorname` AS `Sp2Vor`, " +
			    "`n_two`.`Nickname` AS `Sp2Nic`, " +
			    "`n_two`.`Name` AS `Sp2Nac`, " +
			    "`t`.`Spieler2` AS `Spieler2`, " +
			    "`n_thr`.`Vorname` AS `Sp3Vor`, " +
			    "`n_thr`.`Nickname` AS `Sp3Nic`, " +
			    "`n_thr`.`Name` AS `Sp3Nac`, " +
			    "`t`.`Spieler3` AS `Spieler3`, " +
			    "`t`.`Spiele` AS `Spiele`, " +
			    "`t`.`Siege` AS `S`, " +
			    "`t`.`Unentschieden` AS `U`, " +
			    "`t`.`Niederlagen` AS `N`, " +
			    "`t`.`Punkte` AS `Punkte`, " +
			    "`t`.`ToreP` AS `ToreP`, " +
			    "`t`.`ToreM` AS `ToreM` " +
			    "from " + 
			    "((((`tabelle` `t` " +
			    "join `teams` `n` on (`n`.`TeamID` = `t`.`TeamID`)) " +
			    "left join `spieler` `n_one` on (`n_one`.`SpielerID` = `t`.`Spieler1`)) " + 
			    "left join `spieler` `n_two` on (`n_two`.`SpielerID` = `t`.`Spieler2`)) " +
			    "left join `spieler` `n_thr` on (`n_thr`.`SpielerID` = `t`.`Spieler3`)) " +
			    "order by `t`.`ID`;");
			sout.println(3, "DbAccess.createOMatViews(): erfolgreich beendet!");
		}
		catch(Exception e)
		{
			sout.println(3, "DbAccess.createOMatViews(): mit Fehlern abgebrochen! " + e);
		}
	}
	public void createDefaultGroup()
	{
		String strTeam1 = new String("'Deutschland'");
		String strTeam2 = new String("'England'");
		String strTeam3 = new String("'Schweden'");
		String strTeam4 = new String("'Italien'");

		insert(strBase, "default_tms", "TeamID, TeamName", "'1', " + strTeam1 + ")";
		insert(strBase, "default_tms", "TeamID, TeamName", "'2', " + strTeam2 + ")";
		insert(strBase, "default_tms", "TeamID, TeamName", "'3', " + strTeam3 + ")";
		insert(strBase, "default_tms", "TeamID, TeamName", "'4', " + strTeam4 + ")"; 

		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 1");
		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 2");
		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 3");
		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 4");	
	}
}
