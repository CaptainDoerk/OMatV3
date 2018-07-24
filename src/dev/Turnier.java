package dev;
import java.sql.*;

/**
 * @author Captain Doerk
 * @deprecated
 * Info: Klasse Generator verwenden!
 */
public class Turnier 
{
	DbAccess_MySQL 	myAccess 	= new DbAccess_MySQL();
	ResultSet 	myResultSet = null;

	int			intRunde;
	int			intGruppe;
	String		strGruppe;
	String 		teamA,				teamB;
	
	String		strTurnierName;
	int			intAnzGruppen, 		intAnzTeams, 		intSpieleGruppe, 	intSpieleModus,		intAnzahlPlayOff,
				intPlayOffModus, 	intAnzahlTrost, 	intTrostModus, 		intHalbZeiten, 		intSecProHalbzeit, 	
				intSecPause;
	
	String		todo;
		
	public Turnier(String strTurnierName)
	{
		this.strTurnierName 	= strTurnierName;
		intAnzGruppen 			= 2;
		intAnzTeams				= 4;
		intSpieleGruppe			= 1;
		intSpieleModus			= 0;
		intAnzahlPlayOff		= 4;
		intPlayOffModus			= 1;
		intAnzahlTrost			= 0;
		intTrostModus			= 0;
		intHalbZeiten			= 2;
		intSecProHalbzeit 		= 300;
		intSecPause 			= 60;
	}
	public Turnier(String strTurnierName, int intAnzGruppen, int intAnzTeams, int intSpieleGruppe, int intSpieleModus, int intAnzahlPlayOff,
				int intPlayOffModus, int intAnzahlTrost, int intTrostModus, int intHalbZeiten, int intSecProHalbzeit, int intSecPause)
	{
		this.strTurnierName 	= strTurnierName;
		this.intAnzGruppen		= intAnzGruppen;
		this.intAnzTeams		= intAnzTeams;
		this.intSpieleGruppe	= intSpieleGruppe;
		this.intSpieleModus		= intSpieleModus;
		this.intAnzahlPlayOff 	= intAnzahlPlayOff;
		this.intPlayOffModus	= intPlayOffModus;
		this.intAnzahlTrost		= intAnzahlTrost;
		this.intTrostModus		= intTrostModus;
		this.intHalbZeiten		= intHalbZeiten;
		this.intSecProHalbzeit	= intSecProHalbzeit;
		this.intSecPause		= intSecPause;
	}

