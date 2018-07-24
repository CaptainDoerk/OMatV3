package dev;

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import java.util.Timer;
import java.io.*;
import java.sql.*;

public class TestOMat extends JFrame implements ActionListener, MouseListener
{
	public static 		TestOMat instanz;
	SystemOut			sout;
	
	/*********************************
	 * Variablen und Komponenten GUI *
	 *********************************/
	static final long 	serialVersionUID = 20L;
	String				strHost;
	String				strPort;
	String				strBase;			//wird evtl. nicht benötigt
	String				strUser;
	String				strPass;
	
	//Reiter-Fenster rechts oben
//	PanPenalty			panPenalty;			//TODO Ärger mit Sirenen
	PanLogs				panLogs;
	PanLetzter			panLetzter;

	//Reiter-Fenster Mitte unten
	JTabbedPane			jtpOmat				= new JTabbedPane();
	JTabbedPane			jtpXtra				= new JTabbedPane();
	JScrollPane 		scPanSpielPl;
	PanSpielPlan		panSpielPl;
	PanGruppe			panGruppe;			//TODO: dynamisieren je nach Anzahl Gruppen
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
	String				strTurnierName_v_spl;
	String				strTurnierName_v_tbl;
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
	String				strTNamH;
	String				strTNamG;
	String				strTeam1;
	String				strTeam2;
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
	JLabel  			labNameH, 	labNameG;
	JLabel				labWappH, 	labWappG;
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
	JTorAnzeige			myJTorAnzeige;	
	
	//SpielPlan
	ResultSet			myResultSet		= null;
	int					intSpielID;
	String				strSpielID;
	int					intSpielAnz;

	//extra Window
	boolean				bolXtra			= false;				//Xtra Window hier hinzufügen!
	XtraWindow			myXtraWin;
	Icons				myIcons			= new Icons();
	String				strSchuet;
	String				strKCMode;
	String				strTorAnz;
	
	//Dateien
	File				myFile;
	FileHelper 			myFileHelper;
	
	HTMLWriter			myWriter;
	FTPUpload			myFTPUpload;
    
