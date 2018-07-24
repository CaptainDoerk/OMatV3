package dev;

import java.awt.Color;
import java.awt.Image;
import javax.swing.*;
import java.io.*;

public class JTeamSelector extends JFrame //JDialog
{
	//Attribut
	private static final long serialVersionUID = 101L;
	JLabel[][] 		labTeams	= new JLabel[100][100];
	ImageIcon[][]	imgTeams	= new ImageIcon[100][100];
	Icon[][]		icnTeams	= new Icon[100][100];
	boolean[]		bolChecked	= new boolean[100];
	JButton[]  		btnCheck	= new JButton[100];
	JLabel			labMessage;
	JButton			btnOK;
	JButton			btnReset;
	JButton			myBtnNew;
	String			strWorkDir  = System.getProperty("user.dir");
	String			sep 		= File.separator;
	String			strTeamPath = strWorkDir + sep + "Teams" + sep;
	String			strTempPath = "";
	String			myRedBtn	= strWorkDir + sep + "Icons" + sep + "red20.jpg";
	String			myYelBtn	= strWorkDir + sep + "Icons" + sep + "yel20.jpg";
	String			myGrnBtn	= strWorkDir + sep + "Icons" + sep + "grn20.jpg";
	String			myBluBtn	= strWorkDir + sep + "Icons" + sep + "blu20.jpg";
	String			myNewBtn	= strWorkDir + sep + "Icons" + sep + "plus1.jpg";
	ImageIcon		myRedIcon	= new ImageIcon(myRedBtn);
	ImageIcon		myYelIcon	= new ImageIcon(myYelBtn);
	ImageIcon		myGrnIcon	= new ImageIcon(myGrnBtn);
	ImageIcon		myBluIcon	= new ImageIcon(myBluBtn);
	ImageIcon		myNewIcon	= new ImageIcon(myNewBtn);
	Generator		myGenerator;

	/**
	 * @deprecated
	 */
	public JTeamSelector()
	{
		setDefaultCloseOperation(JDialog.EXIT_ON_CLOSE);
		setLocation(0, 0);
		setSize(1450, 700);
		setLayout(null);
//		myGroupSelector = new JGroupSelector();
		myGenerator = new Generator();
	}
	
	public void init()
	{
/*		intSelTeam = 0;
		
		labMessage = 	new JLabel();
		labMessage.setBounds(20, 330, 780, 40);
		labMessage.setBackground(Color.white);
		labMessage.setOpaque(true);
		add(labMessage);
		
		btnOK 	= new JButton("OK --> Weiter");
		btnOK.setBounds(20, 390, 305, 40);
//		btnOK.addActionListener(this);
		add(btnOK);

		btnReset 	= new JButton("Zurücksetzen");
		btnReset.setBounds(340, 390, 145, 40);
//		btnReset.addActionListener(this);
		add(btnReset);

		myBtnNew 	= new JButton(myNewIcon);
		myBtnNew.setBounds(500, 390, 40, 40);
//		myBtnNew.addActionListener(this);
		add(myBtnNew);
*/
		String myTeams[][] = myGenerator.readTeams();
		int col = 0;
		int row = 0;
		for(int i=0; i<myTeams.length; i++)
		{
			//Teamnamen anzeigen (als String --> Name des Verzeichnisses)
//			System.out.println("Teamname: " + myTeams[i][0]);
			labTeams[i][0] = new JLabel(myTeams[i][0], JLabel.CENTER); //Teamname
			System.out.println("lege Label an: myTeams[" + i + "][0] mit " + myTeams[i][0]);
			labTeams[i][0].setBounds(col*380+20,row*60+20, 160,  40);
			labTeams[i][0].setBackground(Color.WHITE);
			labTeams[i][0].setOpaque(true);
			add(labTeams[i][0]);

			//TeamWappen anzeigen, falls vorhanden --> ansonsten RedIcon;
			labTeams[i][0]	= new JLabel("", JLabel.CENTER);
			strTempPath		= strTeamPath + myTeams[i][0] + sep + "_Wappen.jpg";
//			System.out.println("Wappen:   " + strTempPath);
			if(new File(strTempPath).exists())
			{
				imgTeams[i][0] 	= new ImageIcon(strTempPath);
				imgTeams[i][0].setImage(imgTeams[i][0].getImage().getScaledInstance(40, 40, Image.SCALE_SMOOTH));
				labTeams[i][0].setIcon(imgTeams[i][0]);
			}
			else
			{
				labTeams[i][0] = new JLabel(myRedIcon);
			}
			labTeams[i][0].setBounds(col*380+200,row*60+20,  40,  40);
			labTeams[i][0].setBackground(Color.WHITE);
			labTeams[i][0].setOpaque(true);
			add(labTeams[i][0]);
			
			for(int j=1; j<100; j++)
			{
				//Anzeige Portraits Spieler --> mit Namen!? - Achtung: Dateiendung .jpg ist im Namen enthalten
				if(myTeams[i][j] != null && !myTeams[i][j].equals("_Wappen.jpg"))
				{
					labTeams[i][j]	= new JLabel("", JLabel.CENTER);
					strTempPath		= strTeamPath + myTeams[i][0] + sep + myTeams[i][j];
//					System.out.println("Spieler:  " + strTempPath + " " + i);
					imgTeams[i][j] 	= new ImageIcon(strTempPath);
					imgTeams[i][j].setImage(imgTeams[i][j].getImage().getScaledInstance(40, 40, Image.SCALE_SMOOTH));
					labTeams[i][j].setIcon(imgTeams[i][j]);
					labTeams[i][j].setBounds(col*380+j*60+200,row*60+20,  40,  40);
					add(labTeams[i][j]);
				}
				else break;
			}
			col = i % 3;	//--> Anzahl Spalten
			row = i / 3;
		}		
		setVisible(true);
		validate();
		repaint();
	}
}
