package dev;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.ResultSet;
//import java.sql.SQLException;

import javax.swing.*;

/**
 * @author Captain Doerk
 * @deprecated
 */
public class JCupCreatorII extends JFrame implements MouseListener, ActionListener
{
	private static final long serialVersionUID = 3L;
	DbAccess_MySQL 	myAccess		= new DbAccess_MySQL();
	ResultSet	myResultSet;

	int			intAnzTeams;
	int			intMarkiert		=  0;

	JLabel[] 	labSpTeams;
	JLabel		labMessg;

	JButton		btnOkay;
	JButton		btnReset;

	String		turnierName;
	String		view;

	public JCupCreatorII()
	{
		super("Captain Doerks Cup Creator V0.1");
		setLocation(0, 0);
		setSize(1024,768);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);		
		setLayout(null);
	}
	public void init(int intAnzTeams, JLabel[] labKOTeams)
	{
		intAnzTeams	=	labKOTeams.length;
		labSpTeams = new JLabel[intAnzTeams];
		
		for(int i=0;i<labKOTeams.length;i++)
		{
			int j=0;
			if(labKOTeams[i].getText().length() > 0)
			{
				labSpTeams[j] = new JLabel("", JLabel.CENTER);
				labSpTeams[j].setBounds((i%2)*200+20,(i/2)*50+20,180,40);
				labSpTeams[j].setText(labKOTeams[i].getText());
				labSpTeams[j].setName(labKOTeams[i].getName());
				labSpTeams[j].setBackground(Color.white);
//				labSpTeams[j].addMouseListener(this);
				labSpTeams[j].setOpaque(true);
				add(labSpTeams[i]);
				j++;
			}
		}
		btnOkay = new JButton("Okay");
		btnOkay.setBounds(20, 660, 80, 40);
		btnOkay.addActionListener(this);
		add(btnOkay);
        
		btnReset = new JButton("Reset");
		btnReset.setBounds(120, 660, 80, 40);
		btnReset.addActionListener(this);
		add(btnReset);
        
		labMessg = new JLabel("0 Teams ausgewählt", JLabel.CENTER);
		labMessg.setBounds(220, 660, 200, 40);
		labMessg.setBackground(Color.white);
		labMessg.setOpaque(true);
		add(labMessg);

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
 	 		if(mEvt.getSource() == labSpTeams[i])
 	 		{
 	 			if(labSpTeams[i].getBackground().equals(Color.white))
 	 			{
 	 				labSpTeams[i].setBackground(Color.gray);
 	 				active = i;
 	 				intMarkiert++;
 	 			}
 	 			else
 	 			{
 	 				labSpTeams[i].setBackground(Color.white);
 	 				intMarkiert--;
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
 	public void actionPerformed(ActionEvent aEvt)
 	{
 		if(aEvt.getSource() == btnReset)
 		{
 			reset();
 		}
 		if(aEvt.getSource() == btnOkay)
 		{
 			dispose();
 		}
 	}
 	public void reset(int i)
 	{
 		String strTeamName = labSpTeams[i].getText();
 		for(int j=0;j<intAnzTeams;j++)
 		{
 			if(labSpTeams[j].getText().equals(strTeamName))
 			{
 				labSpTeams[j].setEnabled(true);
 				break;
 			}
 		}
 	}
 	public void reset()
 	{
 		for(int i=0;i<intAnzTeams;i++)
 		{
 			labSpTeams[i].setEnabled(true);
 			labSpTeams[i].setBackground(Color.white);
 			intMarkiert = 0;
			labMessg.setText("0 Teams ausgewählt");
 		}
 	}
}
