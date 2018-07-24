package dev;
import java.awt.Color;
import java.awt.Font;
import java.io.*;

import javax.swing.*;

/**
 * @author Captain Doerk
 */
public class PanLetzter extends JPanel
{
	private static final long serialVersionUID = 101L;
	//Pfade	
	String				strWorkDir  		= System.getProperty("user.dir");
	String				sep 				= File.separator;

	JLabel				labPort;
	JLabel				labName;
	JLabel				labTeam;
	
	Icons				myIcons;

	public PanLetzter()
	{
		setLayout(null);
		setVisible(true);

        //Fonts
        Font fontSml		= new Font("Arial Narrow", 	Font.PLAIN, 24);

//      labTafel.setBounds(640,  40, 340, 200);
		
        labPort = new JLabel("", JLabel.CENTER);
        labPort.setBounds( 20,  40, 100, 100);
        labPort.setBackground(Color.white);
        labPort.setOpaque(true);
        labPort.setVisible(true);

        labName = new JLabel("", JLabel.CENTER);
        labName.setBounds(140,  40, 160,  40);
        labName.setFont(fontSml);
        labName.setBackground(Color.white);
        labName.setOpaque(true);
        labName.setVisible(true);

        labTeam = new JLabel("", JLabel.CENTER);
        labTeam.setBounds(140, 100, 160,  40);
        labTeam.setFont(fontSml);
        labTeam.setBackground(Color.white);
        labTeam.setOpaque(true);
        labTeam.setVisible(true);

	    add(labPort);
	    add(labName);
	    add(labTeam);
	    
	    myIcons = new Icons();
	}
	public void setSchuetze(String strName, String strTeam) 
	{
		labPort.setIcon(myIcons.getIcon(strTeam, strName));
		labName.setText(strName);
		labTeam.setText(strTeam);
	}
}
