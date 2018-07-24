package baendel;

public class Tester 
{
	public static void main(String[] args) 
	{
		Baendel_Doppel myApp = new Baendel_Doppel();
		
		myApp.loseRunde();
		myApp.printPartien();
		myApp.sort();
		
//		Elo myElo 		= new Elo();
//		System.out.println("0, 500, 500: " + myElo.berechneElo(0, 500, 500));
	}
}
