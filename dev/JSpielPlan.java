package dev;

import java.awt.Color;
import java.awt.event.*;
import javax.swing.*;

import java.io.*;
import java.sql.*;

/**
 * @deprecated
 * @author Captain Doerk
 * --> PanSpielPlan...
 */
public class JSpielPlan extends JDialog implements ActionListener
{
	//Attribut
	private static final long serialVersionUID = 22L;
	DbAccess 	myAccess	= new DbAccess();
	JLabel[][] 	myLabel		= new JLabel[20][6];
	JLabel[]	mySpiel;
	JButton[]  	myButton	= new JButton[20];
	JButton		myBtnOK;
	String		strWorkDir  = System.getProperty("user.dir");
	String		sep 		= File.separator;
	String		myRedBtn	= strWorkDir + sep + "Icons" + sep + "red20.jpg";
	String		myYelBtn	= strWorkDir + sep + "Icons" + sep + "yel20.jpg";
	String		myGrnBtn	= strWorkDir + sep + "Icons" + sep + "grn20.jpg";
	String		myBluBtn	= strWorkDir + sep + "Icons" + sep + "blu20.jpg";
	ImageIcon	myRedIcon	= new ImageIcon(myRedBtn);
	ImageIcon	myYelIcon	= new ImageIcon(myYelBtn);
	ImageIcon	myGrnIcon	= new ImageIcon(myGrnBtn);
	ImageIcon	myBluIcon	= new ImageIcon(myBluBtn);
	String		myReturnCode;
	String		myGroup;
	ResultSet	myResultSet = null;
	int			myActButton;
	int			mySpielID;
	String		strSpielID;
	int			mySpielChk;
	
	int			myLowerID;
	int			myUpperID;
	int			mySpielAnz;

	int			myPos;
	String		mySpielPlan;
	String		strView;

	public JSpielPlan()
	{
		setLayout(null);
		setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		setLocation(302, 100);
		setSize(420, 400);

		for(int i=0; i<10; i++)
		{
			myButton[i] = new JButton();
	        add(myButton[i]);
	        myButton[i].addActionListener(this);
	        for(int j=0; j<6; j++)
	        {
	        	myLabel[i][j] = new JLabel("", JLabel.CENTER);
	        	myLabel[i][j].setOpaque(true);
		        add(myLabel[i][j]);
	        }
			myLabel[i][0].setBounds( 45,i*25+20,120,20);
			myLabel[i][1].setBounds(170,i*25+20, 20,20);
	        myLabel[i][1].setText(":");
			myLabel[i][2].setBounds(195,i*25+20,120,20);
			myLabel[i][3].setBounds(320,i*25+20, 20,20);
			myLabel[i][4].setBounds(345,i*25+20, 20,20);
	        myLabel[i][4].setText(":");
			myLabel[i][5].setBounds(370,i*25+20, 20,20);
		}
		myBtnOK = new JButton("OK");
		myBtnOK.setBounds(20, 300, 370, 40);
		myBtnOK.addActionListener(this);
		add(myBtnOK);
		validate();
	}

