package dev;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.File;

public class TestCreator extends JFrame implements ActionListener
{
	//Attribut
	static final long serialVersionUID = 30L;
	String			strWorkDir  	= System.getProperty("user.dir");
	String			sep 			= File.separator;

	int			intGruppen,	intMannsch,	intMinuten,	intHlbZeit;
	boolean		endeSirene, hlbZtSiren, hlbZtStopp, extrSirene;
	
	FileHelper	myFileHelper;
	
	//Icons
	String		iconPfad = strWorkDir + sep + "Icons" + sep;
	ImageIcon	iconAddi = new ImageIcon(iconPfad + "add.jpg");
	ImageIcon	iconRedu = new ImageIcon(iconPfad + "reduce.jpg");
	ImageIcon	iconChck = new ImageIcon(iconPfad + "checked.jpg");
	ImageIcon	iconBlnk = new ImageIcon(iconPfad + "blank.jpg");
	ImageIcon	iconHelp = new ImageIcon(iconPfad + "help.jpg");

	//Labels
	JLabel		labGruppen,	lDcGruppen;
	JLabel		labMannsch,	lDcMannsch;
	JLabel		labMinuten,	lDcMinuten;
	JLabel		labHlbZeit,	lDcHlbZeit;
	JLabel		labEndSrne,	labHlbSrne;
	JLabel		labHlbStop, labPlayOff;
	JLabel		labPlOTeam, lDcPlOTeam;
	JLabel		labXtrSrne, lDcXtrSrne;
	JLabel		labTmAuswl;
	
	//Buttons
	JButton 	addGruppen,	redGruppen;
	JButton		addMannsch,	redMannsch;
	JButton		addMinuten,	redMinuten;
	JButton		addHlbZeit,	redHlbZeit;
	JButton		addPlOTeam,	redPlOTeam;
	JButton		butEndSrne,	butHlbSrne, butHlbStop;
	JButton		butXtrSrne;
	JButton		butTmAuswl;
    
