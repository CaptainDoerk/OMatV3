package dev;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;

public class JGroupSelector extends JDialog implements ActionListener
{
	private static final long serialVersionUID = 102L;

	JLabel[] 	labTeamName	= new JLabel[100];
	boolean[]	bolChecked	= new boolean[100];
	JButton[]  	btnCheck	= new JButton[100];
	JButton		myBtnOK;
	JButton		myBtnReset;
	JButton		myBtnNew;
	JButton		btnGrpA;
	JButton		btnGrpB;
	JButton		btnGrpC;
	JButton		btnGrpD;
	JButton		btnGrpE;
	JButton		btnGrpF;
	JButton		btnGrpG;
	JButton		btnGrpH;
	DbAccess 	myAccess	= new DbAccess();
	String		strWorkDir  = System.getProperty("user.dir");
	String		sep 		= File.separator;
	String		myRedBtn	= strWorkDir + sep + "Icons" + sep + "red20.jpg";
	String		myYelBtn	= strWorkDir + sep + "Icons" + sep + "yel20.jpg";
	String		myGrnBtn	= strWorkDir + sep + "Icons" + sep + "grn20.jpg";
	String		myBluBtn	= strWorkDir + sep + "Icons" + sep + "blu20.jpg";
	String		myNewBtn	= strWorkDir + sep + "Icons" + sep + "plus1.jpg";
	String		myGrpBtn	= strWorkDir + sep + "Icons" + sep + "add.jpg";
	ImageIcon	myRedIcon	= new ImageIcon(myRedBtn);
	ImageIcon	myYelIcon	= new ImageIcon(myYelBtn);
	ImageIcon	myGrnIcon	= new ImageIcon(myGrnBtn);
	ImageIcon	myBluIcon	= new ImageIcon(myBluBtn);
	ImageIcon	myNewIcon	= new ImageIcon(myNewBtn);
	ImageIcon	icnGrp		= new ImageIcon(myGrpBtn);
	ResultSet	myResultSet = null;
	int			intMaxTeam;

	public JGroupSelector()
	{
		setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		setLocation(100, 100);
		setSize(860, 440);
		setLayout(null);
	}

	public void init(boolean[] bolChecked)
	{
		this.bolChecked = bolChecked;
		myBtnOK 	= new JButton("OK --> Weiter");
		myBtnOK.setBounds(20, 350, 305, 40);
		myBtnOK.addActionListener(this);
		add(myBtnOK);

		myBtnReset 	= new JButton("Zurücksetzen");
		myBtnReset.setBounds(340, 350, 145, 40);
		myBtnReset.addActionListener(this);
		add(myBtnReset);

		myBtnNew 	= new JButton(myNewIcon);
		myBtnNew.setBounds(500, 350, 40, 40);
		myBtnNew.addActionListener(this);
		add(myBtnNew);

		btnGrpA 	= new JButton(icnGrp);
		btnGrpA.setBounds(200, 45, 40, 40);
		btnGrpA.addActionListener(this);
		add(btnGrpA);
		btnGrpB 	= new JButton(icnGrp);
		btnGrpB.setBounds(200, 250, 40, 40);
		btnGrpB.addActionListener(this);
		add(btnGrpB);
		btnGrpC 	= new JButton(icnGrp);
		btnGrpC.setBounds(200, 300, 40, 40);
		btnGrpC.addActionListener(this);
		add(btnGrpC);
		btnGrpD 	= new JButton(icnGrp);
		btnGrpD.setBounds(200, 350, 40, 40);
		btnGrpD.addActionListener(this);
		add(btnGrpD);
		btnGrpE 	= new JButton(icnGrp);
		btnGrpE.setBounds(200, 400, 40, 40);
		btnGrpE.addActionListener(this);
		add(btnGrpE);
		btnGrpF 	= new JButton(icnGrp);
		btnGrpF.setBounds(200, 450, 40, 40);
		btnGrpF.addActionListener(this);
		add(btnGrpF);
		btnGrpG 	= new JButton(icnGrp);
		btnGrpG.setBounds(200, 500, 40, 40);
		btnGrpG.addActionListener(this);
		add(btnGrpG);
		btnGrpH 	= new JButton(icnGrp);
		btnGrpH.setBounds(200, 550, 40, 40);
		btnGrpH.addActionListener(this);
		add(btnGrpH);

		myResultSet = myAccess.getSet("kc", "t_teams", "TeamName", "true");
		int j = 0;
		for(int i=0; i<100; i++)
		{
			try
			{
				myResultSet.next();
				if(bolChecked[i])
				{
					j++;
					labTeamName[j]	= new JLabel();
					labTeamName[j].setText(myResultSet.getString("TeamName"));
					labTeamName[j].setBounds(45,j*25+20,120,20);
					labTeamName[j].setBackground(getColor(j));
					labTeamName[j].setOpaque(true);
					add(labTeamName[j]);

					if(labTeamName[j].getText().length() > 0)
					{
						btnCheck[j] = new JButton();
						btnCheck[j].setBounds(20,j*25+20,20,20);
						btnCheck[j].setIcon(myBluIcon);
						btnCheck[j].addActionListener(this);
						add(btnCheck[j]);
					}
				}
			}
			catch(SQLException e)
			{
				System.out.println("JTeamSelector.init(): " + e);
			}
		}
		setVisible(true);
		validate();
		repaint();
	}

	public void actionPerformed(ActionEvent evt) 
	{
		
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

		
}
