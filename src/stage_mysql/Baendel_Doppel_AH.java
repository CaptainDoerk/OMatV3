package stage_mysql;
import java.util.*;
public class Baendel_Doppel_AH
{
	List<String> strPartien = new ArrayList<String>(); // enthält alle Partien (Viererblock = 1 Spiel)
	List<String> strActives = new ArrayList<String>(); // enthält die Namen aller aktiven Spieler
	List<String> strMtchDay = new ArrayList<String>(); // Kandidaten für die nächste Runde
	List<String> strTeamTmp = new ArrayList<String>(); // Überhang
	int d;

	public Baendel_Doppel_AH()
	{
		setActives();
	}

	public static void main(String[] args) 
	{
		Baendel_Doppel_AH bd = new Baendel_Doppel_AH();
		bd.loseRunde();
		bd.printPartien();
		bd.sortPartien();
		bd.printPartien();
	}

	public void setActives()
	{
		strActives.clear();
		strActives.add("Guido    ");
		strActives.add("Bülent   ");
		strActives.add("Matthias ");
		strActives.add("Eduard   ");
		strActives.add("Christian");
		strActives.add("Andrej   ");
		strActives.add("Salih    ");
		strActives.add("Dirk     ");
		strActives.add("Laura    ");
		strActives.add("Andreas  ");
		strActives.add("Ben      ");
		strActives.add("Lisa     ");
		strActives.add("Mario    ");
		strActives.add("Tina     ");
		strActives.add("Leo      ");
		strActives.add("Lennard  ");
		strActives.add("Götze    ");
		strActives.add("Patrick  ");
		strActives.add("Rüdiger  ");
		strActives.add("Angelo   ");
		strActives.add("Gonzales ");
		strActives.add("Gomez    ");

		// strActives.add("");

	}

	public void loseErste()
	{
		// vollständige Partien in strPartien
		for (int i = 0; i < (strActives.size() / 4) * 4; i++)
		{
			strPartien.add(strActives.get(i).toString());
		}
		System.out.println("strActives.size: " + strActives.size());
		// Rest in strMtchDay
		for (int i = (strActives.size() / 4) * 4; i < strActives.size(); i++)
		{
			strMtchDay.add(strActives.get(i).toString());
		}
	}

	public void loseRunde()
	{
		// kann evtl. angepasst werden für 3er Teams
		for (int vierer = 0; vierer < 4; vierer++)
		{
			setActives();
			strTeamTmp.clear();
			strTeamTmp.addAll(strMtchDay);    // Zwischenspeichern
			strActives.removeAll(strMtchDay); // alle aus strMtchDay dürfen nicht zum Auffüllen benutzt werden

			/**
			 * Auffüllen
			 */
			for (int i = strMtchDay.size(); i < 4; i++) // size() 0 bis 3
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
			int intTmp = (strActives.size() / 4) * 4;
			for (int i = 0; i < intTmp; i++)
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
			while (!strActives.isEmpty())
			{
				Random r = new Random();
				int intRandom = r.nextInt(strActives.size());
				strMtchDay.add(strActives.get(intRandom).toString());
				strActives.remove(intRandom);
			}
		}

		if (hasDupes())
		{
			System.out.print(".");
			strPartien.clear();
			loseRunde();
		}
	}

	public void sortPartien() 
	{
		// Transformiere zu Partien
		List<Partie> partien = new ArrayList<>();

		for (int i = 0; i < (strPartien.size() / 4); i++) 
		{
			Partie partie = new Partie();
			int offset = (i * 4);
			partie.getTeam1().add(strPartien.get(offset));
			partie.getTeam1().add(strPartien.get(offset + 1));
			partie.getTeam2().add(strPartien.get(offset + 2));
			partie.getTeam2().add(strPartien.get(offset + 3));
			partien.add(partie);
		}
		boolean foundPlan = false;
		int count = 0;
		while (!foundPlan) 
		{
			Collections.shuffle(partien);
			// Check conditions
			// Players do not have a partie in the following game
			for (int i = 0; i < partien.size(); i++) 
			{
				Set<String> playerCurrent = new HashSet<>();
				playerCurrent.addAll(partien.get(i).getAllPlayers());

				if (i < partien.size() - 1) 
				{
					Set<String> playerNext = new HashSet<>();
					playerNext.addAll(partien.get(i + 1).getAllPlayers());

					playerCurrent.retainAll(playerNext);
					if (!playerCurrent.isEmpty()) 
					{
						System.out.println("Round: "+count+ ", Errorposition: " + (i + 1) + ", Player: "
								+ playerCurrent + ", Game1: "
								+ partien.get(i).getTeam1() + ":"
								+ partien.get(i).getTeam2() + ", Game2: "
								+ partien.get(i + 1).getTeam1() + ":"
								+ partien.get(i + 1).getTeam2());
						break;
					}

				} 
				else 
				{
					foundPlan = true;
					break;
				}
			}
			count++;
		}
		strPartien.clear();
		
		for(Partie partie: partien) 
		{
			strPartien.add(partie.getTeam1().get(0));
			strPartien.add(partie.getTeam1().get(1));
			strPartien.add(partie.getTeam2().get(0));
			strPartien.add(partie.getTeam2().get(1));
		}
	}

	public boolean hasDupes()
	{
		boolean dupes = false;
		for (int i = 0; i <= strPartien.size() - 2; i += 2)
		{
			String strA = strPartien.get(i);
			String strB = strPartien.get(i + 1);

			for (int j = i + 2; j <= strPartien.size() - 2; j += 2)
			{
				if (strA.equals(strPartien.get(j))	&& strB.equals(strPartien.get(j + 1))
				 || strA.equals(strPartien.get(j + 1)) && strB.equals(strPartien.get(j)))
				{
					dupes = true;
				}
				// System.out.print(i + " " + j + "  ");
			}
		}
		return dupes;
	}

	public void printPartien()
	{
		System.out.println();
		for (int i = 0; i < strPartien.size(); i++)
		{
			switch (i % 4)
			{
			case 0:
				System.out.print(strPartien.get(i) + " + ");
				break;
			case 1:
				System.out.print(strPartien.get(i) + "  :  ");
				break;
			case 2:
				System.out.print(strPartien.get(i) + " + ");
				break;
			case 3:
				System.out.println(strPartien.get(i));
				break;
			}
		}
		// System.out.println("strMtchDay " + strMtchDay);
		System.out.println("--------");
	}
}
