package dev;
import java.net.InetAddress;

public class Ping 
{
	public String ping(String strHost)
	{
		String strReturn;
        try 
        {
        	if(InetAddress.getByName(strHost).isReachable(5000))
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