	public void createTabellen()
	{
		System.out.println("Turnier anlegen");
/*		myAccess.insert("kc", "turniere", 
						"TurnierName, AnzGruppen, AnzTeams, SpieleGruppe, AnzahlPlayOff, PlayOffModus, AnzahlTrost, TrostModus, HalbZeiten, SecProHalbzeit, SecPause", 
						"'" + strTurnierName 	+ "', " + 
						intAnzGruppen 			+ ", " + 
						intAnzTeams 			+ ", " + 
						intSpieleGruppe 		+ ", " + 
						intAnzahlPlayOff 		+ ", " + 
						intPlayOffModus 		+ ", " + 
						intAnzahlTrost 			+ ", " + 
						intTrostModus 			+ ", " + 
						intHalbZeiten 			+ ", " + 
						intSecProHalbzeit 		+ ", " + 
						intSecPause);
*/
		//Tabellen anlegen
//		myAccess.create("kc", strTurnierName + "_spl", "_tpl_spielplan");
//		myAccess.create("kc", strTurnierName + "_tbl", "_tpl_tabelle");
//		myAccess.create("kc", strTurnierName + "_tms", "_tpl_teams");

		//Views anlegen
/*		myAccess.fireSQL("CREATE VIEW kc." + strTurnierName + "_v_spl " +
						"AS SELECT t1.TeamName AS TeamA, t2.TeamName AS TeamB, s.SpielID AS SpielID, s.Team1 AS Team1, s.Team2 AS Team2, s.Tore1 AS Tore1, s.Tore2 AS Tore2, s.X AS X, s.Gruppe AS Gruppe " +
						"FROM ((teams t1 JOIN teams t2) JOIN " + strTurnierName + "_spl s) WHERE ((t1.TeamID = s.Team1) AND (t2.TeamID = s.Team2));");				 		
*/		
		//KC View (geht auf T_Teams)
		myAccess.fireSQL("CREATE VIEW kc." + strTurnierName + "_v_spl " +
						"AS SELECT t1.TeamName AS TeamA, t1.Wappen40 as Wappen40A, t1.Wappen100 as Wappen100A, t2.TeamName AS TeamB, t2.Wappen40 as Wappen40B, t2.Wappen100 as Wappen100B, s.SpielID AS SpielID, s.Team1 AS Team1, s.Team2 AS Team2, s.Tore1 AS Tore1, s.Tore2 AS Tore2, s.X AS X, s.Gruppe AS Gruppe " +
						"FROM ((t_teams t1 JOIN t_teams t2) JOIN " + strTurnierName + "_spl s) WHERE ((t1.TurnierPos = s.Team1) AND (t2.TurnierPos = s.Team2));");				 		

/*		myAccess.fireSQL("CREATE VIEW kc." + strTurnierName + "_v_tbl " +
						"AS SELECT t1.TeamName AS TeamName, s.Spiele AS Spiele, s.S AS S, s.U AS U, s.N AS N, s.ToreP as ToreP, s.ToreM AS ToreM, s.Punkte AS Punkte, s.Gruppe AS Gruppe " +
						"FROM (teams t1 JOIN " + strTurnierName + "_tbl s) WHERE (t1.TeamID = s.TeamID);");
*/
		//KC View (geht auf T_Teams)
/*		myAccess.fireSQL("CREATE VIEW kc." + strTurnierName + "_v_tbl " +
						"AS SELECT t1.TeamName AS TeamName, t1.Wappen40 as Wappen40, s.Spiele AS Spiele, s.S AS S, s.U AS U, s.N AS N, s.ToreP as ToreP, s.ToreM AS ToreM, s.Punkte AS Punkte, s.Gruppe AS Gruppe " +
						"FROM (t_teams t1 JOIN " + strTurnierName + "_tbl s) WHERE (t1.TurnierPos = s.TeamID);");

		for(int g=1; g<=2; g++)
		{
			for(int i=1; i<=5; i++)
			{
				switch(g)
				{
					case 1: 	strGruppe = "A"; 	break;
					case 2:		strGruppe = "B"; 	break;
					case 3:		strGruppe = "C"; 	break;
					case 4:		strGruppe = "D"; 	break;
					case 5:		strGruppe = "E"; 	break;
					case 6:		strGruppe = "F"; 	break;
					case 7:		strGruppe = "G"; 	break;
					case 8:		strGruppe = "H"; 	break;
				}
				todo = myAccess.insert("kc", strTurnierName + "_tbl", "TeamID, Gruppe", "'" + strGruppe + i + "', '" + strGruppe + "'");
//				System.out.println(todo);
			}
		}
*/	}
	public void createVorrunde()
	{
		if (intSpieleModus == 0)									//Immer ein kompletter Spieltag pro Gruppe --> KC-Style
		{
			//Anzahl Spieltage ausrechnen
			intRunde = Integer.parseInt(myAccess.select("kc", "_tpl_spielplan_1x" + String.valueOf(intAnzTeams), "max(Runde)", "true"));
			//Jeden einzelnen Spieltag behandeln
			for(int r = 1; r <= intRunde; r++ )
			{
				//Innerhalb jedes Spieltags jede Gruppe für sich behandeln
				for(int g = 1; g <= intAnzGruppen; g++)
				{
					myResultSet = myAccess.getSet("kc", "_tpl_spielplan_1x" + String.valueOf(intAnzTeams), "*", "Runde = " + r);
					try
					{	
						while(myResultSet.next())
						{
							switch(g)
							{
								case 1: 	strGruppe = "A"; 	break;
								case 2:		strGruppe = "B"; 	break;
								case 3:		strGruppe = "C"; 	break;
								case 4:		strGruppe = "D"; 	break;
								case 5:		strGruppe = "E";	break;
								case 6:		strGruppe = "F"; 	break;
								case 7:		strGruppe = "G"; 	break;
								case 8:		strGruppe = "H"; 	break;
							}
							teamA = strGruppe + myResultSet.getString("Team1");
							teamB = strGruppe + myResultSet.getString("Team2");
							todo = myAccess.insert("kc", strTurnierName + "_spl", "Team1, Team2, X, Gruppe",  "'" + teamA + "', '" + teamB + "', '0', '" + strGruppe + "'");
//							System.out.println(todo);
						}
					}
					catch(SQLException e)
					{
						System.err.println("SpielPlan.createVorrunde: " + e);
					}
				}
			}
		}
	}
	
	public void createPlayoffs(int intAnzTeams, int intModus)
	{
		if (intModus == 0)									//16 aus 18 --> KC-Style
		{
			myResultSet = myAccess.getSet("kc", strTurnierName + "_tbl", "*", "true ORDER BY Punkte DESC, (ToreP - ToreM) AS DIFF DESC LIMIT 1, 4");
		}
		
	}
}
