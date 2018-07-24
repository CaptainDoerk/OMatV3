package dev;

import java.awt.Color;
import java.awt.event.*;
import javax.swing.*;

import java.io.*;
import java.sql.*;

public class JTeamSelector2 extends JDialog implements ActionListener
{
	//Attribut
	private static final long serialVersionUID = 101L;
	JLabel[] 		labTeamName	= new JLabel[100];
	boolean[]		bolChecked	= new boolean[100];
	JButton[]  		btnCheck	= new JButton[100];
	JLabel			labMessage;
	JButton			btnOK;
	JButton			btnReset;
	JButton			myBtnNew;
	DbAccess 		myAccess	= new DbAccess();
	String			strWorkDir  = System.getProperty("user.dir");
	String			sep 		= File.separator;
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
	ResultSet		myResultSet = null;
	int				intMaxTeam;
	int				intSelTeam;
	JGroupSelector 	myGroupSelector;

	public JTeamSelector2()
	{
		setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		setLocation(100, 100);
		setSize(860, 480);
		setLayout(null);
		myGroupSelector = new JGroupSelector();
	}
	
	public void init()
	{
		intSelTeam = 0;
		
		labMessage = 	new JLabel();
		labMessage.setBounds(20, 330, 780, 40);
		labMessage.setBackground(Color.white);
		labMessage.setOpaque(true);
		add(labMessage);
		
		btnOK 	= new JButton("OK --> Weiter");
		btnOK.setBounds(20, 390, 305, 40);
		btnOK.addActionListener(this);
		add(btnOK);

		btnReset 	= new JButton("Zurücksetzen");
		btnReset.setBounds(340, 390, 145, 40);
		btnReset.addActionListener(this);
		add(btnReset);

		myBtnNew 	= new JButton(myNewIcon);
		myBtnNew.setBounds(500, 390, 40, 40);
		myBtnNew.addActionListener(this);
		add(myBtnNew);

		intMaxTeam	= Integer.parseInt(myAccess.select("kc", "t_teams", "COUNT(TeamName)" , "true"));
		myResultSet = myAccess.getSet("kc", "t_teams", "TeamName", "true");

		try
		{
			int i = 0;
			int col = 0;
			int row = 0;
			while(myResultSet.next())
			{
				bolChecked[i] 	= false;

				btnCheck[i] 	= new JButton();
				btnCheck[i].setIcon(myBluIcon);
				btnCheck[i].setBounds(col*160+20,row*25+20,20,20);
				btnCheck[i].addActionListener(this);
				add(btnCheck[i]);
				
				labTeamName[i]	= new JLabel();
	        	labTeamName[i].setText(myResultSet.getString("TeamName"));
				labTeamName[i].setBounds(col*160+45,row*25+20,120,20);
				labTeamName[i].setBackground(getColor(i));
				labTeamName[i].setOpaque(true);
				add(labTeamName[i]);

				i++;
				col = i/12;
				row = i%12;
			}
		}
		catch(SQLException e)
		{
			//Abfangen, dass er hier hinkommt
			System.err.println("JTeamSelector.init(): " + e);
		}
		
		setVisible(true);
		validate();
		repaint();
	}

	public void showTeams()
	{
		repaint();
	}

	public void actionPerformed(ActionEvent evt) 
	{
		for(int i=0; i<100; i++)
		{
			if(evt.getSource() == btnCheck[i])
			{
				if (bolChecked[i])			//wenn schon markiert
				{
					bolChecked[i] = false;
					btnCheck[i].setIcon(myBluIcon);
					intSelTeam--;
				}
				else						//wenn nicht markiert
				{
					bolChecked[i] = true;
					btnCheck[i].setIcon(myGrnIcon);
					intSelTeam++;
				}
				labMessage.setText(getMessage());
				break;
			}		
		}
		if(evt.getSource() == btnOK)
		{
			myGroupSelector.init(bolChecked);
			setVisible(false);
		}
		if(evt.getSource() == btnReset)
		{
			for(int i=0; i<intMaxTeam; i++)
			{
				bolChecked[i] 	= false;
				btnCheck[i].setIcon(myBluIcon);
				intSelTeam = 0;
				labMessage.setText(getMessage());
			}
		}
	}
	
	public Color getColor(int i)
	{
		if (i % 2 == 1)
		{
			return Color.WHITE;
		}
		else
		{
			return Color.LIGHT_GRAY;
		}
	}
	
	public String getMessage()
	{
		if(intSelTeam == 1)
		{
			return("1 Mannschaft ausgewählt");
		}
		else
		{
			return(intSelTeam + " Mannschaften ausgewählt");
		}
	}
}
