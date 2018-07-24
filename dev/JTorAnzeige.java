package dev;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.File;
import java.sql.ResultSet;
import java.util.*;

public class JTorAnzeige extends JDialog // JFrame
                        implements ActionListener
{
	/**
	 * Klasse JTorAnzeige
	 * 
	 * momentan ausgelegt auf maximal 13+2 Spieler!
	 */
	//Statische Werte
	static final long 	serialVersionUID = 2L;
	String				strWorkDir  	= System.getProperty("user.dir");
	String				sep 			= File.separator;
	String				myDefaultPath	= strWorkDir + sep + "Teams" + sep + "_default" + sep;
	String				myTeamPfad		= strWorkDir + sep + "Teams" + sep;
	String				myTeamName;
	JButton				butOwnGl, 	butUnknw;
	JLabel				labOwnGl, 	labUnknw;
	int					myI;
	int					intAnzTeams;
	int					intToreH, 	intToreG;
	String				strSpBerName;
	boolean				keinSchuetze;
	
    Font fontSml		= new Font("Arial Narrow", Font.PLAIN,  10);

	//Dynamische Werte (Spieler, die hinzugelesen werden)
	ArrayList<String>	myNames 		= new ArrayList<String>();
	String				strTurnierName;
	JButton[]			butPlay			= new JButton[15];
	JLabel[]			labPlay			= new JLabel[15];
	JLabel				labTmNam;
	String				strGespielt;
	String 				strSpielerName;
	String 				strTeamName;	
	String				splrPath;
	FileHelper			myFileHelper	= new FileHelper();
	DbAccess 			myAccess;
	ResultSet			myResultSet;
	String				myTore = "";
	
	Icons				myIcons;
		
	public JTorAnzeige(String strTurnierName)
    {
//		super("Auswahl Torschütze V0.4");
		this.strTurnierName = strTurnierName;
//		setSize(620, 280);
//		setLocation(262, 284);
		setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		setLayout(null);
		myAccess 		= new DbAccess();
		myResultSet 	= null;
		myIcons			= new Icons();
    }
	
	public void init()
	{
		/****************************
	     * TeamNamen initialisieren *
	     ****************************/
        labTmNam = new JLabel();
        labTmNam.setBounds( 20,  20, 580,  20);
    	labTmNam.setEnabled(true);
    	labTmNam.setBackground(Color.white);
    	labTmNam.setOpaque(true);
		add(labTmNam);

		/****************************************
	     * Buttons und Labels vorinitialisieren *
	     ****************************************/
		for(int i=0; i<15; i++)
		{
			labPlay[i] = new JLabel();
			labPlay[i].setBounds(i%5*120+20, i/5*200+ 60, 100, 100);
			labPlay[i].setEnabled(true);
			labPlay[i].setBackground(Color.white);
			labPlay[i].setOpaque(true);
			labPlay[i].setVisible(false);
			add(labPlay[i]);

			butPlay[i] = new JButton();
			butPlay[i].setBounds(i%5*120+20, i/5*200+180, 100,  40);
			butPlay[i].setEnabled(true);
			butPlay[i].setFont(fontSml);
			butPlay[i].addActionListener(this);
			labPlay[i].setVisible(false);
			add(butPlay[i]);
		}
		validate();
	}

	public void show(String strGespielt, String strTeamName, String strSpBerName, int intToreH, int intToreG)
	{
		keinSchuetze 		= true;
		this.strGespielt	= strGespielt;
		this.strTeamName 	= strTeamName;
		this.intToreH		= intToreH;
		this.intToreG		= intToreG;
		this.strSpBerName	= strSpBerName;
       	labTmNam.setText(strGespielt + ": Tor für " + strTeamName + "! Bitte Schützen auswählen:");
       	myNames = myFileHelper.getPortraits(new File(myTeamPfad + strTeamName));
       	intAnzTeams = myNames.size();
//     	System.out.println("JTorAnzeige.show(): intAnzTeams.size() = " + intAnzTeams);
       	setSize(620, (((intAnzTeams+2)/5)+1)*200+60);
       	setLocation(202, 100);
       	for(int i=0; i<intAnzTeams; i++)
		{
        	labPlay[i].setIcon(myIcons.getIcon(strTeamName, myNames.get(i)));
       		labPlay[i].setVisible(true);
    		butPlay[i].setText(myNames.get(i));
    		butPlay[i].setVisible(true);
        }
		labPlay[myNames.size()].setIcon(new ImageIcon(myDefaultPath + "__owngoal.jpg"));
		labPlay[myNames.size()].setVisible(true);
		butPlay[myNames.size()].setText("Eigentor");
		butPlay[myNames.size()].setVisible(true);
		add(labPlay[myNames.size()]);

		labPlay[myNames.size()+1].setIcon(new ImageIcon(myDefaultPath + "__unknown.jpg"));
		labPlay[myNames.size()+1].setVisible(true);
		butPlay[myNames.size()+1].setText("unbekannt");
		butPlay[myNames.size()+1].setVisible(true);
		add(labPlay[myNames.size()+1]);
		
		for(int i=myNames.size()+2;i<15;i++)
		{
			labPlay[i].setVisible(false);
			butPlay[i].setVisible(false);
		}
        setVisible(true);
		validate();
	}

	public void actionPerformed(ActionEvent e) 
	{
		for(int i=0;i<myNames.size();i++)
		{
			if (e.getSource() == butPlay[i])
			{
				update(myNames.get(i));
			}
		}
		if (e.getSource() == butPlay[myNames.size()])	//Eigentor
		{
			keinSchuetze = true;
//			update("(Eigentor)");
		}
		if (e.getSource() == butPlay[myNames.size()+1])	//unbekannt
		{
			keinSchuetze = true;
//			update("(nicht bekannt)");
		}
		setVisible(false);
	}
	public void update(String strSpielerName)
	{
		this.strSpielerName = strSpielerName;
		String strToreAnzhl = myAccess.select("kc", strTurnierName + "_tor", "Tore", "Spieler = '" + strSpielerName + "' AND Team = '" + strTeamName + "'");
		try
		{
			int i = Integer.parseInt(strToreAnzhl); //wenns funktioniert, ist ein Datensatz vorhanden
			myAccess.update("kc", strTurnierName + "_tor", "Tore = " + (i + 1) , "Spieler = '" + strSpielerName + "' AND Team = '" + strTeamName + "'");
		}
		catch (Exception ex)
		{
			//kein Datensatz gefunden --> neuer Datensatz
			myAccess.insert("kc", strTurnierName + "_tor", "Spieler, Team, Tore", "'" + strSpielerName + "', '" + strTeamName + "','1'");
		}
		//Spielbericht füllen
		try
		{
			myAccess.insert("kc", strSpBerName, "SpielZeit, ToreA, ToreB, Team, Spieler",
												"'" + strGespielt + "'," + intToreH + "," + intToreG + ",'" + strTeamName + "','" + strSpielerName + "'");
			if(intToreH == 5 && intToreG < 5 || intToreG == 5 && intToreH < 5)
			{
				myAccess.insert("kc", strSpBerName, "Spieler, Team, Event", "'-----', '-----', '--Halbzeit--'");
			}
		}
		catch(Exception ex)
		{
			System.err.println("JTorAnzeige.update(): Schütze eintragen\n" + ex);
		}
		//Aktuellen Torschützen setzen in PanLetzter
		TestOMat.instanz.panLetzter.setSchuetze(strSpielerName, strTeamName);
		TestOMat.instanz.jtpXtra.setSelectedComponent(TestOMat.instanz.panLetzter);
	}
}