	/**
	 * @deprecated
	 * Neue Klasse OMat nehmen - TestOMat ist alte Version, evtl. für SQLite
	 */
	public TestOMat()
    {
		super("TestOMat V0.1");
		
		instanz = this;
		sout	= new SystemOut();								//LogLevel(8 = alles, 0 = nichts, 4 = default)
		
		setSize(1024, 768);
		setLocation(0,0);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
        setVisible(true);
       
        //Fonts
        Font fontSml		= new Font("Arial Narrow", 	Font.PLAIN, 14);
        Font fontMed		= new Font("Arial Narrow", 	Font.BOLD,  40);
        Font fontBig		= new Font("Arial Narrow", 	Font.BOLD, 100);

		//Datenbankzugriff
		myAccess			= new DbAccess(8);

        /******************
         * Heimmannschaft *
         ******************/
        //Label für den Teamnamen
        labNameH = new JLabel("", JLabel.CENTER);
        labNameH.setBounds( 40,  40, 220,  20);
        labNameH.setFont(fontSml);
        labNameH.setBackground(Color.white);
        labNameH.setOpaque(true);
        //Label für das Wappen
        labWappH = new JLabel("", JLabel.CENTER);
        labWappH.setBounds( 40,  80, 100, 100);
        labWappH.setOpaque(true);
        //Label für die TorAnzeige
        labToreH = new JLabel(strToreH, JLabel.CENTER);
        labToreH.setBounds(160,  80, 100, 100);
        labToreH.setBackground(Color.white);
        labToreH.setFont(fontBig);
        labToreH.setOpaque(true);
        //Button für Tor
        butToreH = new JButton("Tor!");
		butToreH.setBounds( 40, 200, 220,  40);
		butToreH.setEnabled(false);
		butToreHUp = new JButton(myUpIcn);
		butToreHUp.setBounds(220,80,40,40);
		butToreHUp.setVisible(false);
		butToreHDn = new JButton(myDnIcn);
		butToreHDn.setBounds(220,140,40,40);
		butToreHDn.setVisible(false);

        /********************
         * Timer und Uhrzeit*
         ********************/
		//Uhrzeit
        labClock = new JLabel("", JLabel.CENTER);
        labClock.setBounds(280,  40, 100,  20);
        labClock.setFont(fontSml);
        labClock.setBackground(Color.white);
        labClock.setOpaque(true);	
        //Timer
		labTimer = new JLabel("XX:XX", JLabel.CENTER);
		labTimer.setBounds(280, 120, 100,  60);
		labTimer.setFont(fontMed);
		labTimer.setBackground(Color.white);
		labTimer.setOpaque(true);
		labTimer2 = new JLabel("XX:XX", JLabel.CENTER); //Rest macht Unterklasse

	    myClockTimer 		= new Timer();
	    myCountDownTimer 	= new Timer();
	    mySireneTimer 		= new Timer();

        /******************
         * Gastmannschaft *
         ******************/
	    //Label für den Teamnamen
        labNameG = new JLabel("", JLabel.CENTER);
        labNameG.setBounds(400,  40, 220,  20);
        labNameG.setFont(fontSml);
        labNameG.setBackground(Color.white);
        labNameG.setOpaque(true);
		//Label für die TorAnzeige
        labToreG = new JLabel(strToreG, JLabel.CENTER);
        labToreG.setBounds(400,  80, 100, 100);
        labToreG.setBackground(Color.white);
        labToreG.setFont(fontBig);
        labToreG.setOpaque(true);
		//Label für das Wappen
        labWappG = new JLabel("", JLabel.CENTER);
        labWappG.setBounds(520,  80, 100, 100);
        labWappG.setOpaque(true);
        //Button für Tor
        butToreG = new JButton("Tor!");
		butToreG.setBounds(400, 200, 220,  40);
		butToreG.setEnabled(false);
		butToreGUp = new JButton(myUpIcn);
		butToreGUp.setBounds(400,80,40,40);
		butToreGUp.setVisible(false);
		butToreGDn = new JButton(myDnIcn);
		butToreGDn.setBounds(400,140,40,40);
		butToreGDn.setVisible(false);

		/***********
	     * Buttons *
	     ***********/
		butReset = new JButton("Spiel laden");
        butReset.setFont(fontSml);
        butReset.setBounds(280,  80, 100,  20);
		butRenew = new JButton("Holen");
        butRenew.setFont(fontSml);
        butRenew.setBounds( 40,  10,  70,  20);
		butStart = new JButton("Start");
        butStart.setFont(fontSml);
		butStart.setBounds(280, 200, 100,  40);
		butStart.setEnabled(false);
		
        //JPane
        jtpOmat.setBounds   ( 20, 260, 980, 460);
        jtpXtra.setBounds	(640,  20, 360, 220);
        
        myFTPUpload = new FTPUpload();									//TODO: nur erzeugen, sofern gewünscht
    }	
	public void init(String strTurnierName)
	{
		//Variablennamen basteln
		this.strTurnierName			= strTurnierName;
		this.strTurnierName_tbl 	= strTurnierName + "_tbl";
		this.strTurnierName_v_tbl 	= "v_" + strTurnierName + "_tbl";
		this.strTurnierName_spl 	= strTurnierName + "_spl";
		this.strTurnierName_v_spl 	= "v_" + strTurnierName + "_spl";
		sout.println(8, "TestOMat.init(): strTurnierName = " + strTurnierName);

		//Turnier-Parameter lesen
		myResultSet		= myAccess.getSet("__turniere", "AnzGrupp, AnzPerio, DauerSek, KCMode, Schuet", "TurnierName = '" + strTurnierName + "'");
		try
		{
			myResultSet.next();
			strAnzGrupp		= myResultSet.getString("AnzGrupp");
			strAnzPerio		= myResultSet.getString("AnzPerio");
			strSpielDauer 	= myResultSet.getString("DauerSek");
			strKCMode 		= myResultSet.getString("KCMode");
			strSchuet 		= myResultSet.getString("Schuet");
			strTorAnz 		= "1";
		}
		catch(SQLException ex)
		{
			System.err.println("TestOMat.init([lese Turnier-Parameter]): " + ex);;
		}

		//Gruppen dynamisch hinzufügen
		myResultSet		= myAccess.getSet(strTurnierName_v_spl, "DISTINCT Gruppe", "Gruppe BETWEEN 'a' AND 'z' ORDER BY Gruppe ASC");
		try
		{
			while (myResultSet.next())
			{
		    	jtpOmat.addTab("Gruppe " + myResultSet.getString("Gruppe").toUpperCase(), new PanGruppe(8, strTurnierName, myResultSet.getString("Gruppe")));
			}
		}
		catch(SQLException ex)
		{
				System.err.println("TestOMat.init([lade dynamisch Gruppen hinzu]): " + ex);
		}
		
		//Spielplananzeige hinzu
		panSpielPl		= new PanSpielPlan(8, strTurnierName);
		scPanSpielPl 	= new JScrollPane(panSpielPl);
    	jtpOmat.addTab("Spielplan", scPanSpielPl);

    	//Toranzeige hinzu, wenn gewünscht
		sout.println(8, "TestOMat.init(): strTorAnz = " + strTorAnz);
		if(strTorAnz.equals("1")) 
		{   	
			myJTorAnzeige	= new JTorAnzeige(8, strTurnierName);
		}
		sout.println(8, "TestOMat.init(): strSchuet = " + strSchuet);
		if(strSchuet.equals("1"))
		{
			panSchuetzen	= new PanSchuetzen(8, strTurnierName);
	    	jtpOmat.addTab("Schützen", 	panSchuetzen);
		}

		//MP3-Buttons hinzufügen
		myMP3Thread		= new MP3Thread();										//zentraler MP3Thread, der von den Unterklassen mitbenutzt werden soll
		panMP3Buttons	= new PanMP3Buttons();
		jtpOmat.addTab("MP3s", 		panMP3Buttons);

		myCountDown  	= new CountDown(strSpielDauer, labTimer, labTimer2);
//		panPenalty		= new PanPenalty();										//TODO Ärger mit Sirenen
		panLogs			= new PanLogs();
		panLetzter		= new PanLetzter();
		if(bolXtra)	myXtraWin 	= new XtraWindow(labTimer2);
    	jtpOmat.setSelectedComponent(scPanSpielPl);
		add(jtpOmat);
		
//		jtpXtra.addTab("Penalty", 			panPenalty);						//TODO Ärger mit Sirenen
		jtpXtra.addTab("Logs", 				panLogs);
		jtpXtra.addTab("letzter Schütze", 	panLetzter);
//		jtpXtra.setSelectedComponent(panPenalty);								//TODO Ärger mit Sirenen
		add(jtpXtra);
	    
	    add(labNameH); 		add(labWappH); 		add(labToreH); 		add(butToreH);
        butToreH.addActionListener(this);
        add(butToreHUp); 	add(butToreHDn);
        butToreHUp.addActionListener(this);		butToreHDn.addActionListener(this);

        //GastTeam aufbringen
        add(labNameG); 		add(labToreG); 		add(labWappG); 		add(butToreG);
        butToreG.addActionListener(this);
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

	    //TorAnzeige initialisieren
	    myJTorAnzeige.setModal(true);
	    myJTorAnzeige.init();
	      
		try
		{
			panSpielPl.selectNext();											//Cursor auf erstes Spiel mit RC=0 setzen
			intSpielID = panSpielPl.getSelectedSpiel().getSpielID();
		    myWriter = new HTMLWriter(8, strTurnierName);
		    myWriter.writeAll(labClock.getText());
        	myFTPUpload.uploadToFTP(strTurnierName);

		    if(Integer.parseInt(strAnzGrupp) >= 2) myWriter.writeGruppe("b");	//TODO: Sinn? 5 Zeilen weiter oben writeAll();
		    if(Integer.parseInt(strAnzGrupp) >= 3) myWriter.writeGruppe("c");
		    if(Integer.parseInt(strAnzGrupp) >= 4) myWriter.writeGruppe("d");
		}
		catch(NullPointerException ex)
		{
			sout.println(1, "TestOMat.init(Zeile 344): intSpielID ist NULL \n " + ex );
			intSpielID = 0;
			showZeroGamesBox();
		}
	    showSpiel();

	    validate();
        repaint();
        
        panLogs.addText("<b>" + strTurnierName + ": Willkommen!</b>");
	}
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
			if(myMP3Thread != null) 
			{
				myMP3Thread.stop();
				myMP3Thread = new MP3Thread(torSoundsPfad, 100);
			}
			myMP3Thread.start();																			//Torjubel abspielen

