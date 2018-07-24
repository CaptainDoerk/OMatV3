package stage_mysql;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Timer;
import java.io.*;
import java.sql.*;

public class OMat extends JFrame implements ActionListener, MouseListener
{
	public static 		OMat instanz;
	SystemOut			sout;
	int 				intDebugLvl;
	
	/*********************************
	 * Variablen und Komponenten GUI *
	 *********************************/
	static final long 	serialVersionUID = 20L;
	
	//Reiter-Fenster rechts oben
//	PanPenalty			panPenalty;			//TODO Ärger mit Sirenen
	PanLogs				panLogs;
	PanLetzter			panLetzter;

	//Reiter-Fenster Mitte unten
	JTabbedPane			jtpOmat				= new JTabbedPane();
//	JTabbedPane			jtpXtra				= new JTabbedPane();
	JScrollPane 		scPanSpielPl,	scPanGruppe;
	PanSpielPlan		panSpielPl;
	PanGruppe 			panGruppe;
	PanMP3Buttons		panMP3Buttons;
	PanSchuetzen		panSchuetzen;

	//Pfade	
	String				strWorkDir  		= System.getProperty("user.dir");
	String				sep 				= File.separator;
	String				torSoundsPfad 		= strWorkDir + sep + "SoundsTore" + sep;
	String				str5MinSounds		= strWorkDir + sep + "Sounds5min" + sep;
	String				strEndeSounds		= strWorkDir + sep + "SoundsEnde" + sep;

	String				strTurnierName = "";
	String				strTurnierName_spl;
	String				strTurnierName_tbl;
//	String				strTurnierName_v_spl;
//	String				strTurnierName_v_tbl;
	String				strSpBerName;
	String				strSpielPaarung;
	String				strAnzGrupp;
	String				strAnzPerio;
	String				strSpielDauer;
	
	//Variablen für Tore
	int					intToreH = 0;
	int 				intToreG = 0;
	String  			strToreH = "0";
	String  			strToreG = "0";
	String				strTeam1Sp1, 	strTeam1Sp2, 	strTeam2Sp1, 	strTeam2Sp2;
	int					intEloH,		intEloG, 		intElo;
	boolean				bolHalbZ;
	
	String				myUpBtn	= strWorkDir + sep + "Icons" + sep + "up.jpg";
	ImageIcon			myUpIcn	= new ImageIcon(myUpBtn);
	String				myDnBtn	= strWorkDir + sep + "Icons" + sep + "down.jpg";
	ImageIcon			myDnIcn	= new ImageIcon(myDnBtn);
	String				myRvBtn = strWorkDir + sep + "Icons" + sep + "reduce.jpg";
	ImageIcon			myRvIcn	= new ImageIcon(myRvBtn);
	String				myFwBtn = strWorkDir + sep + "Icons" + sep + "add.jpg";
	ImageIcon			myFwIcn	= new ImageIcon(myFwBtn);
		
	String				strGruppe =	"a";

	//Heim- und Gastteam
	JLabel  			labTeam1Sp1,	labTeam1Sp2, 	labTeam2Sp1,	labTeam2Sp2;
	JButton				butTeam1Sp1, 	butTeam1Sp2,	butTeam2Sp1,	butTeam2Sp2;
	JLabel				labToreH, 	labToreG;
	JButton 			butToreH, 	butToreG;
	JButton				butToreHUp, butToreHDn;
	JButton				butToreGUp, butToreGDn;

	//Buttons
	JButton 			butStart;	//Start-Stop-Button
	JButton				butReset;	//Reset-Button
	JButton				butRenew;	//Hole Spiele-Button

	//Labels
	JLabel  			labTimer, 	labTimer2;
	JLabel  			labClock;
	JPanel				frmWindw;

	/*******************
	 * Externe Klassen *
	 *******************/
	//Timer
	Timer				myClockTimer;
	Timer 				myCountDownTimer;
	Timer				mySireneTimer;
	CountDown			myCountDown;
	
	DbAccess 			myAccess;
	MP3Thread			myMP3Thread;
	FTPThread			myFTPThread;
//	FTPUpload			myFTPUpload;
//	JTorAnzeige			myJTorAnzeige;	
	
	//SpielPlan
	ResultSet			myResultSet		= null;
	int					intSpielID;
	String				strSpielID;
	int					intSpielAnz;
	
	//extra Window
	boolean				bolXtra			= false;				//Xtra Window hier hinzufügen!
	XtraWindow			myXtraWin;
	Icons				myIcons			= new Icons();
	boolean				bolSchuet;								//Schützenanzeige
	boolean				bolKCMode;								//KC-Modus
	boolean				bolTorAnz;								//Toranzeige?
	boolean				bolFTPUpl;								//Instant-FTP-Upload
	boolean				bolMP3Btn;
	
