package baendel;
import 	java.util.*;

public class Baendel_Doppel_MD 
{
	List<String>	strPartien = new ArrayList<String>();		//enthält alle Partien (Viererblock = 1 Spiel)
	List<String> 	strActives = new ArrayList<String>();		//enthält die Namen aller aktiven Spieler
	List<String>	strMtchDay = new ArrayList<String>();		//Kandidaten für die nächste Runde
	List<String>	strTeamTmp = new ArrayList<String>();		//Überhang
	int		d;
	int		intSize, intBlock;
	//int intAnzSpieler;
	
	public Baendel_Doppel_MD()
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
//		strActives.add("Doreen        ");
/*		strActives.add("Joker 1       ");
		strActives.add("Joker 2       ");
		strActives.add("Joker 3       ");
		strActives.add("Joker 4       ");
*/		intSize = strActives.size();
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
    		System.out.print(".");
    		strPartien.clear();
    		loseRunde();
    	}
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
    	for(int i=0; i<strPartien.size(); i++)
    	{
    		switch(i%4)
    		{
    			case 0: System.out.print(strPartien.get(i) + " + "); break;
    			case 1: System.out.print(strPartien.get(i) + "  :  "); break;
    			case 2: System.out.print(strPartien.get(i) + " + "); break;
    			case 3: System.out.println(strPartien.get(i)); break;
    		}
    	}
//		System.out.println("strMtchDay " + strMtchDay);
    	System.out.println("--------");
	}
    
    public void sort()
    {
    	int pos = 0;
    	String[][] strSpiele = new String[intSize][4];			//intSize eventuell mit 1000 überschreiben
    	
    	/**
    	 * 1. Block: vollständig geloste Spiele einsortieren
    	 */
    	System.out.println("..sort1..");
    	for(int i=0; i<(intSize/4)*4; i++)
    	{
    		strSpiele[i/4][i%4] = strPartien.get(i);
    		pos++;
    		System.out.print(strSpiele[i/4][i%4] + "   ");
    		if(i%4==3) System.out.println();
    	}
    	/**
    	 * 2. Block
    	 */
    	String[][] strCandid = new String[1000][4];				//intSize eventuell mit 1000 überschreiben    	
    	for(int i=2; i<intBlock; i++)
    	{
        	System.out.println("..sort" + i + "..");
    		for(int j=0; j<(i*intSize/4)*4; j++)
    		{
    			strCandid[j/4][j%4] = strPartien.get(pos);
    			pos++;
        		System.out.print(strCandid[j/4][j%4] + "   ");
        		if(j%4==3) System.out.println();
    		}
    	}
    }
    
    public void insert()
    {
/*    	DbAccess myAccess = new DbAccess(8);
    	for(int i=0; i<strPartien.size(); i+=4)
    	{
    		myAccess.insert("kcxix_spl", "Team1Sp1, Team1Sp2, Team2Sp1, Team2Sp2", "'" +
    			strPartien.get(i)   + "', '" +
    			strPartien.get(i+1) + "', '" +
    			strPartien.get(i+2) + "', '" + 
    			strPartien.get(i+3) + "'" 
    		);
    	}
    	setActives();
    	for(int i=0; i<strActives.size(); i++)
    	{
			myAccess.insert("kcxix_tbl", "ID, SpielerID, Elo", String.valueOf(i+1)   + ", '" + strPartien.get(i)  + "', 500");
    	}
*/   }
}