			if(strSchuet.equals("1"))
			{
				myJTorAnzeige.show(myCountDown.getGespielt(), strTNamH, strSpBerName, intToreH, intToreG);		//Dialog öffnen für Torschützen-Auswahl
				panSchuetzen.refresh();
			}
			panLogs.addText("(" + myCountDown.getGespielt() + ") Tor für " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
		}
		if(evt.getSource() == butToreHUp)
		{
			intToreH++;
			labToreH.setText(String.valueOf(intToreH));
			if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (+) für " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
			checkHalfTime();
		}
		if(evt.getSource() == butToreHDn)
		{
			intToreH--;
			labToreH.setText(String.valueOf(intToreH));	
			if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (-) für " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
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
			
			if(myMP3Thread != null) 
			{
				myMP3Thread.stop();
				myMP3Thread = new MP3Thread(torSoundsPfad, 100);
			}
			myMP3Thread.start();																			//Torjubel abspielen

			if(strSchuet.equals("1"))
			{
				myJTorAnzeige.show(myCountDown.getGespielt(), strTNamG, strSpBerName, intToreH, intToreG);		//Dialog öffnen für Torschützen-Auswahl
				panSchuetzen.refresh();
			}
			panLogs.addText("(" + myCountDown.getGespielt() + ") Tor für " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
		}
		if(evt.getSource() == butToreGUp)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (+) für " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
			checkHalfTime();
		}
		if(evt.getSource() == butToreGDn)
		{
			intToreG--;
			labToreG.setText(String.valueOf(intToreG));	
			if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (-) für " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
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
				butToreHUp.setVisible(false);
				butToreHDn.setVisible(false);
				butToreG.setEnabled(true);
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
				butToreHUp.setVisible(true);
				butToreHDn.setVisible(true);
				butToreG.setEnabled(false);
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
				myFTPUpload.uploadToFTP(strTurnierName);
				panLogs.addText("<b>" + strSpielPaarung + "</b>");
				sout.println(8, "Schreibe in PanLogs Paarung: " + strSpielPaarung);
				jtpXtra.setSelectedComponent(panLogs);
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
				myAccess.fireSQL("ALTER TABLE `" + strSpBerName + "` " +
								   "RENAME TO `" + strSpBerName + "_OK`");
				//Tabelle updaten
				if(intToreH > intToreG)
				{
					//Heimsieg
					//Heimteam (hat gewonnen)
					myAccess.update(strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
								"Spiele = Spiele + 1, " +
								"Siege = Siege + 1, " + 
								"Punkte = Punkte + 3 ",
								"TeamID = '" + strTeam1 + "'");
					//Gastteam (hat verloren)
					myAccess.update(strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
								"Spiele = Spiele + 1, " +
								"Niederlagen = Niederlagen + 1 ",
								"TeamID = '" + strTeam2 + "'");
				}
				else if(intToreH < intToreG)	//Auswärtssieg
				{
					//Heimteam (hat verloren)
					myAccess.update(strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
								"Spiele = Spiele + 1, " +
								"Niederlagen = Niederlagen + 1 ",  
								"TeamID = '" + strTeam1 + "'");
					//Gastteam (hat gewonnen)
					myAccess.update(strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
								"Spiele = Spiele + 1, " +
								"Siege = Siege + 1, " + 
								"Punkte = Punkte + 3",
								"TeamID = '" + strTeam2 + "'");
				}
				else							//Unentschieden
				{
					//Heimteam
					myAccess.update(strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
								"Spiele = Spiele + 1, " +
								"Unentschieden = Unentschieden + 1, " + 
								"Punkte = Punkte + 1 ", 
								"TeamID = '" + strTeam1 + "'");
					//Gastteam
					myAccess.update(strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
								"Spiele = Spiele + 1, " +
								"Unentschieden = Unentschieden + 1, " + 
								"Punkte = Punkte + 1 " ,
								"TeamID = '" + strTeam2 + "'");
				}
				String[] gruppen = PanManager.getInstance().getGruppen();
				for (int i=0; i<gruppen.length; i++)
				{
					PanManager.getInstance().getGruppe(gruppen[i]).refresh();
				}				
				panSpielPl.getSpielByID(intSpielID).updateSpiel(intToreH, intToreG);
				jtpOmat.setSelectedComponent(scPanSpielPl);
				/**
				 * todo: wenn SpielAnzahl sich ändert, refresh auf PanSpielPlan
				 */
				try
				{
					sout.println(7, "TestOMat.actionPerformed('Übernehmen'): refreshSet()");
					PanManager.getInstance().setSpielPlan(panSpielPl);					//-->ist hier falsch, bei Hole Spiele korrekt
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
						+ strTNamH.replace(" ", "_") + "_vs_" 			//Team A
						+ strTNamG.replace(" ", "_");
		myAccess.create(strSpBerName, "_tpl_spb");				//legt eine Tabelle für Spielbericht an
		strSpielPaarung = labClock.getText() + ": " + strTNamH + " vs. " + strTNamG;
       	myAccess.update(strTurnierName + "_spl", "X = 1", "SpielID = " + intSpielID);
	}
	private void checkFullTime() 
	{
		if(strKCMode.equals("1") && (((intToreH == 10 && intToreG < 9) || (intToreH == 11)) || ((intToreG == 10 && intToreH < 9) || (intToreG == 11))))
		{
			butToreH.setEnabled(false);
			butToreG.setEnabled(false);
			butStart.setText("Stop");
//			butStart.setEnabled(false);
//			butReset.setEnabled(true);
			myCountDown.stop();
			//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerstören und neue anlegen
			if(myMP3Thread != null) 
			{
				myMP3Thread.stop();
				myMP3Thread = new MP3Thread(strEndeSounds, 100);
			}
			myMP3Thread.start();																		//Schlusssirene abspielen
		}
	}
	private void checkHalfTime() 
	{
		if(strKCMode.equals("1") && ((intToreH == 5 && bolHalbZ == false) || (intToreG == 5 && bolHalbZ == false)))
		{
			sout.println("TestOMat.checkHalfTime(): Löse Halbzeit-Alarm aus!");
			myCountDown.set5MinSirene();		//Stellt den Alarm ab, weil vorher schon 5 Tore gefallen sind.
			bolHalbZ = true;
			//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerstören und neue anlegen
//			myMP3Thread.interrupt();
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
		 * TODO: Fehler bei der Anlage des Finales --> nur ein Spiel, myResultSet.next() liefert NPO
		 */
	    myResultSet = myAccess.getSet(strTurnierName_v_spl, "*", "SpielID = " + intSpielID);
        try
        {
        	myResultSet.next();
        	strGruppe	= myResultSet.getString("Gruppe");
        	myWriter.writeAll(labClock.getText());
        	myFTPUpload.uploadToFTP(strTurnierName);
        	strTNamH	= myResultSet.getString("Team1Nm");
        	strTeam1	= myResultSet.getString("Team1ID");		//Für DB-Update und Toranzeige die TeamID
        	labNameH.setText(strTNamH);
        	if(bolXtra) myXtraWin.labNameH.setText(strTNamH);
        	/*
        	 * Wappen setzen
        	 */
           	labWappH.setIcon(myIcons.getIcon(myResultSet.getString("Team1Nm"), "_Wappen"));
           	if(bolXtra) myXtraWin.labWappH.setIcon(myIcons.getIcon(myResultSet.getString("Team1Nm"), "_Wappen", 270));
			
        	strTNamG	= myResultSet.getString("Team2Nm");
        	strTeam2	= myResultSet.getString("Team2ID");		//Für DB-Update und Toranzeige die TeamID
        	labNameG.setText(strTNamG);
        	if(bolXtra) myXtraWin.labNameG.setText(strTNamG);
        	/*
        	 * Wappen setzen
        	 */
           	labWappG.setIcon(myIcons.getIcon(myResultSet.getString("Team2Nm"), "_Wappen"));
           	sout.println(8, "Team 1 = " + myResultSet.getString("Team1Nm") + " vs. " + myResultSet.getString("Team2Nm"));
           	if(bolXtra) myXtraWin.labWappG.setIcon(myIcons.getIcon(myResultSet.getString("Team2Nm"), "_Wappen", 270));
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
			JOptionen myJOptionen = new JOptionen(8);
			myJOptionen.init();
		}
		butReset.setText("Hole Spiele");
	}

	/************************
	 * MouseEvents abfangen *
	 ************************/
 	public void mousePressed(MouseEvent arg0) 
 	{
// 		myCountDown.setRestZeit();
 	}
 	public void mouseEntered(MouseEvent arg0) {}
 	public void mouseExited(MouseEvent arg0) {}
 	public void mouseClicked(MouseEvent arg0) {}
 	public void mouseReleased(MouseEvent arg0) {}
}