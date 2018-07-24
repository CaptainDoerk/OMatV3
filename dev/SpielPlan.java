package dev;
import java.sql.*;

public class SpielPlan 
{
	DbAccess 	myAccess 	= new DbAccess();
	ResultSet 	myResultSet = null;

	int			intRunden;
	int			intGruppen;
	int			intSpRunde;
	int[]		input;
	int[]		pattern;
	int[]		spiele;
	int[]		spielplan;		//speichert alle Spiele einer Gruppe in einem eindimensionalen Array
		
	String		strGruppe;
	String 		teamA;
	String 		teamB;
	String		tournamentName;
	String		todo;
	
	public SpielPlan()
	{
	}
	/**
	 * @param m
	 * 
	 * m beschreibt die Anzahl der Teams, für die ein Spielplan berechnet werden soll. Bei der Berechnung ist zu
	 * unterscheiden, ob m gerade oder ungerade ist
	 */
	public void create(int m)
	{
		Permutation p = new Permutation();
		createArray(m);
		createPattern(m);
		/******************
		 * m ist ungerade *
		 ******************/
		if(m%2 == 1)
		{
			//1. Runde (1:2, 3:4, 5:6, .. m-2:m-1)
			int idx = 0;
			for(int h=0; h<2; h++)
			{
				for(int i=0; i<m; i++)
				{
					spielplan[idx] = i+1;
					idx++;
				}
			}
			//2. bis m-1te Runde (Permutationen)
			for(int i=0; i<((m-1)/2)-1; i++)
			{
				spiele = p.permute(input, pattern);
				for(int h=0; h<2; h++)
				{
					for(int j=0;j<input.length;j++)
					{
						spielplan[idx] = spiele[j];
						idx++;
					}
				}
				input = spiele;
			}
		}
		/****************
		 * m ist gerade *
		 ****************/
		else										//gerade Anzahl
		{
			//1. Runde (1:2, 3:4, 5:6, .. n-1:n)
			for(int i=0; i<m; i++)
			{
				spielplan[i] = i+1;
			}
			//2. bis m-1te Runde (Permutationen)
			int idx;
			for(int i=1; i<m-1; i++)				//pro Spieltag..
			{
				spiele = p.permute(input, pattern);	//Begegnungen neu berechnen
				for(int j=0; j<m; j++)
				{
					idx = m*i+j;					//Index von spielplan[] ermitteln
					spielplan[idx] = spiele[j];
				}
				input = spiele;
			}
		}
/*		for(int i=0; i<spielplan.length; i++)
		{
			System.out.println(spielplan[i] + " ");
		}
*/
	}
	/**
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
		intGruppen = intAnzGruppen;
		create(intAnzTeams);										//insbesondere spielplan[] berechnen
		if(intAnzTeams % 2 == 0)									//Anzahl Spieltage ausrechnen
			intRunden = intAnzTeams - 1;
		else
			intRunden = intAnzTeams;
		
		if(intAnzTeams % 2 == 0)									//Anzahl Spiele pro Spieltag ausrechnen
			intSpRunde = intAnzTeams / 2;
		else
			intSpRunde = (intAnzTeams - 1) / 2;
		
		if (intModus == 0)											//Immer ein kompletter Spieltag pro Gruppe --> KC-Style
		{
			//Jeden einzelnen Spieltag behandeln
			for(int r=0; r<intRunden; r++ )
			{
				System.out.println();
				System.out.println((r+1) + "ter Spieltag:");
				System.out.println("-----------------");
				if(r%2==0)//ungerader Spieltag
				{
					//Innerhalb jedes Spieltags jede Gruppe für sich behandeln
					for(int g=0; g<intGruppen; g++)
					{
						switch(g)
						{
							case 0: 	strGruppe = "a";	break;	// --> maximal 8 verschiedene Gruppen
							case 1:		strGruppe = "b";	break;
							case 2:		strGruppe = "c";	break;
							case 3:		strGruppe = "d";	break;
							case 4:		strGruppe = "e";	break;
							case 5:		strGruppe = "f";	break;
							case 6:		strGruppe = "g";	break;
							case 7:		strGruppe = "h";	break;
						}
						for(int h=0; h<(intSpRunde*2); h+=2)
						{
//							System.out.print(r + " " + intAnzTeams + " " + h + "  ");
							teamA = strGruppe + spielplan[(r * intSpRunde * 2) + h];
							teamB = strGruppe + spielplan[(r * intSpRunde * 2) + h + 1];
							System.out.println(teamA + ":" + teamB + " in Gruppe " + strGruppe);
							myAccess.insert("kc", strTurnierName + "_spl", "Team1, Team2, X, Gruppe", "'" + teamA + "', '" + teamB + "', '0', '" + strGruppe + "'");
						}
					}
				}
				else //gerader Spieltag
				{
					//Innerhalb jedes Spieltags jede Gruppe für sich behandeln
					for(int g=0; g<intGruppen; g++)
					{
						switch(g)
						{
							case 0: 	strGruppe = "a";	break;	// --> maximal 8 verschiedene Gruppen
							case 1:		strGruppe = "b";	break;
							case 2:		strGruppe = "c";	break;
							case 3:		strGruppe = "d";	break;
							case 4:		strGruppe = "e";	break;
							case 5:		strGruppe = "f";	break;
							case 6:		strGruppe = "g";	break;
							case 7:		strGruppe = "h";	break;
						}
						for(int h=0; h<(intSpRunde*2); h+=2)
						{
//							System.out.print(r + " " + intAnzTeams + " " + h + "  ");
							teamA = strGruppe + spielplan[(r * intSpRunde * 2) + h];
							teamB = strGruppe + spielplan[(r * intSpRunde * 2) + h + 1];
							System.out.println(teamB + ":" + teamA + " in Gruppe " + strGruppe);
							myAccess.insert("kc", strTurnierName + "_spl", "Team1, Team2, X, Gruppe", "'" + teamB + "', '" + teamA + "', '0', '" + strGruppe + "'");
						}
					}
				}
			}
		}
		if (intModus == 1)											//Gruppenwechsel nach jedem Spiel
		{
			for(int r=0; r<intRunden; r++ )
			{
				System.out.println();
				System.out.println((r+1) + "ter Spieltag:");
				System.out.println("-----------------");
				//Innerhalb jedes Spieltags jede Gruppe für sich behandeln
				for(int h=0; h<(intSpRunde*2); h+=2)
				{
					for(int g=0; g<intGruppen; g++)
					{
						switch(g)
						{
							case 0: 	strGruppe = "a";	break;	// --> maximal 8 verschiedene Gruppen
							case 1:		strGruppe = "b";	break;
							case 2:		strGruppe = "c";	break;
							case 3:		strGruppe = "d";	break;
							case 4:		strGruppe = "e";	break;
							case 5:		strGruppe = "f";	break;
							case 6:		strGruppe = "g";	break;
							case 7:		strGruppe = "h";	break;
						}
//						System.out.print(r + " " + intAnzTeams + " " + h + "  ");
						teamA = strGruppe + spielplan[(r * intSpRunde * 2) + h];
						teamB = strGruppe + spielplan[(r * intSpRunde * 2) + h + 1];
						System.out.println(teamA + ":" + teamB + " in Gruppe " + strGruppe);
					}
				}
			}
		}
		if (intModus == 2)											//jede Gruppe komplett durch
		{
			//Jeden einzelnen Spieltag behandeln
			for(int g=0; g<intGruppen; g++)
			{
				for(int r=0; r<intRunden; r++ )
				{
					System.out.println();
					System.out.println((r+1) + "ter Spieltag:");
					System.out.println("-----------------");
					//Innerhalb jedes Spieltags jede Gruppe für sich behandeln
					switch(g)
					{
						case 0: 	strGruppe = "a";	break;	// --> maximal 8 verschiedene Gruppen
						case 1:		strGruppe = "b";	break;
						case 2:		strGruppe = "c";	break;
						case 3:		strGruppe = "d";	break;
						case 4:		strGruppe = "e";	break;
						case 5:		strGruppe = "f";	break;
						case 6:		strGruppe = "g";	break;
						case 7:		strGruppe = "h";	break;
					}
					for(int h=0; h<(intSpRunde*2); h+=2)
					{
//						System.out.print(r + " " + intAnzTeams + " " + h + "  ");
						teamA = strGruppe + spielplan[(r * intSpRunde * 2) + h];
						teamB = strGruppe + spielplan[(r * intSpRunde * 2) + h + 1];
						System.out.println(teamA + ":" + teamB + " in Gruppe " + strGruppe);
					}
				}
			}
		}
	}
	/**
	 * @param intAnzTeams
	 * @param intModus
	 * 
	 * ToDo: Verschiedene KO-Modus (am Beispiel von 4 4er Vorrunden-Gruppen mit Namen A, B, C, D)
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
		if(anzahl%2 == 0)
		{
			spielplan	= new int[2 * (anzahl-1) * (anzahl/2)];
		}
		else
		{	
			spielplan	= new int[2 * (anzahl) * (anzahl-1)/2];
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
	}
}


