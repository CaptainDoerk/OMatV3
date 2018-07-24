package dev;

import javax.swing.*;

import java.io.File;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;

public class PanSpielPlan_orig extends JPanel implements ActionListener, MouseListener
{	
	//Identifier für JPanel
	private static final long serialVersionUID = 22L;

	//Datenbankzugriff
	DbAccess_MySQL 	myAccess	= new DbAccess_MySQL();
	ResultSet	myResultSet = null;
	
	//Buttons und Icons
	String		strWorkDir  = System.getProperty("user.dir");
	String		sep 		= File.separator;
	String		iconPfad 	= strWorkDir + sep + "Icons" + sep;
	ImageIcon	iconUp	 	= new ImageIcon(iconPfad + "up.jpg");
	ImageIcon	iconUup	 	= new ImageIcon(iconPfad + "uup.jpg");
	ImageIcon	iconUuup	= new ImageIcon(iconPfad + "uuup.jpg");
	ImageIcon	iconFrsh	= new ImageIcon(iconPfad + "frsh.jgp");
	ImageIcon	iconDn	 	= new ImageIcon(iconPfad + "down.jpg");
	ImageIcon	iconDdn	 	= new ImageIcon(iconPfad + "ddown.jpg");
	ImageIcon	iconDddn	= new ImageIcon(iconPfad + "dddown.jpg");

	String		strReturnCode;
	String		strTournamentName;
	String		strLength	= "";

	int			intSpielID = 1;					//Vorinitialisiert weil sonst Empty ResultSet im TestOMat
	int			intSpielAnz;					//Gesamtanzahl Spiele
	int			intLength;						//Länge der angezeigten Spiele (intLength ist maximal 8)
	int			intCurrPos;						//Position in interner Tabelle
	int			intLowerID, 	intUpperID;

	Icons		myIcons		= new Icons();
	//Buttons und Labels
	JButton		btnFirst,	btnRed10,	btnReduc,	btnActul,	btnAddit,	btnAdd10,	btnLast;
	JLabel[][] 	myLabel		= new JLabel[8][8];