	public TestCreator()
    {
		super("Creator V0.1");
		setSize(1024, 768);
		setLocation(0,0);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
        setVisible(true);
        
        intGruppen = 2;
        intMannsch = 5;
        intMinuten = 10;
        intHlbZeit = 2;

        //Fonts
        Font fontMed = new Font("Arial Narrow", Font.BOLD,   40);
        Font fontSml = new Font("Arial Narrow", Font.BOLD,   18);
        
        //Button und Labels: Gruppen
		redGruppen = new JButton(iconRedu);
		redGruppen.setBounds( 40,  40,  40,  40);
		labGruppen = new JLabel(String.valueOf(intGruppen), JLabel.CENTER); 
        labGruppen.setBounds(100,  40,  40,  40);
        labGruppen.setBackground(Color.white);
        labGruppen.setFont(fontMed);
        labGruppen.setOpaque(true);
		addGruppen = new JButton(iconAddi);
		addGruppen.setBounds(160,  40,  40,  40);
		lDcGruppen = new JLabel("Gruppen");
		lDcGruppen.setBounds(220,  40, 160,  40);
		lDcGruppen.setFont(fontSml);
		lDcGruppen.setOpaque(true);     
		
        //Buttons und Labels Teams
		redMannsch = new JButton(iconRedu);
		redMannsch.setBounds( 40, 100,  40,  40);
        labMannsch = new JLabel(String.valueOf(intMannsch), JLabel.CENTER); 
        labMannsch.setBounds(100, 100,  40,  40);
        labMannsch.setBackground(Color.white);
        labMannsch.setFont(fontMed);
        labMannsch.setOpaque(true);
		addMannsch = new JButton(iconAddi);
		addMannsch.setBounds(160, 100,  40,  40);
		lDcMannsch = new JLabel("Teams");
		lDcMannsch.setBounds(220, 100, 160,  40);
		lDcMannsch.setFont(fontSml);
		lDcMannsch.setOpaque(true);
		
        //Buttons und Label Minuten
		redMinuten = new JButton(iconRedu);
		redMinuten.setBounds( 40, 200,  40,  40);
        labMinuten = new JLabel(String.valueOf(intMinuten), JLabel.CENTER); 
        labMinuten.setBounds(100, 200,  40,  40);
        labMinuten.setBackground(Color.white);
        labMinuten.setFont(fontMed);
        labMinuten.setOpaque(true);
		addMinuten = new JButton(iconAddi);
		addMinuten.setBounds(160, 200,  40,  40);
		lDcMinuten = new JLabel("Dauer pro Halbzeit");
		lDcMinuten.setBounds(220, 200, 160,  40);
		lDcMinuten.setBackground(Color.white);
		lDcMinuten.setFont(fontSml);
		lDcMinuten.setOpaque(true);
		
        //Buttons und Label Halbzeiten
		redHlbZeit = new JButton(iconRedu);
		redHlbZeit.setBounds( 40, 260,  40,  40);
        labHlbZeit = new JLabel(String.valueOf(intHlbZeit), JLabel.CENTER); 
        labHlbZeit.setBounds(100, 260,  40,  40);
        labHlbZeit.setBackground(Color.white);
        labHlbZeit.setFont(fontMed);
        labHlbZeit.setOpaque(true);
		addHlbZeit = new JButton(iconAddi);
		addHlbZeit.setBounds(160, 260,  40,  40);
		lDcHlbZeit = new JLabel("Halbzeiten");
		lDcHlbZeit.setBounds(220, 260, 160,  40);
		lDcHlbZeit.setBackground(Color.white);
		lDcHlbZeit.setFont(fontSml);
		lDcHlbZeit.setOpaque(true);
		
		//Buttons und Labels aufbringen: Schlusssirene
		butEndSrne = new JButton(iconBlnk);
		butEndSrne.setBounds( 40, 320,  40,  40);
        labEndSrne = new JLabel("Schluss-Sirene"); 
        labEndSrne.setBounds(100, 320, 160,  40);
        labEndSrne.setBackground(Color.white);
        labEndSrne.setFont(fontSml);
        labEndSrne.setOpaque(true);

		//Buttons und Labels aufbringen: Halbzeitsirene
		butHlbSrne = new JButton(iconBlnk);
		butHlbSrne.setBounds( 40, 380,  40,  40);
        labHlbSrne = new JLabel("Halbzeit-Sirene"); 
        labHlbSrne.setBounds(100, 380, 160,  40);
        labHlbSrne.setBackground(Color.white);
        labHlbSrne.setFont(fontSml);
        labHlbSrne.setOpaque(true);
        
		//Buttons und Labels aufbringen: Halbzeitpause
        butHlbStop = new JButton(iconBlnk);
        butHlbStop.setBounds(300, 380,  40,  40);
        labHlbStop = new JLabel("Halbzeit-Pause"); 
        labHlbStop.setBounds(360, 380, 160,  40);
        labHlbStop.setBackground(Color.white);
        labHlbStop.setFont(fontSml);
        labHlbStop.setOpaque(true);

        //Button und Labels: KO-System
		redPlOTeam = new JButton(iconRedu);
		redPlOTeam.setBounds( 40, 440,  40,  40);
		labPlOTeam = new JLabel(String.valueOf(intGruppen), JLabel.CENTER); 
        labPlOTeam.setBounds(100, 440,  40,  40);
        labPlOTeam.setBackground(Color.white);
        labPlOTeam.setFont(fontMed);
        labGruppen.setOpaque(true);
        addPlOTeam = new JButton(iconAddi);
		addPlOTeam.setBounds(160, 440,  40,  40);
		lDcPlOTeam = new JLabel("Gruppen");
		lDcPlOTeam.setBounds(220, 440, 160,  40);
        lDcPlOTeam.setBackground(Color.white);
		lDcGruppen.setFont(fontMed);
		lDcGruppen.setOpaque(true);     

        //Buttons und Labels aufbringen: Teamauswahl
        butTmAuswl = new JButton("Teams auswählen");
        butTmAuswl.setBounds(532,  40,  160,  40);
    }	
	public void init()
	{
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
		add(redMinuten);	redMinuten.addActionListener(this);
		add(labMinuten);
		add(addMinuten);	addMinuten.addActionListener(this);
		add(lDcMinuten);
        
		//Buttons und Labels aufbringen: Halbzeit
		add(redHlbZeit);	redHlbZeit.addActionListener(this);
		add(labHlbZeit);
		add(addHlbZeit);	addHlbZeit.addActionListener(this);
		add(lDcHlbZeit);
		
		//Buttons und Labels aufbringen: Schlusssirene
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
    
        validate();
        repaint();
	}
	public void actionPerformed(ActionEvent evt) 
	{
		if(evt.getSource() == addGruppen)
		{
			if (intGruppen < 8)
			{
				intGruppen++;
			}
			labGruppen.setText(String.valueOf(intGruppen));
			if (intGruppen > 1)
			{
				lDcGruppen.setText("Gruppen");
			}
		}
		if(evt.getSource() == redGruppen)
		{
			if (intGruppen > 1)
			{
				intGruppen--;
			}
			labGruppen.setText(String.valueOf(intGruppen));
			if (intGruppen == 1)
			{
				lDcGruppen.setText("Gruppe");	
			}
		}
		if(evt.getSource() == addMannsch)
		{
			if (intMannsch < 20)
			{
				intMannsch++;
			}
			labMannsch.setText(String.valueOf(intMannsch));
		}
		if(evt.getSource() == redMannsch)
		{
			if (intMannsch > 3)
			{
				intMannsch--;
			}
			labMannsch.setText(String.valueOf(intMannsch));
		}
		//Minuten
		if(evt.getSource() == addMinuten)
		{
			if (intMinuten < 90)
			{
				intMinuten++;
			}
			labMinuten.setText(String.valueOf(intMinuten));
		}
		if(evt.getSource() == redMinuten)
		{
			if (intMinuten > 1)
			{
				intMinuten--;
			}
			labMinuten.setText(String.valueOf(intMinuten));
		}
		if(evt.getSource() == addHlbZeit)
		{
			if(intHlbZeit == 0)
			{
				lDcHlbZeit.setText("Halbzeit");
				intHlbZeit++;
			}
			else if(intHlbZeit < 4)
			{
				lDcHlbZeit.setText("Halbzeiten");
				intHlbZeit++;
			}
			labHlbZeit.setText(String.valueOf(intHlbZeit));
		}
		if(evt.getSource() == redHlbZeit)
		{
			if(intHlbZeit > 2)
			{
				intHlbZeit--;
			}
			else if(intHlbZeit == 2)
			{
				intHlbZeit = 1;
				lDcHlbZeit.setText("Halbzeit");
			}
			else if(intHlbZeit == 1)
			{
				intHlbZeit = 0;
				lDcHlbZeit.setText("Kölsch Cup Modus");
			}
			labHlbZeit.setText(String.valueOf(intHlbZeit));
		}
	}
}