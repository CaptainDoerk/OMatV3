package dev;
import java.io.File;
import java.sql.*;

/**
 *  @author Captain Doerk
 *	@deprecated
 *	DefaultGruppen usw. werden in der Klasse DbAccess generiert!
 */
public class Generator 
{
	DbAccess 	myAccess 	= new DbAccess();
	ResultSet 	myResultSet = null;
	FileHelper	myFileHelper = new FileHelper();
	
	int			intRunde;
	int			intGruppe;
	int[]		input;
	int[]		pattern;
	int[]		spiele;
	
	String		strGruppe;
	String 		teamA;
	String 		teamB;
	String		tournamentName;
	String		todo;

	public void createDatabase()
	{
		myAccess.fireSQL("CREATE DATABASE IF NOT EXISTS omat;");
	}
	public void createTournament(String strTournamentName)
	{
		this.tournamentName = strTournamentName;
		//Tabellen erstellen
		myAccess.create("kc", tournamentName + "_spl", "_tpl_spielplan");
		myAccess.create("kc", tournamentName + "_tbl", "_tpl_tabelle");
		myAccess.create("kc", tournamentName + "_tms", "_tpl_teams");
		myAccess.create("kc", tournamentName + "_tor", "_tpl_tore");
	}
	public void createViews(String strTournamentName)
	{
		this.tournamentName = strTournamentName;
		myAccess.fireSQL("CREATE OR REPLACE VIEW kc." + tournamentName + "_v_spl " +
				"AS SELECT t1.TeamName AS TeamA, t2.TeamName AS TeamB, s.SpielID AS SpielID, s.Team1 AS Team1, s.Team2 AS Team2, s.Tore1 AS Tore1, s.Tore2 AS Tore2, s.X AS X, s.Gruppe AS Gruppe " +
				"FROM ((t_teams t1 JOIN t_teams t2) JOIN " + tournamentName + "_spl s) " +
				"WHERE (t1.TurnierPos  = s.Team1) " +
				"  AND (t2.TurnierPos = s.Team2) " +
				"  AND (t1.TurnierName = " + tournamentName + ") " + 
				"  AND (t2.TurnierName = " + tournamentName + ") " + 
				"ORDER BY SpielID;");
		myAccess.fireSQL("CREATE OR REPLACE VIEW kc." + tournamentName + "_v_tbl " +
				"AS SELECT t1.TeamID AS TeamID, t1.TeamName as TeamName, t2.TeamID as Team1, t2.Gruppe AS Gruppe, t2.Spiele as Spiele, t2.S AS S, t2.U AS U, t2.N AS N, t2.ToreP AS ToreP, t2.ToreM AS ToreM, t2.Punkte AS Punkte, t2.Status AS Status " +
				"FROM (t_teams t1 JOIN " + tournamentName + "_tbl t2) " +
				"WHERE (t1.TurnierPos = t2.TeamID) " +
				"  AND (t1.TurnierName = " + tournamentName + ") " +
				"ORDER BY Gruppe;"); 
	}
	public void createDefaultGroup()
	{
		String strTeam1 = new String("'Dogs'");
		String strTeam2 = new String("'Cats'");
		String strTeam3 = new String("'Bugs'");
		String strTeam4 = new String("'Fish'");

		try { myAccess.update("kc", "t_teams", "TeamName = " + strTeam1 , "TurnierName = 'default' AND TurnierPos = 'a1'"); }
		catch (Exception ex) { myAccess.insert("kc", "t_teams", "TeamID, TeamName, TurnierName, TurnierPos", "'z1', " + strTeam1 + ", 'default', 'a1'"); }
		try { myAccess.update("kc", "t_teams", "TeamName = " + strTeam2 , "TurnierName = 'default' AND TurnierPos = 'a2'"); }
		catch (Exception ex) { myAccess.insert("kc", "t_teams", "TeamID, TeamName, TurnierName, TurnierPos", "'z2', " + strTeam2 + ", 'default', 'a2'"); }
		try { myAccess.update("kc", "t_teams", "TeamName = " + strTeam3 , "TurnierName = 'default' AND TurnierPos = 'a3'"); }
		catch (Exception ex) { myAccess.insert("kc", "t_teams", "TeamID, TeamName, TurnierName, TurnierPos", "'z3', " + strTeam3 + ", 'default', 'a3'"); }
		try { myAccess.update("kc", "t_teams", "TeamName = " + strTeam4 , "TurnierName = 'default' AND TurnierPos = 'a4'"); }
		catch (Exception ex) { myAccess.insert("kc", "t_teams", "TeamID, TeamName, TurnierName, TurnierPos", "'z4', " + strTeam4 + ", 'default', 'a4'"); }

		myAccess.insert("kc", "default_tbl", "TeamID, Team1, Gruppe", "1, 'a1', 'a'");
		myAccess.insert("kc", "default_tbl", "TeamID, Team1, Gruppe", "2, 'a2', 'a'");
		myAccess.insert("kc", "default_tbl", "TeamID, Team1, Gruppe", "3, 'a3', 'a'");
		myAccess.insert("kc", "default_tbl", "TeamID, Team1, Gruppe", "4, 'a4', 'a'");
	}
	public String[][] readTeams()
	{
		String		strWorkDir  		= System.getProperty("user.dir");
		String		sep 				= File.separator;
		String		strTeamPfad			= strWorkDir + sep + "Teams" + sep;
		String[]	strTempTeams		= myFileHelper.getFileNames(strTeamPfad);
		String[][] 	strNames	 		= new String[strTempTeams.length][20];
		System.out.println("Generator: strTempTeams.length: " + strTempTeams.length);
		String[]	strTempNames;
		for(int i=0; i<19; i++)//strTempTeams.length; i++)
		{
			strNames[i][0] 	= strTempTeams[i];
			strTempNames 	= myFileHelper.getFileNames(strTeamPfad + strTempTeams[i] + sep);
			for(int j=0; j<strTempNames.length; j++)
			{
				strNames[i][j+1] = strTempNames[j];
			}
		}
		return strNames;
	}
	/**
	 * @param m
	 * 
	 * m beschreibt die Anzahl der Teams, für die ein Spielplan berechnet werden soll. Bei der Berechnung ist zu
	 * unterscheiden:
	 * 
	 * m ungerade
	 * die ersten beiden Runden ergeben sich aus 1:2, 3:4, 5:6, .. m-2:m-1, m:1, 2:3, 4:5, .. m-1:m
	 * 
	 * m gerade
	 * die erste Runde ergibt sich aus 1:2, 3:4, 5:6, .. m-1:m
	 * 
	 * Danach ergeben sich die Paarungen aus der Permutation (1)(3, 5, m-2, m, m-1, m-3, 4, 2), wobei die Permutation
	 * immer wieder auf das Ergebnis der vorigen Permutation angewendet wird.
	 */
	public void createSmartSpielPlan(int m)
	{
		if(m%2 == 1)				//ungerade Anzahl
		{
			//1. Runde (1:2, 3:4, 5:6, .. m-2:m-1)
			for(int i=1; i<=(m-2);i += 2)
			{
				System.out.println(i + ":" + (i + 1));
			}
			//2. Runde (m:1, 2:3, 4:5, .. m-1:m)
			System.out.println(m + ":1");
			for(int i=2; i<=m;i += 2)
			{
				System.out.println(i + ":" + (i + 1));
			}
			//3. bis m-1te Runde (Permutationen)
			Permutation p = new Permutation();
			createArray(m);
			createPattern(m);
			for(int i=3; i<=m; i++)
			{
				spiele = p.permute(input, pattern);
				
				//spiele in DB wegschreiben
				
				input = spiele;
			}
		}
		else								//gerade Anzahl
		{
			//1. Runde (1:2, 3:4, 5:6, .. n-1:n)
			for(int i=1; i<m-2;)
			{
				System.out.println(i + ":" + (i + 1));
				i += 2;
			}
			//2. bis m-1te Runde (Permutationen)
			for(int i=2; i<m-1; m++)
			{
				//foo();
			}
		}
	}
	/**
	 * @deprecated
	 * --> Klasse SpielPlan benutzen!
	 * 
	 * @param intAnzGruppen
	 * @param intAnzTeams
	 * @param intModus
	 * 
	 * ToDo: Verschiedene Turniermodi (am Beispiel von 4 4er Gruppen mit Namen A, B, C, D)
	 * 
	 * Modus 0: jede Gruppe spielt einen Spieltag komplett, danach Gruppenwechsel
	 * AABBCCDDAABBCCDDAABBCCDD
	 * 
	 * Modus 1: jede Gruppe spielt eine Partie, danach Gruppenwechsel
	 * ABCDABCDABCDABCDABCDABCD
	 * 
	 * Modus 2: jede Gruppe spielt komplett durch, danach Gruppenwechsel
	 * AAAAAABBBBBBCCCCCCDDDDDD
	 * 
	 * Modus 40: (nur für 4 Gruppen): wie Modus 0, aber in zwei Blöcken zu je zwei Gruppen
	 * AABBAABBAABBCCDDCCDDCCDD
	 * 
	 * Modus 41: (nur für 4 Gruppen): wie Modus 1, aber in zwei Blöcken zu je zwei Gruppen 
	 * ABABABABABABCDCDCDCDCDCD
	 */
	public void createVorrunde(String strTurnierName, int intAnzGruppen, int intAnzTeams, int intModus)
	{
		intGruppe = intAnzGruppen;
		//String tournamentName = "test_cup";
		if (intModus == 0)											//Immer ein kompletter Spieltag pro Gruppe --> KC-Style
		{
			//Anzahl Spieltage ausrechnen
			intRunde = Integer.parseInt(myAccess.select("kc", "_tpl_spielplan_1x" + String.valueOf(intAnzTeams), "max(Runde)", "true"));
			
			//Jeden einzelnen Spieltag behandeln
			for(int r = 1; r <= intRunde; r++ )
			{
				//Innerhalb jedes Spieltags jede Gruppe für sich behandeln
				for(int g = 1; g <= intGruppe; g++)
				{
					myResultSet = myAccess.getSet("kc", "_tpl_spielplan_1x" + String.valueOf(intAnzTeams), "*", "Runde = " + r);
					try
					{	
						while(myResultSet.next())
						{
							switch(g)
							{
								case 1: 	strGruppe = "a";		// --> maximal 8 verschiedene Gruppen
								case 2:		strGruppe = "b";
								case 3:		strGruppe = "c";
								case 4:		strGruppe = "d";
								case 5:		strGruppe = "e";
								case 6:		strGruppe = "f";
								case 7:		strGruppe = "g";
								case 8:		strGruppe = "h";
							}
							teamA = strGruppe + myResultSet.getString("Team1");
							teamB = strGruppe + myResultSet.getString("Team2");
							myAccess.insert("kc", strTurnierName + "_spl", "Team1, Team2, X, Gruppe",  "'" + teamA + "', '" + teamB + "', '0', '" + g + "'");
//							todo = myAccess.insert("kc", tournamentName + "_spl", "Team1, Team2, X, Gruppe",  "'" + teamA + "', '" + teamB + "', '0', '" + g + "'");
//							System.out.print(todo + ", ");
//							System.out.println(teamA + ":" + teamB + " in Gruppe " + g);
						}
					}
					catch(SQLException e)
					{
						System.err.println("Generator.createVorrunde: " + e);
					}
				}
			}
		}
	}
	/**
	 * @param intAnzTeams
	 * @param intModus
	 * 
	 * ToDo: Verschiedene KO-Modi (am Beispiel von 4 4er Vorrunden-Gruppen mit Namen A, B, C, D)
	 * 
	 * Modus  0: fortlaufend
	 * A1:B2 B1:C2 C1:D2 D1:A2 
	 * --> Sieger(A1:B2):Sieger(B1:C2) Sieger(C1:D2):Sieger(D1:A2) 
	 * --> Finale
	 * 
 	 * Modus 10: wie Modus 0, aber mit Spiel um Platz drei
	 * 
	 * Modus  1: blockweise
	 * A1:B2 B1:A2 C1:D2 D1:C2
 	 * --> Sieger(A1:B2):Sieger(B1:A2) Sieger(C1:D2):Sieger(D1:C2)
	 * --> Finale
	 * 
	 * Modus 11: wie Modus 1, aber mit Spiel um Platz drei
	 * 
	 * Modus  2: zunächst Blöcke, dann überkreuz
	 * A1:B2 C1:D2 B1:A2 D1:C2
 	 * --> Sieger(A1:B2):Sieger(C1:D2) Sieger(B1:A2):Sieger(D1:C2)
	 * --> Finale
	 * 
	 * Modus 21: wie Modus 2, aber mit Spiel um Platz drei
	 * 
	 * Modus 50: manuell über Auswahl-Popup (falls man die Partien selbst auslosen möchte)
	 * 
	 * Modus 99: Zufallsberechnung
	 * Spiele gegen Vorrundengegner werden vermieden, so lange es möglich ist.
	 * Die Partien werden so angeordnet, dass jedes Team möglichst lange Pause vor dem nächsten Spiel hat.
	 */
	public void createEndrunde(int intAnzTeams, int intModus)
	{
		if (intModus == 10)									//16 aus 18 --> KC-Style
		{	
			//todo
			myResultSet = myAccess.getSet("kc", tournamentName + "_tbl", "*", "true ORDER BY Punkte DESC, (ToreP - ToreM) AS DIFF DESC LIMIT 1, 4");
		}
		if (intModus == 50)									//manuell
		{
			
		}
	}
	public void createArray(int anzahl)
	{
		input	= new int[anzahl];
		for(int i=0; i<anzahl; i++)
		{
			input[i] = i+1;
		}
	}
	/**
	 * @param anzahl
	 * 
	 * Erstellt ein Array mit dem für die Berechnung von Spielplänen benötigten Muster in der Form
	 * (1)(3, 5, 7, ... 6, 4, 2)
	 */
	public void createPattern(int anzahl)
	{
		pattern = new int[anzahl];
		int tmp = (anzahl%2 == 0) ? anzahl/2 : (anzahl+1)/2;		//verkapptes if für wertzuweisung

		for(int i=0; i<tmp; i++)
		{
			pattern[i] = i * 2 + 1;
		}
		for(int i=tmp; i<anzahl; i++)
		{
			pattern[i] = (anzahl - i) * 2;
		}
/*		for(int i=0; i<anzahl; i++)
		{
			System.out.print(pattern[i] + ", ");
		}
		System.out.println();
*/	}
}
