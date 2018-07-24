package dev;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;

public class JCupCreator extends JFrame implements MouseListener, ActionListener
{
	private static final long serialVersionUID = 2L;
	DbAccess 	myAccess		= new DbAccess();
	ResultSet	myResultSet;

	int			intMarkiert		=  0;
	int			col;
	int			intTeamAnz;

	JLabel[] 	labTeams;
	JLabel[]	labTeam2;
	JLabel		labMessg;
	
	JButton		btnWeit;
	JButton		btnOkay;
	JButton		btnReset;

	String		turnierName;
	String		view;
	String		strGruppe;
	String		strLabel;
	
	public JCupCreator()
	{
		super("Captain Doerks Cup Creator V0.1");
		setLocation(0, 0);
		setSize(1024,768);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	public void init()
	{
		myResultSet = myAccess.getSet("kc", "test_cup_v_tbl", "*", "true ORDER BY Gruppe, Punkte DESC, ToreP-ToreM DESC limit 0, 65");
		try
		{
			int i=0;
			myResultSet.last();
			strGruppe 		= myResultSet.getString("Gruppe");
			intTeamAnz 		= myResultSet.getRow();
			labTeams		= new JLabel[intTeamAnz];
			labTeam2 		= new JLabel[16];

			myResultSet.beforeFirst();
			if (strGruppe.equals("a")) col = 1; 
			if (strGruppe.equals("b")) col = 2; 
			if (strGruppe.equals("c")) col = 3;
			if (strGruppe.equals("d")) col = 4;
			if (strGruppe.equals("e")) col = 5;
			if (strGruppe.equals("f")) col = 6;
			
			while(myResultSet.next())
			{
				labTeams[i] = new JLabel(myResultSet.getString("TeamName"), JLabel.CENTER);
		        labTeams[i].setBounds((i%col)*200+20,(i/col)*50+20,180,40);
		        labTeams[i].setName(myResultSet.getString("TeamID"));
		        labTeams[i].setBackground(Color.white);
		        labTeams[i].addMouseListener(this);
		        labTeams[i].setOpaque(true);
		        add(labTeams[i]);
		        i++;
//		        System.out.print(i + ",");
			}
		}
		catch(SQLException e)
		{
			System.err.println("JKOManual.init(): \n" + e);
		}
        btnWeit = new JButton("weiter");
        btnWeit.setBounds(20, 660, 80, 40);
        btnWeit.addActionListener(this);
        add(btnWeit);
        
        btnReset = new JButton("Reset");
        btnReset.setBounds(120, 660, 80, 40);
        btnReset.addActionListener(this);
        add(btnReset);
        
        labMessg = new JLabel("0 Teams ausgewählt", JLabel.CENTER);
        labMessg.setBounds(220, 660, 200, 40);
        labMessg.setBackground(Color.white);
        labMessg.setOpaque(true);
        add(labMessg);
	}
 	public void mousePressed(MouseEvent mEvt) 
 	{
 		for(int i=0;i<intTeamAnz;i++)
 		{
 	 		if(mEvt.getSource() == labTeams[i])
 	 		{
				if(mEvt.getClickCount() >= 2)
 				{
 					stock(i);
 				}
				else
				{
					if(labTeams[i].getBackground().equals(Color.white))
					{
						labTeams[i].setBackground(Color.gray);
						active = i;
						intMarkiert++;
					}
					else
					{
						labTeams[i].setBackground(Color.white);
						intMarkiert--;
					}
				}
 	 		}
 		}
		if(intMarkiert != 1)
		{
			labMessg.setText(intMarkiert + " Teams ausgewählt");
		}
		else
		{
			labMessg.setText("1 Team ausgewählt");
 		}
 	}

 	int active = -1;
 	public void actionPerformed(ActionEvent aEvt)
 	{
 		if(aEvt.getSource() == btnReset)
 		{
 			reset();
 		}
 	}
 	public void reset(int i)
 	{
 		String strTeamName = labTeams[i].getText();
 		for(int j=0;j<intTeamAnz;j++)
 		{
 			if(labTeams[j].getText().equals(strTeamName))
 			{
 				labTeams[j].setEnabled(true);
 				break;
 			}
 		}
 	}
 	public void reset()
 	{
 		for(int i=0;i<intTeamAnz;i++)
 		{
 			labTeams[i].setEnabled(true);
 			labTeams[i].setBackground(Color.white);
 			intMarkiert = 0;
			labMessg.setText("0 Teams ausgewählt");
 		}
 	}
 	public void stock(int index)
 	{
 		for(int i=0;i<intTeamAnz;i++)
 		{
 			if(labTeam2[i].getText().length() == 0)
 			{
 				labTeam2[i].setText(labTeams[index].getText());
 				labTeam2[i].setName(labTeams[index].getName());
 				labTeam2[index].setEnabled(false);
 				active = -1;
 				break;
 			}
 		}
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
}