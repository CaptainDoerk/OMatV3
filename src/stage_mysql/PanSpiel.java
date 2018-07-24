package stage_mysql;
import java.io.File;
import java.sql.*;

import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @author Captain Doerk
 *
 */
public class PanSpiel extends JPanel implements ActionListener
{
	private static final long serialVersionUID = 23L;

	String		strWorkDir  = System.getProperty("user.dir");
	String		sep 		= File.separator;
	String		iconPfad 	= strWorkDir + sep + "Icons" + sep;

	JLabel[] 	myLabel		= new JLabel[9];
	JButton		myButton	= new JButton();
	Icons		myIcons		= new Icons();
	ImageIcon	iconAddi 	= new ImageIcon(iconPfad + "add.jpg");
	ImageIcon	iconChck 	= new ImageIcon(iconPfad + "checked.jpg");

    DbAccess	myAccess;
    ResultSet	myResultSet = null;
    int			intDebugLvl;
    String		strTurnierName;
	boolean 	open 		= false;

	JFormattedTextField field1 = new JFormattedTextField();
	JFormattedTextField field2 = new JFormattedTextField();

	
	public PanSpiel(int intDebugLvl, DbAccess myAccess, String strTurnierName)
	{
		setLayout(null);

		this.intDebugLvl	= intDebugLvl;
    	this.myAccess		= myAccess;
    	this.strTurnierName = strTurnierName;

    	myLabel[0]	= new JLabel("", SwingConstants.CENTER);		//Team1Sp1
		myLabel[0].setBackground(Color.WHITE);
		myLabel[0].setBounds( 20,  5, 130, 40);
		myLabel[0].setOpaque(true);
		add(myLabel[0]);
		myLabel[1]	= new JLabel("", SwingConstants.CENTER);		//Team1Sp2
		myLabel[1].setBackground(Color.WHITE);
		myLabel[1].setBounds(170,  5, 130, 40);
		myLabel[1].setOpaque(true);
		add(myLabel[1]);
		myLabel[2]	= new JLabel(":", SwingConstants.CENTER);		//SpielID
		myLabel[2].setBackground(Color.WHITE);
		myLabel[2].setBounds(320,  5,  40, 40);
		myLabel[2].setOpaque(true);
		add(myLabel[2]);
		myLabel[3]	= new JLabel("", SwingConstants.CENTER);		//Team2Sp1
		myLabel[3].setBackground(Color.WHITE);
		myLabel[3].setBounds(380,  5, 130, 40);
		myLabel[3].setOpaque(true);
		add(myLabel[3]);
		myLabel[4]	= new JLabel("", SwingConstants.CENTER);		//Team2Sp2
		myLabel[4].setBackground(Color.WHITE);
		myLabel[4].setBounds(530,  5, 130, 40);
		myLabel[4].setOpaque(true);
		add(myLabel[4]);
		myLabel[5]	= new JLabel("", SwingConstants.CENTER);
		myLabel[5].setBackground(Color.WHITE);
		myLabel[5].setBounds(680,  5,  40, 40);
		myLabel[5].setOpaque(true);
		add(myLabel[5]);
		myLabel[6]	= new JLabel(":", SwingConstants.CENTER);
		myLabel[6].setBackground(Color.WHITE);
		myLabel[6].setBounds(740,  5,  40, 40);
		myLabel[6].setOpaque(true);
		add(myLabel[6]);
		myLabel[7]	= new JLabel("", SwingConstants.CENTER);
		myLabel[7].setBackground(Color.WHITE);
		myLabel[7].setBounds(800,  5, 40, 40);
		myLabel[7].setOpaque(true);
		add(myLabel[7]);
		myLabel[8]	= new JLabel("", SwingConstants.CENTER);
		myLabel[8].setBackground(Color.WHITE);
		myLabel[8].setBounds(860,  5, 40, 40);
		myLabel[8].setOpaque(true);
		add(myLabel[8]);
		myButton	= new JButton(iconAddi);
		myButton.setBackground(Color.WHITE);
		myButton.setBounds(910,  5, 40, 40);
		myButton.setOpaque(true);
		myButton.addActionListener(this);
		add(myButton);
		
		setSize(new Dimension(920, 60));
		setPreferredSize(new Dimension(920, 50));
	}
	public void setSelected(boolean flag)
	{
		if (flag)
		{
			for(int i=0; i<9; i++)
			{
				myLabel[i].setBackground(Color.ORANGE);
			}
		}
		else
		{
			for(int i=0; i<9; i++)
			{
				myLabel[i].setBackground(Color.WHITE);				
			}
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
	public void setSpiel(int intSpielID, String strTeam1Sp1, String strTeam1Sp2, String strTeam2Sp1, String strTeam2Sp2)
	{
		myLabel[0].setText(strTeam1Sp1);
		myLabel[1].setText(strTeam1Sp2);
		myLabel[2].setName(String.valueOf(intSpielID));
		myLabel[3].setText(strTeam2Sp1);
		myLabel[4].setText(strTeam2Sp2);
	}
	public void setSpiel(ResultSet myResultSet)
	{
		try
		{
			myLabel[0].setText(myResultSet.getString("Team1Sp1"));
			myLabel[1].setText(myResultSet.getString("Team1Sp2"));
			myLabel[1].setName(myResultSet.getString("Gruppe"));
			myLabel[2].setName(String.valueOf(myResultSet.getString("SpielID")));
			myLabel[3].setText(myResultSet.getString("Team2Sp1"));
			myLabel[4].setText(myResultSet.getString("Team2Sp2"));
			myLabel[4].setName(myResultSet.getString("Gruppe"));
			myLabel[5].setText(myResultSet.getString("Tore1"));
//			myLabel[5].setName(myResultSet.getString("Team1ID"));
			myLabel[7].setText(myResultSet.getString("Tore2"));
//			myLabel[7].setName(myResultSet.getString("Team2ID"));
//			myLabel[8].setText(myResultSet.getString("Elo"));
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
		return Integer.parseInt(myLabel[2].getName());
	}
	public void actionPerformed(ActionEvent evt) 
	{
		if(evt.getSource() == myButton)
		{
			if(myButton.getIcon().equals(iconAddi))
			{
				myButton.setIcon(iconChck);
				setEnabled(true);
				myLabel[5].setVisible(false);
				myLabel[7].setVisible(false);
				field1.setBounds(680,  5,  40, 40);
				field1.setHorizontalAlignment(SwingConstants.CENTER);
				field1.setText(myLabel[5].getText());
				add(field1);
				field2.setBounds(800,  5,  40, 40);
				field2.setHorizontalAlignment(SwingConstants.CENTER);
				field2.setText(myLabel[7].getText());
				add(field2);
			}
			else if(myButton.getIcon().equals(iconChck))
			{
				if(!isInteger(field1.getText()))
				{
					field1.setText(myLabel[5].getText());
				}
				if(!isInteger(field2.getText()))
				{
					field2.setText(myLabel[7].getText());
				}
				if(isInteger(field1.getText()) && isInteger(field2.getText()))
				{
					updateGame();
//					PanManager.getInstance().getGruppe(gruppen[i]).refresh();

					PanManager.getInstance().getGruppe("Gruppe " + myLabel[1].getName()).refresh();
					if(!myLabel[1].getName().equals(myLabel[4].getName()))
					{
						PanManager.getInstance().getGruppe("Gruppe " + myLabel[4].getName()).refresh();
					}
				}
			}
		}
	}
	public void updateGame()
	{
		myButton.setIcon(iconAddi);
		//Annulierung Ergebnisse in Tabelle
		if(Integer.parseInt(myLabel[5].getText()) > Integer.parseInt(myLabel[7].getText()))
		{
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege-1, "
				+ "ToreP=ToreP-" + myLabel[5].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[7].getText() + ", "
				+ "Punkte=Punkte-3",
				"SpielerID=" + myLabel[0].getText()
			);	//Heimsieg annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege-1, "
				+ "ToreP=ToreP-" + myLabel[5].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[7].getText() + ", "
				+ "Punkte=Punkte-3",
				"SpielerID=" + myLabel[1].getText()
			);	//Heimsieg annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen-1, "
				+ "ToreP=ToreP-" + myLabel[7].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[5].getText(),
				"SpielerID=" + myLabel[3].getText()
			);	//Auswärtsniederlage annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen-1, "
				+ "ToreP=ToreP-" + myLabel[7].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[5].getText(),
				"SpielerID=" + myLabel[4].getText()
			);	//Auswärtsniederlage annulieren
		}
		else if(Integer.parseInt(myLabel[5].getText()) == Integer.parseInt(myLabel[7].getText()))
		{
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden-1, "
				+ "ToreP=ToreP-" + myLabel[5].getText() + ", "
				+ "ToreM=ToreM-" + myLabel[7].getText() + ", "
				+ "Punkte=Punkte-1",
				"SpielerID=" + myLabel[0].getText()
			);	//Heimunentschieden annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden-1, "
				+ "ToreP=ToreP-" + myLabel[5].getText() + ", "
				+ "ToreM=ToreM-" + myLabel[7].getText() + ", "
				+ "Punkte=Punkte-1",
				"SpielerID=" + myLabel[1].getText()
			);	//Heimunentschieden annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden-1, "
				+ "ToreP=ToreP-" + myLabel[7].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[5].getText() + ", "
				+ "Punkte=Punkte-1",
				"SpielerID=" + myLabel[3].getText()
			);	//Auswärtsunentschieden annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden-1, "
				+ "ToreP=ToreP-" + myLabel[7].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[5].getText() + ", "
				+ "Punkte=Punkte-1",
				"SpielerID=" + myLabel[4].getText()
			);	//Auswärtsunentschieden annulieren
		}
		else if(Integer.parseInt(myLabel[5].getText()) < Integer.parseInt(myLabel[7].getText()))
		{
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen-1, "
				+ "ToreP=ToreP-" + myLabel[5].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[7].getText(),
				"SpielerID=" + myLabel[0].getText()
			);	//Heimniederlage annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen-1, "
				+ "ToreP=ToreP-" + myLabel[5].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[7].getText(),
				"SpielerID=" + myLabel[1].getText()
			);	//Heimniederlage annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege-1, "
				+ "ToreP=ToreP-" + myLabel[7].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[5].getText() + ", "
				+ "Punkte=Punkte-3",
				"SpielerID=" + myLabel[3].getText()
			);	//Auswärtssieg annulieren
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege-1, "
				+ "ToreP=ToreP-" + myLabel[7].getText() + ", " 
				+ "ToreM=ToreM-" + myLabel[5].getText() + ", "
				+ "Punkte=Punkte-3",
				"SpielerID=" + myLabel[4].getText()
			);	//Auswärtssieg annulieren
		}
		else
		{
			System.err.println("PanSpiel(310): What the fuck? Das darf nicht passieren!");
		}
		//neue Einträge in Tabelle, Update Spielplan
		if(Integer.parseInt(field1.getText()) > Integer.parseInt(field2.getText()))
		{
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", " 
				+ "ToreM=ToreM+" + field2.getText() + ", "
				+ "Punkte=Punkte+3",
				"SpielerID=" + myLabel[0].getText()
			);	//Heimsieg eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", " 
				+ "ToreM=ToreM+" + field2.getText() + ", "
				+ "Punkte=Punkte+3",
				"SpielerID=" + myLabel[1].getText()
			);	//Heimsieg eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen+1, "
				+ "ToreP=ToreP+" + field2.getText() + ", " 
				+ "ToreM=ToreM+" + field1.getText(),
				"SpielerID=" + myLabel[3].getText()
			);	//Auswärtsniederlage eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen+1, "
				+ "ToreP=ToreP+" + field2.getText() + ", " 
				+ "ToreM=ToreM+" + field1.getText(),
				"SpielerID=" + myLabel[4].getText()
			);	//Auswärtsniederlage eintragen

			myAccess.update(strTurnierName + "_spl", 
				"Tore1=" + field1.getText() + ", Tore2=" + field2.getText() + ", S=1, U=0, N=0", 
				"SpielID=" + myLabel[2].getName()
				); //Update Spielplan direkt
		}
		else if(Integer.parseInt(field1.getText()) == Integer.parseInt(field2.getText()))
		{
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", "
				+ "ToreM=ToreM+" + field2.getText() + ", "
				+ "Punkte=Punkte+1",
				"SpielerID=" + myLabel[0].getText()
			);	//Heimunentschieden eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", "
				+ "ToreM=ToreM+" + field2.getText() + ", "
				+ "Punkte=Punkte+1",
				"SpielerID=" + myLabel[1].getText()
			);	//Heimunentschieden eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", "
				+ "ToreM=ToreM+" + field2.getText() + ", "
				+ "Punkte=Punkte+1",
				"SpielerID=" + myLabel[3].getText()
			);	//Auswärtsunentschieden eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Unentschieden=Unentschieden+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", "
				+ "ToreM=ToreM+" + field2.getText() + ", "
				+ "Punkte=Punkte+1",
				"SpielerID=" + myLabel[4].getText()
			);	//Auswärtsunentschieden eintragen
			myAccess.update(strTurnierName + "_spl", 
				"Tore1=" + field1.getText() + ", Tore2=" + field2.getText() + ", S=0, U=1, N=0", 
				"SpielID=" + myLabel[2].getName()
			); //Update Spielplan direkt
		}
		else
		{
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", " 
				+ "ToreM=ToreM+" + field2.getText(),
				"SpielerID=" + myLabel[0].getText()
			);	//Heimniederlage eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Niederlagen=Niederlagen+1, "
				+ "ToreP=ToreP+" + field1.getText() + ", " 
				+ "ToreM=ToreM+" + field2.getText(),
				"SpielerID=" + myLabel[1].getText()
			);	//Heimniederlage eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege+1, "
				+ "ToreP=ToreP+" + field2.getText() + ", " 
				+ "ToreM=ToreM+" + field1.getText() + ", "
				+ "Punkte=Punkte+3",
				"SpielerID=" + myLabel[3].getText()
			);	//Auswärtssieg eintragen
			myAccess.update(strTurnierName + "_tbl",
				"Siege=Siege+1, "
				+ "ToreP=ToreP+" + field2.getText() + ", " 
				+ "ToreM=ToreM+" + field1.getText() + ", "
				+ "Punkte=Punkte+3",
				"SpielerID=" + myLabel[4].getText()
			);	//Auswärtssieg eintragen
			myAccess.update(strTurnierName + "_spl", 
				"Tore1=" + field1.getText() + ", Tore2=" + field2.getText() + ", S=0, U=0, N=1", 
				"SpielID = " + myLabel[2].getName()); //Update Spielplan direkt
		}
		myLabel[5].setText(field1.getText());
		remove(field1);
		myLabel[5].setVisible(true);
		myLabel[7].setText(field2.getText());
		remove(field2);
		myLabel[7].setVisible(true);
		setEnabled(false);
	}
	public static boolean isInteger(String strInput)
	{
		try
		{
			Integer.parseInt(strInput);
		}
		catch(NullPointerException npex)
		{
			return false;
		}
		catch(NumberFormatException nfex)
		{
			return false;
		}
		return true;
	}
}
