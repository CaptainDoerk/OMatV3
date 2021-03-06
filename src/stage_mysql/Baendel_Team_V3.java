package stage_mysql;
import 	java.sql.ResultSet;
import 	java.util.*;

public class Baendel_Team_V3 
{
	int[][] intSplRunde;
	int[][] intSpiele;
	int		intMaxSplID;
	int		intCost, 		intCostA, 		intCostB,		intCostMax;
	int		intAnzTeams;
	int		intAnzRunde;				//Counter, wie oft loseRunde() gerufen wurde.
	int 	length; 					//TODO: length ungerade kl�ren
	int		intTeamID;
	int		intHard, 		intLazy;
	int		intMode;					//"rand" (0) f�r v�llig willk�rlich
										//"lazy" (1) f�r 1 Spiel Pause weniger als optimal, 
										//"hard" (2) f�r optimale Pausen
	
	public Baendel_Team_V3(int intAnzTeams)
	{
		this.intAnzTeams = intAnzTeams;
		intSpiele 	= new int[100][3];	//TODO: vereinfachen
		intAnzRunde = 0;
		
		/**
		 * TODO: Unterscheidung Modi 
		 * "hard" --> es wird der optimale Spielplan gesucht mit intCost = [abrunden](anzTeams / 2) - 1
		 * --> z. B. 5 oder  6 Teams: mindestens 1 Spiel Pause
		 *           7 oder  8 Teams: mindestens 2 Spiele Pause
		 *           9 oder 10 Teams: mindestens 3 Spiele Pause usw.
		 * "lazy" --> wie "hard, jedoch ist ein Spiel Pause weniger als "hard" auch noch okay
		 * --> kommt normalerweise erst bei n > 12 zum Tragen
		 * "rand" --> wie es gelost wird, so wird es genommen. Keine Garantie f�r nichts.
		 */
		intHard = ((intAnzTeams + 1) / 2) - 2;		//nicht fragen, isso.
		intLazy = intHard - 1;
        System.out.println("hard: " + intHard + ", lazy: " + intLazy);
	}
	public void fillArray(String strTurnierNameSpl)
	{
		DbAccess myAccess = new DbAccess(6);
		ResultSet myResultSet = myAccess.getSet(strTurnierNameSpl, "Team1, Team2, X", "true");
		int i = 0;
		try
		{
			myResultSet.next();
			intSpiele[i][0] = Integer.parseInt(myResultSet.getString("Team1"));
			intSpiele[i][1] = Integer.parseInt(myResultSet.getString("Team2"));
			intSpiele[i][2] = Integer.parseInt(myResultSet.getString("X"));
			i++;
		}
		catch(Exception ex)
		{
			System.err.println("Baendel_Team_Meth.fillArray(" + strTurnierNameSpl + ")");
		}
	}
	public void loseErste()			//ok
	{
		if(intAnzTeams % 2 == 0)
		{
			loseErsteGerade();
		}
		else
		{
			loseErsteUngerade();
		}
		intAnzRunde++;
	}
	public void loseErsteGerade()	//ok
	{
		int	intTeamID 	= 0;
		length = intAnzTeams / 2;
		intSplRunde = new int[length][3];
		for (int i=0; i<length; i++)
		{
			intTeamID++;	intSpiele[i][0] = intTeamID;	//die ersten Partien sind 1-2, 3-4, 5-6 usw.
			intTeamID++; 	intSpiele[i][1] = intTeamID;
			intSpiele[i][2] = -1;
		}
		intMaxSplID = length;
	}
	public void loseErsteUngerade()	//ok
	{
		int intTeamID	= 0;
		length = intAnzTeams;			//ungerade Anzahl Teams
		intSplRunde = new int[length][3];
		for(int i=0; i<length; i++)
		{
			intTeamID++;	intSpiele[i][0] = intTeamID%intAnzTeams;		//2 Uml�ufe
			if(intTeamID%intAnzTeams == 0) intSpiele[i][0] = intAnzTeams;
			intTeamID++;	intSpiele[i][1] = intTeamID%intAnzTeams;
			if(intTeamID%intAnzTeams == 0) intSpiele[i][1] = intAnzTeams;
			intSpiele[i][2] = -1;
		}
		intMaxSplID = length;
	}
	public void loseRunde()			//ok
	{
		if(intAnzTeams % 2 == 0)
		{
			loseRundeGerade();
		}
		else
		{
			loseRundeUngerade();
		}
    	intAnzRunde++;
	}
    public void loseRundeGerade()	//ok
    {
		length = intAnzTeams / 2;
		intSplRunde = new int[length][3];
    	//1.) lose zuf�llig Partien aus
        for(int i=0; i<intAnzTeams; i++)
    	{
        	Random r 		= new Random();
        	int intTeamOL	= intTeamID;					//Dummy wegspeichern f�r den Vergleich auf doppelt geloste Partien (s. u.)
        	intTeamID 		= r.nextInt(intAnzTeams) + 1;
//        	System.out.println(i+1 + ". Lauf: TeamID " + intTeamID + ", ");
        	for(int j=0; j<=i; j++)
        	{
        		//intTeamID bereits vorhanden?
        		if (intSplRunde[j/2][j%2] == intTeamID)		//TODO: ArrayIndexOutOfBoundsException: 0
        		{
//           		System.out.println("Treffer: [" + j/2 + "][0]=" + intSplRunde[j/2][0] + ", [" + j/2 + "][1]=" + intSplRunde[j/2][1] + ", ");      		
        			intTeamID = r.nextInt(intAnzTeams) + 1;	// neuen Wert versuchen
//        			System.out.println("neuer Wert f�r intTeamID: " + intTeamID);
        			j = -1; 	// nochmals von vorne pr�fen (wird beim n�chsten Umlauf auf 0 gesetzt)
        		}
        	}
       		intSplRunde[i/2][i%2] 	= intTeamID;			//intTeamID in den Spielplan f�r die Runde setzen
//			System.out.println("setze [" + i/2 + "][" + i%2 + "] = " + intSplRunde[i/2][i%2]);

       		//2.) F�r jede neu gezogene Partie (dann ist i%2 = 1) pr�fen, ob es diese Partie bereits gab (ab Runde 2)
   			if(intAnzRunde >0 && i%2 == 1)
  			{
   				for (int j=0; j<100; j++)
   				{
   					if(((intSpiele[j][0] == intTeamID) && (intSpiele[j][1] == intTeamOL)) || ((intSpiele[j][0] == intTeamOL) && (intSpiele[j][1] == intTeamID)))
   					{
//						System.out.println("ung�ltig " + intTeamID + ":" + intTeamOL);
   						i = -1;		//nochmal von vorne anfangen!
   						intTeamOL = 0;
   					}
   				}
  			}
    	}
		//3.) wenn wir hier ankommen, enth�lt das Array intSplRunde nur g�ltige Partien. K�rzere der beiden Pausen suchen in Feld [2].
        if(intAnzRunde > 0)
        {
        	for(int i=0; i<length; i++)
        	{
        		//R�ckw�rtssuche
        		for(int j=intMaxSplID; j>=(intMaxSplID-length); j--)
        		{
        			if(intSpiele[j][0] == intSplRunde[i][0] || intSpiele[j][1] == intSplRunde[i][0])
        			{
        				//intCostA = intMaxSplID - 1 - j;
//        				intCostA = (intAnzRunde * length) - j - 1;
           				intCostA = intMaxSplID - j - 1;
//						System.out.print(intSplRunde[i][0] + "=" + intCostA + ", ");
        				break;
        			}
        		}
        		for(int j=intMaxSplID; j>=(intMaxSplID-length); j--)
        		{
        			if(intSpiele[j][0] == intSplRunde[i][1] || intSpiele[j][1] == intSplRunde[i][1])
        			{
        				//intCostB = intMaxSplID - 1 - j;
//        				intCostB = (intAnzRunde * length) - j - 1;
           				intCostB = intMaxSplID - j - 1;
//						System.out.print(intSplRunde[i][1] + "=" + intCostB + ", ");
        				break;
        			}
        		}
        		//je h�her der Wert, desto l�nger die Wartezeit
        		//minimale Pause finden, zweites Kriterium L�nge der Pause f�r das andere Team.
        		if (intCostA >= intCostB)
        		{
        			intCost = intCostB * 100 + intCostA;
        		}
        		else
        		{
        			intCost = intCostA * 100 + intCostB;
        		}
        		intSplRunde[i][2] = intCost; 
//				System.out.println("Kosten f�r " + intSplRunde[i][0] + ":" + intSplRunde[i][1] + " = " + intSplRunde[i][2]);
        	}
        	Arrays.sort(intSplRunde, new Comparator<int[]>() 
        	{
        		public int compare(int[] o1, int[] o2) 
        		{
        			return Integer.compare(o2[2], o1[2]);
        		}
        	});
        }
		for(int i=0; i<length; i++)
		{
/*       	System.out.print("minimale Pause f�r ");
       		if(intSplRunde[i][0] < 10) System.out.print(" ");
       		System.out.print(intSplRunde[i][0] + ":");
       		if(intSplRunde[i][1] < 10) System.out.print(" ");
       		System.out.print(intSplRunde[i][1] + " = ");
		
       		if(intSplRunde[i][2] < 100) System.out.print("..");
       		System.out.print(intSplRunde[i][2]);
       		if ((intSplRunde[i][2] / 100) + i < intHard) System.out.print(", ..verletzt hard");
       		if ((intSplRunde[i][2] / 100) + i < intLazy) System.out.print(", ..verletzt lazy");
       		System.out.println();
			
*/			intSpiele[intMaxSplID + i][0] = intSplRunde[i][0];
			intSpiele[intMaxSplID + i][1] = intSplRunde[i][1];
			intSpiele[intMaxSplID + i][2] = -1;
		}
		intMaxSplID += length;
//		System.out.println("intMaxSplID: " + intMaxSplID);
    }
    public void loseRundeUngerade()
    {
    	loseRundeUngeradeRand();
    	sortArray();
    }
    public void loseRundeUngeradeRand()
    {
    	length			= intAnzTeams;
		intSplRunde 	= new int[length][3];					
		int intTeamOL;
		Random r 		= new Random();
    	for(int i=0; i<intAnzTeams; i++)					//ERSTER DURCHGANG (Erste Charge bis intAnzTeams)
    	{
        	intTeamOL	= intTeamID;						//Dummy wegspeichern f�r den Vergleich auf doppelt geloste Partien (s. u.)
        	intTeamID 	= r.nextInt(intAnzTeams) + 1;
        	for(int j=0; j<=i; j++)
        	{
        		if ((intSplRunde[j/2][j%2] == intTeamID))	//intTeamID im ersten Durchgang bereits gelost worden?
        		{
//        			System.out.println("Treffer: [" + j/2 + "][" + j%2 + "]=" + intSplRunde[j/2][j%2]);      		
        			intTeamID = r.nextInt(intAnzTeams) + 1;	// neuen Wert versuchen
//        			System.out.println("neuer Wert f�r intTeamID: " + intTeamID);
        			j = -1; 	// nochmals von vorne pr�fen (wird beim n�chsten Umlauf auf 0 gesetzt)
        		}
        	}
       		intSplRunde[i/2][i%2] 	= intTeamID;			//intTeamID in den Spielplan f�r die Runde setzen
       		//2.) F�r jede neu gezogene Partie (dann ist i%2 = 1) pr�fen, ob es diese Partie bereits gab (ab Runde 2)
   			if(intAnzRunde >0 && i%2 == 1)
  			{
   				for (int j=0; j<100; j++)
   				{
   					if(((intSpiele[j][0] == intTeamID) && (intSpiele[j][1] == intTeamOL)) || ((intSpiele[j][0] == intTeamOL) && (intSpiele[j][1] == intTeamID)))
   					{
// 						System.out.println("ung�ltig " + intTeamID + ":" + intTeamOL);
   						i = -1;		//nochmal von vorne anfangen!
   						intTeamOL = 0;
   					}
   				}
  			}
    	}
    	for(int i=intAnzTeams; i<intAnzTeams+1; i++)		//Mittelspiel auff�llen
    	{
//        	Random r 	= new Random();						//<--aus For-Schleife nach oben
        	intTeamOL	= intTeamID;						//Dummy wegspeichern f�r den Vergleich auf doppelt geloste Partien (s. u.)
        	intTeamID 	= r.nextInt(intAnzTeams) + 1;
//       	System.out.println(i+1 + ". Lauf: TeamID " + intTeamID);
        	if(intTeamID == intSplRunde[i/2][0])			//wenn selbe ID wie letztes Spiel in ERSTE RUNDE
        	{
//        		System.out.println("Treffer Mitte " + intTeamID);
        		i--;										//wieder von vorne anfangen
        	}
       		//2.) F�r jede neu gezogene Partie (dann ist i%2 = 1) pr�fen, ob es diese Partie bereits gab (ab Runde 2)
        	intSplRunde[intAnzTeams/2][1] = intTeamID;
   			if(intAnzRunde >0 && i%2 == 1)
  			{
   				for (int j=0; j<100; j++)
   				{
   					if(((intSpiele[j][0] == intTeamID) && (intSpiele[j][1] == intTeamOL)) || ((intSpiele[j][0] == intTeamOL) && (intSpiele[j][1] == intTeamID)))
   					{
// 						System.out.println("ung�ltig " + intTeamID + ":" + intTeamOL);
   						i = intAnzTeams;		//nochmal von vorne anfangen!
   						intTeamOL = 0;
   					}
   				}
  			}
    	}
    	int intMitte = intTeamID;
    	for(int i=intAnzTeams+1; i<intAnzTeams*2; i++) 		//ZWEITER DURCHGANG 
    	{
//        	Random r 	= new Random();					//<--aus For-Schleife nach oben
        	intTeamOL	= intTeamID;						//Dummy wegspeichern f�r den Vergleich auf doppelt geloste Partien (s. u.)
        	intTeamID 	= r.nextInt(intAnzTeams) + 1;
//        	System.out.println(i + ". Lauf: TeamID " + intTeamID);
        	for(int j=intAnzTeams; j<=i; j++)				//kein +1, da Mittelspiel mit beachtet werden muss
        	{
        		//intTeamID bereits vorhanden?
        		if ((intTeamID == intSplRunde[j/2][j%2] || intTeamID == intMitte))
        		{
//        			System.out.println("i:" + i + ", j:" + j + ", intTeamID: " + intTeamID + ", intSplRunde[" + j/2 + "][" + j%2 + "]=" + intSplRunde[j/2][j%2]);
        			intTeamID = r.nextInt(intAnzTeams) + 1;	// neuen Wert versuchen
//        			System.out.println("neuer Wert f�r intTeamID: " + intTeamID);
        			j = intAnzTeams; 	// nochmals von vorne pr�fen (wird beim n�chsten Umlauf auf intAnzTeams+1 gesetzt)
        		}
        	}
       		//2.) F�r jede neu gezogene Partie (dann ist i%2 = 1) pr�fen, ob es diese Partie bereits gab (ab Runde 2)
       		intSplRunde[i/2][i%2] 	= intTeamID;			//intTeamID in den Spielplan f�r die Runde setzen
   			if(intAnzRunde >0 && i%2 == 1)
  			{
   				for (int j=0; j<100; j++)
   				{
   					if(((intSpiele[j][0] == intTeamID) && (intSpiele[j][1] == intTeamOL)) || ((intSpiele[j][0] == intTeamOL) && (intSpiele[j][1] == intTeamID)))
   					{
// 						System.out.println("ung�ltig " + intTeamID + ":" + intTeamOL);
   						i = intAnzTeams + 1;		//nochmal von vorne anfangen!
   						intTeamOL = 0;
   					}
   				}
  			}
    	}
    }
    public void sortArray()
    {
		//3.) wenn wir hier ankommen, enth�lt das Array intSplRunde nur g�ltige Partien.
    	for(int i=0; i<length; i++)
		{
			sortArray(length);
		}
    }
    public void sortArray(int intBis)
    {
    	intCostMax = 0;							//initialisieren
//    	System.out.println("intMaxSplID: " + intMaxSplID + ", intBis: " + intBis);
       	for (int i=0; i<intBis; i++)						//ersten Block betrachten
       	{
       		//R�ckw�rtssuche in allen Spielen: wann hat TeamA zuletzt gespielt?
       		for(int j=intMaxSplID-1; j>=0; j--)				//j=0 wird nicht erreicht, da vorher mit break abgebrochen wird
       														//evtl. relevant, falls Teams auch mal ein paar Runden aussetzen
       														//TODO: Neueinsteiger? dann l�uft es doch bis j=0 durch.
       		{
       			if(intSpiele[j][0] == intSplRunde[i][0] || intSpiele[j][1] == intSplRunde[i][0])
       			{
       				intCostA = intMaxSplID - j;
//					System.out.print(intSplRunde[i][0] + "=" + intCostA + ", ");
       				break;
       			}
       		}
       		//R�ckw�rtssuche in allen Spielen: wann hat TeamB zuletzt gespielt?
       		for(int j=intMaxSplID-1; j>=0; j--)
       		{
       			if(intSpiele[j][0] == intSplRunde[i][1] || intSpiele[j][1] == intSplRunde[i][1])
       			{
       				intCostB = intMaxSplID - j;
//					System.out.print(intSplRunde[i][1] + "=" + intCostB + ", ");
       				break;
       			}
       		}
       		if (intCostA >= intCostB)
       		{
       			intCost = intCostB * 100 + intCostA;
       		}
       		else
       		{
       			intCost = intCostA * 100 + intCostB;
       		}       		
       		if(intSplRunde[i][2] >= 0)	intSplRunde[i][2] = intCost;
//     		System.out.println("Kosten f�r " + intSplRunde[i][0] + ":" + intSplRunde[i][1] + " = " + intSplRunde[i][2]);
			
			if(intSplRunde[i][2] >= intCostMax)
			{
				intCostMax = intCost;										//intCostMax wegspeichern
			}
       	}
		//Sortieren
       	for(int i=0; i<intBis; i++)
       	{
       		if(intSplRunde[i][2] == intCostMax)								//suche Maximum
       		{
       			intSpiele[intMaxSplID][0] = intSplRunde[i][0];
       			intSpiele[intMaxSplID][1] = intSplRunde[i][1];
       			intMaxSplID++;
       			intSplRunde[i][2] = -1;										//wird nicht mehr betrachtet
       			intSpiele[intMaxSplID][2] = intSplRunde[i][2];
       			break;
       		}
     	}
    }
    public void leereArray()		//ok
    {
    	intSplRunde = null;
    }
    public void printArray()		//ok
    {
    	for (int i=0; i<100; i++)
    	{
    		if(intSpiele[i][0] > 0)
    		{
    			System.out.println(i+1 + ".Spiel: " + intSpiele[i][0] + ":" + intSpiele[i][1]);
    		}
    	}
    }
	public void insertArray(String strTurnierNameSpl)
	{
		DbAccess myAccess = new DbAccess(6);
		for(int i=0; i<intSpiele.length; i++)
		{
//			System.out.println("[2]:" + intSpiele[i][2]);
			if(intSpiele[i][0] != 0 && intSpiele[i][2] == -1)
			myAccess.insert(strTurnierNameSpl, "Gruppe, Team1, Team2, X", "'a', '" + intSpiele[i][0] + "', '" + intSpiele[i][1] + "', '0'");
		}
	}
}