	//Dateien
	File				myFile;
	FileHelper 			myFileHelper;
	
	HTMLWriter			myWriter;
	
	Elo					myElo;

	public OMat(int intDebugLvl, DbAccess myAccess)
    {
		super("OMat2017");
		
		instanz 			= this;
		this.intDebugLvl 	= intDebugLvl;
		this.myAccess		= myAccess;
		sout				= new SystemOut(intDebugLvl);						//LogLevel(8 = alles, 0 = nichts, 4 = default)
		
		setSize(1024, 768);
		setLocation(0,0);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
        setVisible(true);
       
        //Fonts
        Font fontSml		= new Font("Arial Narrow", 	Font.PLAIN, 14);
        Font fontMed		= new Font("Arial Narrow", 	Font.BOLD,  40);
        Font fontBig		= new Font("Arial Narrow", 	Font.BOLD, 100);

        /******************
         * Heimmannschaft *
         ******************/
        //Label für Name Team1Sp1
        labTeam1Sp1 = new JLabel("", SwingConstants.CENTER);
        labTeam1Sp1.setBounds( 40,  40, 100,  20);
        labTeam1Sp1.setFont(fontSml);
        labTeam1Sp1.setBackground(Color.white);
        labTeam1Sp1.setOpaque(true);
        //Label für Name Team1Sp2
        labTeam1Sp2 = new JLabel("", SwingConstants.CENTER);
        labTeam1Sp2.setBounds(160,  40, 100,  20);
        labTeam1Sp2.setFont(fontSml);
        labTeam1Sp2.setBackground(Color.white);
        labTeam1Sp2.setOpaque(true);
        //Label für die Portraits
        butTeam1Sp1 = new JButton("");
        butTeam1Sp1.setBounds( 40,  80, 100, 100);
        butTeam1Sp1.setOpaque(true);
        butTeam1Sp2 = new JButton("");
        butTeam1Sp2.setBounds(160,  80, 100, 100);
        butTeam1Sp2.setOpaque(true);
        //Label für die TorAnzeige
        labToreH = new JLabel(strToreH, SwingConstants.CENTER);
        labToreH.setBounds(280,  80, 100, 100);
        labToreH.setBackground(Color.white);
        labToreH.setFont(fontBig);
        labToreH.setOpaque(true);
        //Button für Tor
        butToreH = new JButton("Tor!");
		butToreH.setBounds( 40, 200, 220,  40);
		butToreH.setEnabled(false);
		butToreHUp = new JButton(myUpIcn);
		butToreHUp.setBounds(340,80,40,40);
		butToreHUp.setVisible(false);
		butToreHDn = new JButton(myDnIcn);
		butToreHDn.setBounds(340,140,40,40);
		butToreHDn.setVisible(false);

        /********************
         * Timer und Uhrzeit*
         ********************/
		//Uhrzeit
        labClock = new JLabel("!", SwingConstants.CENTER);
        labClock.setBounds(280,  40, 340,  20);
        labClock.setFont(fontSml);
        labClock.setBackground(Color.white);
        labClock.setOpaque(true);	
        //Timer
		labTimer = new JLabel("XX:XX", SwingConstants.CENTER);
		labTimer.setBounds(400, 120, 100,  60);
		labTimer.setFont(fontMed);
		labTimer.setBackground(Color.white);
		labTimer.setOpaque(true);
		labTimer2 = new JLabel("XX:XX", SwingConstants.CENTER); //Rest macht Unterklasse

	    myClockTimer 		= new Timer();
	    myCountDownTimer 	= new Timer();
	    mySireneTimer 		= new Timer();

        /******************
         * Gastmannschaft *
         ******************/
	    //Label für den Teamnamen
        labTeam2Sp1 = new JLabel("", SwingConstants.CENTER);
        labTeam2Sp1.setBounds(640,  40, 100,  20);
        labTeam2Sp1.setFont(fontSml);
        labTeam2Sp1.setBackground(Color.white);
        labTeam2Sp1.setOpaque(true);
	    //Label für den Teamnamen
        labTeam2Sp2 = new JLabel("", SwingConstants.CENTER);
        labTeam2Sp2.setBounds(760,  40, 100,  20);
        labTeam2Sp2.setFont(fontSml);
        labTeam2Sp2.setBackground(Color.white);
        labTeam2Sp2.setOpaque(true);
		//Label für die TorAnzeige
        labToreG = new JLabel(strToreG, SwingConstants.CENTER);
        labToreG.setBounds(520,  80, 100, 100);
        labToreG.setBackground(Color.white);
        labToreG.setFont(fontBig);
        labToreG.setOpaque(true);
        //Label für diePortraits
        butTeam2Sp1 = new JButton("");
        butTeam2Sp1.setBounds(640,  80, 100, 100);
        butTeam2Sp1.setOpaque(true);
        butTeam2Sp2 = new JButton("");
        butTeam2Sp2.setBounds(760,  80, 100, 100);
        butTeam2Sp2.setOpaque(true);
        //Button für Tor
        butToreG = new JButton("Tor!");
		butToreG.setBounds(640, 200, 220,  40);
		butToreG.setEnabled(false);
		butToreGUp = new JButton(myUpIcn);
		butToreGUp.setBounds(520,80,40,40);
		butToreGUp.setVisible(false);
		butToreGDn = new JButton(myDnIcn);
		butToreGDn.setBounds(520,140,40,40);
		butToreGDn.setVisible(false);

		/***********
	     * Buttons *
	     ***********/
		butReset = new JButton("Spiel laden");
        butReset.setFont(fontSml);
        butReset.setBounds(400,  80, 100,  20);
		butRenew = new JButton("Holen");
        butRenew.setFont(fontSml);
        butRenew.setBounds( 40,  10,  70,  20);
		butStart = new JButton("Start");
        butStart.setFont(fontSml);
		butStart.setBounds(280, 200, 340,  40);
		butStart.setEnabled(false);
		
        //JPane
        jtpOmat.setBounds   ( 20, 260, 980, 460);
//		jtpXtra.setBounds	(640,  20, 360, 220);
    }	
	public void init(String strTurnierName)
	{
		//Variablennamen basteln
		this.strTurnierName			= "kcxx";
		this.strTurnierName_tbl 	= "kcxx_tbl";
		this.strTurnierName_spl 	= "kcxx_spl";

		strAnzGrupp		= "1";
		strAnzPerio		= "1";
		strSpielDauer 	= "600";
		bolKCMode 		= true;
		bolFTPUpl		= true;
		bolSchuet 		= false;
		bolTorAnz 		= false;

		//Tabelle
		panGruppe		= new PanGruppe(myAccess, strTurnierName, "a");
		scPanGruppe		= new JScrollPane(panGruppe);
//		scPanGruppe.setSize(2000,2000);
//		scPanGruppe.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
		jtpOmat.addTab("Ranking", scPanGruppe);
		
		//Spielplananzeige hinzu
		panSpielPl		= new PanSpielPlan(intDebugLvl, myAccess, strTurnierName);
		scPanSpielPl 	= new JScrollPane(panSpielPl);
    	jtpOmat.addTab("Spielplan", scPanSpielPl);

    	//gewünschte Module hinzu
//		if(bolTorAnz) myJTorAnzeige	= new JTorAnzeige(intDebugLvl, myAccess, strTurnierName);
		if(bolSchuet)
		{
			panSchuetzen	= new PanSchuetzen(intDebugLvl, myAccess, strTurnierName);
	    	jtpOmat.addTab("Schützen", 	panSchuetzen);
		}
		if(bolFTPUpl) myFTPThread = new FTPThread(intDebugLvl, strTurnierName);
		if(bolMP3Btn || true)
		{
			myMP3Thread		= new MP3Thread();									//zentraler MP3Thread, der von den Unterklassen mitbenutzt werden soll
			panMP3Buttons	= new PanMP3Buttons();
			jtpOmat.addTab("MP3s", 		panMP3Buttons);
		}
		myCountDown  	= new CountDown(strSpielDauer, labTimer, labTimer2);
//		panPenalty		= new PanPenalty();										//TODO Ärger mit Sirenen
//		panLogs			= new PanLogs();
//		panLetzter		= new PanLetzter();
		bolXtra			= false;
		if(bolXtra)	myXtraWin 	= new XtraWindow(labTimer2);
    	jtpOmat.setSelectedComponent(scPanSpielPl);
		add(jtpOmat);
		
//		jtpXtra.addTab("Penalty", 			panPenalty);						//TODO Ärger mit Sirenen
//		jtpXtra.addTab("Logs", 				panLogs);
//		jtpXtra.addTab("letzter Schütze", 	panLetzter);
//		jtpXtra.setSelectedComponent(panPenalty);								//TODO Ärger mit Sirenen
//		add(jtpXtra);
	    
		//HeimTeam aufbringen
	    add(labTeam1Sp1); 	add(labTeam1Sp2);	
	    add(butTeam1Sp1);	butTeam1Sp1.addActionListener(this);
	    add(butTeam1Sp2);	butTeam1Sp2.addActionListener(this);
	    add(labToreH); 		add(butToreH);		butToreH.addActionListener(this);
        add(butToreHUp); 	add(butToreHDn);
        butToreHUp.addActionListener(this);		butToreHDn.addActionListener(this);

        //GastTeam aufbringen
        add(labTeam2Sp1); 	add(labTeam2Sp2);
        add(butTeam2Sp1);	butTeam2Sp1.addActionListener(this);	
        add(butTeam2Sp2);	butTeam2Sp2.addActionListener(this);
 		add(labToreG); 		add(butToreG);		butToreG.addActionListener(this);
        add(butToreGUp); 	add(butToreGDn);
        butToreGUp.addActionListener(this);		butToreGDn.addActionListener(this);

		//SteuerungsButtons aufbringen
        add(butReset);	butReset.addActionListener(this);
        add(butRenew);	butRenew.addActionListener(this);
        add(butStart);	butStart.addActionListener(this);

        //Labels aufbringen
        add(labTimer);	labTimer.addMouseListener(this);
        add(labClock);

        //Uhr initialisieren
	    myClockTimer.scheduleAtFixedRate(new Clock(labClock), 0, 100);
	    myCountDownTimer.scheduleAtFixedRate(myCountDown, 0,  50);

	    myElo	= new Elo();
	    intEloH = 0;
	    intEloG	= 0;
	    
	    //TorAnzeige initialisieren
//	    myJTorAnzeige.setModal(true);
//	    myJTorAnzeige.init();
		try
		{
			panSpielPl.selectNext();											//Cursor auf erstes Spiel mit RC=0 setzen
			intSpielID = panSpielPl.getSelectedSpiel().getSpielID();
			sout.println(7, "OMat.init(Zeile 349): intSpielID ist: " + intSpielID);
		    myWriter = new HTMLWriter(8, myAccess, "kcxx");
		    myWriter.writeAll(labClock.getText());
		    if(bolFTPUpl) myFTPThread.start();
		}
		catch(NullPointerException ex)
		{
			ex.printStackTrace();
			sout.println(1, "OMat.init(Zeile 358): intSpielID ist: " + intSpielID + "\n " + ex );
			showZeroGamesBox();
		}
	    showSpiel();

	    validate();
        repaint();
        
//        panLogs.addText("<b>" + strTurnierName + ": Willkommen!</b>");
	}
	@SuppressWarnings("deprecation")
	public void actionPerformed(ActionEvent evt) 
	{
		/*********************
	     * Tor Heim gedrückt *
	     *********************/
		if(evt.getSource() == butToreH)
		{
			intToreH++;
			labToreH.setText(String.valueOf(intToreH));
			if (bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));			//Anzeigetafel aktualisieren

			checkHalfTime();		//spielt Sirene
			checkFullTime();		//spielt Sirene
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(torSoundsPfad, 100);
				}
				myMP3Thread.start();																			//Torjubel abspielen
			}
