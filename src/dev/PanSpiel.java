package dev;
import java.io.File;
import java.sql.*;
import javax.swing.*;
import java.awt.*;

/**
 * @author Captain Doerk
 *
 */
public class PanSpiel extends JPanel
{
	private static final long serialVersionUID = 23L;

	String		strWorkDir  = System.getProperty("user.dir");
	String		sep 		= File.separator;
	String		iconPfad 	= strWorkDir + sep + "Icons" + sep;

	JLabel[] 	myLabel		= new JLabel[9];
	Icons		myIcons		= new Icons();

	public PanSpiel()
	{
		setLayout(null);
		
		myLabel[0]	= new JLabel("", JLabel.CENTER);
		myLabel[0].setBounds( 20,  5,  40, 40);
		myLabel[0].setOpaque(true);
		add(myLabel[0]);
		myLabel[1]	= new JLabel("", JLabel.CENTER);
		myLabel[1].setBackground(Color.WHITE);
		myLabel[1].setBounds( 80,  5, 220, 40);
		myLabel[1].setOpaque(true);
		add(myLabel[1]);
		myLabel[2]	= new JLabel(":", JLabel.CENTER);
		myLabel[2].setBackground(Color.WHITE);
		myLabel[2].setBounds(320,  5,  40, 40);
		myLabel[2].setOpaque(true);
		add(myLabel[2]);
		myLabel[3]	= new JLabel("", JLabel.CENTER);
		myLabel[3].setBounds(380,  5,  40, 40);
		myLabel[3].setOpaque(true);
		add(myLabel[3]);
		myLabel[4]	= new JLabel("", JLabel.CENTER);
		myLabel[4].setBackground(Color.WHITE);
		myLabel[4].setBounds(440,  5, 220, 40);
		myLabel[4].setOpaque(true);
		add(myLabel[4]);
		myLabel[5]	= new JLabel("", JLabel.CENTER);
		myLabel[5].setBackground(Color.WHITE);
		myLabel[5].setBounds(680,  5,  40, 40);
		myLabel[5].setOpaque(true);
		add(myLabel[5]);
		myLabel[6]	= new JLabel(":", JLabel.CENTER);
		myLabel[6].setBackground(Color.WHITE);
		myLabel[6].setBounds(740,  5,  40, 40);
		myLabel[6].setOpaque(true);
		add(myLabel[6]);
		myLabel[7]	= new JLabel("", JLabel.CENTER);
		myLabel[7].setBackground(Color.WHITE);
		myLabel[7].setBounds(800,  5, 40, 40);
		myLabel[7].setOpaque(true);
		add(myLabel[7]);
		myLabel[8]	= new JLabel("", JLabel.CENTER);
		myLabel[8].setBackground(Color.WHITE);
		myLabel[8].setBounds(860,  5, 40, 40);
		myLabel[8].setOpaque(true);
		add(myLabel[8]);
		
		
		setSize(new Dimension(920, 60));
		setPreferredSize(new Dimension(920, 50));
	}
	public void setSelected(boolean flag)
	{
		if (flag)
		{
			myLabel[1].setBackground(Color.ORANGE);
			myLabel[2].setBackground(Color.ORANGE);
			myLabel[4].setBackground(Color.ORANGE);
			myLabel[5].setBackground(Color.ORANGE);
			myLabel[6].setBackground(Color.ORANGE);
			myLabel[7].setBackground(Color.ORANGE);
			myLabel[8].setBackground(Color.ORANGE);
		}
		else
		{
			myLabel[1].setBackground(Color.WHITE);
			myLabel[2].setBackground(Color.WHITE);
			myLabel[4].setBackground(Color.WHITE);
			myLabel[5].setBackground(Color.WHITE);
			myLabel[6].setBackground(Color.WHITE);
			myLabel[7].setBackground(Color.WHITE);
			myLabel[8].setBackground(Color.WHITE);
		}
	}
	public void setEnabled(boolean flag)
	{
		for(int i=0; i<9; i++)
		{
			myLabel[i].setEnabled(flag);
		}
	}
	public boolean isEnabled()
	{
		return myLabel[0].isEnabled();		//irgendeins abfragen, werden alle deaktiviert
	}
	public void setSpiel(int intSpielID, String strTeamA, String strTeamB)
	{
		myLabel[0].setIcon(myIcons.getIcon(strTeamA, "_Wappen", 40));
		myLabel[0].setName(String.valueOf(intSpielID));
		myLabel[1].setText(strTeamA);
		myLabel[3].setIcon(myIcons.getIcon(strTeamB, "_Wappen", 40));
		myLabel[4].setText(strTeamB);
	}
	public void setSpiel(ResultSet myResultSet)
	{
		try
		{
			myLabel[0].setIcon(myIcons.getIcon(myResultSet.getString("Team1Nm"), "_Wappen", 40));
			myLabel[0].setName(String.valueOf(myResultSet.getString("SpielID")));
			myLabel[1].setText(myResultSet.getString("Team1Nm"));
			myLabel[3].setIcon(myIcons.getIcon(myResultSet.getString("Team2Nm"), "_Wappen", 40));
			myLabel[4].setText(myResultSet.getString("Team2Nm"));
			myLabel[5].setText(myResultSet.getString("Tore1"));
			myLabel[7].setText(myResultSet.getString("Tore2"));
			myLabel[8].setText(myResultSet.getString("Elo"));
			if(myResultSet.getString("X").equals("8"))
			{
				//Dann ist das Spiel bereits gespielt
				this.setEnabled(false);
			}
		}
		catch(SQLException ex)
		{
			System.err.println("PanSpiel.setSpiel(): " + ex);
		}
	}
	public void updateSpiel(int intToreA, int intToreB)
	{
		myLabel[5].setText(String.valueOf(intToreA));
		myLabel[7].setText(String.valueOf(intToreB));		
	}
	public int getSpielID()
	{
		return Integer.parseInt(myLabel[0].getName());
	}
}
