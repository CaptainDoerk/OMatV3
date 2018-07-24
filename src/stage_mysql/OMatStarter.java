package stage_mysql;
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
		
	public OMatStarter(int intDebugLvl, DbAccess myAccess)
	{
		this.intDebugLvl	= intDebugLvl;
		this.myAccess		= myAccess;
		sout				= new SystemOut(intDebugLvl);
	}
	public void init()
	{
		sout.println(4, "Starte OMatStarter...");
		myAccess.createDefaultTables();												//TODO: besser machen?
		myResultSet = myAccess.getSet("__turniere", "TurnierName", "aktiv = 1");
		try
		{
			myResultSet.next();
			{
				strTurnierName = myResultSet.getString("TurnierName");
				sout.println(4, "OMatStarter.init(): TurnierName = " + strTurnierName + " gefunden, wird geladen...");
				OMat myOMat = new OMat(intDebugLvl, myAccess);
				myOMat.init(strTurnierName);
			}
		}
		catch(NullPointerException npex)
		{
			npex.printStackTrace();
			sout.println(1, "OMatStarter.init(): " + npex);
			System.err.println("Wie zum Henker bin ich hier her gekommen?");
			myAccess.createDefaultGroup();
//			loadJOptionen();
		}
		catch(Exception ex)
		{
			sout.println(1, "kein aktives Turnier gefunden, lade JOptionen");
			myAccess.createDefaultGroup();
			myAccess.createOMatViews("default");
			loadJOptionen();
		}
	}
	public void loadJOptionen()
	{
		JOptionen myJOptionen = new JOptionen(intDebugLvl, myAccess);
		myJOptionen.init();
	}
}
