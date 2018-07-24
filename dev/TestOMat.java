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
	String				strBase;			//wird evtl. nicht ben�tigt
	String				strUser;
	String				strPass;
	
	//Reiter-Fenster rechts oben
//	PanPenalty			panPenalty;			//TODO �rger mit Sirenen
	PanLogs				panLogs;
	PanLetzter			panLetzter;

	//Reiter-Fenster Mitte unten
	JTabbedPane			jtpOmat				= new JTabbedPane();
	JTabbedPane			jtpXtra				= new JTabbedPane();
	JScrollPane 		scPanSpielPl;
	PanSpielPlan		panSpielPl;
	PanGruppe			panGruppe;													//TODO: dynamisieren je nach Anzahl Gruppen
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
	String				strSpielDauer;
	
	//Variablen f�r Tore
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
	boolean				bolXtra			= false;				//Xtra Window hier hinzuf�gen!
	XtraWindow			myXtraWin;
	Icons				myIcons			= new Icons();
	String				strSchuet;
	String				strKCMode;
	
	//Dateien
	File				myFile;
	FileHelper 			myFileHelper;
    
	public TestOMat()
    {
		super("TestOMat V0.1");
		
		instanz = this;
		sout	= new SystemOut();								//LogLevel
		
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
		myAccess			= new DbAccess();

        /******************
         * Heimmannschaft *
         ******************/
        //Label f�r den Teamnamen
        labNameH = new JLabel("", JLabel.CENTER);
        labNameH.setBounds( 40,  40, 220,  20);
        labNameH.setFont(fontSml);
        labNameH.setBackground(Color.white);
        labNameH.setOpaque(true);
        //Label f�r das Wappen
        labWappH = new JLabel("", JLabel.CENTER);
        labWappH.setBounds( 40,  80, 100, 100);
        labWappH.setOpaque(true);
        //Label f�r die TorAnzeige
        labToreH = new JLabel(strToreH, JLabel.CENTER);
        labToreH.setBounds(160,  80, 100, 100);
        labToreH.setBackground(Color.white);
        labToreH.setFont(fontBig);
        labToreH.setOpaque(true);
        //Button f�r Tor
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
	    //Label f�r den Teamnamen
        labNameG = new JLabel("", JLabel.CENTER);
        labNameG.setBounds(400,  40, 220,  20);
        labNameG.setFont(fontSml);
        labNameG.setBackground(Color.white);
        labNameG.setOpaque(true);
		//Label f�r die TorAnzeige
        labToreG = new JLabel(strToreG, JLabel.CENTER);
        labToreG.setBounds(400,  80, 100, 100);
        labToreG.setBackground(Color.white);
        labToreG.setFont(fontBig);
        labToreG.setOpaque(true);
		//Label f�r das Wappen
        labWappG = new JLabel("", JLabel.CENTER);
        labWappG.setBounds(520,  80, 100, 100);
        labWappG.setOpaque(true);
        //Button f�r Tor
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
    }	
	public void init()
	{
		myAccess.init();
		myResultSet = myAccess.getSet("kc", "turniere", "*", "aktiv = 1");
		try
		{
			myResultSet.next();
			strTurnierName 	= myResultSet.getString("TurnierName");
			strSpielDauer   = myResultSet.getString("DauerSek");
			strSchuet		= myResultSet.getString("Schuet");
			strKCMode		= myResultSet.getString("KCMode");
			sout.println(6, "Datensatz gefunden, Lade Turnier: " + strTurnierName);
		}
		catch(SQLException ex)
		{
			sout.println(2, "TestOMat.init(): " + ex);
			strTurnierName	= "default";
			strSpielDauer	= "600";
			strSchuet		= "1";
			strKCMode		= "1";
		}
		this.strTurnierName_tbl 	= strTurnierName + "_tbl";
		this.strTurnierName_v_tbl 	= strTurnierName + "_v_tbl";
		this.strTurnierName_spl 	= strTurnierName + "_spl";
		this.strTurnierName_v_spl 	= strTurnierName + "_v_spl";
		
		sout.println(8, "TestOMat.init(): strTurnierName = " + strTurnierName);

		//Gruppen dynamisch hinzuf�gen
		myResultSet		= myAccess.getSet("kc", strTurnierName_v_spl, "DISTINCT Gruppe", "Gruppe BETWEEN 'a' AND 'z' ORDER BY Gruppe ASC");
		try
		{
			while (myResultSet.next())
			{
		    	jtpOmat.addTab("Gruppe " + myResultSet.getString("Gruppe").toUpperCase(), new PanGruppe(strTurnierName, myResultSet.getString("Gruppe").toUpperCase()));
			}
		}
		catch(SQLException ex)
		{
				System.err.println("TestOMat.init(): " + ex);
		}
		myJTorAnzeige	= new JTorAnzeige(strTurnierName);
		myMP3Thread		= new MP3Thread();										//zentraler MP3Thread, der von den Unterklassen mitbenutzt werden soll
		panMP3Buttons	= new PanMP3Buttons();
		myCountDown  	= new CountDown(strSpielDauer, labTimer, labTimer2);
		panSchuetzen	= new PanSchuetzen(strTurnierName);
		panSpielPl		= new PanSpielPlan(strTurnierName);
//		panPenalty		= new PanPenalty();										//TODO �rger mit Sirenen
		panLogs			= new PanLogs();
		panLetzter		= new PanLetzter();
		
		if(bolXtra)	myXtraWin 	= new XtraWindow(labTimer2);

		/**
		 * JPanels
		 */
		scPanSpielPl 	= new JScrollPane(panSpielPl);
    	jtpOmat.addTab("Spielplan", scPanSpielPl);
    	jtpOmat.addTab("Sch�tzen", 	panSchuetzen);
		jtpOmat.addTab("MP3s", 		panMP3Buttons);
    	jtpOmat.setSelectedComponent(scPanSpielPl);
		add(jtpOmat);
		
//		jtpXtra.addTab("Penalty", 			panPenalty);						//TODO �rger mit Sirenen
		jtpXtra.addTab("Logs", 				panLogs);
		jtpXtra.addTab("letzter Sch�tze", 	panLetzter);
//		jtpXtra.setSelectedComponent(panPenalty);								//TODO �rger mit Sirenen
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
		}
		catch(NullPointerException ex)
		{
			sout.println(5, "TestOMat.init(Zeile 344): intSpielID ist NULL \n " + ex );
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
	     * Tor Heim gedr�ckt *
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
				myJTorAnzeige.show(myCountDown.getGespielt(), strTNamH, strSpBerName, intToreH, intToreG);		//Dialog �ffnen f�r Torsch�tzen-Auswahl
				panSchuetzen.refresh();
			}
			panLogs.addText("(" + myCountDown.getGespielt() + ") Tor f�r " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
		}
		if(evt.getSource() == butToreHUp)
		{
			intToreH++;
			labToreH.setText(String.valueOf(intToreH));
			if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (+) f�r " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
			checkHalfTime();
		}
		if(evt.getSource() == butToreHDn)
		{
			intToreH--;
			labToreH.setText(String.valueOf(intToreH));	
			if(bolXtra) myXtraWin.labToreH.setText(String.valueOf(intToreH));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (-) f�r " + strTNamH + ", Spielstand " + intToreH + ":" + intToreG);
		}
		/*********************
	     * Tor Gast gedr�ckt *
	     *********************/
		if(evt.getSource() == butToreG)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if (bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));			//Anzeigetafel aktualisieren

			//Halbzeit pr�fen
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
				myJTorAnzeige.show(myCountDown.getGespielt(), strTNamG, strSpBerName, intToreH, intToreG);		//Dialog �ffnen f�r Torsch�tzen-Auswahl
				panSchuetzen.refresh();
			}
			panLogs.addText("(" + myCountDown.getGespielt() + ") Tor f�r " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
		}
		if(evt.getSource() == butToreGUp)
		{
			intToreG++;
			labToreG.setText(String.valueOf(intToreG));
			if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (+) f�r " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
			checkHalfTime();
		}
		if(evt.getSource() == butToreGDn)
		{
			intToreG--;
			labToreG.setText(String.valueOf(intToreG));	
			if(bolXtra) myXtraWin.labToreG.setText(String.valueOf(intToreG));
			panLogs.addText("(" + myCountDown.getGespielt() + ") (-) f�r " + strTNamG + ", Spielstand " + intToreH + ":" + intToreG);
		}
		/***********************
		 * Start/Stop gedr�ckt *
		 ***********************/
		if(evt.getSource() == butStart)
		{
			if(butStart.getText() == "Start")
			{
				butStart.setText("Stop");
				butReset.setText("�bernehmen");
				butReset.setEnabled(false);
				butToreH.setEnabled(true);
				butToreHUp.setVisible(false);
				butToreHDn.setVisible(false);
				butToreG.setEnabled(true);
				butToreGUp.setVisible(false);
				butToreGDn.setVisible(false);
				myCountDown.start();
//				panPenalty.xstart();					//TODO �rger mit Sirenen
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
//				panPenalty.stop();				//TODO �rger mit Sirenen
			}
		}
		/***************************************************
		 * Spiel laden / �bernehmen / Hole Spiele gedr�ckt *
		 ***************************************************/
		if(evt.getSource() == butRenew && intSpielAnz > 0)
		{
			try
			{
				sout.println(5, "TestOMat.actionPerformed('Hole Spiele'): refreshSet()");
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
				sout.println(2, "TestOMat.actionPerformed('Hole Spiele'): " + ex);
			}
		}
		if(evt.getSource() == butReset)
		{
			if(butReset.getText() == "Spiel laden")
			{
				setSpiel();
				panLogs.addText("<b>" + strSpielPaarung + "</b>");
				sout.println(8, "Schreibe in PanLogs Paarung: " + strSpielPaarung);
				jtpXtra.setSelectedComponent(panLogs);
				bolHalbZ = false;
			}
			if(butReset.getText() == "�bernehmen")
			{
				//CountDown zur�cksetzen
				myCountDown.reset();
//				panPenalty.reset();					//TODO �rger mit Sirenen
				
				//Startknopf deaktivieren --> damit das Spiel nicht nochmals gespielt wird
				butStart.setEnabled(false);
				//Spielplan updaten
				myAccess.update("kc", strTurnierName_spl, 
						"Tore1  = " + String.valueOf(intToreH) + ", " +  
						"Tore2  = " + String.valueOf(intToreG) + ", " +
						"X = 8 ",
						"SpielID = " + intSpielID);
				panSpielPl.getSpielByID(intSpielID).setEnabled(false);
			
				//Tabelle updaten
				if(intToreH > intToreG)
				{
					//Heimsieg
					//Heimteam (hat gewonnen)
					myAccess.update("kc", strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
								"Spiele = Spiele + 1, " +
								"S = S + 1, " + 
								"Punkte = Punkte + 3 ",
								"TeamID = '" + strTeam1 + "'");
					//Gastteam (hat verloren)
					myAccess.update("kc", strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
								"Spiele = Spiele + 1, " +
								"N = N + 1 ",
								"TeamID = '" + strTeam2 + "'");
				}
				else if(intToreH < intToreG)	//Ausw�rtssieg
				{
					//Heimteam (hat verloren)
					myAccess.update("kc", strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
								"Spiele = Spiele + 1, " +
								"N = N + 1 ",  
								"TeamID = '" + strTeam1 + "'");
					//Gastteam (hat gewonnen)
					myAccess.update("kc", strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
								"Spiele = Spiele + 1, " +
								"S = S + 1, " + 
								"Punkte = Punkte + 3",
								"TeamID = '" + strTeam2 + "'");
				}
				else							//Unentschieden
				{
					//Heimteam
					myAccess.update("kc", strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreH) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreG) + ", " +
								"Spiele = Spiele + 1, " +
								"U = U + 1, " + 
								"Punkte = Punkte + 1 ", 
								"TeamID = '" + strTeam1 + "'");
					//Gastteam
					myAccess.update("kc", strTurnierName_tbl, 
								"ToreP  = ToreP + " + String.valueOf(intToreG) + ", " +  
								"ToreM  = ToreM + " + String.valueOf(intToreH) + ", " +
								"Spiele = Spiele + 1, " +
								"U = U + 1, " + 
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
				 * todo: wenn SpielAnzahl sich �ndert, refresh auf PanSpielPlan
				 */
				try
				{
					sout.println(5, "TestOMat.actionPerformed('�bernehmen'): refreshSet()");
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
					System.err.println("TestOMat.actionPerformed('�bernehmen'): " + ex);
				}

				//Tore zur�cksetzen
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
						+ labClock.getText().replace(":", "") + "_"		//Uhrzeit
						+ strTNamH.replace(" ", "_") + "_vs_" 			//Team A
						+ strTNamG.replace(" ", "_");
		myAccess.create("kc", strSpBerName, "_tpl_spielbericht");		//legt eine Tabelle f�r Spielbericht an
		strSpielPaarung = labClock.getText() + ": " + strTNamH + " vs. " + strTNamG;
		
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
			//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerst�ren und neue anlegen
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
			sout.println("TestOMat.checkHalfTime(): L�se Halbzeit-Alarm aus!");
			myCountDown.set5MinSirene();		//Stellt den Alarm ab, weil vorher schon 5 Tore gefallen sind.
			bolHalbZ = true;
			//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerst�ren und neue anlegen
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
	    myResultSet = myAccess.getSet("kc", strTurnierName_v_spl, "*", "SpielID = " + intSpielID);
        try
        {
        	myResultSet.next();
        	strTNamH	= myResultSet.getString("TeamA");
        	strTeam1	= myResultSet.getString("Team1");		//F�r DB-Update und Toranzeige die TeamID
        	labNameH.setText(strTNamH);
        	if(bolXtra) myXtraWin.labNameH.setText(strTNamH);
        	if (strTurnierName.equals("default"))
        	{
            	labWappH.setIcon(myIcons.getIcon("_default" + sep + myResultSet.getString("TeamA"), "_Wappen"));
            	if(bolXtra) myXtraWin.labWappH.setIcon(myIcons.getIcon("_default" + sep + myResultSet.getString("TeamA"), "_Wappen", 270));
        	}
        	else
        	{
            	labWappH.setIcon(myIcons.getIcon(myResultSet.getString("TeamA"), "_Wappen"));
            	if(bolXtra) myXtraWin.labWappH.setIcon(myIcons.getIcon(myResultSet.getString("TeamA"), "_Wappen", 270));
        	}
			
        	strTNamG	= myResultSet.getString("TeamB");
        	strTeam2	= myResultSet.getString("Team2");		//F�r DB-Update und Toranzeige die TeamID
        	labNameG.setText(strTNamG);
        	if(bolXtra) myXtraWin.labNameG.setText(strTNamG);
        	if (strTurnierName.equals("default"))
        	{
            	labWappG.setIcon(myIcons.getIcon("_default" + sep + myResultSet.getString("TeamB"), "_Wappen"));        		
            	if(bolXtra) myXtraWin.labWappG.setIcon(myIcons.getIcon("_default" + sep + myResultSet.getString("TeamB"), "_Wappen", 270));
        	}
        	else
        	{
            	labWappG.setIcon(myIcons.getIcon(myResultSet.getString("TeamB"), "_Wappen"));        		
            	if(bolXtra) myXtraWin.labWappG.setIcon(myIcons.getIcon(myResultSet.getString("TeamB"), "_Wappen", 270));
        	}
        }
		catch(SQLException e)
		{
			sout.println(5, "TestOMat.showSpiel(): Fehler im ResultSet: " + e);
		}
	}
	public String getSchuetzen()
	{
		String mySchuetzen = "<html><b>Top 10 Sch�tzen</b><br><br>";
		ResultSet myResultSet = myAccess.getSet("kc", "spieler", "*", "SpielerName != '_Eigentor' AND SpielerName != '_unbekannt' ORDER BY Tore DESC");
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
				mySchuetzen = "Fehler bei der Sch�tzenanzeige";
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
			"M�chten Sie den Generator starten (empfohlen)?", 
			"OMat meldet:", 
			JOptionPane.OK_CANCEL_OPTION
		);
		if(intResult == JOptionPane.OK_OPTION)
		{
			sout.println(8, "TestOMat.showZeroGamesBox): OK geklickt");
			JOptionen myJOptionen = new JOptionen();
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