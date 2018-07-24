package dev;

/**
 * @author Captain Doerk, LauLau
 */
public class Permutation 
{
	int[] 	input;
	int[] 	output;
	int[]	muster;
	
	int		vorne;
	int		hinten;
	int		wert_vorne;
	int		wert_hinten;
	
	public Permutation()
	{
	}

	/**
	 * @param input
	 * @param  muster
	 * @return output
	 * 
	 * Aufgrund der besonderen Bedingungen für Spielpläne ist die Funktion permute() stark verschlankt.
	 * Sie kann ausschließlich zur Generation von Spielplänen herangezogen werden, da das Team 1 (das erste
	 * Element des Arrays) stets als Gruppenkopf das erste Spiel hat - es wird also selbst nicht mutiert.
	 */
	public int[] permute(int[] input, int[] muster)
	{
		this.input	= 	input;
		this.muster	= 	muster;

		//Ziel ist zunächst gleich Quelle, wird dann verändert
		output		= 	input;

		//Testausgabe: ist output korrekt?
//		System.out.print("output[]: ");
		for(int i=0; i<output.length; i++)
		{
//			System.out.print(output[i] + ", ");
		}
//		System.out.println();
		//Testausgabe: ist muster korrekt?
//		System.out.print("muster[]: ");
		for(int i=1; i<muster.length; i++)
		{
//			System.out.print(muster[i] + ", ");
		}
//		System.out.println();

		//mit i=1 anfangen, da die 1 nicht permutiert wird
		for(int i=1; i<input.length-1; i++) //input.length = 6;
		{	
			//bestimmen, welche Elemente des Arrays miteinander vertauscht werden sollen
			vorne 			= muster[i];
			hinten			= muster[i + 1];
//			System.out.print(i + "ter Durchlauf, vertausche " + vorne + "tes mit " + hinten + "tem Element, ");

			//für korrekten Zugriff aufs Array: input[1] ist das zweite Element des Arrays.
			vorne--;
			hinten--;
			
			wert_vorne		= input[vorne];
			wert_hinten		= input[hinten];		
//			System.out.println("also " + wert_vorne + " mit " + wert_hinten);
			
			//Vertauschung
			output[vorne]	= wert_hinten;
			output[hinten]	= wert_vorne;
		}
		return output;
	}
}