package dev;
import java.awt.Color;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.swing.*;

public class PanFinale 	extends JPanel
						implements MouseListener
{
	private static final long 		serialVersionUID = 123L;
	SystemOut 						sout = new SystemOut();
	static int 						intTeams = 8, 	
									intGrupp = 2;
	JLabel[][]						labTeams		= new JLabel[8][2];
	int 							intTeamAnz;
	FileHelper						myFileHelper;
	int intErrorCode = 0;

	public PanFinale()
	{
		setLayout(null);
		for(int j=0; j<intGrupp; j++)
		{
			for(int i=0; i<intTeams; i++)
			{
				//Wappen
				labTeams[i][j] = new JLabel("", JLabel.LEFT);
				labTeams[i][j].setBounds( 20+j*140, 35+i*60, 120, 40);
				labTeams[i][j].setIcon(new Icons().getIcon("_default", "_Wappen", 40));
				labTeams[i][j].setText("<NEU>");
				labTeams[i][j].setBackground(Color.RED);
				labTeams[i][j].setOpaque(true);
				labTeams[i][j].addMouseListener(this);
				add(labTeams[i][j]);
			}
		}
		myFileHelper = new FileHelper();
	}
	public void setLabels(int intTeamAnz)
	{
		for(int i=0; i<intTeamAnz; i++)
		{
			labTeams[i][0].setVisible(true);
			labTeams[i][1].setVisible(true);
		}
		for(int i=intTeamAnz; i<intTeams; i++)
		{
			labTeams[i][0].setVisible(false);
			labTeams[i][1].setVisible(false);
		}
	}
	public void checkDoubles()
	{
		//TODO: gibt es auch in PanVorrunde --> zusammenlegen?		
		Hashtable<String, JLabel> hstTeamNamen = new Hashtable<String, JLabel>();
		String strTeamName = "";
		intErrorCode = 0;
		for (int g = 0; g < 2; g++)
		{
			for(int t = 0; t < intTeams; t++)
			{
				strTeamName = labTeams[t][g].getText();
				if(hstTeamNamen.containsKey(strTeamName))
				{
					labTeams[t][g].setBackground(Color.RED);
					hstTeamNamen.get(strTeamName).setBackground(Color.RED);
					intErrorCode = 1;									//TODO: Sinn?
				}
				else
				{
					hstTeamNamen.put(strTeamName, labTeams[t][g]);
					labTeams[t][g].setBackground(Color.WHITE);
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
			sout.println(8, "PanFinale.mouseClicked: " + myString);
			l.setText(myString);
			checkDoubles();
		}		
	}
	public int getErrorCode()
	{
		return intErrorCode;
	}
	public void mouseEntered(MouseEvent arg0) {}
	public void mouseExited(MouseEvent arg0)  {}
	public void mousePressed(MouseEvent arg0) {}
	public void mouseReleased(MouseEvent arg0){}
}
