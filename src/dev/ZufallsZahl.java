package dev;

/**
 * @author Captain Doerk
 */
public class ZufallsZahl
{
    public int generiere(int n) 
    {
        double dezimalZahl = Math.random();
        int ganzZahl = (int)Math.round(dezimalZahl * n);
        return ganzZahl;
    }
}