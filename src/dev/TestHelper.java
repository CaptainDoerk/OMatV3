package dev;

//import java.io.*;
//import java.util.*;
//import javax.swing.*;

public class TestHelper
{
	public static void main( String args[] )
	{
		OMatStarter myApp = new OMatStarter(8);
//		TestOMat myApp 	= new TestOMat();
//		JOptionen myApp = new JOptionen();
//		DbAccess myApp = new DbAccess();
		myApp.init();

//		FTPUpload myApp = new FTPUpload();
//		myApp.connectToFTP();
//		myApp.uploadToFTP("nations");

//		HTMLWriter myWriter = new HTMLWriter("nations");
//		myWriter.writeAll();
//		myApp.createOMatDB();			//--> muss schiefgehen beim Zugriff auf ein nicht-existierendes Schema!
//		myApp.createDefaultTables();
//		myApp.createDefaultGroup();
//		myApp.createOMatTables("kcxvi");
//		myApp.createOMatViews();
		
//		System.out.println(myApp.createKCTables());
//		System.out.println(myApp.createKCViews());
		
//		Ping myPing = new Ping();
//		System.out.println(myPing.ping("localhost"));

		//Code to select files of a particular extensions
//		ExampleFileFilter filter = new ExampleFileFilter();
//		filter.addExtension("jpg");
//		filter.addExtension("gif");
//		filter.setDescription("Teams");
//		chooser.setFileFilter(filter);
//		JTextField jTextField1 = new javax.swing.JTextField();
		
//		JChooser myJChooser = new JChooser();
//		String myString = myJChooser.choose("Teams");
//		System.out.println("ausgewählt: " + myString);
		
/*		final JFrame frame = new JFrame();
		JFileChooser chooser = new JFileChooser(System.getProperty("user.dir") + "\\Teams");
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 
		int choice = chooser.showOpenDialog(frame);

//		int returnVal = chooser.showOpenDialog(new Component());
		int returnVal = 0;
		if(returnVal == JFileChooser.APPROVE_OPTION) 
		{
		     System.out.println("You chose to open this file: " +
		            chooser.getSelectedFile().getName());
		} 
*/
/*		FileOpen a = new FileOpen();
		try
		{
			String strCont = a.ReadFileContents("d:\\db.cfg");
			
			int intBeg = strCont.indexOf("HOST=");
			int intEnd = strCont.indexOf(";");
			String strHost = strCont.substring(intBeg + 5, intEnd);
			System.out.println(strHost);

			intBeg = strCont.indexOf("PORT=");
			intEnd = strCont.indexOf(";", intBeg + 1);
			String strPort = strCont.substring(intBeg+5, intEnd);
			System.out.println(strPort);
			
			intBeg = strCont.indexOf("BASE=");
			intEnd = strCont.indexOf(";", intBeg + 1);
			String strBase = strCont.substring(intBeg+5, intEnd);
			System.out.println(strBase);
			
			intBeg = strCont.indexOf("USER=");
			intEnd = strCont.indexOf(";", intBeg + 1);
			String strUser = strCont.substring(intBeg+5, intEnd);
			System.out.println(strUser);
			
			intBeg = strCont.indexOf("PASS=");
			intEnd = strCont.indexOf(";", intBeg + 1);
			String strPass = strCont.substring(intBeg+5, intEnd);
			System.out.println(strPass);
		}
		catch(Exception e)
		{
			System.err.println(e);
		}
*/
//		TestCreator myApp = new TestCreator();
//		JTournaments myApp = new JTournaments();
//		Generator myGen = new Generator();
//		myGen.createTournament(myString);
//		myGen.createViews(myString);
//		myGen.createDatabase();

//		SpielPlan myApp	= new SpielPlan();
//		myApp.createVorrunde("seventeen", 1, 19, 0);

//		myGen.readTeams();
//		myGen.createVorrunde("kc2010", 3, 6, 0);	//--> deprecated! Klasse SpielPlan benutzen!

//		SpielPlan myApp	= new SpielPlan();
//		myApp.createVorrunde("kc2010", 3, 6, 0);

//		myGen.createPattern(20);
//		myGen.createPattern(27);

//		JTournaments myApp = new JTournaments();
//		myApp.init();
		
/*		WriteFile myWriteFile = new WriteFile();
		myWriteFile.writeHTMLHeader("kc2010", "Deportivo", "Sauffpark");
		myWriteFile.writeHTMLLine("0", "1", "Mahony", "Sauffpark");
		myWriteFile.writeHTMLLine("1", "1", "Inge", "Deportivo");
		myWriteFile.writeHTMLLine("1", "2", "Mahony", "Sauffpark");
		myWriteFile.writeHalbzeit();
		myWriteFile.writeHTMLLine("1", "3", "Mahony", "Sauffpark");
		myWriteFile.writeHTMLLine("2", "3", "Zwuckel", "Deportivo");
		myWriteFile.writeHTMLFooter();
*/

//		MP3Player myBtnPlayer = new MP3Player();
//		myBtnPlayer.play("D:\\Workspace\\OMat V2\\BtnSounds\\");
//		Thread myBtnThread = new Thread(myBtnPlayer); //nicht konkurrierend
//		myBtnThread.start();
//		OMatGUI myApp = new OMatGUI();
//		JCupCreator myApp = new JCupCreator();
//		JKOManual myApp = new JKOManual("test_cup");
//		PanelCreator myApp = new PanelCreator();
//		myApp.init();
//		myGen.createPattern(20);
//		myGen.createPattern(27);		
/*		Permutation myPermutation = new Permutation();
		int[]	myinput 	= {1, 2, 3, 4, 5, 6, 7, 8};
		int[]	mypattern	= {1, 3, 5, 7, 8, 6, 4, 2};
		int[]	myresult	= myPermutation.permute(myinput, mypattern);

		System.out.print("Ergebnis: myresult = (");
		for(int i=0; i<myresult.length; i++)
		{
			System.out.print(myresult[i] + ", ");
		}
		System.out.println(")");
*/
//		Turnier myTournament = new Turnier("foxcup");
//		myTournament.createTabellen();
//		myTournament.createVorrunde();

//		JTeamSelector myTeamSelector = new JTeamSelector();
//		myTeamSelector.init();
//		myTeamSelector.showTeams();

//		TestCreator myTestCreator = new TestCreator();
//		myTestCreator.init();

//		JSpielPlan myJSpielPlan = new JSpielPlan();
//		myJSpielPlan.init(10);
		
//		JSpielSelector myJSpielSelector = new JSpielSelector();
//		myJSpielSelector.init();
		
		FileHelper myFileHelper = new FileHelper();
		String[] myString = myFileHelper.getFileNames("HTML\\nations");
		System.out.println("--------");
		for(int i=0; i<myString.length; i++)
		{
			System.out.println("  " + myString[i]);
		}

//		String myString = myFileHelper.openFile();
//		System.out.println(myString);
//		myFileHelper.showLine(myString, 5);
		
//		CountDownSetter myCountDownSetter = new CountDownSetter(459669, 600000);
//		myCountDownSetter.init();

//		JTeamSelector myTeamSelector = new JTeamSelector();
//		myTeamSelector.init();		
		
//		Timer myClockTimer = new Timer();
//		myClockTimer.scheduleAtFixedRate(new Clock(), 0, 100 );		

//		File dir = new File("/home/cd/workspace/OMat/Teams/");
//		File[] fileArray = dir.listFiles();
//		System.out.println(fileArray[2]);
//		System.out.println(fileArray.length);

		System.out.println("Ende..");
	}
}
