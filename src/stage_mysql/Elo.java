package stage_mysql;

public class Elo 
{
	int		intEloS, 	intEloV;
	double	dblDiff;
	double	dblEa;
	double	dblE;														//Erwartungswert
	double	dblQuot;
	int		intF = 100;													//Faktor
	int 	intK = 1000;												//Punktebasis
	int		intPkte;													//vergebene Punkte
	
	/**
	 * Erw
	 * @param intToto	--> Ergebnis im Toto-Stil für Unterscheidung dblSa
	 * @param intEloA	--> Elo-Wert des Heimteams
	 * @param intEloB	--> Elo-Wert des Auswärtsteams
	 */
	public int berechneElo(int intToto, int intEloA, int intEloB)
	{
		//Erwartungswert (dblDiff immer negativ)
		if(intEloA > intEloB) dblDiff = intEloB - intEloA; else dblDiff = intEloA - intEloB;
		System.out.print("Elo.berechneElo(): dblDiff=" + dblDiff + ", ");
		dblEa	= 1 / (1 + Math.pow(10, ((dblDiff)/intK)));
		System.out.println("dblEa=" + dblEa);

		//		System.out.println("dblEa: " + dblEa);
		if		((intEloA >= intEloB && intToto == 1) || (intEloA <= intEloB && intToto == 2)) 	//Favoritensieg
		{
			intPkte = Math.abs(calc(1));
		}
		else if	((intEloA < intEloB && intToto == 1) || (intEloA > intEloB && intToto == 2))	//Aussenseitersieg
		{
			intPkte = Math.abs(calc(0));
		}
		else if	(intToto == 0)																	//Unentschieden
		{
			if(intEloA > intEloB)	//Favorit hat nicht gewonnen
			{
				intPkte = calc(0.5); //negativ, bekommt A abgezogen, B hinzu				
			}
			else					
			{
				intPkte = -calc(0.5); //positiv, bekommt A hinzu, B abgezogen
			}
		}
		return intPkte;
	}
	public int calc(double dblSa)
	{
		return (int)(intF * (dblSa - dblEa));
	}
}