package stage_mysql;
import java.net.InetAddress;

/**
 * @author Captain Doerk
 */
public class Ping 
{
	static String ping(String strHost)
	{
		String strReturn;
        try 
        {
        	if(InetAddress.getByName(strHost).isReachable(2000))
        	{
        		strReturn = "ok";
        	}
        	else
        	{
        		strReturn = "Host nicht erreichbar";
        	}
        }
        catch (Exception e) 
        {
        	strReturn = "Host unbekannt";
        	e.printStackTrace();
        }
        return strReturn;
    }
}

