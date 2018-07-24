package stage_mysql;
import java.io.File;
import java.sql.*;
import javax.swing.JOptionPane;

public class DbAccess
{
	int				intDebugLvl;
	static String 	strHost;
	static String 	strPort;
	static String 	strBase;
	static String 	strUser;
	static String 	strPass;
	SystemOut		sout;
	
	public DbAccess(int intDebugLvl)
	{
		this.intDebugLvl	= intDebugLvl;
		sout				= new SystemOut(intDebugLvl);
		sout.println(7, "DbAccess(Konstruktor) gerufen...");
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
		try
		{
			String strConfig = FileOpen.ReadFileContents(strWorkDir + sep + "Config" + sep + "config_mysql.txt");
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
			sout.println(1, "DbAccess.readConfig(): " + e.toString());
		}
	}
	public void testPing()
	{
		//Testen, ob DB installiert ist
		String strReturn = Ping.ping(strHost);
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
		else
		{
			sout.println(8, "Ping ok!");
		}
	}
	public String fireSQL(String mytodo)
	{
		String todo = mytodo;
		sout.println(6, "DbAccess.freSQL(): " + todo);
		Connection conn = connect();
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
		}
		catch (Exception e) 
		{
        	sout.println(1, "DbAccess.fireSQL(): " + todo + "\n --> " + e);
        	return("Fehler!");
		}
		return (todo);
	}
	public ResultSet fireSQL_RS(String mytodo)
	{
		String todo = mytodo;
		Connection conn = connect();
		ResultSet r = null; //Initialisiert für return
		sout.println(6, "DbAccess.fireSQL_RS(): " + todo);
		try 
		{
			Statement s = conn.createStatement();
        	r = s.executeQuery(todo);
       		return r;
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.fireSQL_RS(): " + todo + "\n --> " + e);
		}
		return r;
	}
	public String create(String myTable,
						 String myLike)
	{
		String table	= myTable;
		String like		= myLike;
		
		Connection conn = connect();
		String todo = ("CREATE TABLE IF NOT EXISTS " + strBase + "." + table + " LIKE " + strBase + "." + like + ";");
		sout.println(6, "DbAccess.create(): " + todo);
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
		}
		catch (Exception e) 
		{
        	sout.println(1, "DbAccess.create(): " + todo + "\n --> " + e);
        	return("Fehler!");
		}
		return (todo);
	}
	public String insert(String myTable, 
			             String myColumns, 
			             String myValues) 
	{
		String table   = myTable;
		String columns = myColumns;
		String values  = myValues;
		
		Connection conn = connect();
		String todo = ( "INSERT INTO " + strBase + "." + table + " " +
					    "(" + columns + ") VALUES (" + values + ");" );
		sout.println(6, "DbAccess.insert(): " + todo);
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.insert(): " + todo + "\n --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String select(String myTable, String myColumns, String myCrit) 
	{
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		Connection conn = connect();
		String todo = ("SELECT " + columns + " " +
        		       "FROM " + strBase + "." + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.select(): " + todo);
		try 
		{
    	  	Statement s = conn.createStatement();
        	ResultSet r = s.executeQuery(todo);
        	while(r.next()) 
        	{
        		return(r.getString(columns));        	
           	}
        }
        catch (Exception e) 
        {
        	sout.println(1, "DbAccess.select(): " + todo + "\n --> " + e);
        	return("Fehler!");
        }
        return(todo);
	}
	public String selectCOUNT(String myTable, String myColumns, String myCrit) 
	{
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		Connection conn = connect();
		String todo = ("SELECT COUNT(" + columns + ") AS Anzahl " +
        		       "FROM " + strBase + "." + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.selectCOUNT(): " + todo);
		try 
		{
    	  	Statement s = conn.createStatement();
        	ResultSet r = s.executeQuery(todo);
        	while(r.next()) 
        	{
        		return(r.getString("Anzahl"));
           	}
        }
        catch (Exception e) 
        {
        	sout.println(1, "DbAccess.selectCOUNT(): " + todo + "\n --> " + e);
        	return("Fehler!");
        }
        return(todo);
	}
	public ResultSet getSet(String myTable, String myColumns, String myCrit) 
	{
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		Connection conn = connect();
		String todo = ("SELECT " + columns + " " +
        		       "FROM " + strBase + "." + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.getSet(): " + todo);
		ResultSet r = null; //Initialisiert für return
		try 
		{
			Statement s = conn.createStatement();
        	r = s.executeQuery(todo);
       		return r;
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.getSet (" + todo + ") \n --> " + e);
		}
		return r;
	}
	public String update(String myTable, String myValues, String myCrit) 
	{
		String table   = myTable;
		String values  = myValues;
		String crit    = myCrit;
		
		Connection conn = connect();
		String todo = ( "UPDATE " + strBase + "." + table + " " +
					    "SET " + values + " " +
					    "WHERE " + crit + ";");
		sout.println(6, "DbAccess.update(): " + todo);
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.update(): " + todo + "\n --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String delete(String myTable, String myCrit) 
	{
		String table   = myTable;
		String crit    = myCrit;
		
		Connection conn = connect();
		String todo = ( "DELETE FROM " + strBase + "." + table + " " +
					    "WHERE " + crit + ";");
		sout.println(6, todo);
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
		}
		catch (Exception e) 
		{
			sout.println(3, "DbAccess.delete(): " + todo + "\n --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String dropTable(String mySchema, String myTable)
	{
		String schema  = mySchema;
		String table   = myTable;

		Connection conn = connect();
		String todo = ( "DROP TABLE IF EXISTS " + schema + "." + table + ";");
		sout.println(6, "DbAccess.dropTable(): " + todo);
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.dropTable(): " + todo + "\n --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	private static Connection connect()
	{
		Connection conn = null;
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
        	System.err.println ("DbAccess.connect(): Verbindung \n" + conn + "\n  --> " + e);
        }
        return conn;
	}
	//Default-Operationen Konstruktion
	/**
	 * @deprecated: macht keinen Sinn, weil DB manuell angelegt werden muss, siehe Config
	 */
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
			sout.println(3, "DbAccess.createOMatDB(): Mit Fehler abgebrochen! \n  --> " + e);
		}
	}
	public void createOMatTables(String strTournamentName)
	{
//		create(strTournamentName + "_spb", "_tpl_spb");
		create(strTournamentName + "_spl", "_tpl_spl");
//		create(strTournamentName + "_spr", "_tpl_spr");
		create(strTournamentName + "_tbl", "_tpl_tbl");
//		create(strTournamentName + "_tms", "_tpl_tms");
//		create(strTournamentName + "_tor", "_tpl_tor");
	}
	public void createDefaultTables()
	{
		try
		{
			//OMat Spielbericht
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spb` ( " +
					"`ID` int(10) unsigned NOT NULL AUTO_INCREMENT, " +
					"`SpielZeit` varchar(5) DEFAULT NULL, " +
					"`ToreA` int(3) DEFAULT NULL, " +
					"`ToreB` int(3) DEFAULT NULL, " +
					"`Team` varchar(45) DEFAULT NULL, " +
					"`Spieler` varchar(45) DEFAULT NULL, " +
					"`Event` varchar(45) DEFAULT NULL, " +
					"PRIMARY KEY (`ID`) " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
			
			//Neue Version Spiele (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spl` ( " +
					"`SpielID` int(4) AUTO_INCREMENT, " +
					"`Gruppe` varchar(1) DEFAULT 'a', " +
					"`Team1Sp1` varchar(20), " +
					"`Team1Sp2` varchar(20), " +
					"`Team2Sp1` varchar(20), " +
					"`Team2Sp2` varchar(20), " +
					"`Tore1` int(2) DEFAULT '0', " +
					"`Tore2` int(2) DEFAULT '0', " +
					"`S` int(1) DEFAULT '0', " +
					"`U` int(1) DEFAULT '0', " +
					"`N` int(1) DEFAULT '0', " +
					"`Kommentar` char(1), " +
					"`X` int(1) DEFAULT '0', " +
					"PRIMARY KEY (`SpielID`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;"); 

			//NEU: Spieler für Spieler-Info (z. B. Club 1.000 oder letzter Schütze)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spr` ( " +
					"`SpielerID` int(3) NOT NULL AUTO_INCREMENT, " +
					"`Name` varchar(30), " +
					"`Vorname` varchar(30), " +
					"`Nickname` varchar(30), " +
					"PRIMARY KEY (`SpielerID`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");

			//Neue Version Tabelle (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tbl` ( " +
					"`ID` int(3) NOT NULL AUTO_INCREMENT, " +
					"`SpielerID` varchar(20), " +
					"`Gruppe` varchar(1) DEFAULT 'a', " +
					"`Spiele` int(3) DEFAULT '0', " +
					"`Siege` int(3) DEFAULT '0', " +
					"`Unentschieden` int(3) DEFAULT '0', " +
					"`Niederlagen` int(3) DEFAULT '0', " +
					"`Punkte` int(3) DEFAULT '0', " +
					"`Elo` int(4) DEFAULT '500', " +
					"`ToreP` int(3) DEFAULT '0', " +
					"`ToreM` int(3) DEFAULT '0', " +
					" PRIMARY KEY (`ID`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
			
			//Neue Version Teams (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tms` ( " +
					"`TeamID` int(3) AUTO_INCREMENT, " +
					"`Name` varchar(30), " +
					"PRIMARY KEY (`TeamID`) USING BTREE " +
					") ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;");

			//OMat: Torschützen-Anzeige
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tor` ( " +
					"`Spieler` varchar(30) NOT NULL, " +
					"`Team` varchar(30), " +
					"`Tore` int(10) DEFAULT 0, " +
					"PRIMARY KEY (`Spieler`,`Team`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
			
/*			//TODO: OMat: Teams --> muss obsolet werden!
			fireSQL("CREATE TABLE IF NOT EXISTS `__teams` ( " +
					"`TeamID` varchar(3) NOT NULL, " +
					"`TeamName` varchar(30) NOT NULL, " +
					"`TurnierName` varchar(45) NOT NULL, " +
					"`TurnierPos` varchar(45) NOT NULL, " +					//TODO: --> wird evtl. nicht benötigt
					"PRIMARY KEY (`TeamID`) " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
*/
			//OMat: Turnierverwaltung
			fireSQL("CREATE TABLE IF NOT EXISTS `__turniere` ( " +
					"`TurnierName` varchar(45) NOT NULL, " +
					"`AnzGrupp` int(3) DEFAULT 1, " +
					"`AnzTeams` int(3) DEFAULT 4, " +
					"`AnzPerio` int(1) DEFAULT 1, " +
					"`DauerSek` int(4) DEFAULT 600, " +
					"`aktiv`  boolean DEFAULT FALSE, " +
					"`KCMode` boolean DEFAULT FALSE, " +
					"`Schuet` boolean DEFAULT FALSE, " +
					"`FTPUpl` boolean DEFAULT FALSE, " +
					"PRIMARY KEY (`TurnierName`) USING BTREE " +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8;");

			String myString = insert("__turniere",
								"TurnierName, AnzGrupp, AnzTeams, AnzPerio, DauerSek, aktiv ",
								"'kcxix',     '1',      '14',     '1',      '600',    '1' ");
		}
		catch(Exception e)
		{
			sout.println(1, "DbAccess.createOMatTables():\n " + e);
		}
	}
	public void createOMatViews(String strTournamentName)
	{
/**		try
		{
			//Neue Version v_<Name>_spl
//			fireSQL("DROP VIEW IF EXISTS " + strBase + ".v_" + strTournamentName + "_spl;");
			fireSQL("CREATE OR REPLACE VIEW " + strBase + ".v_" + strTournamentName + "_spl " +
				"AS SELECT " +
				"`s`.`SpielID` AS `SpielID`, " +
				"`s`.`Jahr` AS `Jahr`, " +
				"`s`.`Gruppe` AS `Gruppe`, " +
				"`t_one`.`Name` AS `Team1Nm`, " +
				"`t_two`.`Name` AS `Team2Nm`, " +
				"`s`.`Team1` AS `Team1ID`, " +
				"`s`.`Team2` AS `Team2ID`, " +
				
//				"`tb_one`.`Elo` AS `Team1Elo`, " +
//				"`tb_two`.`Elo` AS `Team2Elo`, " +
				
				"`s`.`Tore1` AS `Tore1`, " +
				"`s`.`Tore2` AS `Tore2`, " +
				"`s`.`Kommentar` AS `Kommentar`, "  +
				"`s`.`X` AS `X`, "  +
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
				"`s`.`Team2Sp2` AS `Team2Sp2` " + 
				"FROM " + 
				"((((((`" + strTournamentName + "_spl` `s` " + 
				"LEFT JOIN `" + strTournamentName + "_tms` `t_one` on (`t_one`.`TeamID` = `s`.`Team1`)) " +
				"LEFT JOIN `" + strTournamentName + "_tms` `t_two` on (`t_two`.`TeamID` = `s`.`Team2`)) " + 
				
//				"LEFT JOIN `" + strTournamentName + "_tbl` `tb_one` on (`tb_one`.`TeamID` = `s`.`Team1`)) " +
//				"LEFT JOIN `" + strTournamentName + "_tbl` `tb_two` on (`tb_two`.`TeamID` = `s`.`Team2`)) " + 
				
				"LEFT JOIN `" + strTournamentName + "_spr` `n_one` on (`n_one`.`SpielerID` = `s`.`Team1Sp1`)) " +
				"LEFT JOIN `" + strTournamentName + "_spr` `n_two` on (`n_two`.`SpielerID` = `s`.`Team1Sp2`)) " +
				"LEFT JOIN `" + strTournamentName + "_spr` `n_thr` on (`n_thr`.`SpielerID` = `s`.`Team2Sp1`)) " +
				"LEFT JOIN `" + strTournamentName + "_spr` `n_fou` on (`n_fou`.`SpielerID` = `s`.`Team2Sp2`)) " +
				"ORDER BY SpielID;") ;

			//Neue Version v_<Name>_tbl
//			fireSQL("DROP VIEW IF EXISTS " + strBase + ".v_" + strTournamentName + "_tbl;"); 
			fireSQL("CREATE OR REPLACE VIEW " + strBase + ".v_" + strTournamentName + "_tbl " + 
				"AS SELECT " + 
				"`t`.`ID` AS `ID`, " +
				"`t`.`Jahr` AS `Jahr`, " +
				"`t`.`Gruppe` AS `Gruppe`, " +
				"`t`.`Platz` AS `Platz`, " +
				"`n`.`Name` AS `TeamName`, " +
				"`t`.`TeamID` AS `TeamID`, " +
			    "`t`.`Spiele` AS `Spiele`, " +
			    "`t`.`Siege` AS `S`, " +
			    "`t`.`Unentschieden` AS `U`, " +
			    "`t`.`Niederlagen` AS `N`, " +
			    "`t`.`Elo` AS `Elo`, " +
			    "`t`.`Punkte` AS `Punkte`, " +
			    "`t`.`ToreP` AS `ToreP`, " +
			    "`t`.`ToreM` AS `ToreM`, " +
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
			    "`t`.`Spieler3` AS `Spieler3` " +
			    "FROM " + 
			    "((((`" + strTournamentName + "_tbl` `t` " +
			    "JOIN `" + strTournamentName + "_tms` `n` on (`n`.`TeamID` = `t`.`TeamID`)) " +
			    "LEFT JOIN `" + strTournamentName + "_spr` `n_one` on (`n_one`.`SpielerID` = `t`.`Spieler1`)) " + 
			    "LEFT JOIN `" + strTournamentName + "_spr` `n_two` on (`n_two`.`SpielerID` = `t`.`Spieler2`)) " +
			    "LEFT JOIN `" + strTournamentName + "_spr` `n_thr` on (`n_thr`.`SpielerID` = `t`.`Spieler3`)) " +
			    "ORDER BY `t`.`Spiele` DESC, `t`.`Punkte` DESC, `t`.`Siege` DESC, `t`.`ToreP`-`t`.`ToreM` DESC, `t`.`ToreP` DESC;");
		}
		catch(Exception e)
		{
			sout.println(1, "DbAccess.createOMatViews():\n" + e);
		}
		*/
	}
	public void createDefaultGroup()
	{
		create("default_spb", "_tpl_spb");	//Spielberichte
		create("default_spl", "_tpl_spl");	//Spiele
		create("default_spr", "_tpl_spr");	//Spieler
		create("default_tbl", "_tpl_tbl");	//Tabelle
		create("default_tms", "_tpl_tms");	//Teams
		create("default_tor", "_tpl_tor");	//Torschützen

		insert("default_tms", "TeamID, Name", "1, 'Deutschland'");
		insert("default_tms", "TeamID, Name", "2, 'England'");
		insert("default_tms", "TeamID, Name", "3, 'Schweden'");
		insert("default_tms", "TeamID, Name", "4, 'Italien'"); 

		insert("default_tbl", "Jahr, TeamID", "2014, 1");
		insert("default_tbl", "Jahr, TeamID", "2014, 2");
		insert("default_tbl", "Jahr, TeamID", "2014, 3");
		insert("default_tbl", "Jahr, TeamID", "2014, 4");	

		try
		{
			insert("__turniere", "TurnierName, AnzGrupp, AnzTeams, AnzPerio, DauerSek, aktiv", "'default', 1, 4, 1, 300, 1");
		}
		catch (Exception ex)
		{
			update("__turniere", "AnzGrupp = 1, AnzTeams = 4, AnzPerio = 1, DauerSek = 300, aktiv = 1", "TurnierName = 'default'");
		}
		createOMatViews("default");
	}
}