/*			if(bolSchuet)
			{
				myJTorAnzeige.show(myCountDown.getGespielt(), strTNamH, strSpBerName, intToreH, intToreG);	//Dialog öffnen für Torschützen-Auswahl
				panSchuetzen.refresh();
			}
			panLogs.addText("(" + myCountDown.getGespielt() + ") Tor für " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
*/
		}
		if(evt.getSource() == butToreHUp)
		{
			intToreH++;
			labToreH.setText(String.valueOf(intToreH));
			if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));
//			panLogs.addText("(" + myCountDown.getGespielt() + ") (+) für " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
			checkHalfTime();
		}
		if(evt.getSource() == butToreHDn)
		{
			intToreH--;
			labToreH.setText(String.valueOf(intToreH));	
			if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));
//			panLogs.addText("(" + myCountDown.getGespielt() + ") (-) für " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
		}
		if(evt.getSource() == butTeam1Sp1)
		{
			intToreH++;
			labToreH.setText(String.valueOf(intToreH));
			if (bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));			//Anzeigetafel aktualisieren

			checkHalfTime();		//spielt Sirene
			checkFullTime();		//spielt Sirene
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(torSoundsPfad, 100);
				}
				myMP3Thread.start();																			//Torjubel abspielen
			}
		}
		if(evt.getSource() == butTeam1Sp2)
		{
			intToreH++;
			labToreH.setText(String.valueOf(intToreH));
			if (bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));			//Anzeigetafel aktualisieren

			checkHalfTime();		//spielt Sirene
			checkFullTime();		//spielt Sirene
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(torSoundsPfad, 100);
				}
				myMP3Thread.start();																			//Torjubel abspielen
			}
		}
		/*********************
	     * Tor Gast gedrückt *
	     *********************/
		if(evt.getSource() == butToreG)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if (bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));			//Anzeigetafel aktualisieren

			//Halbzeit prüfen
			checkHalfTime();
			checkFullTime();
			
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(torSoundsPfad, 100);
				}
				myMP3Thread.start();																			//Torjubel abspielen
			}
