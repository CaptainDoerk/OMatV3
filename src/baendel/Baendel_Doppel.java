package baendel;
import 	java.util.*;

public class Baendel_Doppel 
{
	List<String>	strPartien = new ArrayList<String>();		//enthält alle Partien (Viererblock = 1 Spiel)
	List<String> 	strActives = new ArrayList<String>();		//enthält die Namen aller aktiven Spieler
	List<String>	strMtchDay = new ArrayList<String>();		//Kandidaten für die nächste Runde
	List<String>	strTeamTmp = new ArrayList<String>();		//Überhang
	List<String>	strCandids = new ArrayList<String>();
	List<String>	strPartienDB = new ArrayList<String>();	
	
	int		d;
	int		intSize, intBlock;
	boolean verwerfen = false;
	//int intAnzSpieler;
	
	public Baendel_Doppel()
	{
		setActives();
	}
	public void setActives()
	{
		//Keine Punkte oder Sonderzeichen in den Namen!
		strActives.clear();
		strActives.add("Alex          ");
		strActives.add("Tha Man       ");
		strActives.add("Mad Maz       ");
		strActives.add("Captain Doerk ");
		strActives.add("Ben vom Berg  ");
		strActives.add("Fraggy        ");
		strActives.add("Dolschewida   ");
		strActives.add("Franke N Stein");
		strActives.add("Luca Toni     ");
		strActives.add("Shooter       ");
		strActives.add("Mahony        ");
		strActives.add("Tha Tux       ");
		strActives.add("Schnelle      ");
		strActives.add("Flo Hightech  ");
		strActives.add("Doreen        ");
		strActives.add("Tina          ");
		strActives.add("Leo           ");
		strActives.add("Lennard       ");
		strActives.add("Theo          ");
		strActives.add("Gonzo         ");
		intSize = strActives.size();
		intBlock = 6;					//Anzahl Spiel-Blöcke (bei Modulo-Rest 1 und 3 entweder 4 oder 8)
	}
	public void loseErste()
	{
		//vollständige Partien in strPartien
		for(int i=0; i<(strActives.size()/4)*4; i++)
		{
			strPartien.add(strActives.get(i).toString());
		}
		System.out.println("strActives.size: " + strActives.size());
		//Rest in strMtchDay
		for(int i=(strActives.size()/4)*4; i<strActives.size(); i++)
		{
			strMtchDay.add(strActives.get(i).toString());
		}
	}

    public void loseRunde()
    {	
    	//kann evtl. angepasst werden für 3er Teams
    	for(int vierer = 0; vierer < intBlock; vierer++)
    	{
    		setActives();
    		strTeamTmp.clear();
    		strTeamTmp.addAll(strMtchDay);							//Zwischenspeichern
    		strActives.removeAll(strMtchDay);    					//alle aus strMtchDay dürfen nicht zum Auffüllen benutzt werden
    		/**
    		 * Auffüllen
    		 */	
    		for(int i=strMtchDay.size(); i<4; i++) 					//size() 0 bis 3
    		{
    			Random r = new Random();
    			int intRandom = r.nextInt(strActives.size());
    			strMtchDay.add(strActives.get(intRandom).toString());
    			strActives.remove(intRandom);
    		}
    		strActives.addAll(strTeamTmp);
    		/**
    		 * Restliche Partien losen
    		 */
    		int intTmp = (strActives.size()/4)*4;
    		for(int i=0; i<intTmp; i++)
    		{
    			Random r = new Random();
    			int intRandom = r.nextInt(strActives.size());
    			strMtchDay.add(strActives.get(intRandom).toString());
    			strActives.remove(intRandom);
    		}
    		strPartien.addAll(strMtchDay);
    		strMtchDay.clear();
    		
    		/**
    		 * den Rest als Vortrag in strMatchDay stellen
    		 */
    		while(!strActives.isEmpty())
    		{
    			Random r = new Random();
    			int intRandom = r.nextInt(strActives.size());
    			strMtchDay.add(strActives.get(intRandom).toString());
    			strActives.remove(intRandom);
    		}
    	}
    	if(hasDupes())
    	{
    		try
    		{
//    			System.out.print(".");
    			strPartien.clear();
    			loseRunde();
    		}
    		catch(StackOverflowError e)
    		{
    			System.out.println();
    			System.err.println("StackOverflowError");
//    			verwerfen = true;
    		}
    	}
    	strTeamTmp.clear();
	}
    public boolean hasDupes()
    {
    	boolean dupes = false;
    	for(int i=0; i<=strPartien.size()-2; i+=2)
    	{
    		String strA = strPartien.get(i);
    		String strB = strPartien.get(i+1);
    		for(int j=i+2; j<=strPartien.size()-2; j+=2)
    		{
    			if( strA.equals(strPartien.get(j))   && strB.equals(strPartien.get(j+1))
    			||  strA.equals(strPartien.get(j+1)) && strB.equals(strPartien.get(j)  ) )
    			{
    				dupes = true;
    			}
//    			System.out.print(i + " " + j + "  ");
    		}
    	}
    	return dupes;
    }
    public void printPartien()
    {
    	System.out.println();
		System.out.println("intSize: " + intSize);
    	for(int i=0; i<strPartien.size(); i++)
    	{
    		switch(i%4)
    		{
    			case 0: System.out.print(strPartien.get(i) + "   + "); break;
    			case 1: System.out.print(strPartien.get(i) + "    :  "); break;
    			case 2: System.out.print(strPartien.get(i) + "   + "); break;
    			case 3: System.out.println(strPartien.get(i)); break;
    		}
    	}
    	System.out.println("--------");
	}
    
