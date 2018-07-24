package stage_mysql;

public class Starter
{
	public static void main( String args[] )
	{
		int intDebugLvl = 8;
		System.out.println("Start...");
		DbAccess	myAccess	= new DbAccess(intDebugLvl);
//		myAccess.createDefaultTables();
//		myAccess.createOMatTables("kcxx");
//		Baendel_Doppel myApp = new Baendel_Doppel();
//		myApp.loseRunde();
//		myApp.sort();

		OMat myOMat 				= new OMat(intDebugLvl, myAccess);
		myOMat.init("kcxx");

//		myAccess.insert("kcxix_spl", "Team1Sp1, Team1Sp2, Team2Sp1, Team2Sp2", "'Alex', 'Fraggy', 'Flo Hightech', 'Ben vom Berg'");
//		myAccess.insert("kcxix_spl", "Team1Sp1, Team1Sp2, Team2Sp1, Team2Sp2", "'Ben vom Berg', 'Fraggy', 'Captain Doerk', 'Tha Tux'");

//		myAccess.createDefaultTables();
//		Baendel_Team_V3 myApp = new Baendel_Team_V3(10);
//		myApp.fillArray("default_spl");
//		myApp.loseRunde();
//		myApp.insertArray("default_spl");

//		myAccess.createDefaultTables();
//		myAccess.createDefaultGroup();
//		JOptionen	myApp		= new JOptionen(4, myAccess);
//		FTPUpload	myApp		= new FTPUpload(7);
//		myApp.connectToFTP();
//		myATpp.uploadToFTP("kcxvii");
//		FTPThread	myApp		= new FTPThread(intDebugLvl, "kcxvii");
//		Thread 		myApp		= new Thread(new FTPThread("kcxvii"));
//		myApp.start();
//		myApp.run();
	}
}