	public PanSpielPlan_orig(String strTournamentName)
	{
		this.strTournamentName 	= strTournamentName;
		setLayout(null);

		//Ausgangs-Spielplan lesen
		myResultSet 	= myAccess.getSet("kc", strTournamentName + "_v_spl", "*", "TRUE ORDER BY SpielID ASC");
		getRowCount();

		//initialisieren: erste Spiele
		if(intSpielAnz >= 8)							//es werden maximal 8 Spiele angezeigt
		{
			intLength = 8;
		}
		else
		{
			intLength = intSpielAnz;					//wenn es weniger als 8 Spiele sind, auch weniger anzeigen
		}
		try 
		{
			myResultSet.beforeFirst();					//wurde aufgrund getRowCount() verstellt
			for(int i=0; i<intLength; i++)				//intPosLength ist maximal 8
			{
				myResultSet.next(); 
				myLabel[i][0]	= new JLabel(myIcons.getIcon(myResultSet.getString("TeamA"), "_Wappen", 40), JLabel.CENTER);
				myLabel[i][0].setBounds( 20, i*50+20,  40, 40);
				myLabel[i][0].setOpaque(true);
				myLabel[i][0].addMouseListener(this);
				myLabel[i][0].setName(myResultSet.getString("SpielID"));
				add(myLabel[i][0]);
				myLabel[i][1]	= new JLabel(myResultSet.getString("TeamA"), JLabel.CENTER);
				myLabel[i][1].setBounds( 80, i*50+20, 220, 40);
				myLabel[i][1].setOpaque(true);
				myLabel[i][1].addMouseListener(this);
				add(myLabel[i][1]);
				myLabel[i][2]	= new JLabel(":", JLabel.CENTER);
				myLabel[i][2].setBounds(320, i*50+20,  40, 40);
				myLabel[i][2].setOpaque(true);
				myLabel[i][2].addMouseListener(this);
				add(myLabel[i][2]);
				myLabel[i][3]	= new JLabel(myIcons.getIcon(myResultSet.getString("TeamB"), "_Wappen", 40), JLabel.CENTER);
				myLabel[i][3].setBounds(380, i*50+20,  40, 40);
				myLabel[i][3].setOpaque(true);
				myLabel[i][3].addMouseListener(this);
				add(myLabel[i][3]);
				myLabel[i][4]	= new JLabel(myResultSet.getString("TeamB"), JLabel.CENTER);
				myLabel[i][4].setBounds(440, i*50+20, 220, 40);
				myLabel[i][4].setOpaque(true);
				myLabel[i][4].addMouseListener(this);
				add(myLabel[i][4]);
				myLabel[i][5]	= new JLabel(myResultSet.getString("Tore1"), JLabel.CENTER);
				myLabel[i][5].setBounds(680, i*50+20,  40, 40);
				myLabel[i][5].setOpaque(true);
				myLabel[i][5].addMouseListener(this);
				add(myLabel[i][5]);
				myLabel[i][6]	= new JLabel(":", JLabel.CENTER);
				myLabel[i][6].setBounds(740, i*50+20,  40, 40);
				myLabel[i][6].setOpaque(true);
				myLabel[i][6].addMouseListener(this);
				add(myLabel[i][6]);
				myLabel[i][7]	= new JLabel(myResultSet.getString("Tore2"), JLabel.CENTER);
				myLabel[i][7].setBounds(800, i*50+20, 40, 40);
				myLabel[i][7].setOpaque(true);
				myLabel[i][7].addMouseListener(this);
				add(myLabel[i][7]);
			}
			if(intLength < 8)
			{
				for(int i=intLength; i<8; i++)				//intPosLength ist maximal 8
				{
					myLabel[i][0]	= new JLabel("", JLabel.CENTER);
					myLabel[i][0].setBounds( 20, i*50+20,  40, 40);
					myLabel[i][0].setOpaque(true);
					myLabel[i][0].addMouseListener(this);
					add(myLabel[i][0]);
					myLabel[i][1]	= new JLabel("", JLabel.CENTER);
					myLabel[i][1].setBounds( 80, i*50+20, 220, 40);
					myLabel[i][1].setOpaque(true);
					myLabel[i][1].addMouseListener(this);
					add(myLabel[i][1]);
					myLabel[i][2]	= new JLabel(":", JLabel.CENTER);
					myLabel[i][2].setBounds(320, i*50+20,  40, 40);
					myLabel[i][2].setOpaque(true);
					myLabel[i][2].addMouseListener(this);
					add(myLabel[i][2]);
					myLabel[i][3]	= new JLabel("", JLabel.CENTER);
					myLabel[i][3].setBounds(380, i*50+20,  40, 40);
					myLabel[i][3].setOpaque(true);
					myLabel[i][3].addMouseListener(this);
					add(myLabel[i][3]);
					myLabel[i][4]	= new JLabel("", JLabel.CENTER);
					myLabel[i][4].setBounds(440, i*50+20, 220, 40);
					myLabel[i][4].setOpaque(true);
					myLabel[i][4].addMouseListener(this);
					add(myLabel[i][4]);
					myLabel[i][5]	= new JLabel("", JLabel.CENTER);
					myLabel[i][5].setBounds(680, i*50+20,  40, 40);
					myLabel[i][5].setOpaque(true);
					myLabel[i][5].addMouseListener(this);
					add(myLabel[i][5]);
					myLabel[i][6]	= new JLabel(":", JLabel.CENTER);
					myLabel[i][6].setBounds(740, i*50+20,  40, 40);
					myLabel[i][6].setOpaque(true);
					myLabel[i][6].addMouseListener(this);
					add(myLabel[i][6]);
					myLabel[i][7]	= new JLabel("", JLabel.CENTER);
					myLabel[i][7].setBounds(800, i*50+20, 40, 40);
					myLabel[i][7].setOpaque(true);
					myLabel[i][7].addMouseListener(this);
					add(myLabel[i][7]);					
				}
			}
		}
		catch(SQLException ex)
		{
			System.err.println("PanSpielPlan().Konstruktor " + ex);
		}
		
		btnFirst	= new JButton(iconUuup);
		btnFirst.setBounds(920,  20, 40,  40);
		btnFirst.addActionListener(this);
		add(btnFirst);
		btnRed10	= new JButton(iconUup);
		btnRed10.setBounds(920,  60, 40,  40);
		btnRed10.addActionListener(this);
		add(btnRed10);
		btnReduc	= new JButton(iconUp);
		btnReduc.setBounds(920, 100, 40, 40);
		btnReduc.addActionListener(this);
		add(btnReduc);
		btnActul	= new JButton(iconFrsh);
		btnActul.setBounds(920, 200, 40,  40);
		btnActul.addActionListener(this);
		add(btnActul);
		btnAddit	= new JButton(iconDn);
		btnAddit.setBounds(920, 300, 40, 40);
		btnAddit.addActionListener(this);
		add(btnAddit);
		btnAdd10	= new JButton(iconDdn);
		btnAdd10.setBounds(920, 340, 40, 40);
		btnAdd10.addActionListener(this);
		add(btnAdd10);
		btnLast	= new JButton(iconDddn);
		btnLast.setBounds (920, 380, 40, 40);
		btnLast.addActionListener(this);
		add(btnLast);
		
//		PanManager.getInstance().setSpielPlan(this);			//EINKOMMENTIEREN!!!!
		setSpielID();
//		refreshSet();
	}
	public void setSpielID()
	{
 		intSpielID		= Integer.parseInt(myAccess.select("kc", strTournamentName + "_v_spl", "SpielID", "X = 0 ORDER BY SpielID ASC LIMIT 0, 1"));
 		if(intSpielID > 2)
 		{
 			intCurrPos		= intSpielID - 2;
 		}
 		else
 		{
 			intCurrPos		= 0;
 		}
 		refreshSet();
	}
	public void getRowCount()
	{
/*		try
		{	
			myResultSet.last(); 
//			intSpielAnz = myResultSet.getRow(); //Anzahl Spiele ausrechnen (Dirty Style)
		}
		catch(SQLException e)
		{
			System.err.println("PanSpielPlan(): " + e);
		}
		
*/		
		intSpielAnz = Integer.parseInt(myAccess.select("kc", strTournamentName + "_spl", "COUNT(SpielID)", "TRUE"));
		System.out.println("PanSpielPlan.getRowCount(): intSpielAnz = " + intSpielAnz);
//		System.out.println("PanSpielPlan.getRowCount(): intLength   = " + intLength);
	}
 	public void refreshSet()
 	{
		myResultSet 	= myAccess.getSet("kc", strTournamentName + "_v_spl", "*", "TRUE ORDER BY SpielID ASC"); //alle Spiele
 		System.out.println("PanSpielPlan.refreshSet(): aktuelle SpielID = " + intSpielID);
 		try
 		{
			if(intSpielID > 2)
 			{
 	 			myResultSet.absolute(intSpielID - 2);
 			}
 			else
 			{
 				myResultSet.beforeFirst();
 			}
 		}
 		catch (SQLException ex)
 		{
 			System.out.println("PanSpielPlan.showPlan(): Fehler beim Setzen des Cursors\n" + ex);
 		}
		showPlan();
 	}
 	public void showPlan()
 	{
 		getRowCount();
 		for(int i=0; i<intLength; i++)
 		{
 			try
 			{	
 				myResultSet.next(); 
 				myLabel[i][0].setName(myResultSet.getString("SpielID"));
 				if(strTournamentName.equals("default"))
 				{
 					myLabel[i][0].setIcon(myIcons.getIcon("_default" + sep + myResultSet.getString("TeamA"), "_Wappen", 40)); 					 					
 				}
 				else
 				{
 					myLabel[i][0].setIcon(myIcons.getIcon(myResultSet.getString("TeamA"), "_Wappen", 40)); 					
 				}
 				myLabel[i][1].setText(myResultSet.getString("TeamA"));
 				if(strTournamentName.equals("default"))
 				{
 					myLabel[i][3].setIcon(myIcons.getIcon("_default" + sep + myResultSet.getString("TeamB"), "_Wappen", 40)); 					
 				}
 				else
 				{
 					myLabel[i][3].setIcon(myIcons.getIcon(myResultSet.getString("TeamB"), "_Wappen", 40));
 				}
 				myLabel[i][4].setText(myResultSet.getString("TeamB"));
 				myLabel[i][5].setText(myResultSet.getString("Tore1"));
 				myLabel[i][7].setText(myResultSet.getString("Tore2"));
 				strReturnCode	= myResultSet.getString("X");
 				if(strReturnCode.equals("8"))
 				{
 					myLabel[i][0].setEnabled(false);
 					myLabel[i][1].setEnabled(false);
 					myLabel[i][2].setEnabled(false);
 					myLabel[i][3].setEnabled(false);
 					myLabel[i][4].setEnabled(false);
 					myLabel[i][5].setEnabled(false);
 					myLabel[i][6].setEnabled(false);
 					myLabel[i][7].setEnabled(false);
 				}
 				else
 				{
 					myLabel[i][0].setEnabled(true);
 					myLabel[i][1].setEnabled(true);
 					myLabel[i][2].setEnabled(true);
 					myLabel[i][3].setEnabled(true);
 					myLabel[i][4].setEnabled(true);
 					myLabel[i][5].setEnabled(true);
 					myLabel[i][6].setEnabled(true);
 					myLabel[i][7].setEnabled(true); 					
 				}
 			}
 			catch(SQLException ex)
 			{
 				System.err.println("PanSpielPlan().showPlan(): \nfehlerhafte SpielIDs (Sprünge) checken\n" + ex);
 			}
 		}
/* 		for(int i=intLength; i<8; i++)		//sollte unbenötigte Labels ausblenden --> gab NullPointerException, falls < 8 Spiele
 		{
 			System.out.println("PanSpielPlan.showPlan: intLength = " + intLength);
			myLabel[i][0].setVisible(false);
			myLabel[i][1].setVisible(false);
			myLabel[i][2].setVisible(false);
			myLabel[i][3].setVisible(false);
			myLabel[i][4].setVisible(false);
			myLabel[i][5].setVisible(false);
			myLabel[i][6].setVisible(false);
			myLabel[i][7].setVisible(false);
 		}
*/ 		setCursor();
 	}
 	public void setCursor()
 	{
 		for(int i=0; i<intLength; i++)
 		{
			if(Integer.parseInt(myLabel[i][0].getName()) == intSpielID)
			{
				myLabel[i][1].setBackground(Color.orange);
				myLabel[i][2].setBackground(Color.orange);
				myLabel[i][4].setBackground(Color.orange);
				myLabel[i][5].setBackground(Color.orange);
				myLabel[i][6].setBackground(Color.orange);
				myLabel[i][7].setBackground(Color.orange);
			}
			else
			{
				myLabel[i][1].setBackground(Color.white);
				myLabel[i][2].setBackground(Color.white);
				myLabel[i][4].setBackground(Color.white);
				myLabel[i][5].setBackground(Color.white);
				myLabel[i][6].setBackground(Color.white);
				myLabel[i][7].setBackground(Color.white);
			}
		}
 		repaint();
 	}
	public void actionPerformed(ActionEvent evt) 
	{
		refreshSet();	//liest myResultSet neu
		try
		{
			myResultSet.last();	
			if(evt.getSource() == btnFirst)
			{
				intCurrPos = 0;
				myResultSet.beforeFirst();
			}
			if(evt.getSource() == btnReduc)
			{
				if(intCurrPos > 1)
				{
					intCurrPos--;
					myResultSet.absolute(intCurrPos);
				}
				else
				{
					intCurrPos = 0;
					myResultSet.beforeFirst();
				}
			}
			if(evt.getSource() == btnRed10)
			{
				if(intCurrPos > 8)
				{
					intCurrPos -= 8;
					myResultSet.absolute(intCurrPos);
				}
				else
				{
					intCurrPos = 0;
					myResultSet.beforeFirst();
				}
			}
			if(evt.getSource() == btnActul)
			{
				showPlan();
			}
			if(evt.getSource() == btnAddit)
			{
				if(intCurrPos < (intSpielAnz - 8))
				{
					intCurrPos++;
				} 
				myResultSet.absolute(intCurrPos);
			}
			if(evt.getSource() == btnAdd10)
			{
				if(intCurrPos < (intSpielAnz - 16))
				{
					intCurrPos += 8;
				}
				myResultSet.absolute(intCurrPos);
			}
			if(evt.getSource() == btnLast)
			{
				intCurrPos = intSpielAnz - 8;
				myResultSet.absolute(intCurrPos);
			}
			showPlan();
		}
		catch(SQLException e)
		{
			System.err.println(e);
		}
	}
 	public void mousePressed(MouseEvent mEvt) 
 	{	
		for(int i=0;i<8;i++)
		{
			for(int j=0; j<8; j++)
			{
				if(mEvt.getSource() == myLabel[i][j])
				{
					if(myLabel[i][0].isEnabled())
	 				{
						intSpielID = Integer.parseInt(myLabel[i][0].getName());
//		 				System.out.println("panSpielPlan.mousePressed()..intSpielID: " + intSpielID + " , intSpielAnz: " + intSpielAnz);
		 				try
		 				{
	 						myResultSet.absolute(intSpielID-i);
	 						myResultSet.previous();
		 				}
		 				catch(SQLException ex)
		 				{
		 					System.err.println("Ex in PanSpielPlan().mousePressed(): " + ex);
		 				}
		 				showPlan();
	 				}
				}
 			}
		}
 	}
 	public int getSpielID()
 	{
 		return intSpielID;			//für aufrufende Klasse OMat
 	}
	public void mouseClicked(MouseEvent e){}
	public void mouseEntered(MouseEvent e){}
	public void mouseExited(MouseEvent e){}
	public void mouseReleased(MouseEvent e){}
}
