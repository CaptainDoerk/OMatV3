package dev;
import java.io.File;
import java.sql.*;

import javax.swing.JOptionPane;

/**
 * Version für SQLITE
 * Schema nicht angeben
 */
public class DbAccess_SQLite 
{
	static 	String 	strHost;
	static 	String 	strPort;
	static 	String 	strBase;
	static 	String 	strUser;
	static 	String 	strPass;
	Connection		conn;
	SystemOut		sout	= new SystemOut(6);
	
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
		else
		{
			sout.println(8, "Ping ok!");
		}
	}
	public String fireSQL(String mytodo)
	{
		String todo = mytodo;
		sout.println(6, "DbAccess.freSQL(): " + todo);
		conn = connect();
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
        	sout.println(1, "DbAccess.fireSQL(): \n " + todo + "\n  --> " + e);
        	return("Fehler!");
		}
		return (todo);
	}
	public ResultSet fireSQL_RS(String mytodo)
	{
		String todo = mytodo;
		ResultSet r = null; //Initialisiert für return
		sout.println(6, "DbAccess.fireSQL_RS(): " + todo);
		conn = connect();
		try 
		{
			sout.println(1, mytodo);
			java.sql.Statement s = conn.createStatement();
        	r = s.executeQuery(todo);
        	conn.commit();
        	conn.close();
       		return r;
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.fireSQL_RS:\n" + todo + "\n  --> " + e);
		}
		return r;
	}
	public String create(String myScheme,
						 String myTable,
						 String myLike)
	{
		String table	= myTable;
		String like		= myLike;
		
		String todo = ("CREATE TABLE IF NOT EXISTS " + table + " AS SELECT * FROM " + like + ";");
		sout.println(6, "DbAccess.create(): " + todo);
		conn = connect();
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
        	sout.println(1, "DbAccess.create():\n " + todo + "\n  --> " + e);
        	return("Fehler!");
		}
		return (todo);
	}
	public String insert(String myScheme, 
			             String myTable, 
			             String myColumns, 
			             String myValues) 
	{
		String table   = myTable;
		String columns = myColumns;
		String values  = myValues;
		
		String todo = ( "INSERT INTO " + table + " " +
					    "(" + columns + ") VALUES (" + values + ");" );
		sout.println(6, "DbAccess.insert(): " + todo);
		conn = connect();
		try 
		{
			Statement s = conn.createStatement();
			s.executeUpdate(todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.insert(): " + todo + "\n  --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String select(String myScheme, String myTable, String myColumns, String myCrit) 
	{
//		String scheme  = myScheme;
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		String todo = ("SELECT " + columns + " " +
        		       "FROM " + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.select(): " + todo);
		java.sql.Connection conn = connect();
		try 
		{
    	  	Statement s = conn.createStatement();
        	ResultSet r = s.executeQuery(todo);
        	while(r.next()) 
        	{
        		return(r.getString(columns));
           	}
        	conn.close();
        }
        catch (Exception e) 
        {
        	sout.println(1, "DbAccess.select():\n" + todo + "\n  --> " + e);
        	return("Fehler!");
        }
        return(todo);
	}
	public String selectCOUNT(String myScheme, String myTable, String myColumns, String myCrit) 
	{
//		String scheme  = myScheme;
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		String todo = ("SELECT COUNT(" + columns + ") AS Anzahl " +
        		       "FROM " + table + " " +
        		       "WHERE " + crit + ";");
		sout.println(6, "DbAccess.selectCOUNT(): " + todo);
		java.sql.Connection conn = connect();
		try 
		{
    	  	java.sql.Statement s = conn.createStatement();
        	java.sql.ResultSet r = s.executeQuery(todo);
        	conn.commit();
        	conn.close();
        	while(r.next()) 
        	{
        		return(r.getString("Anzahl"));
           	}
        }
        catch (Exception e) 
        {
        	sout.println(1, "DbAccess.selectCOUNT():\n" + todo + "\n  --> " + e);
        	return("Fehler!");
        }
        return(todo);
	}
	public ResultSet getSet(String myScheme, String myTable, String myColumns, String myCrit) 
	{
		String table   = myTable;
		String columns = myColumns;
		String crit    = myCrit;
		
		String todo = ("SELECT " + columns + " " +
        		         "FROM " + table + " " +
        		        "WHERE " + crit + ";");
		sout.println(6, "DbAccess.getSet(): " + todo);
		conn = connect();
		try 
		{
			Statement s = conn.createStatement();
        	ResultSet rs = s.executeQuery(todo);
/*			while(rs.next())
            {
            	System.out.println("DbAccess.getSet(turniername): " + rs.getString("turniername"));
            }
*/        	conn.close();
        	return rs;
		}
		catch (Exception e) 
		{
			sout.println(1, "Fehler beim getSet:\n" + todo + "\n" + e);
		}
		return null;
	}
	public String update(String mySchema, String myTable, String myValues, String myCrit) 
	{
//		String schema  = mySchema;
		String table   = myTable;
		String values  = myValues;
		String crit    = myCrit;
		
		String todo = ( "UPDATE " + table + " " +
					    "SET " + values + " " +
					    "WHERE " + crit + ";");
		sout.println(6, "DbAccess.update(): " + todo);
		java.sql.Connection conn = connect();
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.update():\n" + todo + "\n  --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	public String delete(String mySchema, String myTable, String myCrit) 
	{
//		String schema  = mySchema;
		String table   = myTable;
		String crit    = myCrit;
		
		String todo = ( "DELETE FROM " + table + " " +
					    "WHERE " + crit + ";");
		sout.println(6, todo);
		java.sql.Connection conn = connect();
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
			conn.close();
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
//		String schema  = mySchema;
		String table   = myTable;

		String todo = ( "DROP TABLE IF EXISTS " + table + ";");
		sout.println(6, "DbAccess.dropTable(): " + todo);
		java.sql.Connection conn = connect();
		try 
		{
			java.sql.Statement s = conn.createStatement();
			s.executeUpdate (todo);
			conn.commit();
			conn.close();
		}
		catch (Exception e) 
		{
			sout.println(1, "DbAccess.dropTable():\n" + todo + "\n  --> " + e);
        	return("Fehler!");
		}
        return (todo);
	}
	private static java.sql.Connection connect()
	{
		java.sql.Connection conn = null;
        try 
        {
			Class.forName("org.sqlite.JDBC");
        }
        catch (Exception e) 
        {
        	System.err.println ("DbAccess.connect(): Treiber \n" + e);
        }
        try 
        {
        	conn = java.sql.DriverManager.getConnection("jdbc:sqlite:sqlite/omat.sqlite");
			conn.setAutoCommit(false);
        }
        catch (Exception e) 
        {
        	System.err.println ("DbAccess.connect(): Verbindung \n" + conn + "\n  --> " + e);
        	connect();
        }
        return conn;
	}
	public void createOMatTables(String strTournamentName)		//TODO: Auslagern in andere Klasse?
	{
		create(strBase, strTournamentName + "_spb", "_tpl_spb");
		create(strBase, strTournamentName + "_spl", "_tpl_spl");
		create(strBase, strTournamentName + "_spr", "_tpl_spr");
		create(strBase, strTournamentName + "_tbl", "_tpl_tbl");
		create(strBase, strTournamentName + "_tms", "_tpl_tms");
		create(strBase, strTournamentName + "_tor", "_tpl_tor");
		//Update der __turniere macht JOptionen.sendData()
	}
	public void createDefaultTables()
	{
		try
		{
			//OMat Spielbericht
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spb` ( " +
					"`ID` INTEGER PRIMARY KEY AUTOINCREMENT, " +
					"`SpielZeit` CHAR(5) DEFAULT NULL, " +
					"`ToreA` INT DEFAULT NULL, " +
					"`ToreB` INT DEFAULT NULL, " +
					"`Team` CHAR(45) DEFAULT NULL, " +
					"`Spieler` CHAR(45) DEFAULT NULL, " +
					"`Event` CHAR(45) DEFAULT NULL " +
					");");
			
			//Neue Version Spiele (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spl` ( " +
					"`SpielID` INTEGER PRIMARY KEY AUTOINCREMENT, " +
					"`Jahr` INT DEFAULT '0', " +
					"`Gruppe` char(1), " +
					"`Team1` INT DEFAULT '0', " +
					"`Team2` INT DEFAULT '0', " +
					"`Tore1` INT DEFAULT '0', " +
					"`Tore2` INT DEFAULT '0', " +
					"`Team1Sp1` INT DEFAULT '0', " +
					"`Team1Sp2` INT DEFAULT '0', " +
					"`Team2Sp1` INT DEFAULT '0', " +
					"`Team2Sp2` INT DEFAULT '0', " +
					"`S` INT DEFAULT '0', " +
					"`U` INT DEFAULT '0', " +
					"`N` INT DEFAULT '0', " +
					"`Kommentar` CHAR(1), " +
					"`X` INT DEFAULT '0' " +
					");"); 

			//NEU: Spieler für Spieler-Info (z. B. Club 1.000 oder letzter Schütze)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_spr` ( " +
					"`SpielerID` INTEGER PRIMARY KEY AUTOINCREMENT, " +
					"`Name` CHAR(30), " +
					"`Vorname` CHAR(30), " +
					"`Nickname` CHAR(30) " +
					");");

			//Neue Version Tabelle (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tbl` ( " +
					"`ID` INTEGER PRIMARY KEY AUTOINCREMENT, " +
					"`Jahr` INT, " +
					"`Platz` INT, " +
					"`TeamID` INT, " +
					"`Gruppe` INT, " +
					"`Spieler1` INT, " +
					"`Spieler2` INT, " +
					"`Spieler3` INT, " +
					"`Spiele` INT DEFAULT '0', " +
					"`Siege` INT DEFAULT '0', " +
					"`Unentschieden` INT DEFAULT '0', " +
					"`Niederlagen` INT DEFAULT '0', " +
					"`Punkte` INT DEFAULT '0', " +
					"`ToreP` INT DEFAULT '0', " +
					"`ToreM` INT DEFAULT '0' " +
					");");
			
			//Neue Version Teams (selbes Schema wie in KCDB)
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tms` ( " +
					"`TeamID` INTEGER PRIMARY KEY AUTOINCREMENT, " +
					"`Name` CHAR(30) " +
					");");

			//OMat: Torschützen-Anzeige
			fireSQL("CREATE TABLE IF NOT EXISTS `_tpl_tor` ( " +
					"`Spieler` CHAR(30) NOT NULL, " +
					"`Team` CHAR(30), " +
					"`Tore` int(10) DEFAULT 0, " +
					"PRIMARY KEY (`Spieler`,`Team`) " +
					");");
			
			//TODO: OMat: Teams --> muss obsolet werden!
			fireSQL("CREATE TABLE IF NOT EXISTS `__teams` ( " +
					"`TeamID` INTEGER PRIMARY KEY AUTOINCREMENT, " +
					"`TeamName` CHAR(30) NOT NULL, " +
					"`TurnierName` CHAR(45) NOT NULL, " +
					"`TurnierPos` CHAR(45) NOT NULL " +					//TODO: --> wird evtl. nicht benötigt
					");");

			//OMat: Turnierverwaltung
			fireSQL("CREATE TABLE IF NOT EXISTS `__turniere` ( " +
					"`TurnierName` CHAR(45) NOT NULL, " +
					"`AnzGrupp` INT DEFAULT 1, " +
					"`AnzTeams` INT DEFAULT 4, " +
					"`AnzPerio` INT DEFAULT 1, " +
					"`DauerSek` INT DEFAULT 600, " +
					"`aktiv` INT DEFAULT 0, " +
					"`KCMode` INT DEFAULT 0, " +
					"`Schuet` INT DEFAULT 0, " +
					"PRIMARY KEY (`TurnierName`) " +
					");");
		}
		catch(Exception e)
		{
			sout.println(1, "DbAccess.createOMatTables():\n " + e);
		}
	}
	public void createOMatViews(String strTournamentName)
	{
		try
		{
			//Neue Version v_<Name>_spl
			fireSQL("CREATE VIEW v_" + strTournamentName + "_spl " +
				"AS SELECT " +
				"`s`.`SpielID` AS `SpielID`, " +
				"`s`.`Jahr` AS `Jahr`, " +
				"`s`.`Gruppe` AS `Gruppe`, " +
				"`t_one`.`Name` AS `Team1Nm`, " +
				"`t_two`.`Name` AS `Team2Nm`, " +
				"`s`.`Team1` AS `Team1ID`, " +
				"`s`.`Team2` AS `Team2ID`, " +
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
				"LEFT JOIN `" + strTournamentName + "_spr` `n_one` on (`n_one`.`SpielerID` = `s`.`Team1Sp1`)) " +
				"LEFT JOIN `" + strTournamentName + "_spr` `n_two` on (`n_two`.`SpielerID` = `s`.`Team1Sp2`)) " +
				"LEFT JOIN `" + strTournamentName + "_spr` `n_thr` on (`n_thr`.`SpielerID` = `s`.`Team2Sp1`)) " +
				"LEFT JOIN `" + strTournamentName + "_spr` `n_fou` on (`n_fou`.`SpielerID` = `s`.`Team2Sp2`)) " +
				"ORDER BY SpielID; ") ;

			//Neue Version v_<Name>_tbl
			fireSQL("CREATE VIEW v_" + strTournamentName + "_tbl " + 
				"AS SELECT " + 
				"`t`.`ID` AS `ID`, " +
				"`t`.`Jahr` AS `Jahr`, " +
//				"`t`.`Gruppe` AS `Gruppe`, " +		// nicht in _tpl_tbl enthalten?
				"`t`.`Platz` AS `Platz`, " +
				"`n`.`Name` AS `TeamName`, " +
				"`t`.`TeamID` AS `TeamID`, " +
			    "`t`.`Spiele` AS `Spiele`, " +
			    "`t`.`Siege` AS `S`, " +
			    "`t`.`Unentschieden` AS `U`, " +
			    "`t`.`Niederlagen` AS `N`, " +
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
	}
	public void createDefaultGroup()
	{
		create(strBase, "default_spb", "_tpl_spb");	//Spielberichte
		create(strBase, "default_spl", "_tpl_spl");	//Spiele
		create(strBase, "default_spr", "_tpl_spr");	//Spieler
		create(strBase, "default_tbl", "_tpl_tbl");	//Tabelle
		create(strBase, "default_tms", "_tpl_tms");	//Teams
		create(strBase, "default_tor", "_tpl_tor");	//Torschützen

		insert(strBase, "default_tms", "TeamID, Name", "1, 'Deutschland'");
		insert(strBase, "default_tms", "TeamID, Name", "2, 'England'");
		insert(strBase, "default_tms", "TeamID, Name", "3, 'Schweden'");
		insert(strBase, "default_tms", "TeamID, Name", "4, 'Italien'"); 

		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 1");
		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 2");
		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 3");
		insert(strBase, "default_tbl", "Jahr, TeamID", "2014, 4");	

		try
		{
			insert(strBase, "__turniere", "TurnierName, AnzGrupp, AnzTeams, AnzPerio, DauerSek, aktiv", "'default', 1, 4, 1, 300, 1");
		}
		catch (Exception ex)
		{
			update(strBase, "__turniere", "AnzGrupp = 1, AnzTeams = 4, AnzPerio = 1, DauerSek = 300, aktiv = 1", "TurnierName = 'default'");
		}
		createOMatViews("default");
	}
}
