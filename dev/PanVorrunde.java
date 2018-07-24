package dev;
import java.awt.Color;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.swing.*;

public class PanVorrunde extends JPanel
						 implements MouseListener
{
	private static final long serialVersionUID = 122L;
	ArrayList<ArrayList<JLabel>>	lstGruppe;
	int								intErrorCode;
	DbAccess						myAccess;
	int								intTeams;						//TODO: umgehen? Wird nur f�r checkDoubles() ben�tigt
//	boolean							endeSirene, hlbZtSiren, hlbZtStopp, extrSirene;
	FileHelper						myFileHelper;

	public PanVorrunde()
	{
		setLayout(null);
		myAccess 		= new DbAccess();
		myFileHelper	= new FileHelper();
	}
	
	/**
	 * @author LauLau
	 */
	public void initGroups(String s, int intGrupp, int t) 
	{
		lstGruppe 	= new ArrayList<ArrayList<JLabel>>();
		for(int g = 0; g < intGrupp; g++)
		{
			createGroup(s, g, t);
		}
		checkDoubles(t);
	}
	
	/**
	 * @author LauLau
	 */
	public void createGroup(String s, int g, int intTeams) 
	{
		this.intTeams = intTeams;										//TODO: umgehen? Wird nur f�r checkDoubles() ben�tigt
		ArrayList<JLabel> gruppenListe = new ArrayList<JLabel>();
		for(int t = 0; t < intTeams; t++)
		{
			gruppenListe.add(createTeam(s, g, t));
		}
		lstGruppe.add(gruppenListe);
		checkDoubles(intTeams);
	}
	
	/**
	 * @author LauLau
	 * @author Captain Doerk
	 */
	public JLabel createTeam(String strTurnierName, int g, int t) 
	{
		intTeams = t;													//TODO: umgehen? Wird nur f�r checkDoubles() ben�tigt
		String strGruppe = "";	
		switch(g)
		{
			case 0: strGruppe = "a"; break;
			case 1: strGruppe = "b"; break;
			case 2: strGruppe = "c"; break;
			case 3: strGruppe = "d"; break;
		}
		String strTeam = String.valueOf(t + 1) ;
		String strTeamName = myAccess.select("kc", strTurnierName + "_tms", "TeamName", "TeamID = '" + strGruppe + strTeam + "'");
		JLabel l = new JLabel("", JLabel.LEFT);	
//		System.out.println("JOptionen.createTeam(" + strGruppe + strTeam + "): " + strTeamName);
		if(strTeamName.substring(0, 4).equals("SELE"))	//TODO: �ndern! TeamName muss mindestens 4 Stellen haben, sonst UnhandledException
		{
			l.setIcon(new Icons().getIcon("_default", "_Wappen", 40));
			l.setText("<NEU>");
			l.setBackground(Color.RED);
			intErrorCode = 2;
		}
		else
		{
			l.setIcon(new Icons().getIcon(strTeamName, "_Wappen", 40));
			l.setText(strTeamName);			
			l.setBackground(Color.WHITE);
		}
		l.setBounds(20+g*140, 35+t*60, 120, 40);
		l.setOpaque(true);
		l.addMouseListener(this);
		add(l);
		return l;
	}
	public void checkDoubles(int intTeams)
	{
		intErrorCode = 0;												//TODO: Sinn?
		Hashtable<String, JLabel> hstTeamNamen = new Hashtable<String, JLabel>();
		String strTeamName = "";
		for (ArrayList<JLabel> group: lstGruppe) //Gruppen
		{
			for(int t = 0; t < intTeams; t++)
			{
				strTeamName = group.get(t).getText();
				if(hstTeamNamen.containsKey(strTeamName))
				{
					group.get(t).setBackground(Color.RED);
					hstTeamNamen.get(strTeamName).setBackground(Color.RED);
					intErrorCode = 1;									//TODO: Sinn?
				}
				else
				{
					hstTeamNamen.put(strTeamName, group.get(t));
					group.get(t).setBackground(Color.WHITE);
				}
			}
		}
	}
	public void mouseClicked(MouseEvent arg0)
	{
		//Dialog zur Teamauswahl										//TODO:	Doppelklick abfangen oder eigenen Dialog
		if(arg0.getSource() instanceof JLabel) 
		{
			JLabel l = (JLabel)arg0.getSource();
			String myString = myFileHelper.getFileName();
			l.setIcon(new Icons().getIcon(myString, "_Wappen", 40));
			System.out.println("PanVorrunde.mouseClicked: " + myString);
			l.setText(myString);
			checkDoubles(intTeams);										//TODO: ohne intTeams m�glich?
		}
	}
	public void mouseEntered(MouseEvent arg0){}
	public void mouseExited(MouseEvent arg0) {}
	public void mousePressed(MouseEvent arg0){}
	public void mouseReleased(MouseEvent arg0){}
}
