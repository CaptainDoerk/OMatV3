package dev;
import javax.swing.*;
import java.io.File;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;

/**
 * @author Captain Doerk
 */
public class PanGruppe 	extends JPanel
						implements MouseListener
{
	private static final long serialVersionUID = 1L;
	String		strWorkDir  	= System.getProperty("user.dir");
	String		sep 			= File.separator;
	Icons		myIcons			= new Icons();
	DbAccess	myAccess;
	ResultSet	myResultSet 	= null;
	String		strTurnierName;
	String		strGruppe;
	JLabel[][]	labTablle		= new JLabel[8][6];
//	ImageIcon[]	icnWappen		= new ImageIcon[8];
	int 		intTeamAnz;
	
	public PanGruppe(int intDebugLvl, String strTurnierName, String strGruppe)
	{
		this.strTurnierName = strTurnierName;
		this.strGruppe		= strGruppe;
		setLayout(null);
		myAccess			= new DbAccess(intDebugLvl);
		intTeamAnz = Integer.parseInt(myAccess.select("__turniere", "AnzTeams", "aktiv = 1"));

		for(int i = 0; i < intTeamAnz; i++)
		{
			//Wappen
			labTablle[i][0] = new JLabel("", JLabel.CENTER);
			labTablle[i][0].setBounds( 20, i*50+5,  40,  40);
//			labTablle[i][0].setBackground(Color.white);
			labTablle[i][0].setOpaque(true);
			add(labTablle[i][0]);
			//Teamname
			labTablle[i][1] = new JLabel("", JLabel.CENTER);
			labTablle[i][1].setBounds( 80, i*50+5, 220,  40);
			labTablle[i][1].setBackground(Color.white);
			labTablle[i][1].setOpaque(true);
			labTablle[i][1].addMouseListener(this);
			add(labTablle[i][1]);
			//Punkte
			labTablle[i][2] = new JLabel("", JLabel.CENTER);
			labTablle[i][2].setBounds(320, i*50+5,  40,  40);
			labTablle[i][2].setBackground(Color.white);
			labTablle[i][2].setOpaque(true);
			add(labTablle[i][2]);
			//Punkte
			labTablle[i][3] = new JLabel("", JLabel.CENTER);
			labTablle[i][3].setBounds(380, i*50+5,  40,  40);
			labTablle[i][3].setBackground(Color.white);
			labTablle[i][3].setOpaque(true);
			add(labTablle[i][3]);
			//Tore
			labTablle[i][4] = new JLabel("", JLabel.CENTER);
			labTablle[i][4].setBounds(440, i*50+5,  80,  40);
			labTablle[i][4].setBackground(Color.white);
			labTablle[i][4].setOpaque(true);
			add(labTablle[i][4]);
		}
		refresh();
		PanManager.getInstance().addGruppe("Gruppe " + strGruppe, this);		
	}
	public void refresh()
	{
		myResultSet = myAccess.getSet("v_" + strTurnierName + "_tbl", "*", "Gruppe = '" + strGruppe + "'" + " ORDER BY Punkte DESC, Spiele DESC, ToreP-ToreM DESC, ToreP DESC ");
		try
		{
			int i = 0;
			while(myResultSet.next() && i < intTeamAnz)	//Abfangen: nur 8 Teams pro Gruppe möglich?
			{
				labTablle[i][0].setIcon(myIcons.getIcon(myResultSet.getString("TeamName"), "_Wappen", 40));					
				labTablle[i][1].setText(myResultSet.getString("TeamName"));
				labTablle[i][2].setText(myResultSet.getString("Spiele"));
				labTablle[i][3].setText(myResultSet.getString("Punkte"));
				labTablle[i][4].setText(myResultSet.getString("ToreP") + " : " + myResultSet.getString("ToreM"));
				i++;
			}
		}
		catch(SQLException e)
		{
			System.err.println("PanGruppe.refresh(): \n" + e);
		}
	}
	public void mouseClicked(MouseEvent arg0) 
	{
		// TODO Doppelklick abfangen: Team ändern
    	if (arg0.getClickCount() >= 2) 
    	{
    		System.out.println("Doppelklick..");
    	}
	}
	public void mouseEntered(MouseEvent arg0){}
	public void mouseExited(MouseEvent arg0){}
	public void mousePressed(MouseEvent arg0){}
	public void mouseReleased(MouseEvent arg0){}
}
