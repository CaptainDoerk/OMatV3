package stage_mysql;
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
	JLabel[][]	labTablle		= new JLabel[14][6];									//TODO
//	ImageIcon[]	icnWappen		= new ImageIcon[8];
	int 		intTeamAnz;
	
	public PanGruppe(DbAccess myAccess, String strTurnierName, String strGruppe)
	{
		setLayout(null);
		this.myAccess		= myAccess;
		this.strTurnierName = strTurnierName;
		this.strGruppe		= strGruppe;
		intTeamAnz = 14;																//TODO

		for(int i = 0; i < intTeamAnz; i++)
		{
			//Wappen
			labTablle[i][0] = new JLabel("", SwingConstants.CENTER);
			labTablle[i][0].setBounds( 20, i*50+5,  40,  40);
			labTablle[i][0].setBackground(Color.white);
			labTablle[i][0].setOpaque(true);
			add(labTablle[i][0]);
			//Teamname
			labTablle[i][1] = new JLabel("", SwingConstants.CENTER);
			labTablle[i][1].setBounds( 80, i*50+5, 220,  40);
			labTablle[i][1].setBackground(Color.white);
			labTablle[i][1].setOpaque(true);
			labTablle[i][1].addMouseListener(this);
			add(labTablle[i][1]);
			//Elo
			labTablle[i][5] = new JLabel("", SwingConstants.CENTER);
			labTablle[i][5].setBounds(320, i*50+5,  80,  40);
			labTablle[i][5].setBackground(Color.white);
			labTablle[i][5].setOpaque(true);
			add(labTablle[i][5]);
			//Punkte
			labTablle[i][2] = new JLabel("", SwingConstants.CENTER);
			labTablle[i][2].setBounds(420, i*50+5,  40,  40);
			labTablle[i][2].setBackground(Color.white);
			labTablle[i][2].setOpaque(true);
			add(labTablle[i][2]);
			//Punkte
			labTablle[i][3] = new JLabel("", SwingConstants.CENTER);
			labTablle[i][3].setBounds(480, i*50+5,  40,  40);
			labTablle[i][3].setBackground(Color.white);
			labTablle[i][3].setOpaque(true);
			add(labTablle[i][3]);
			//Tore
			labTablle[i][4] = new JLabel("", SwingConstants.CENTER);
			labTablle[i][4].setBounds(540, i*50+5,  80,  40);
			labTablle[i][4].setBackground(Color.white);
			labTablle[i][4].setOpaque(true);
			add(labTablle[i][4]);
		}
//		this.setPreferredSize(new Dimension(600,500));
		refresh();
		PanManager.getInstance().addGruppe("Ranking", this);		
	}
	public void refresh()
	{
		myResultSet = myAccess.getSet("kcxx_tbl", "*", "Gruppe = 'a'" + " ORDER BY Elo DESC, Punkte DESC, Spiele DESC, ToreP-ToreM DESC, ToreP DESC ");
		try
		{
			int i = 0;
			while(myResultSet.next() && i < intTeamAnz)	//Abfangen: nur statisch Teams pro Gruppe möglich?
			{
				labTablle[i][0].setIcon(myIcons.getIcon(myResultSet.getString("SpielerID"), 40));					
				labTablle[i][1].setText(myResultSet.getString("SpielerID"));
				labTablle[i][5].setText(myResultSet.getString("Elo"));			//[5] siehe oben
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
	public void mouseEntered(MouseEvent arg0){ /** */ }
	public void mouseExited(MouseEvent arg0){ /** */ }
	public void mousePressed(MouseEvent arg0){ /** */ }
	public void mouseReleased(MouseEvent arg0){ /** */ }
}
