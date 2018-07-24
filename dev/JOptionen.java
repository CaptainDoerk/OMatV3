package dev;

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.sql.*;
import java.util.*;

/**
 * @author Captain Doerk
 *
 *	todo: Referenzen auf Teams, die nicht im Teams-Verzeichnis liegen
 */
public class JOptionen 	extends JFrame 
						implements ActionListener, MouseListener
{
	SystemOut 				sout = new SystemOut();
	//Datenbank
	DbAccess				myAccess;
	ResultSet				myResultSet;

	//Attribute
	static final long 		serialVersionUID 	= 30L;
	String					strWorkDir  		= System.getProperty("user.dir");
	String					sep 				= File.separator;

	int						intErrorCode;
	int						intGrupp,	intTeams,	intRunde,	intDauer,	intPerio;
	int						intMode;
	boolean					endeSirene, hlbZtSiren, hlbZtStopp, extrSirene;
	
	FileHelper				myFileHelper;
	
	//Icons
	String					iconPfad = strWorkDir + sep + "Icons" + sep;
	ImageIcon				iconFrsh = new ImageIcon(iconPfad + "frsh.jpg");
	ImageIcon				iconBlnk = new ImageIcon(iconPfad + "blank.jpg");
	ImageIcon				iconChck = new ImageIcon(iconPfad + "checked.jpg");
	ImageIcon				iconAddi = new ImageIcon(iconPfad + "add.jpg");
	ImageIcon				iconRedu = new ImageIcon(iconPfad + "reduce.jpg");
	ImageIcon				iconHelp = new ImageIcon(iconPfad + "help.jpg");

	//Labels
	JTextField				jtxTouName;
	JTextField				jtxSpDauer;
	
	//Labels
	JLabel					labTouName;										//Turniername
	JLabel					labGruppen,	lDcGruppen;
	JLabel					labMannsch,	lDcMannsch;
	JLabel					labMinuten,	lDcMinuten;
	JLabel					labSpDauer;
	JLabel					labHalbZtn,	lDcHlbZeit;
	JLabel					labEndSrne,	labHlbSrne;
	JLabel					labHlbStop, labPlayOff;
	JLabel					labPlOTeam, lDcPlOTeam;
	JLabel								labXtrSrne, lDcXtrSrne;
	JLabel								labTmAuswl;
	JLabel					labSubmit;
	
	//Button
	JButton 				addGruppen,	redGruppen;
	JButton					addMannsch,	redMannsch;
	JButton					addHlbZeit,	redHlbZeit;
	JButton					addPlOTeam,	redPlOTeam;
	JButton					butEndSrne,	butHlbSrne, butHlbStop;
	JButton					butXtrSrne;
//	JButton					butTmAuswl;
	JButton					butSubmit;
//	JButton					butStarten;
	
	//Strings
	String					strTurnierName;
	String					strGrupp;
	String					strTeams;
	String					strPerio;
	String					strDauer;
	
	//Radio Buttons
	JRadioButton 			jrbVorrun;
	JRadioButton			jrbAchtel;
	JRadioButton			jrbViertl;
	JRadioButton			jrbSemifn;
	JRadioButton			jrbFinale;
	ButtonGroup				grpRunde;
	
	JCheckBox				jcbSchuet;
	boolean					bolSchuet;
	String					strSchuet;
	
	JCheckBox				jcbKCMode;
	boolean					bolKCMode;
	String					strKCMode;
	
	JTabbedPane				jtpRechts				= new JTabbedPane();
	PanVorrunde				panVorrunde;
	PanFinale				panFinale;
	
 	public JOptionen()
    {
		super("JOptionen V0.1");
		setSize(1024, 768);
		setLocation(0,0);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
		setVisible(true);
		
		myFileHelper = new FileHelper();
		myAccess 	= new DbAccess();
		myAccess.init();
		myAccess.createTables();
		
		//Gespeicherte Werte von aktivem Turnier laden
        myResultSet = myAccess.getSet("kc", "turniere", "*", "aktiv = 1");
        try
        {
        	myResultSet.next();
        	strTurnierName = myResultSet.getString("TurnierName");
        	intGrupp = Integer.parseInt(myResultSet.getString("AnzGrupp"));
			intTeams = Integer.parseInt(myResultSet.getString("AnzTeams"));
			intPerio = Integer.parseInt(myResultSet.getString("AnzPerio"));
			intDauer = Integer.parseInt(myResultSet.getString("DauerSek"));
			strSchuet = myResultSet.getString("Schuet");
			strKCMode = myResultSet.getString("KCMode");
        }
        catch(SQLException ex)
		{
        	strTurnierName = "default";
			intGrupp = 2;
			intTeams = 5;
			intPerio = 1;
			intDauer = 600;
			strSchuet = "1";
			strKCMode = "1";
			sout.println(4, "JOptionen (Konstruktor), Defaultwerte geladen wegen: \n" + ex);
		}
        //Fonts
        Font fontSml		= new Font("Arial Narrow", Font.PLAIN,  14);
        
        //Button und Labels: Gruppen
        jtxTouName = new JTextField(strTurnierName);
        jtxTouName.setHorizontalAlignment(JTextField.CENTER);
        jtxTouName.setBounds( 20,  20, 160,  40);
        jtxTouName.setBackground(Color.white);
        jtxTouName.setFont(fontSml);
        jtxTouName.setOpaque(true);
        
		labTouName = new JLabel("Turniername", JLabel.CENTER);
		labTouName.setBounds(200,  20, 140,  40);
		labTouName.setBackground(Color.white);
		labTouName.setFont(fontSml);
		labTouName.setOpaque(true);     

		//Gruppen
		redGruppen = new JButton(iconRedu);
		redGruppen.setBounds( 20,  80,  40,  40);
		labGruppen = new JLabel(String.valueOf(intGrupp), JLabel.CENTER); 
        labGruppen.setBounds( 80,  80,  40,  40);
        labGruppen.setBackground(Color.white);
        labGruppen.setFont(fontSml);
        labGruppen.setOpaque(true);
		addGruppen = new JButton(iconAddi);
		addGruppen.setBounds(140,  80,  40,  40);
		
		lDcGruppen = new JLabel("Gruppen", JLabel.CENTER);
		lDcGruppen.setBounds(200,  80, 140,  40);
        lDcGruppen.setBackground(Color.white);
		lDcGruppen.setFont(fontSml);
		lDcGruppen.setOpaque(true);     
		
        //Buttons und Labels Teams
		redMannsch = new JButton(iconRedu);
		redMannsch.setBounds( 20, 140,  40,  40);
        labMannsch = new JLabel(String.valueOf(intTeams), JLabel.CENTER); 
        labMannsch.setBounds( 80, 140,  40,  40);
        labMannsch.setBackground(Color.white);
        labMannsch.setFont(fontSml);
        labMannsch.setOpaque(true);
		addMannsch = new JButton(iconAddi);
		addMannsch.setBounds(140, 140,  40,  40);
		
		lDcMannsch = new JLabel("Teams pro Gruppe", JLabel.CENTER);
		lDcMannsch.setBounds(200, 140, 140,  40);
        lDcMannsch.setBackground(Color.white);
		lDcMannsch.setFont(fontSml);
		lDcMannsch.setOpaque(true);
		
        //Buttons und Label Halbzeiten
		redHlbZeit = new JButton(iconRedu);
		redHlbZeit.setBounds( 20, 200,  40,  40);
		labHalbZtn = new JLabel(String.valueOf(intPerio), JLabel.CENTER); 
		labHalbZtn.setBounds( 80, 200,  40,  40);
		labHalbZtn.setBackground(Color.white);
		labHalbZtn.setFont(fontSml);
		labHalbZtn.setOpaque(true);
		addHlbZeit = new JButton(iconAddi);
		addHlbZeit.setBounds(140, 200,  40,  40);

		lDcHlbZeit = new JLabel("Spielabschnitt", JLabel.CENTER);
		lDcHlbZeit.setBounds(200, 200, 140,  40);
		lDcHlbZeit.setBackground(Color.white);
		lDcHlbZeit.setFont(fontSml);
		lDcHlbZeit.setOpaque(true);
		
        //Spieldauer
		jtxSpDauer = new JTextField(setDauer(intDauer));
		jtxSpDauer.setHorizontalAlignment(JTextField.CENTER);
		jtxSpDauer.setBounds( 20, 260, 160,  40);
		jtxSpDauer.setBackground(Color.white);
		jtxSpDauer.setFont(fontSml);
		jtxSpDauer.setOpaque(true);
		
		labSpDauer = new JLabel("Dauer pro HZ (mm:ss)", JLabel.CENTER);
		labSpDauer.setBounds(200, 260, 140,  40);
		labSpDauer.setBackground(Color.white);
		labSpDauer.setFont(fontSml);
		labSpDauer.setOpaque(true);
		
		jrbVorrun	= new JRadioButton("Vorrunde");
		jrbVorrun.setBounds ( 20, 320, 140, 40);
		jrbVorrun.setBackground(Color.white);
		jrbVorrun.setFont(fontSml);
		jrbAchtel	= new JRadioButton("1/8-Finale");
		jrbAchtel.setBounds ( 20, 360, 140, 40);
		jrbAchtel.setBackground(Color.white);
		jrbAchtel.setFont(fontSml);
		jrbViertl	= new JRadioButton("1/4-Finale");
		jrbViertl.setBounds ( 20, 400, 140, 40);
		jrbViertl.setBackground(Color.white);
		jrbViertl.setFont(fontSml);
		jrbSemifn	= new JRadioButton("1/2-Finale");
		jrbSemifn.setBounds ( 20, 440, 140, 40);
		jrbSemifn.setBackground(Color.white);
		jrbSemifn.setFont(fontSml);
		jrbFinale	= new JRadioButton("Finale");
		jrbFinale.setBounds ( 20, 480, 140, 40);
		jrbFinale.setBackground(Color.white);
		jrbFinale.setFont(fontSml);
		grpRunde	= new ButtonGroup();
		
		jcbSchuet	= new JCheckBox("Schützenauswahl");
		jcbSchuet.setBounds (200, 320, 140,  40);
		jcbSchuet.setBackground(Color.white);
		jcbSchuet.setFont(fontSml);
		jcbKCMode	= new JCheckBox("KC-Modus");
		jcbKCMode.setBounds (200, 360, 140,  40);
		jcbKCMode.setBackground(Color.white);
		jcbKCMode.setFont(fontSml);
		
		//Buttons unten
//		butStarten 	= new JButton(iconFrsh);
//		butStarten.setBounds	( 20, 600,  40,  40);
		butSubmit	= new JButton(iconChck);
		butSubmit.setBounds		( 20, 660,  40,  40);
		labSubmit	= new JLabel("Erstellen!");
		labSubmit.setBackground(Color.WHITE);
		labSubmit.setBounds		( 80, 660, 120,  40);
		
		//JPanels
		jtpRechts.setBounds   (360,  20, 640, 700);
		panVorrunde	= new PanVorrunde();
		panFinale	= new PanFinale();
		jtpRechts.setEnabled(false);
	}
    
	public void init()
	{
		//Turnier-Name
		add(jtxTouName);
		add(labTouName);
		
		//Buttons und Labels aufbringen: Gruppen
		add(addGruppen);	addGruppen.addActionListener(this);
		add(labGruppen);
		add(redGruppen);	redGruppen.addActionListener(this);
		add(lDcGruppen);

        //Buttons und Labels aufbringen: Teams
		add(redMannsch);	addMannsch.addActionListener(this);
		add(labMannsch);
		add(addMannsch);	redMannsch.addActionListener(this);
		add(lDcMannsch);
        
		//Buttons und Labels aufbringen: Spieldauer
		add(jtxSpDauer);
		add(labSpDauer);

		//Buttons und Labels aufbringen: Halbzeit
		add(redHlbZeit);	redHlbZeit.addActionListener(this);
		add(labHalbZtn);
		add(addHlbZeit);	addHlbZeit.addActionListener(this);
		add(lDcHlbZeit);
				
		grpRunde.add(jrbVorrun);		add(jrbVorrun);		jrbVorrun.addActionListener(this);
		grpRunde.add(jrbAchtel);		add(jrbAchtel);		jrbAchtel.addActionListener(this);		
		grpRunde.add(jrbViertl);		add(jrbViertl);		jrbViertl.addActionListener(this);
		grpRunde.add(jrbSemifn);		add(jrbSemifn);		jrbSemifn.addActionListener(this);
		grpRunde.add(jrbFinale);		add(jrbFinale);		jrbFinale.addActionListener(this);
		jrbVorrun.setSelected(true);
		
		add(jcbSchuet);	jcbSchuet.addActionListener(this);
		if(strSchuet.equals("1")){ jcbSchuet.setSelected(true); }else{ jcbSchuet.setSelected(false); }

		add(jcbKCMode); jcbKCMode.addActionListener(this);
		if(strKCMode.equals("1")){ jcbKCMode.setSelected(true); }else{ jcbKCMode.setSelected(false); }
		sout.println(7, "strKCMode: " + strKCMode);
/*		//Buttons und Labels aufbringen: Schlusssirene
		add(butEndSrne);	butEndSrne.addActionListener(this);
		add(labEndSrne);		
		//Buttons und Labels aufbringen: Halbzeitsirene
		add(butHlbSrne);	butHlbSrne.addActionListener(this);
		add(labHlbSrne);
		//Buttons und Labels aufbringen: Halbzeitsirene
		add(butHlbStop);	butHlbStop.addActionListener(this);
		add(labHlbStop);
		
		//Buttons und Labels aufbringen: Halbzeit
		add(redPlOTeam);	redPlOTeam.addActionListener(this);
		add(labPlOTeam);
		add(addPlOTeam);	addPlOTeam.addActionListener(this);
		add(lDcPlOTeam);

		//Button aufbringen: Teamauswahl
		add(butTmAuswl);	butTmAuswl.addActionListener(this);
*/    
		
		//Buttons und Labels aufbringen: Submit und Starten					//TODO: sinnvoll Umbenennen
		add(butSubmit);		butSubmit.addActionListener(this);
		add(labSubmit);
//		add(butStarten);	butStarten.addActionListener(this);
		
		jtpRechts.addTab("Vorrunde", panVorrunde);
		jtpRechts.addTab("KO-Runde", panFinale);
		jtpRechts.setSelectedComponent(panVorrunde);
		add(jtpRechts);
		
		panVorrunde.initGroups(strTurnierName, intGrupp, intTeams);
        validate();
        repaint();
	}
	public static void main (String args[])
	{
		JOptionen myOpt = new JOptionen();
		myOpt.init();
	}
	public String setDauer(int myDauer)
	{
		String myString = String.valueOf(myDauer / 60) + ":" + String.valueOf(myDauer % 60);
		if (myDauer % 60 == 0) 
		{
			return myString + "0";
		}
		else
		{
			return myString;
		}
	}
	
	/**
	 * Diese Methode konvertiert die eingegebene Spieldauer nach folgenden Regeln:
	 * 1. zunächst wird untersucht, ob im Eingabefeld ein Doppelpunkt, Punkt oder Komma auftritt
	 * 	  --> Es sind Minuten gemeint
	 */
	public void convertDauer()
	{
		String 	myString 		= jtxSpDauer.getText();
		boolean bolStats		= true;
		int		intCount		= 0;
		int		intPos			= 0;
		String	strSeprt		= "" ;
		
		int 	intMin 			= 0;
		int 	intSek 			= 0;

		if(myString.equals("") || myString.equals("0") || myString.substring(0,1).equals("-"))
		{
			bolStats	= false;
		}
		for(int i=0; i<myString.length(); i++)
		{
			//Wenn der Wert nicht nur aus Zahlen besteht..
			if(!Character.isDigit(myString.charAt(i)))
			{
				//und statt einer Zahl einen Doppelpunkt besitzt
				if(myString.substring(i, i+1).equals(":"))
				{
					intPos		= i;
					strSeprt	= "doppl";
					intCount++;
				}
				else
				if(myString.substring(i, i+1).equals("."))
				{
					intPos		= i;
					strSeprt	= "punkt";
					intCount++;
				}
				else
				if(myString.substring(i, i+1).equals(","))
				{
					intPos		= i;
					strSeprt	= "komma";
					intCount++;
				}
				//andernfalls (enthält außer Zahlen und den drei Zeichen ein anderes Zeichen
				else
				{
					bolStats = false;
				}
			}
			//wenn mehr als ein Punkt, Doppelpunkt usw. auftritt
			if(intCount>1)
			{
				bolStats = false;
			}
		}
		
		//In vernünftiges Zeitformat konvertieren
		if(bolStats == false)
		{
			jtxSpDauer.setBackground(Color.red);
			jtxSpDauer.setText("10:00");
			intErrorCode = 2;
		}
		else
		{
			jtxSpDauer.setBackground(Color.white);
			if(strSeprt.equals("komma") || strSeprt.equals("punkt"))
			{
				//Zwei Nullen anhängen
				myString		+= "00";
				try
				{
					intMin			= Integer.parseInt(myString.substring(0,intPos));
				}
				catch(NumberFormatException ex)
				{
					intMin			= 10;
				}
				if(intMin > 120)
				{
					intMin = 120;
				}
				intSek			= Integer.parseInt(myString.substring(intPos+1, intPos+3))*60/100;
				if(intSek<10)
				{
					myString	= intMin + ":0" + String.valueOf(intSek);
				}
				else
				{
					System.out.println(myString + " : " + intSek);
					myString 	= intMin + ":" + String.valueOf(intSek).substring(0,2);
				}
				System.out.println("myString: " + myString);
			}
			if(strSeprt.equals("doppl"))
			{
				//falls die Zeit mit XX: oder XX:X angegeben ist, zwei Nullen anhängen
				myString		+= "00";
				intMin			= Integer.parseInt(myString.substring(0,intPos));
				if(intMin > 120)
				{
					intMin = 120;
				}
				intSek			= Integer.parseInt(myString.substring(intPos+1, myString.length()))/100;
				if(intSek>=60)
				{
					myString	= intMin + ":00";
				}
				else
				if(intSek<10)
				{
					myString	= intMin + ":0" + intSek;
				}
				else
				{
					myString	= myString.substring(0,intPos+3);
				}
			}
			if(strSeprt.equals(""))
			{
				if(myString.length() > 8)
				{
					myString 	= "7200";
				}
				myString = String.valueOf(Integer.parseInt(myString));
				if(Integer.parseInt(myString) > 7200)
				{
					myString 	= "120:00";
				}
				else
				if(Integer.parseInt(myString) > 45)	//länger als 45 Minuten geht keine Halbzeit der Welt
				{
					intMin	= Integer.parseInt(myString) / 60;
					intSek	= Integer.parseInt(myString) % 60;
					if(intSek < 10)
					{
						myString = intMin + ":0" + intSek;
					}
					else
					{
						myString = intMin + ":" + intSek;
					}
				}
				else
				{
					myString += ":00";
				}
			}
			jtxSpDauer.setText(myString);
		}
		sout.println(8, "JOptionen.convertDauer(intMin): " + intMin);
		intDauer = intMin * 60 + intSek;
	}	
	/**
	 * ActionPerformed
	 */
	public void actionPerformed(ActionEvent evt) 
	{
//		System.out.println("intGrupp: " + intGrupp + ", intTeams: " + intTeams);
		if(evt.getSource() == addGruppen)
		{
			if (intGrupp < 4)														//TODO: später erweitern auf 8
			{
				panVorrunde.createGroup(strTurnierName, intGrupp, intTeams);
				intGrupp++;
			}
			labGruppen.setText(String.valueOf(intGrupp));
			if (intGrupp > 1)
			{
				lDcGruppen.setText("Gruppen");
			}
			repaint();
		}
		if(evt.getSource() == redGruppen)
		{
			if (intGrupp > 1)
			{
				ArrayList<JLabel> liste = panVorrunde.lstGruppe.remove(panVorrunde.lstGruppe.size()-1);
				for (JLabel l: liste) 
				{
					panVorrunde.remove(l);											//TODO: wird nicht sauber gelöscht
				}
				intGrupp--;
			}
			labGruppen.setText(String.valueOf(intGrupp));
			if (intGrupp == 1)
			{
				lDcGruppen.setText("Gruppe");	
			}
			repaint();
		}
		if(evt.getSource() == addMannsch)
		{
			if (intTeams < 8)				//2011-06-02: später erweitern auf 20
			{
				int g = 0;
				for (ArrayList<JLabel> group: panVorrunde.lstGruppe) 
				{
					group.add(panVorrunde.createTeam(strTurnierName, g, intTeams));		//TODO: ändern?
					g++;
				}
				intTeams++;
				panVorrunde.intTeams++;
			}
			labMannsch.setText(String.valueOf(intTeams));
			repaint();
		}
		if(evt.getSource() == redMannsch)
		{
			if (intTeams > 3)
			{
				for (ArrayList<JLabel> group: panVorrunde.lstGruppe) {
					JLabel l = group.remove(group.size()-1);
					panVorrunde.remove(l);												//TODO: ändern?
				}
				intTeams--;
			}
			labMannsch.setText(String.valueOf(intTeams));
			repaint();
		}		
		if(evt.getSource() == addHlbZeit)
		{
			switch(intPerio)
			{
				case 0:
					lDcHlbZeit.setText("Spielabschnitt");
					intPerio++;
					break;
				case 1:
					lDcHlbZeit.setText("Halbzeiten");
					intPerio++;
					break;
				case 2:
					lDcHlbZeit.setText("Drittel");
					intPerio++;
					break;
				case 3:
					lDcHlbZeit.setText("Viertel");
					intPerio++;
					break;
				default:
			}
			labHalbZtn.setText(String.valueOf(intPerio));
		}
		if(evt.getSource() == redHlbZeit)
		{
			switch(intPerio)
			{
				case 1:
					intPerio = 0;
					lDcHlbZeit.setText("Kölsch Cup Modus");
					break;
				case 2:
					intPerio = 1;
					lDcHlbZeit.setText("Spielabschnitt");
					break;
				case 3:
					intPerio--;
					lDcHlbZeit.setText("Halbzeiten");
					break;				
				case 4:
					intPerio--;
					lDcHlbZeit.setText("Drittel");
					break;				
				case 5:
					intPerio--;
					lDcHlbZeit.setText("Viertel");
					break;
				default:
					break;
			}
			labHalbZtn.setText(String.valueOf(intPerio));
		}
		if(evt.getSource() == jrbVorrun)
		{
			jtpRechts.setSelectedComponent(panVorrunde);
			setSelected(true);
			intMode = 1;
		}
		if(evt.getSource() == jrbAchtel)
		{
			jtpRechts.setSelectedComponent(panFinale);
			panFinale.setLabels(8);
			setSelected(false);
			intMode = 2;
			intTeams = 8;
		}
		if(evt.getSource() == jrbViertl)
		{
			jtpRechts.setSelectedComponent(panFinale);
			panFinale.setLabels(4);
			setSelected(false);
			intMode = 2;
			intTeams = 4;
		}
		if(evt.getSource() == jrbSemifn)
		{
			jtpRechts.setSelectedComponent(panFinale);
			panFinale.setLabels(2);
			setSelected(false);
			intMode = 2;
			intTeams = 2;
		}
		if(evt.getSource() == jrbFinale)
		{
			jtpRechts.setSelectedComponent(panFinale);
			panFinale.setLabels(1);
			setSelected(false);
			intMode = 2;
			intTeams = 1;
		}
		if(evt.getSource() == butSubmit)
		{
			convertDauer();
			checkDoubles();
			if(intErrorCode > 0)
			{
				String strErrMsg = "";
				switch(intErrorCode)
				{
					case 1: strErrMsg = "Doppelte Teamnamen oder noch nicht zugewiesene Teams vorhanden, bitte anpassen!"; break;
					case 2: strErrMsg = "Bitte Spieldauer überprüfen!"; break;
				}
				JOptionPane.showMessageDialog
				(	
						null, 
						strErrMsg, 
						"Achtung!", 
						JOptionPane.ERROR_MESSAGE
				);
			}
			else
			{
				int	intResult = JOptionPane.showConfirmDialog
				(	
						null, 
						"Achtung! Spielplan mit den gewählten Daten erstellen?", 
						"OMat meldet:", 
						JOptionPane.OK_CANCEL_OPTION
				);
				if(intResult == JOptionPane.OK_OPTION)
				{
					sendData();
					setVisible(false);
					dispose();
				}
			}
		}
/*		if(evt.getSource() == butStarten)
		{
			TestOMat myApp = new TestOMat();
			myApp.init(strTurnierName);
		}
*/
	}	
	public void setSelected(boolean status)
	{
		addGruppen.setEnabled(status);
		redGruppen.setEnabled(status);
		addMannsch.setEnabled(status);
		redMannsch.setEnabled(status);
	}
	/**
	 * @param  strDauer
	 * @return intDauer
	 * 
	 * Wandelt die Spieldauer von String in einen Sekundenwert um
	 */
	public int getIntDauerFrom(String strDauer)
	{
//		System.out.println("JOptionen.getIntDauerFrom: strDauer = " + strDauer);
		String	myString 	= strDauer;
		int		intPos 		= strDauer.indexOf(":");
		int		myDauer 	= 0;
		if (intPos > 0)
		{
			myDauer = Integer.parseInt(strDauer.substring(0,intPos)) * 60
					+ Integer.parseInt(strDauer.substring(intPos+1, intPos + 3));
		}
		else
		{
			System.err.println("JOptionen.getIntDauerFrom(" + myString + "): fehlerhaftes Format, setze auf 600..");
			myDauer = 600;
		}
		return 	myDauer;
	}	
	public void sendData()
	{
		//Werte auslesen
		strTurnierName 	= jtxTouName.getText();
		strGrupp		= labGruppen.getText();
		strTeams		= labMannsch.getText();
		strPerio		= labHalbZtn.getText();
		strDauer		= jtxSpDauer.getText();
		intDauer		= getIntDauerFrom(strDauer);
		bolSchuet		= jcbSchuet.isSelected();
		bolKCMode		= jcbKCMode.isSelected();
		if(jrbVorrun.isSelected())
		{
			//Überprüfen, ob das Turnier schon vorhanden ist
			ResultSet myResultSet = myAccess.getSet("kc", "turniere", "*", "TurnierName = '" + strTurnierName + "'");
			if(bolSchuet){ strSchuet = "1"; }else{ strSchuet = "0";}
			if(bolKCMode){ strKCMode = "1"; }else{ strKCMode = "0";}
			System.out.println("Schuetzen ausgewaehlt: " + strSchuet);
			System.out.println("KC-Modus aktiv:        " + strKCMode);
			try
			{
				/**
				 * Turnier bereits vorhanden --> Update
				 */
				if(myResultSet.next())
				{
					System.out.println("JOptionen.sendData(): Update..");
					//Update in Tabelle "turniere"n
					String strValues 	= "AnzGrupp = '" + strGrupp + "', " 
										+ "AnzTeams = '" + strTeams + "', "
										+ "AnzPerio = '" + strPerio + "', "
										+ "DauerSek = '" + intDauer + "', " 
										+ "aktiv = '1', "
										+ "Schuet = '" + strSchuet + "', "
										+ "KCMode = '" + strKCMode + "'";
					myAccess.update("kc", "turniere", strValues, "TurnierName = '" + strTurnierName + "'");

					//alle bereits vorhandenen Tabellen löschen, werden neu aufgebaut
					ResultSet myResultSet2 = myAccess.fireSQL_RS("SHOW TABLES LIKE '" + strTurnierName + "%'");
					while(myResultSet2.next())
					{
						myAccess.dropTable("kc", myResultSet2.getString(1));
					}
				}
				/**
				 * Turnier noch nicht vorhanden --> Neuanlage
				 */
				else
				{
					System.out.println("JOptionen.sendData(): Neuanlage..");
					//Eintrag in Tabelle "turniere"
					String strColumns	= "TurnierName, AnzGrupp, AnzTeams, AnzPerio, DauerSek, aktiv, Schuet";
					String strValues 	= "'" + strTurnierName + "', '" 
										+ strGrupp 	+ "', '" 
										+ strTeams 	+ "', '" 
										+ strPerio 	+ "', '" 
										+ intDauer 	+ "', '"
										+ "1"		+ "', '"
										+ strSchuet + "'"; //"', '"
//										+ strKCMode + "'";
					myAccess.insert("kc", "turniere", strColumns, strValues);					
				}
				/**
				 * wird jedes Mal ausgeführt
				 */
				//Alle anderen Turniere Status = 0 setzen
				myAccess.update("kc", "turniere", "aktiv = '0'", "NOT TurnierName = '" + strTurnierName + "'");
			
				//Tabellen gemäß Templates neu aufbauen (früher Klasse Generator)
				myAccess.create("kc", strTurnierName + "_spl", "_tpl_spielplan");
				myAccess.create("kc", strTurnierName + "_tbl", "_tpl_tabelle");
				myAccess.create("kc", strTurnierName + "_tms", "_tpl_teams");
				myAccess.create("kc", strTurnierName + "_tor", "_tpl_tore");
			
				//Erstelle Views (früher Klasse Generator)
				myAccess.fireSQL("CREATE OR REPLACE VIEW kc." + strTurnierName + "_v_spl " +
						"AS SELECT t1.TeamName AS TeamA, t2.TeamName AS TeamB, s.SpielID AS SpielID, s.Team1 AS Team1, s.Team2 AS Team2, s.Tore1 AS Tore1, s.Tore2 AS Tore2, s.X AS X, s.Gruppe AS Gruppe " +
						"FROM (( " + strTurnierName + "_tms t1 JOIN " + strTurnierName + "_tms t2) JOIN " + strTurnierName + "_spl s) " +
						"WHERE (t1.TeamID  = s.Team1) " +
						"  AND (t2.TeamID = s.Team2) " +
						"ORDER BY SpielID;");
				//--> erster View enthält s.Team1 AS Team1 --> Bedeutung?
				myAccess.fireSQL("CREATE OR REPLACE VIEW kc." + strTurnierName + "_v_tbl " +
						"AS SELECT t1.TeamID AS TeamID, t1.TeamName as TeamName, t2.Gruppe AS Gruppe, t2.Spiele as Spiele, t2.S AS S, t2.U AS U, t2.N AS N, t2.ToreP AS ToreP, t2.ToreM AS ToreM, t2.Punkte AS Punkte, t2.Status AS Status " +
						"FROM (" + strTurnierName + "_tms t1 JOIN " + strTurnierName + "_tbl t2) " +
						"WHERE (t1.TeamID = t2.TeamID) " +
						"ORDER BY TeamID;"); 
				//--> beim zweiten View wurde t2.Team1 AS Team1 entfernt --> Spätfolgen?

				//Tabellen füllen
				//*_tms und *_tbl
				int 	i = 0;	int		j = 0;
				String 	strGruppe;
				for (ArrayList<JLabel> group: panVorrunde.lstGruppe)
				{
					i++;
					switch(i)
					{
						case 1: strGruppe = "a"; break;
						case 2: strGruppe = "b"; break;
						case 3: strGruppe = "c"; break;
						case 4: strGruppe = "d"; break;
						case 5: strGruppe = "e"; break;
						case 6: strGruppe = "f"; break;
						case 7: strGruppe = "g"; break;
						case 8: strGruppe = "h"; break;
						default: strGruppe = "z"; break;
					}
					for(int t=0; t<intTeams; t++)
					{
						j = t + 1;	//Hilfsvariable, da sonst umständlich
						myAccess.insert("kc", strTurnierName + "_tms", "TeamID, TeamName, Team1", "'" + strGruppe + j + "', '" + group.get(t).getText() + "', '" + strGruppe + j + "'");
						myAccess.insert("kc", strTurnierName + "_tbl", "TeamID, Gruppe", "'" + strGruppe + j + "', '" + strGruppe + "'");
					}
				}
				//*_spl
				SpielPlan mySpielPlan = new SpielPlan();
				mySpielPlan.createVorrunde(strTurnierName, intGrupp, intTeams, 0); //--> Modus später dynamisieren
			}	
			catch(SQLException ex)
			{
				System.err.println(ex);
			}
		}
		//KO-Runde
		if(jrbAchtel.isSelected() || jrbViertl.isSelected() || jrbSemifn.isSelected() || jrbFinale.isSelected())
		{
			for(int i=0; i<intTeams; i++)
			{
				//TODO: funktioniert nur, wenn das Team mittels Spielplan erstellt wurde (sonst geht Select auf den View ins Leere)
				String strTeamIDA = myAccess.select("kc", strTurnierName + "_v_tbl", "TeamID" , "TeamName = '" + panFinale.labTeams[i][0].getText() + "'");
				String strTeamIDB = myAccess.select("kc", strTurnierName + "_v_tbl", "TeamID" , "TeamName = '" + panFinale.labTeams[i][1].getText() + "'");
				if(panFinale.labTeams[i][0].isVisible()) //zusätzliche Absicherung
				{
					myAccess.insert("kc", strTurnierName + "_spl", "Team1, Team2, Gruppe", "'" + strTeamIDA + "', '" + strTeamIDB + "', '" + intTeams + "'");
				}
			}
		}
	}
	public void checkDoubles()
	{
		intErrorCode = 0;
		Hashtable<String, JLabel> hstTeamNamen = new Hashtable<String, JLabel>();
		String strTeamName = "";
		for (ArrayList<JLabel> group: panVorrunde.lstGruppe) //Gruppen
		{
			for(int t = 0; t < intTeams; t++)
			{
				strTeamName = group.get(t).getText();
				if(hstTeamNamen.containsKey(strTeamName))
				{
					group.get(t).setBackground(Color.RED);
					hstTeamNamen.get(strTeamName).setBackground(Color.RED);
					intErrorCode = 1;
				}
				else
				{
					hstTeamNamen.put(strTeamName, group.get(t));
					group.get(t).setBackground(Color.WHITE);
				}
			}
		}
	}
	public void mouseClicked(MouseEvent arg0) 
	{
		//Dialog zur Teamauswahl
		/**
		 * todo:	Doppelklick abfangen
		 */
		if(arg0.getSource() instanceof JLabel) 
		{
			JLabel l = (JLabel)arg0.getSource();
			String myString = myFileHelper.getFileName();
			l.setIcon(new Icons().getIcon(myString, "_Wappen", 40));
			System.out.println("JOptionen.mouseClicked: " + myString);
			l.setText(myString);
			checkDoubles();
		}
	}
	public void mouseEntered(MouseEvent arg0) {}
	public void mouseExited(MouseEvent arg0) {}
	public void mousePressed(MouseEvent arg0) {}
	public void mouseReleased(MouseEvent arg0) {}
}