package baendel;
import 	java.util.*;

public class Baendel_Sngl_4 
{
	int[][] intSplRunde;
	int[][] intSpiele;
	int		intMaxSplID;
	int		intCost, intCostA, intCostB, intCostC, intCostD;
	int[]	intPausen;
	int		intAnzSpieler;
	int		intAnzRunde;				//Counter, wie oft loseRunde() gerufen wurde.
	int 	length; 					//TODO: length ungerade klären
	int		intSpielerID;
	
	public Baendel_Sngl_4(int intAnzSpieler)
	{
		this.intAnzSpieler = intAnzSpieler;
		length = intAnzSpieler/4;

		intSplRunde = new int[length][5];
		intSpiele 	= new int[100][4];	//TODO: vereinfachen
		intPausen	= new int[4];
		intAnzRunde = 0;
	}
	public void loseErste()
	{
		int	intTeamID 	= 0;
		for (int i=0; i<length; i++)
		{
			intTeamID++;	intSpiele[i][0] = intTeamID;	//die ersten Partien sind 1-2, 3-4, 5-6 usw.
			intTeamID++; 	intSpiele[i][1] = intTeamID;
			intTeamID++; 	intSpiele[i][2] = intTeamID;
			intTeamID++; 	intSpiele[i][3] = intTeamID;
		}
		intMaxSplID = length;
	}
    public void loseRunde()
    {
    	System.out.println("---");
    	int intSpieler4 = 0, intSpieler3 = 0, intSpieler2 = 0;
    	//1.) lose zufällig Partien aus
        for(int i=0; i<intAnzSpieler; i++)
    	{
        	Random r 		= new Random();
        	intSpieler4 = intSpieler3;
        	intSpieler3 = intSpieler2;
        	intSpieler2 = intSpielerID;					//Dummy wegspeichern für den Vergleich auf doppelt geloste Partien (s. u.)
        	intSpielerID = r.nextInt(intAnzSpieler) + 1;
//        	System.out.println(i+1 + ". Lauf: SpielerID " + intSpielerID + ", ");
        	for(int j=0; j<=i; j++)
        	{
        		//intSpielerID bereits vorhanden?
        		if ((intSplRunde[j/4][j%4] == intSpielerID))
        		{
/*        			System.out.println("Treffer: [" + j/4 + "][0]=" + intSplRunde[j/4][0] + ", " +
        										"[" + j/4 + "][1]=" + intSplRunde[j/4][1] + ", " +
           										"[" + j/4 + "][2]=" + intSplRunde[j/4][2] + ", " +
           										"[" + j/4 + "][3]=" + intSplRunde[j/4][3]);      		
*/       			intSpielerID = r.nextInt(intAnzSpieler) + 1;	// neuen Wert versuchen
//        			System.out.println("neuer Wert für intSpielerID: " + intSpielerID);
        			j = -1; 	// nochmals von vorne prüfen (wird beim nächsten Umlauf auf 0 gesetzt)
        		}
        	}
       		intSplRunde[i/4][i%4] 	= intSpielerID;		//intTeamID in den Spielplan für die Runde setzen
//			System.out.println("setze [" + i/2 + "][" + i%2 + "] = " + intSplRunde[i/2][i%2]);

       		//2.) Für jede neu gezogene Partie (dann ist i%2 = 1) prüfen, ob es diese Partie bereits gab (ab Runde 2)
   			if(intAnzRunde >0 && i%4 == 1)
  			{
   				for (int j=0; j<100; j++)
   				{
   					if( 	//gleiche Paare verhindern
   							(intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler2)  || 
   							(intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpielerID) || 

   							(intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpieler4)  || 
 							(intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpieler3) 

/* 							((intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler2)  && (intSpiele[j][2] == intSpieler3)  && (intSpiele[j][3] == intSpieler4))  || 
   							((intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler2)  && (intSpiele[j][2] == intSpieler4)  && (intSpiele[j][3] == intSpieler3))  || 
   							((intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler3)  && (intSpiele[j][2] == intSpieler2)  && (intSpiele[j][3] == intSpieler4))  || 
   							((intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler3)  && (intSpiele[j][2] == intSpieler4)  && (intSpiele[j][3] == intSpieler2))  || 
   							((intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler4)  && (intSpiele[j][2] == intSpieler2)  && (intSpiele[j][3] == intSpieler3))  || 
   							((intSpiele[j][0] == intSpielerID) && (intSpiele[j][1] == intSpieler4)  && (intSpiele[j][2] == intSpieler3)  && (intSpiele[j][3] == intSpieler2))  || 

   							((intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpielerID) && (intSpiele[j][2] == intSpieler3)  && (intSpiele[j][3] == intSpieler4))  || 
   							((intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpielerID) && (intSpiele[j][2] == intSpieler4)  && (intSpiele[j][3] == intSpieler3))  || 
   							((intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpieler3)  && (intSpiele[j][2] == intSpielerID) && (intSpiele[j][3] == intSpieler4))  || 
   							((intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpieler3)  && (intSpiele[j][2] == intSpieler4)  && (intSpiele[j][3] == intSpielerID)) || 
   							((intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpieler4)  && (intSpiele[j][2] == intSpielerID) && (intSpiele[j][3] == intSpieler3))  || 
   							((intSpiele[j][0] == intSpieler2)  && (intSpiele[j][1] == intSpieler4)  && (intSpiele[j][2] == intSpieler3)  && (intSpiele[j][3] == intSpielerID)) || 
   							
   							((intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpielerID) && (intSpiele[j][2] == intSpieler2)  && (intSpiele[j][3] == intSpieler4))  || 
   							((intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpielerID) && (intSpiele[j][2] == intSpieler4)  && (intSpiele[j][3] == intSpieler2))  || 
   							((intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpieler2)  && (intSpiele[j][2] == intSpielerID) && (intSpiele[j][3] == intSpieler4))  || 
   							((intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpieler2)  && (intSpiele[j][2] == intSpieler4)  && (intSpiele[j][3] == intSpielerID)) || 
   							((intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpieler4)  && (intSpiele[j][2] == intSpielerID) && (intSpiele[j][3] == intSpieler2))  || 
   							((intSpiele[j][0] == intSpieler3)  && (intSpiele[j][1] == intSpieler4)  && (intSpiele[j][2] == intSpieler2)  && (intSpiele[j][3] == intSpielerID)) ||
   							
   							((intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpielerID) && (intSpiele[j][2] == intSpieler2)  && (intSpiele[j][3] == intSpieler3))  || 
   							((intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpielerID) && (intSpiele[j][2] == intSpieler3)  && (intSpiele[j][3] == intSpieler2))  || 
   							((intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpieler2)  && (intSpiele[j][2] == intSpielerID) && (intSpiele[j][3] == intSpieler3))  || 
   							((intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpieler2)  && (intSpiele[j][2] == intSpieler3)  && (intSpiele[j][3] == intSpielerID)) || 
   							((intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpieler3)  && (intSpiele[j][2] == intSpielerID) && (intSpiele[j][3] == intSpieler2))  || 
   							((intSpiele[j][0] == intSpieler4)  && (intSpiele[j][1] == intSpieler3)  && (intSpiele[j][2] == intSpieler2)  && (intSpiele[j][3] == intSpielerID)) 
*/   					)
   					{
// 						System.out.println("ungültig " + intTeamID + ":" + intTeamOL);
   						i = -1;		//nochmal von vorne anfangen!
   						intSpieler2 = 0;
   						intSpieler3 = 0;
   						intSpieler4 = 0;
 					}
   				}
  			}
    	}
		//3.) wenn wir hier ankommen, enthält das Array intSplRunde nur gültige Partien. Kürzere der Pausen suchen in Feld [4].
//		System.out.println("intMaxSplID: " + intMaxSplID);
//		System.out.println("length:      " + length);
        if(intAnzRunde > 0)
        {
        	for(int i=0; i<length; i++)
        	{
        		//Rückwärtssuche
        		for(int j=intMaxSplID; j>=(intMaxSplID-length); j--)
        		{
        			if(intSpiele[j][0] == intSplRunde[i][0] || intSpiele[j][1] == intSplRunde[i][0] || intSpiele[j][2] == intSplRunde[i][0] || intSpiele[j][3] == intSplRunde[i][0])
        			{
        				//intCostA = intMaxSplID - 1 - j;
        				intPausen[0] = (intAnzRunde * length) - j - 1;
//						System.out.print(intSplRunde[i][0] + "=" + intCostA + ", ");
        				break;
        			}
        		}
        		for(int j=intMaxSplID; j>=(intMaxSplID-length); j--)
        		{
        			if(intSpiele[j][0] == intSplRunde[i][1] || intSpiele[j][1] == intSplRunde[i][1] || intSpiele[j][2] == intSplRunde[i][1] || intSpiele[j][3] == intSplRunde[i][1])
        			{
        				//intCostB = intMaxSplID - 1 - j;
        				intPausen[1] = (intAnzRunde * length) - j - 1;
//						System.out.print(intSplRunde[i][1] + "=" + intCostB + ", ");
        				break;
        			}
        		}
        		for(int j=intMaxSplID; j>=(intMaxSplID-length); j--)
        		{
        			if(intSpiele[j][0] == intSplRunde[i][2] || intSpiele[j][1] == intSplRunde[i][2] || intSpiele[j][2] == intSplRunde[i][2] || intSpiele[j][3] == intSplRunde[i][2])
        			{
        				//intCostB = intMaxSplID - 1 - j;
        				intPausen[2] = (intAnzRunde * length) - j - 1;
//						System.out.print(intSplRunde[i][2] + "=" + intCostC + ", ");
        				break;
        			}
        		}
        		for(int j=intMaxSplID; j>=(intMaxSplID-length); j--)
        		{
        			if(intSpiele[j][0] == intSplRunde[i][3] || intSpiele[j][1] == intSplRunde[i][3] || intSpiele[j][2] == intSplRunde[i][3] || intSpiele[j][3] == intSplRunde[i][3])
        			{
        				//intCostB = intMaxSplID - 1 - j;
        				intPausen[3] = (intAnzRunde * length) - j - 1;
//						System.out.print(intSplRunde[i][3] + "=" + intCostD + ", ");
        				break;
        			}
        		}
        		//je höher der Wert, desto länger die Wartezeit
        		//minimale Pause finden, zweites Kriterium Länge der Pause für das andere Team.
        		Arrays.sort(intPausen);
/*        		System.out.print("Pausen: ");
        		for(int j=0; j<intPausen.length; j++)
        		{
        			System.out.print(intPausen[j] + ", ");
        		}
        		System.out.println("..;");
*/        		intSplRunde[i][4] 	= intPausen[0] * 1000000
        							+ intPausen[1] *   10000
        							+ intPausen[2] *     100
        							+ intPausen[3];
//				System.out.println("Kosten für " + intSplRunde[i][0] + "+" + intSplRunde[i][1] + ":" + intSplRunde[i][2] + "+" + intSplRunde[i][3] + " = " + intSplRunde[i][4]);
        	}
        	Arrays.sort(intSplRunde, new Comparator<int[]>() 
        	{
        		public int compare(int[] o1, int[] o2) 
        		{
        			return Integer.compare(o2[4], o1[4]);
        		}
        	});
        }
		for(int i=0; i<length; i++)
		{
			System.out.println("minimale Pause für " + intSplRunde[i][0] + "+" + intSplRunde[i][1] + ":" + intSplRunde[i][2] + "+" + intSplRunde[i][3] + " = " + intSplRunde[i][4]);
			intSpiele[intMaxSplID + i][0] = intSplRunde[i][0];
			intSpiele[intMaxSplID + i][1] = intSplRunde[i][1];
			intSpiele[intMaxSplID + i][2] = intSplRunde[i][2];
			intSpiele[intMaxSplID + i][3] = intSplRunde[i][3];
		}
    	intAnzRunde++;
		intMaxSplID += length;
    }
    public void leereArray()
    {
		for (int i=0; i<length; i++)
		{
			intSplRunde[i][0] = 0;
			intSplRunde[i][1] = 0;
			intSplRunde[i][2] = 0;
			intSplRunde[i][3] = 0;
		}
    }
    public void printArray() //ArrayIndexOutOfBounds?
    {
    	for (int i=0; i<100; i++)
    	{
    		if(intSpiele[i][0] > 0)
    		{
    			System.out.println(i+1 + ".Spiel: " + intSplRunde[i][0] + "+" + intSplRunde[i][1] + ":" + intSplRunde[i][2] + "+" + intSplRunde[i][3] + " = " + intSplRunde[i][4]);
    		}
    	}
    }
}
