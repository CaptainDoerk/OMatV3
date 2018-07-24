package stage_mysql;
import java.awt.Color;
import java.awt.Font;
import java.sql.*;

import javax.swing.*;

/**
 * @author Captain Doerk
 */
public class PanSchuetzen extends JPanel
{
	private static final long serialVersionUID = 1000L;

	DbAccess		myAccess;
	int				intDebugLvl;
	SystemOut		sout;
	ResultSet		myResultSet;
	JLabel[][] 		labSchuetzen;
	String			strTurnierName;
	String			strTeamName, strFileName;
	Icons			myIcons;
	int				h, w;

	public PanSchuetzen(int intDebugLvl, DbAccess myAccess, String strTurnierName)
	{
		setLayout(null);
		this.intDebugLvl	= intDebugLvl;
		this.myAccess		= myAccess;
		this.strTurnierName	= strTurnierName;
		sout				= new SystemOut(intDebugLvl);
		myIcons				= new Icons();
		labSchuetzen		= new JLabel[99][4];
        Font fontSml		= new Font("Arial Narrow", 	Font.PLAIN, 14);
        Font fontMed		= new Font("Arial Narrow", 	Font.BOLD,  40);
	    Font fontBig		= new Font("Arial Narrow", 	Font.BOLD, 100);
	    //erste Spalte
		for(int i=0; i<3; i++) //i=3 für die besten drei Schützen
		{
			//1. Feld Anzeige Platz
			labSchuetzen[i][0]	= new JLabel((i+1)+".".toString(), SwingConstants.CENTER);
			labSchuetzen[i][0].setBounds( 20,  20+i*120,   40,   40);
			labSchuetzen[i][0].setBackground(Color.white);
			labSchuetzen[i][0].setFont(fontSml);
			labSchuetzen[i][0].setOpaque(true);
			add(labSchuetzen[i][0]);

			//2.Feld Anzeige Portrait
			labSchuetzen[i][1]	= new JLabel("", SwingConstants.CENTER);
			labSchuetzen[i][1].setBounds(1*120-40,  20+i*120, 100, 100);
			labSchuetzen[i][1].setBackground(Color.white);
			labSchuetzen[i][1].setOpaque(true);
			labSchuetzen[i][1].setFont(fontBig);
			add(labSchuetzen[i][1]);
			
			//3. Feld Anzeige Wappen
			labSchuetzen[i][2]	= new JLabel("", SwingConstants.CENTER);
			labSchuetzen[i][2].setBounds(2*120-40,  20+i*120, 100, 100);
			labSchuetzen[i][2].setOpaque(true);
			add(labSchuetzen[i][2]);
			
			labSchuetzen[i][3]	= new JLabel("", SwingConstants.CENTER);
			labSchuetzen[i][3].setBounds(3*120-40,  20+i*120, 100, 100);
			labSchuetzen[i][3].setBackground(Color.white);
			labSchuetzen[i][3].setOpaque(true);
			labSchuetzen[i][3].setFont(fontBig);
			add(labSchuetzen[i][3]);
		}
		//zweite und dritte Spalte
		for(int i=0; i<12; i++)
		{
			for(int j=0; j<4; j++)
			{
				labSchuetzen[i+3][j] 	= new JLabel("", SwingConstants.CENTER);
				h =  20 + i*60	 - i/6*360;	//nie wieder danach fragen!
				w = 460 + j%4*60 + i/6*260;
				labSchuetzen[i+3][j].setBounds(w, h,  40,  40);
				labSchuetzen[i+3][j].setBackground(Color.white);		//TODO: Transparenz für Wappen ([i][2])
				labSchuetzen[i+3][j].setOpaque(true);
				add(labSchuetzen[i+3][j]);
			}
			labSchuetzen[i+3][0].setFont(fontSml);
			labSchuetzen[i+3][0].setText((i+4)+".".toString());
			labSchuetzen[i+3][1].setFont(fontMed);
		}
		refresh();
	}
	public void refresh()
	{
		int length = 0;
		//es folgt captain doerk's und fjen's mörder-select
		myResultSet = myAccess.fireSQL_RS("SELECT t1.Spieler AS Spieler, SUM(t1.tore) AS Tore, t2.Team AS Team " + 
				"FROM ((SELECT * FROM " + strTurnierName + "_tor ORDER BY TORE DESC) t1 join " + strTurnierName + "_tor t2) " +
				"WHERE ((t1.Spieler = t2.Spieler) and (t1.Team = t2.Team)) " +
				"GROUP BY t1.Spieler " +
				"ORDER BY Tore DESC, t1.Spieler DESC ");
		try //Größe ResultSet ausrechnen (Dirty Style)
		{
			myResultSet.last();
			length = myResultSet.getRow();
			myResultSet.beforeFirst();
		}
		catch(SQLException ex)
		{
			sout.println(1, "PanSchuetzen.refresh():\n" + ex);
		}
		catch(NullPointerException npex)
		{
			sout.println(1, "PanSchuetzen.refresh():\n" + npex);
			length = 0;
		}
		int tmp = (length>3) ? 3:length; //da kommt doch kei sau druff
		for(int i=0; i<tmp; i++)
		{
			try
			{
				myResultSet.next();
				labSchuetzen[i][1].setText(myResultSet.getString("Tore"));
				labSchuetzen[i][2].setIcon(myIcons.getIcon(myResultSet.getString("Team"), myResultSet.getString("Spieler")));
				labSchuetzen[i][3].setIcon(myIcons.getIcon(myResultSet.getString("Team"), "_Wappen"));
			}
			catch(SQLException ex)
			{
				System.err.println("PanSchuetzen.refresh() 1: " + ex);
			}
		}
		if(length > 15)
		{
			length = 15;
		}
		for(int i=3; i<length; i++)
		{
			try
			{
				myResultSet.next();
				labSchuetzen[i][1].setText(myResultSet.getString("Tore"));
				labSchuetzen[i][2].setIcon(myIcons.getIcon(myResultSet.getString("Team"), myResultSet.getString("Spieler"), 40));
				labSchuetzen[i][3].setIcon(myIcons.getIcon(myResultSet.getString("Team"), "_Wappen", 40));
			}
			/**
			 * ToDo: "After end of result set"
			 */
			catch(SQLException ex)
			{
				sout.println(1, "PanSchuetzen.refresh(): 2 " + ex);
			}
		}
	}
}