	public void showSpielPlan(String strView)
	{
		this.strView = strView;
		//myLowerID holen
		myResultSet = myAccess.getSet("kc", strView, "*", "X < 8 ORDER BY SpielID ASC");
		try
		{	
			myResultSet.last(); 
			mySpielAnz = myResultSet.getRow(); 
			myResultSet.beforeFirst();
			
	        myResultSet.next();
	        myLowerID = Integer.parseInt(myResultSet.getString("SpielID"));
	        mySpielID = myLowerID;
	        myResultSet.last();
	        myUpperID = Integer.parseInt(myResultSet.getString("SpielID"));
		}
		catch(SQLException e)
		{
			System.err.println("JSpielPlan.showSpielPlan: IDs nicht geholt! " + e);
			myLowerID = 1;
			mySpielID = 1;
			myUpperID = 2;
		}
		//Eigentliche Werte holen
		if (mySpielAnz > 10)
		{
			mySpielAnz = 10;
		}
//		mySpielAnz = (myUpperID - myLowerID) + 1;		//mySpielAnz ist somit maximal 10, bei weniger Spielen weniger
		myResultSet = myAccess.getSet("kc", strView, "*", "X < 8 ORDER BY SpielID LIMIT 0, " + mySpielAnz);
		System.out.println("mySpielAnz: " + mySpielAnz);
		
		try
		{
	        myResultSet.beforeFirst();
			for(int i=0; i<mySpielAnz; i++)
			{
				myResultSet.next();
				myReturnCode	= myResultSet.getString("X");
		        strSpielID		= myResultSet.getString("SpielID");
		        mySpielID		= Integer.parseInt(strSpielID);
		        
		        if (String.valueOf(myReturnCode).equals("0"))
		        {
		        	myButton[i].setIcon(myBluIcon);
		        }
		        else
		        if (String.valueOf(myReturnCode).equals("4"))
		        {
		        	myButton[i].setIcon(myYelIcon);
		        }
		        else
		        {
		        	myButton[i].setIcon(myRedIcon);		        	
		        }
				myButton[i].setBounds( 20,i*25+20, 20,20);
				myButton[i].setName(strSpielID);
				myGroup	= myResultSet.getString("Gruppe");
				myLabel[i][0].setText(myResultSet.getString("TeamA"));
				myLabel[i][0].setBackground(getColor());
				myLabel[i][1].setBackground(getColor());
		        myLabel[i][2].setText(myResultSet.getString("TeamB"));
				myLabel[i][2].setBackground(getColor());
		        myLabel[i][3].setText(myResultSet.getString("Tore1"));
				myLabel[i][3].setBackground(getColor());
				myLabel[i][4].setBackground(getColor());
		        myLabel[i][5].setText(myResultSet.getString("Tore2"));
				myLabel[i][5].setBackground(getColor());
			}
			if(mySpielAnz < 10)
			{
				for(int i=mySpielAnz; i<10; i++)
				{
					myLabel[i][0].setVisible(false);
					myLabel[i][1].setVisible(false);
					myLabel[i][2].setVisible(false);
					myLabel[i][3].setVisible(false);
					myLabel[i][4].setVisible(false);
					myLabel[i][5].setVisible(false);
					myButton[i].setVisible(false);
				}
			}
			mySpielID = myLowerID;					//falls kein Button geklickt wird, den obersten nehmen
		}
		catch(SQLException e)
		{
			System.err.println("JSpielPlan.showSpielPlan(" + strView + "): Fehler im ResultSet: " + e + "\n" +
					           "mySpielAnz: " + mySpielAnz + ", lower: " + myLowerID + ", upper: " + myUpperID);
			//e.printStackTrace();
			mySpielID = myLowerID;
		}
		setVisible(true);
        validate();
        repaint();
	}
	String tmp;
	public void actionPerformed(ActionEvent evt) 
	{
		for(int i = 0; i<20; i++)
		{
			if(evt.getSource() == myButton[i])
			{
				//resetButtons();
//				showSpielPlan(strView);
				myButton[i].setIcon(myGrnIcon);
				mySpielID = Integer.parseInt(myButton[i].getName());
				System.out.println("myJSpielPlan.actionPerformed..mySpielID: " + mySpielID);
				tmp = myButton[i].getName();
				repaint();
			}
		}
		if(evt.getSource() == myBtnOK)
		{
/*			myAccess.update("kc", "soccercup2010_spl", 
					"X = 4 ",
					"SpielID = " + tmp);
*/			setVisible(false);
		}
	}
	public void resetButtons()
	{
		myResultSet = myAccess.getSet("kc", strView, "*", "X = 0 OR SpielID between " + myLowerID + " and " + myUpperID);
		try
		{	
			for(int i=0; i<mySpielAnz; i++)
			{
		        myResultSet.next();
		        myReturnCode	= myResultSet.getString("X");
		        if (String.valueOf(myReturnCode).equals("0"))
		        {
		        	myButton[i].setIcon(myBluIcon);
		        }
		        else
		        if (String.valueOf(myReturnCode).equals("4"))
		        {
		        	myButton[i].setIcon(myYelIcon);
		        }
		        else
		        {
		        	myButton[i].setIcon(myRedIcon);		        	
		        }
			}
		}
		catch(SQLException e)
		{
			System.err.println("JSpielPlan.resetButtons(): Fehler im ResultSet: " + e);
		}
	}
	public Color getColor()
	{
		if (myGroup.toString().equals("a")) return Color.WHITE;
		if (myGroup.toString().equals("b")) return Color.LIGHT_GRAY;
		if (myGroup.toString().equals("c")) return Color.GRAY;
		if (myGroup.toString().equals("1")) return Color.WHITE;
		if (myGroup.toString().equals("2")) return Color.LIGHT_GRAY;
		if (myGroup.toString().equals("3")) return Color.GRAY;
		return Color.red;
	}
	public ResultSet getSpiel()
	{
		myResultSet = myAccess.getSet("kc", strView, "*", "SpielID = " + mySpielID);
		return myResultSet;
	}
}
