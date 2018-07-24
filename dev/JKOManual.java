package dev;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;

public class JKOManual extends JFrame implements MouseListener, ActionListener
{
	private static final long serialVersionUID = 24L;
	DbAccess 	myAccess	= new DbAccess();
	JLabel[] 	labKOTeams;
	JLabel[]	labSpTeams;
	JLabel[]	labDpPunkt;
	JButton		btnOkay;
	JButton		btnReset;

	ResultSet	myResultSet;
	String		turnierName;
	String		view;

	int			intAnzTeams;
	
	public JKOManual(String turnierName)
	{
		super("KOManual");
		this.turnierName 	= turnierName;
		view 				= turnierName + "_v_tbl";
		setLocation(0, 0);
		setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);		
		setLayout(null);
	}
	public void init()
	{
		//Anzahl der zu erwartenden Teams lesen
		intAnzTeams = Integer.parseInt(myAccess.select("kc", view, "COUNT(TeamID)", "Status = 1"));
		setSize(880, (intAnzTeams/2)*50+120);
		labKOTeams = new JLabel[intAnzTeams];
		labSpTeams = new JLabel[intAnzTeams];
		labDpPunkt = new JLabel[intAnzTeams/2];

		myResultSet = myAccess.getSet("kc", view, "TeamID, TeamName", "Status = 1 ORDER BY TeamName ASC");
		try
		{
			for(int i=0;i<intAnzTeams;i++)
			{
				myResultSet.next();
				labKOTeams[i] = new JLabel("", JLabel.CENTER);
		        labKOTeams[i].setBounds((i%2)*200+20,(i/2)*50+20,180,40);
		        labKOTeams[i].setText(myResultSet.getString("TeamName"));
		        labKOTeams[i].setName(myResultSet.getString("TeamID"));
		        labKOTeams[i].setBackground(Color.white);
		        labKOTeams[i].addMouseListener(this);
		        labKOTeams[i].setOpaque(true);
		        add(labKOTeams[i]);
		        
				labSpTeams[i] = new JLabel("", JLabel.CENTER);
				labSpTeams[i].setBounds((i%2)*220+440,(i/2)*50+20,180,40);
				labSpTeams[i].setBackground(Color.white);
		        labSpTeams[i].addMouseListener(this);
				labSpTeams[i].setOpaque(true);
		        add(labSpTeams[i]);	        
			}
			for(int i=0;i<intAnzTeams/2;i++)
			{
				labDpPunkt[i] = new JLabel(":", JLabel.CENTER);
				labDpPunkt[i].setBounds(630,i*50+20,20,40);
				labDpPunkt[i].setBackground(Color.white);
				labDpPunkt[i].setOpaque(true);
				add(labDpPunkt[i]);
			}
		}
		catch(SQLException e)
		{
			System.err.println("JKOManual.init(): \n" + e);
		}
        btnOkay = new JButton("Okay");
        btnOkay.setBounds(20, (intAnzTeams*25+30), 80, 40);
        btnOkay.addActionListener(this);
        add(btnOkay);
        
        btnReset = new JButton("Reset");
        btnReset.setBounds(120, (intAnzTeams*25+30), 80, 40);
        btnReset.addActionListener(this);
        add(btnReset);

		setVisible(true);
		repaint();
	}	
 	public void mouseClicked(MouseEvent arg0) 
 	{
 	}
 	public void mouseEntered(MouseEvent arg0) 
 	{
 	}
 	public void mouseExited(MouseEvent arg0) 
 	{
 	}
 	public void mouseReleased(MouseEvent arg0) 
 	{
 	}
 	int active = -1;
 	public void mousePressed(MouseEvent mEvt) 
 	{
 		for(int i=0;i<intAnzTeams;i++)
 		{
 	 		if(mEvt.getSource() == labKOTeams[i])
 	 		{
 	 			if(labKOTeams[i].isEnabled() == true)
 	 			{
 	 				labKOTeams[i].setBackground(Color.gray);
 	 				active = i;
 	 				if(mEvt.getClickCount() >= 2)
 	 				{
 	 					stock(i);
 	 				}
 	 			}
 	 		}
 	 		else
 	 		{
 	 			labKOTeams[i].setBackground(Color.white);
 	 		}
 		}
 		if(active >= 0)
 		{
 			for(int i=0;i<intAnzTeams;i++)
 			{
 				if(mEvt.getSource() == labSpTeams[i])
 				{
 					//wenn das Label bereits gefüllt ist
 					if(labSpTeams[i].getText().length() > 0)
 					{
 						//muss das korrespondierende KO-Label wieder aktiviert werden.
 						reset(i);
 					}
 					labSpTeams[i].setText(labKOTeams[active].getText());
 					labSpTeams[i].setName(labKOTeams[active].getName());
 					labKOTeams[active].setEnabled(false);
 					active = -1;
				}
 			}
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
 			updateSpielplan();
 			dispose();
 		}
 	}
 	public void reset(int i)
 	{
 		String strTeamName = labSpTeams[i].getText();
 		for(int j=0;j<intAnzTeams;j++)
 		{
 			if(labKOTeams[j].getText().equals(strTeamName))
 			{
 				labKOTeams[j].setEnabled(true);
 				break;
 			}
 		}
 	}
 	public void reset()
 	{
 		for(int i=0;i<intAnzTeams;i++)
 		{
 			labKOTeams[i].setEnabled(true);
 			labKOTeams[i].setBackground(Color.white);
 			labSpTeams[i].setText("");
 		}
 	}
 	public void stock(int index)
 	{
 		for(int i=0;i<intAnzTeams;i++)
 		{
 			if(labSpTeams[i].getText().length() == 0)
 			{
 				labSpTeams[i].setText(labKOTeams[index].getText());
 				labSpTeams[i].setName(labKOTeams[index].getName());
 				labKOTeams[index].setEnabled(false);
 				active = -1;
 				break;
 			}
 		}
 	}
 	public void updateSpielplan()
 	{
 		for(int i=0; i<intAnzTeams;i+=2)
 		{
 			myAccess.insert("kc", turnierName + "_spl", "Team1, Team2, Art", labSpTeams[i].getName() + ", " + labSpTeams[i+1].getName() + ", 4");
// 			System.out.print("Füge ein in Tabelle " + turnierName + "_spl: ");
// 			System.out.print(labSpTeams[i].getName() + " (" + labSpTeams[i].getText() + ") : ");
// 			System.out.print(labSpTeams[i+1].getName() + " (" + labSpTeams[i+1].getText() + ")");
// 			System.out.println();
 		}
 	}
}
