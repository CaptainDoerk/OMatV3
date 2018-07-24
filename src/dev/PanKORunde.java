package dev;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;

public class PanKORunde extends JPanel implements ActionListener, MouseListener
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 24L;
	DbAccess_MySQL 		myAccess	= new DbAccess_MySQL();
	
	JLabel[] 		labAllTeams;
	JLabel[]		labSelTeams;
	JLabel[]		labDplPunkt;
	JButton			btnOkay;
	JButton			btnReset;

	JRadioButton 	jrbPlatz	= new JRadioButton("Platzierungsspiel");
	JRadioButton 	jrbFinal	= new JRadioButton("KO-Spiel (Sieger weiter)");
	ButtonGroup 	bg			= new ButtonGroup();
	
	ResultSet		myResultSet;
	String			strTurnierName;
	String			view;

	int				intAnzTeams;
	int				intSelTeams;

	public PanKORunde(String strTurnierName)
	{
		setLayout(null);
		this.strTurnierName = strTurnierName;
		view 				= strTurnierName + "_tbl"; 				//2011-06-02: war _v_tbl

		//Anzahl der zu erwartenden Teams lesen
		intAnzTeams = Integer.parseInt(myAccess.select("kc", view, "COUNT(TeamID)", "Status = 1"));
//		System.out.println(intAnzTeams + " Teams");

		if((intAnzTeams >=  4) && (intAnzTeams < 8))	intSelTeams =  4;
		if((intAnzTeams >=  8) && (intAnzTeams < 16))	intSelTeams =  8;
		if((intAnzTeams >= 16) && (intAnzTeams < 32))	intSelTeams = 16;

		labAllTeams = new JLabel[intAnzTeams];
		labSelTeams = new JLabel[intSelTeams];
		labDplPunkt = new JLabel[intSelTeams/2];

		myResultSet = myAccess.getSet("kc", view, "*", "Status = 1 ORDER BY TeamName");
		
		btnReset = new JButton("Reset");
		btnReset.setBounds( 20,380,160, 40);
		btnReset.addActionListener(this);
		add(btnReset);

		btnOkay = new JButton("Okay");
		btnOkay.setBounds (200,380,160, 40);
		btnOkay.addActionListener(this);
		add(btnOkay);

		//Wenn noch mehr als zwei Teams im Rennen sind, KO-Runde, ansonsten Platzierung
		if(intAnzTeams > 2)
		{
			jrbFinal.setSelected(true);
		}
		else
		{
			jrbPlatz.setSelected(true);
		}
		
		jrbPlatz.setBounds( 20,320,180, 20);
		jrbPlatz.addActionListener(this);
		add(jrbPlatz);
		bg.add(jrbPlatz);
		
		jrbFinal.setBounds( 20,340,180, 20);
		jrbFinal.addActionListener(this);
		add(jrbFinal);
		bg.add(jrbFinal);

		setVisible(true);
		repaint();
//	}
	
//	public void refresh()
//	{
		try
		{
			//linke Seite: alle Teams, die in der Verlosung sind
			for(int i=0;i<intAnzTeams;i++)
			{
				myResultSet.next();
				labAllTeams[i] = new JLabel("", JLabel.CENTER);
				labAllTeams[i].setBounds((i/6)*180+20,(i%6)*50+20,160,40);
				labAllTeams[i].setText(myResultSet.getString("TeamName") + " (" + myResultSet.getString("Gruppe").toUpperCase() + ")");
				labAllTeams[i].setName(myResultSet.getString("Team1"));
				labAllTeams[i].setBackground(Color.white);
				labAllTeams[i].addMouseListener(this);
				labAllTeams[i].setOpaque(true);
				add(labAllTeams[i]);
			}
			//Rechte Seite: geloste Spiele
			for(int i=0;i<intSelTeams;i++)
			{
				labSelTeams[i] = new JLabel("", JLabel.CENTER);
				labSelTeams[i].setBounds((i%2)*220+580,(i/2)*50+20,160,40);
				labSelTeams[i].setBackground(Color.white);
				labSelTeams[i].addMouseListener(this);
				labSelTeams[i].setOpaque(true);
				add(labSelTeams[i]);	        
			}	
			for(int i=0;i<intSelTeams/2;i++)
			{
				labDplPunkt[i] = new JLabel(":", JLabel.CENTER);
				labDplPunkt[i].setBounds(760,i*50+20,20,40);
				labDplPunkt[i].setBackground(Color.white);
				labDplPunkt[i].setOpaque(true);
				add(labDplPunkt[i]);
			}	
		}
		catch(SQLException e)
		{
			System.err.println("JKOManual.init(): \n" + e);
		}
	}
	
	public void actionPerformed(ActionEvent aEvt) 
	{
		if(aEvt.getSource() == btnReset)
		{
			reset();
		}
		if(aEvt.getSource() == btnOkay)
		{
			update();
		}
	}
 	int active = -1;
 	public void mousePressed(MouseEvent mEvt) 
 	{
 		for(int i=0;i<intAnzTeams;i++)
 		{
 	 		if(mEvt.getSource() == labAllTeams[i])
 	 		{
 	 			if(labAllTeams[i].isEnabled() == true)
 	 			{
 	 				labAllTeams[i].setBackground(Color.gray);
 	 				active = i;
 	 				if(mEvt.getClickCount() >= 2)
 	 				{
 	 					stock(i);
 	 				}
 	 			}
 	 		}
 	 		else
 	 		{
 	 			labAllTeams[i].setBackground(Color.white);
 	 		}
 		}
		for(int i=0;i<intSelTeams;i++)
		{
			if(mEvt.getSource() == labSelTeams[i])
			{
 				if(mEvt.getClickCount() >= 2)
 				{
 					//wenn das Label bereits gefüllt ist
 					if(labSelTeams[i].getText().length() > 0)
 					{
 						//muss das korrespondierende KO-Label wieder aktiviert werden.
 						reset(i);
 						labSelTeams[i].setText("");
 						labSelTeams[i].setName("");
 					}
				}
			}
		}
 	}
	public void mouseReleased(MouseEvent arg0) {
	}
 	public void reset(int i)
 	{
 		String strTeamName = labSelTeams[i].getText();
 		for(int j=0;j<intAnzTeams;j++)
 		{
 			if(labAllTeams[j].getText().equals(strTeamName))
 			{
 				labAllTeams[j].setEnabled(true);
 				break;
 			}
 		}
 	}
 	public void reset()
 	{
 		for(int i=0;i<intAnzTeams;i++)
 		{
 			labAllTeams[i].setEnabled(true);
 			labAllTeams[i].setBackground(Color.white);
 		}
 		for(int i=0;i<intSelTeams;i++)
 		{
 			labSelTeams[i].setText("");
 			labSelTeams[i].setName("");
 		}
 	}
 	public void stock(int index)
 	{
 		for(int i=0;i<intSelTeams;i++)
 		{
 			if(labSelTeams[i].getText().length() == 0)
 			{
 				labSelTeams[i].setText(labAllTeams[index].getText());
 				labSelTeams[i].setName(labAllTeams[index].getName());
 				labAllTeams[index].setEnabled(false);
 				active = -1;
 				break;
 			}
 		}
 	}
 	public void update()
 	{
 		for(int i=0; i<intSelTeams-1; i+=2)
 		{
 			if((labSelTeams[i].getText().length() > 0) && (labSelTeams[i+1].getText().length() > 0))
			{
 				System.out.println(labSelTeams[i].getText() + " vs. " + labSelTeams[i+1].getText()
 									+ ", " + labSelTeams[i].getName() + ":" + labSelTeams[i+1].getName());
 				
 				myAccess.insert("kc", strTurnierName + "_spl", "Team1, Team2, X, Gruppe", 
 								"'" + labSelTeams[i].getName() 	+ "', '" + 	//Team1
 								labSelTeams[i+1].getName() 		+ "', " +	//Team2
 								intSelTeams+0 					+ ", " +	//80
 								intSelTeams);								//8
 				
			}
 		}
 	}
	public void mouseClicked(MouseEvent arg0) {}
	public void mouseEntered(MouseEvent arg0) {}
	public void mouseExited(MouseEvent arg0) {}
}