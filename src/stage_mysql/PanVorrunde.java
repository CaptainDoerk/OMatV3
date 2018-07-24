package stage_mysql;
import java.awt.Color;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.swing.*;

/**
 * @author Captain Doerk
 */
public class PanVorrunde extends JPanel
						 implements MouseListener
{
	private static final long serialVersionUID = 122L;
	ArrayList<ArrayList<JLabel>>	lstGruppe;
	int								intErrorCode;
	SystemOut						sout;
	int								intDebugLvl;
	DbAccess						myAccess;
	int								intTeams;						//TODO: umgehen? Wird nur für checkDoubles() benötigt
//	boolean							endeSirene, hlbZtSiren, hlbZtStopp, extrSirene;
//	FileHelper						myFileHelper;
	JChooser						myJChooser;

	public PanVorrunde(int intDebugLvl, DbAccess myAccess)
	{
		setLayout(null);
		this.intDebugLvl	= intDebugLvl;
		this.myAccess 		= myAccess;
		sout				= new SystemOut(intDebugLvl);
		myJChooser			= new JChooser();
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
		this.intTeams = intTeams;										//TODO: umgehen? Wird nur für checkDoubles() benötigt
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
		intTeams = t;													//TODO: umgehen? Wird nur für checkDoubles() benötigt

		String strTeam = String.valueOf(t + 1) ;
		String strTeamName = myAccess.select(strTurnierName + "_tms", "Name", "TeamID = " + strTeam);	//liefert NULL
		JLabel l = new JLabel("", SwingConstants.LEFT);	
		sout.println(8, "JOptionen.createTeam(" +  strTeam + "): " + strTeamName);
		if(strTeamName.substring(0, 4).equals("SELE"))	//TODO: Ändern! TeamName muss mindestens 4 Stellen haben, sonst UnhandledException
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
			String strActul = l.getText();
			System.out.println("JOptionen.mouseClicked(): aktuelles Team " + strActul);
			String myString = myJChooser.choose("Teams");
			System.out.println("ausgewählt: " + myString);
			if (myString.equals(""))
			{
				myString = strActul;
			}
			l.setIcon(new Icons().getIcon(myString, "_Wappen", 40));
			System.out.println("JOptionen.mouseClicked: " + myString);
			l.setText(myString);
			checkDoubles(intTeams);										//TODO: ohne intTeams möglich?
		}
	}
	public void mouseEntered(MouseEvent arg0){ /** */ }
	public void mouseExited(MouseEvent arg0){ /** */ }
	public void mousePressed(MouseEvent arg0){ /** */ }
	public void mouseReleased(MouseEvent arg0){ /** */ }
}