    public void sort()
    {
    	System.out.println();

    	int max = 0;
    	String[][] 	strSorted = new String[1000][4];				//skalieren?
    	String[][] 	strToSort = new String[1000][4];
    	int[][]		intPausen = new int[1000][5];
    	strCandids = strPartien;
    	/**
    	 * 1. Block einsortieren
    	 */
		for(int j=0; j<getBlockSize(1); j++)						//BlockSize = Anzahl Spiele pro Block
		{
			for(int k=0; k<4; k++)
			{
        		strSorted[j][k] = strCandids.get(0);	
        		strCandids.remove(0);	
			}
			System.out.println(strSorted[j][0] 	+ "   + " 
					+  strSorted[j][1] 			+ "   : "
					+  strSorted[j][2] 			+ "   + "
					+  strSorted[j][3]	);
			max = j;
		}

		/**
		 * Ab 2. Block: restliche Spiele aufteilen
		 */
		for(int i=1; i<intBlock; i++)								//4x
		{
			for(int m=0; m<getBlockSize(i+1); m++)					//Spieltag sortieren
			{
				int pos = 0;
				System.out.println("Beginn Durchlauf " + m + "..");
				
				for(int j=0; j<getBlockSize(i+1)-m; j++)			//BlockSize = Anzahl Spiele pro Block
				{
					for(int k=0; k<4; k++)
					{
						strToSort[j][k] = strCandids.get(pos);
						pos++;
					}			
				}
				System.out.println("....");
				/*
				 * Pausen ausrechnen
				 */
				int paw = 0;
				boolean found;
				for(int j=0; j<getBlockSize(i+1)-m; j++)				//4 oder 5x
				{
					for(int k=0; k<4; k++)
					{
						found = false;
						paw = 0;
						for(int l=max; l>=0; l--)
						{
							if(strToSort[j][k] == strSorted[l][0] 
							|| strToSort[j][k] == strSorted[l][1]
							|| strToSort[j][k] == strSorted[l][2]						
							|| strToSort[j][k] == strSorted[l][3])
							{
								if(intPausen[j][k] == 0) intPausen[j][k] = paw;
								paw = 0;											//reset
								found = true;
								break;
							}
							else
							{
								paw++;							
							}
						}
						//nicht gefunden
						if(!found) 
						{
							intPausen[j][k] = paw;
						}
					}
					System.out.println(strToSort[j][0] + "(" + intPausen[j][0] + ")+ "
								 	+ strToSort[j][1] + "(" + intPausen[j][1] + "): "
								 	+ strToSort[j][2] + "(" + intPausen[j][2] + ")+ "
								 	+ strToSort[j][3] + "(" + intPausen[j][3] + ") " );
				}
//				System.out.println("....");
				/*
				 * vierstelligen Warteindex ausrechnen
				 */
				List<String>	strTemp = new ArrayList<String>();
				int intMaxPaw = 0;
				int intMaxIdx = 0;
				String value = "";
				for(int j=0; j<getBlockSize(i+1)-m; j++)
				{
					strTemp.clear();
					strTemp.add(String.valueOf(intPausen[j][0]));
					strTemp.add(String.valueOf(intPausen[j][1]));
					strTemp.add(String.valueOf(intPausen[j][2]));
					strTemp.add(String.valueOf(intPausen[j][3]));
					Collections.sort(strTemp);
					value = strTemp.get(0) + strTemp.get(1) + strTemp.get(2) + strTemp.get(3);
					intPausen[i][4] = Integer.parseInt(value);
					value = String.valueOf(intMaxPaw);
					if (intPausen[i][4] > intMaxPaw) 
					{
						intMaxPaw = intPausen[i][4];
						System.out.println("value " + intPausen[i][4] + " bigger than " + value + ", j: " + j);
						intMaxIdx = j;
					}
				}
				if(intMaxPaw<1000)
				{
					System.out.println("Verwerfen!! intMaxPaw: " + intMaxPaw + "---------------------------------------------------------------------------");
					verwerfen = true;
				}
				max++;
				// höchsten Wert in strSorted übernehmen..
				strSorted[max][0] = strToSort[intMaxIdx][0];
				strSorted[max][1] = strToSort[intMaxIdx][1];
				strSorted[max][2] = strToSort[intMaxIdx][2];
				strSorted[max][3] = strToSort[intMaxIdx][3];
		
				// ..aus strCandids entfernen..
				strCandids.remove(4*intMaxIdx);
				strCandids.remove(4*intMaxIdx);
				strCandids.remove(4*intMaxIdx);
				strCandids.remove(4*intMaxIdx);
				
				for(int j=intMaxIdx; j<1000; j++)
				{
					strToSort[j][0] = null;
					strToSort[j][1] = null;
					strToSort[j][2] = null;
					strToSort[j][3] = null;
				}
				/*
				 * ..und Pausen auf null setzen
				 */	
				for(int j=0; j<1000; j++)
				{
					for(int k=0; k<5; k++)
					{
						intPausen[j][k] = 0;
					}
				}
				System.out.println("Ende Durchlauf " + m + "..");
				for(int j=0; j<=max; j++)
				{
					System.out.println(strSorted[j][0] + "   + "
									+ strSorted[j][1] + "   : "
									+ strSorted[j][2] + "   + "
									+ strSorted[j][3]);
				}
			}
		}
		if(verwerfen)
		{
			System.out.println("----Verwerfen!----");
		}
		else
		{
			for(int i=0; i<(intSize*intBlock)/4; i++)
			{
				for(int j=0; j<4;j++)
				{
					strPartienDB.add(strSorted[i][j]);
				}
			}
			insert(strPartienDB);
		}
	}

    public int getBlockSize(int i)
    {
    	return (((i*intSize)/4) - (((i-1) * intSize)/4));
    }

    public void insert(List<String> partien)
    {
/*    	DbAccess myAccess = new DbAccess(8);
    	for(int i=0; i<partien.size(); i+=4)
    	{
    		myAccess.insert("kcxix_spl", "Team1Sp1, Team1Sp2, Team2Sp1, Team2Sp2", "'" +
    			partien.get(i)   + "', '" +
    			partien.get(i+1) + "', '" +
    			partien.get(i+2) + "', '" + 
    			partien.get(i+3) + "'" 
    		);
    	}
    	setActives();
    	for(int i=0; i<strActives.size(); i++)
    	{
			myAccess.insert("kcxix_tbl", "ID, SpielerID, Elo", String.valueOf(i+1)   + ", '" + strPartien.get(i)  + "', 500");
    	}
*/
    }
}
