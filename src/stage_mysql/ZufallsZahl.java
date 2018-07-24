package stage_mysql;

/**
 * @author Captain Doerk
 */
public class ZufallsZahl
{
    static int generiere(int n) 
    {
        double dezimalZahl = Math.random();
        int ganzZahl = (int)Math.round(dezimalZahl * n);
        return ganzZahl;
    }
}