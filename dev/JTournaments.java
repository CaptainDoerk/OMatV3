package dev;
import javax.swing.*;

import java.awt.event.*;
import java.awt.*;
import java.sql.*;

public class JTournaments extends JDialog implements MouseListener, ActionListener
{
	private static final long serialVersionUID = 110L;
	DbAccess	myAccess;
	ResultSet	myResultSet;
	JLabel[][] 	myLabel;
	static int	myRows;

	public JTournaments()
	{
		setLayout(null);
	}
	public void init()
	{
		setLocation(302, 100);
		setSize(640, 480);
		myAccess = new DbAccess();

		//Turniere laden
		myResultSet = myAccess.getSet("kc", "turniere", "*", "true");
		try
		{
			//Größe des ResultSets lesen (dirty style)
			myResultSet.last(); 
			myRows = myResultSet.getRow();
			if(myRows < 5)
				myLabel = new JLabel[myRows][4];
			else
				myLabel = new JLabel[5][4];
			myResultSet.beforeFirst();
			
			loadLabels();
			
			int row = 0;
			while(myResultSet.next())
			{
		        myLabel[row][0].setText(myResultSet.getString("TurnierName"));
		        myLabel[row][1].setText(myResultSet.getString("AnzGrupp"));
		        myLabel[row][2].setText(myResultSet.getString("AnzTeams"));
		        myLabel[row][3].setText(myResultSet.getString("DauerSek"));
		        row++;
			}
		}
		catch(SQLException ex)
		{
			System.err.println(ex);
		}
		setVisible(true);
		repaint();
	}
	public void actionPerformed(ActionEvent evt)
	{
		
	}
	public void loadLabels()
	{
		for(int i=0; i<myRows; i++)
		{
			myLabel[i][0] = new JLabel();
			myLabel[i][0].setBounds( 20,i*50+20,200,  40);
			myLabel[i][0].setBackground(Color.WHITE);
			myLabel[i][0].setOpaque(true);
			add(myLabel[i][0]);
			myLabel[i][1] = new JLabel();
			myLabel[i][1].setBounds(240,i*50+20, 40,  40);
			myLabel[i][1].setBackground(Color.WHITE);
			myLabel[i][1].setOpaque(true);
			add(myLabel[i][1]);
			myLabel[i][2] = new JLabel();
			myLabel[i][2].setBounds(300,i*50+20, 40,  40);
			myLabel[i][2].setBackground(Color.WHITE); 
			myLabel[i][2].setOpaque(true);
			add(myLabel[i][2]);
			myLabel[i][3] = new JLabel();
			myLabel[i][3].setBounds(360,i*50+20, 60,  40);
			myLabel[i][3].setBackground(Color.WHITE);
			myLabel[i][3].setOpaque(true);
			add(myLabel[i][3]);
		}
	}
	@Override
	public void mouseClicked(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mouseEntered(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mouseExited(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mousePressed(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void mouseReleased(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}