/*			if(bolSchuet)
			{
				myJTorAnzeige.show(myCountDown.getGespielt(), strTNamG, strSpBerName, intToreH, intToreG);		//Dialog öffnen für Torschützen-Auswahl
				panSchuetzen.refresh();
			}
			panLogs.addText("(" + myCountDown.getGespielt() + ") Tor für " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
*/		}
		if(evt.getSource() == butToreGUp)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
//			panLogs.addText("(" + myCountDown.getGespielt() + ") (+) für " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
			checkHalfTime();
		}
		if(evt.getSource() == butToreGDn)
		{
			intToreG--;
			labToreG.setText(String.valueOf(intToreG));	
			if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
//			panLogs.addText("(" + myCountDown.getGespielt() + ") (-) für " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
		}
		if(evt.getSource() == butTeam2Sp1)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if (bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));			//Anzeigetafel aktualisieren

			checkHalfTime();		//spielt Sirene
			checkFullTime();		//spielt Sirene
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(torSoundsPfad, 100);
				}
				myMP3Thread.start();																			//Torjubel abspielen
			}
		}
		if(evt.getSource() == butTeam2Sp2)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if (bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));			//Anzeigetafel aktualisieren

			checkHalfTime();		//spielt Sirene
			checkFullTime();		//spielt Sirene
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(torSoundsPfad, 100);
				}
				myMP3Thread.start();																			//Torjubel abspielen
			}
		}
		/***********************
		 * Start/Stop gedrückt *
		 ***********************/
		if(evt.getSource() == butStart)
		{
			if(butStart.getText() == "Start")
			{
				butStart.setText("Stop");
				butReset.setText("Übernehmen");
				butReset.setEnabled(false);
				butToreH.setEnabled(true);
				butTeam1Sp1.setEnabled(true); 			butTeam1Sp2.setEnabled(true);
				butToreHUp.setVisible(false);
				butToreHDn.setVisible(false);
				butToreG.setEnabled(true);
				butTeam2Sp1.setEnabled(true); 			butTeam2Sp2.setEnabled(true);
				butToreGUp.setVisible(false);
				butToreGDn.setVisible(false);
				myCountDown.start();
//				panPenalty.xstart();					//TODO Ärger mit Sirenen
			}
			else
			{
				butStart.setText("Start");
				butReset.setEnabled(true);
				butToreH.setEnabled(false);
				butTeam1Sp1.setEnabled(false); 			butTeam1Sp2.setEnabled(false);
				butToreHUp.setVisible(true);
				butToreHDn.setVisible(true);
				butToreG.setEnabled(false);
				butTeam2Sp1.setEnabled(false); 			butTeam2Sp2.setEnabled(false);
				butToreGUp.setVisible(true);
				butToreGDn.setVisible(true);
				myCountDown.stop();
//				panPenalty.stop();						//TODO Ärger mit Sirenen
			}
		}
		/*********
		 * Holen *
		 *********/
		if(evt.getSource() == butRenew)
		{
			try
			{
				sout.println(7, "TestOMat.actionPerformed('Hole Spiele'): refreshSet()");
				PanManager.getInstance().setSpielPlan(panSpielPl);
				intSpielAnz = PanManager.getInstance().refreshSet();				//PanManager informieren
				if(intSpielAnz > 0)
				{
					panSpielPl.selectNext();
					showSpiel();
					butReset.setText("Spiel laden");
				}
				else
				{
					showZeroGamesBox();
				}
			}
			catch(NullPointerException ex)
			{
				sout.println(1, "TestOMat.actionPerformed('Hole Spiele'): " + ex);
			}
		}
		/****************************
		 * Spiel laden / Übernehmen *
		 ****************************/
		if(evt.getSource() == butReset)
		{
			if(butReset.getText() == "Spiel laden")
			{
				setSpiel();
				myWriter.writeAll(labClock.getText());
				if(bolFTPUpl) myFTPThread.start();
//				panLogs.addText("<b>" + strSpielPaarung + "</b>");
//				sout.println(8, "Schreibe in PanLogs Paarung: " + strSpielPaarung);
//				jtpXtra.setSelectedComponent(panLogs);
				bolHalbZ = false;
			}
			if(butReset.getText() == "Übernehmen")
			{
				myCountDown.reset();
//				panPenalty.reset();					//TODO Ärger mit Sirenen
				
				//Startknopf deaktivieren --> damit das Spiel nicht nochmals gespielt wird
				butStart.setEnabled(false);
				//Spielplan updaten
				myAccess.update(strTurnierName_spl, 
						"Tore1  = " + String.valueOf(intToreH) + ", " +  
						"Tore2  = " + String.valueOf(intToreG) + ", " +
						"X = 8 ",
						"SpielID = " + intSpielID);
				panSpielPl.getSpielByID(intSpielID).setEnabled(false);
				//gespieltes Spiel auf OK setzen
				myAccess.fireSQL("ALTER TABLE `" + strSpBerName + "` RENAME TO `" + strSpBerName + "_OK`");
				
				//Elo berechnen
				intEloH = 0; 
				intEloG = 0;
				intEloH = Integer.parseInt(myAccess.select(strTurnierName_tbl, "Elo", "SpielerID = '" + strTeam1Sp1 + "'"))
						+ Integer.parseInt(myAccess.select(strTurnierName_tbl, "Elo", "SpielerID = '" + strTeam1Sp2 + "'"));
				intEloG = Integer.parseInt(myAccess.select(strTurnierName_tbl, "Elo", "SpielerID = '" + strTeam2Sp1 + "'"))
						+ Integer.parseInt(myAccess.select(strTurnierName_tbl, "Elo", "SpielerID = '" + strTeam2Sp2 + "'"));

				//Tabelle updaten
				if(intToreH > intToreG)		//Heimsieg
				{
					intElo = myElo.berechneElo(1, intEloH, intEloG);
					//Heimteam (hat gewonnen)
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo + " + String.valueOf(intElo) + ", " +
							"Siege = Siege + 1, " + 
							"Punkte = Punkte + 3 ",
							"SpielerID = '" + strTeam1Sp1 + "'");
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo + " + String.valueOf(intElo) + ", " +
							"Siege = Siege + 1, " + 
							"Punkte = Punkte + 3 ",
							"SpielerID = '" + strTeam1Sp2 + "'");
					//Gastteam (hat verloren)
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo - " + String.valueOf(intElo) + ", " +
							"Niederlagen = Niederlagen + 1 ",
							"SpielerID = '" + strTeam2Sp1 + "'");
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo - " + String.valueOf(intElo) + ", " +
							"Niederlagen = Niederlagen + 1 ",
							"SpielerID = '" + strTeam2Sp2 + "'");
					myAccess.update(strTurnierName_spl, "Elo = " + String.valueOf(intElo), "SpielID = '" + intSpielID + "'" );
				}
				else if(intToreH < intToreG)	//Auswärtssieg
				{
					intElo = myElo.berechneElo(2, intEloH, intEloG);
					//Heimteam (hat verloren)
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo - " + String.valueOf(intElo) + ", " +
							"Niederlagen = Niederlagen + 1 ",  
							"SpielerID = '" + strTeam1Sp1 + "'");
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo - " + String.valueOf(intElo) + ", " +
							"Niederlagen = Niederlagen + 1 ",  
							"SpielerID = '" + strTeam1Sp2 + "'");
					//Gastteam (hat gewonnen)
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo + " + String.valueOf(intElo) + ", " +
							"Siege = Siege + 1, " + 
							"Punkte = Punkte + 3",
							"SpielerID = '" + strTeam2Sp1 + "'");
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo + " + String.valueOf(intElo) + ", " +
							"Siege = Siege + 1, " + 
							"Punkte = Punkte + 3",
							"SpielerID = '" + strTeam2Sp2 + "'");
					myAccess.update(strTurnierName_spl, "Elo = " + String.valueOf(intElo), "SpielID = '" + intSpielID + "'" );
				}
				else							//Unentschieden
				{
					intElo = myElo.berechneElo(0, intEloH, intEloG);
					//Heimteam
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo + " + String.valueOf(intElo) + ", " +
							"Unentschieden = Unentschieden + 1, " + 
							"Punkte = Punkte + 1 ", 
							"SpielerID = '" + strTeam1Sp1 + "'");
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo + " + String.valueOf(intElo) + ", " +
							"Unentschieden = Unentschieden + 1, " + 
							"Punkte = Punkte + 1 ", 
							"SpielerID = '" + strTeam1Sp2 + "'");
					//Gastteam
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo - " + String.valueOf(intElo) + ", " +
							"Unentschieden = Unentschieden + 1, " + 
							"Punkte = Punkte + 1 " ,
							"SpielerID = '" + strTeam2Sp1 + "'");
					myAccess.update(strTurnierName_tbl, 
							"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
							"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
							"Spiele = Spiele + 1, " +
							"Elo = Elo - " + String.valueOf(intElo) + ", " +
							"Unentschieden = Unentschieden + 1, " + 
							"Punkte = Punkte + 1 " ,
							"SpielerID = '" + strTeam2Sp2 + "'");
					myAccess.update(strTurnierName_spl, "Elo = " + String.valueOf(intElo), "SpielID = '" + intSpielID + "'" );
				}
				String[] gruppen = PanManager.getInstance().getGruppen();
				for (int i=0; i<gruppen.length; i++)
				{
					PanManager.getInstance().getGruppe(gruppen[i]).refresh();
				}				
				panSpielPl.getSpielByID(intSpielID).updateSpiel(intToreH, intToreG);
				jtpOmat.setSelectedComponent(scPanSpielPl);
				/**
				 * TODO: wenn SpielAnzahl sich ändert, refresh auf PanSpielPlan
				 */
				try
				{
					sout.println(7, "TestOMat.actionPerformed('Übernehmen'): refreshSet()");
					PanManager.getInstance().setSpielPlan(panSpielPl);					//-->ist hier falsch, bei Hole Spiele korrekt
					intSpielAnz = PanManager.getInstance().refreshSet();				//PanManager informieren
					sout.println(7, "intSpielAnz = " + intSpielAnz);
					if(intSpielAnz > 0)
					{
						panSpielPl.selectNext();
						showSpiel();
						butReset.setText("Spiel laden");
					}
					else
					{
						showZeroGamesBox();
					}
				}
				catch(Exception ex)
				{
					System.err.println("TestOMat.actionPerformed('Übernehmen'): " + ex);
				}
				//Tore zurücksetzen
				intToreH = 0;
				labToreH.setText(String.valueOf(intToreH));
				if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));			
				intToreG = 0;
				labToreG.setText(String.valueOf(intToreG));
				if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
				butReset.setText("Spiel laden");
			}
		}
	}
	public void setSpiel()
	{
		intSpielID = panSpielPl.getSelectedSpiel().getSpielID();
		butStart.setEnabled(true);
		showSpiel();
		if(intSpielID < 10)
		{
			strSpielID	= "0" + String.valueOf(intSpielID);
		}
		else
		{
			strSpielID	= String.valueOf(intSpielID);
		}
		strSpBerName 	= strTurnierName 
						+ "_" + strSpielID + "_" 						//SpielID
//						+ labClock.getText().replace(":", "") + "_"		//Uhrzeit
						+ strTeam1Sp1.replace(" ", "") + "_"
						+ strTeam1Sp2.replace(" ", "") + "_vs_" 		
						+ strTeam2Sp1.replace(" ", "") + "_"
						+ strTeam2Sp2.replace(" ", "");
		myAccess.create(strSpBerName, "_tpl_spb");						//legt eine Tabelle für Spielbericht an
		strSpielPaarung = labClock.getText() + ": " + strTeam1Sp1 + " + " + strTeam1Sp2 + " vs. " + strTeam2Sp1 + " + " + strTeam2Sp2;
       	myAccess.update(strTurnierName + "_spl", "X = 1", "SpielID = " + intSpielID);
	}
	@SuppressWarnings("deprecation")
	private void checkFullTime() 
	{
		if((bolKCMode) && (((intToreH == 10 && intToreG < 9) || (intToreH == 11)) || ((intToreG == 10 && intToreH < 9) || (intToreG == 11))))
		{
			butToreH.setEnabled(false);
			butToreG.setEnabled(false);
			butStart.setText("Stop");
			myCountDown.stop();
			//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerstören und neue anlegen
			if(bolMP3Btn)
			{
				if(myMP3Thread != null) 
				{
					myMP3Thread.stop();
					myMP3Thread = new MP3Thread(strEndeSounds, 100);
				}
				myMP3Thread.start();																		//Schlusssirene abspielen
			}
		}
	}
	@SuppressWarnings("deprecation")
	private void checkHalfTime() 
	{
		if((bolKCMode) && ((intToreH == 5 && bolHalbZ == false) || (intToreG == 5 && bolHalbZ == false)))
		{
			sout.println("TestOMat.checkHalfTime(): Löse Halbzeit-Alarm aus!");
			myCountDown.set5MinSirene();		//Stellt den Alarm ab, weil vorher schon 5 Tore gefallen sind.
			bolHalbZ = true;
			//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerstören und neue anlegen
			if(myMP3Thread != null) 
			{
				myMP3Thread.stop();
				myMP3Thread = new MP3Thread(str5MinSounds, 100);
			}
			myMP3Thread.start();																		//Halbzeitsirene abspielen
		}
	}
	public void showSpiel()
	{
		/**
		 * TODO: Fehler bei der Anlage des Finales --> nur ein Spiel, myResultSet.next() liefert NPEx
		 */
	    myResultSet = myAccess.getSet(strTurnierName_spl, "*", "SpielID = " + intSpielID);
        try
        {
        	myResultSet.next();
        	strGruppe	= myResultSet.getString("Gruppe");
        	myWriter.writeAll(labClock.getText());
//        	if(bolFTPUpl) myFTPThread.start();
//       	strTNamH	= myResultSet.getString("Team1Nm");
        	strTeam1Sp1	= myResultSet.getString("Team1Sp1");
        	strTeam1Sp2 = myResultSet.getString("Team1Sp2");
//        	intEloH		= Integer.parseInt(myResultSet.getString("Team1Elo"));
        	labTeam1Sp1.setText(strTeam1Sp1);
        	labTeam1Sp2.setText(strTeam1Sp2);
        	if(bolXtra) myXtraWin.labNameH.setText(strTeam1Sp1 + " + " + strTeam1Sp2);
        	/*
        	 * Portraits setzen
        	 */
			butTeam1Sp1.setIcon(myIcons.getIcon(myResultSet.getString("Team1Sp1")));
			butTeam1Sp2.setIcon(myIcons.getIcon(myResultSet.getString("Team1Sp2")));
//          if(bolXtra) myXtraWin.labWappH.setIcon(myIcons.getIcon(myResultSet.getString("Team1Nm"), "_Wappen", 270));
			
//        	strTNamG	= myResultSet.getString("Team2Nm");
        	strTeam2Sp1	= myResultSet.getString("Team2Sp1");
        	strTeam2Sp2	= myResultSet.getString("Team2Sp2");
//        	intEloG		= Integer.parseInt(myResultSet.getString("Team2Elo"));
        	labTeam2Sp1.setText(strTeam2Sp1);
        	labTeam2Sp2.setText(strTeam2Sp2);
        	if(bolXtra) myXtraWin.labNameG.setText(strTeam2Sp1 + " + " + strTeam2Sp2);
        	/*
        	 * Portraits setzen
        	 */
			butTeam2Sp1.setIcon(myIcons.getIcon(myResultSet.getString("Team2Sp1")));
			butTeam2Sp2.setIcon(myIcons.getIcon(myResultSet.getString("Team2Sp2")));
//        	if(bolXtra) myXtraWin.labWappG.setIcon(myIcons.getIcon(myResultSet.getString("Team2Nm"), "_Wappen", 270));
        	repaint();
        }
		catch(SQLException e)
		{
			sout.println(1, "TestOMat.showSpiel(): Fehler im ResultSet: " + e);
		}
	}
	public String getSchuetzen()
	{
		String mySchuetzen = "<html><b>Top 10 Schützen</b><br><br>";
		ResultSet myResultSet = myAccess.getSet("spieler", "*", "SpielerName != '_Eigentor' AND SpielerName != '_unbekannt' ORDER BY Tore DESC");
		for(int i = 0; i<10; i++)
		{
			try
			{
				myResultSet.next();
				mySchuetzen	+= myResultSet.getString("SpielerName");
				for(int j=myResultSet.getString("SpielerName").length();j<25;j++)
				{
					mySchuetzen += ".";
				}
				if(myResultSet.getString("Tore").length() == 1)
				{
					mySchuetzen += ".";
				}
				mySchuetzen	+= myResultSet.getString("Tore") + "<br>";
			}
			catch(SQLException e)
			{
				mySchuetzen = "Fehler bei der Schützenanzeige";
			}
		}
		return mySchuetzen;
	}
	public void showZeroGamesBox()
	{
		int	intResult = JOptionPane.showConfirmDialog
		(	
			null, 
			"Achtung! \n" +
			"\n" +
			"Keine ungespielten Spiele (mehr) im aktuellen Turnier gefunden! \n" +
			"Möchten Sie den Generator starten (empfohlen)?", 
			"OMat meldet:", 
			JOptionPane.OK_CANCEL_OPTION
		);
		if(intResult == JOptionPane.OK_OPTION)
		{
			sout.println(8, "TestOMat.showZeroGamesBox): OK geklickt");
			JOptionen myJOptionen = new JOptionen(intDebugLvl, myAccess);
			myJOptionen.init();
		}
		butReset.setText("Hole Spiele");
	}

	/************************
	 * MouseEvents abfangen *
	 ************************/
 	public void mousePressed(MouseEvent arg0) { /** */ }
 	public void mouseEntered(MouseEvent arg0) { /** */ }
 	public void mouseExited(MouseEvent arg0) { /** */ }
 	public void mouseClicked(MouseEvent arg0) { /** */ }
 	public void mouseReleased(MouseEvent arg0) { /** */ }
}