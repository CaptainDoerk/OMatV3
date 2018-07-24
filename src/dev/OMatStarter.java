package dev;
import java.sql.ResultSet;

public class OMatStarter
{
	int					intDebugLvl;
	DbAccess			myAccess;
	ResultSet			myResultSet;
	String				strTurnierName;
	String				strSpielDauer;
	String				strSchuet;
	String				strKCMode;
	SystemOut 			sout;
		
	public OMatStarter(int intDebugLvl)
	{
		this.intDebugLvl	= intDebugLvl;
		sout				= new SystemOut(intDebugLvl);
		myAccess			= new DbAccess(intDebugLvl);
	}
	public void init()
	{
		sout.println(6, "Starte OMatStarter..");
		myAccess.createDefaultTables();
		myResultSet = myAccess.getSet("__turniere", "turniername", "aktiv = 1");
		try
		{
			myResultSet.next();
			{
				strTurnierName = myResultSet.getString("turniername");
				sout.println(6, "OMatStarter.init(): TurnierName = " + strTurnierName + " gefunden, wird geladen...");
				OMat myOMat = new OMat(intDebugLvl);
				myOMat.init(strTurnierName);
			}
		}
		catch(NullPointerException npex)
		{
			sout.println(1, "OMatStarter.init(): " + npex);
			myAccess.createDefaultGroup();
			loadJOptionen();
		}
		catch(Exception ex)
		{
			sout.println(1, "kein aktives Turnier gefunden, lade JOptionen");
			myAccess.createDefaultGroup();
			loadJOptionen();
		}
	}
	public void loadJOptionen()
	{
		JOptionen myJOptionen = new JOptionen(intDebugLvl);
		myJOptionen.init();
	}
}
