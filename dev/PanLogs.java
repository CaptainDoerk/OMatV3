package dev;

import java.awt.Color;
import java.awt.Font;
import java.io.*;
import javax.swing.*;

public class PanLogs extends JPanel
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 111L;
	//Pfade	
	String				strWorkDir  		= System.getProperty("user.dir");
	String				sep 				= File.separator;
	String[]			strText;
	JLabel				labLogs;

	public PanLogs()
	{
		setLayout(null);
		setVisible(true);
		
		strText = new String[12]; //12
        Font fontSml		= new Font("Courier New", 	Font.PLAIN, 12);

		labLogs	 = new JLabel("Logs", JLabel.LEFT);
		labLogs.setBounds( 20,  10, 320, 170);
		labLogs.setFont(fontSml);
		labLogs.setBackground(Color.white);
		labLogs.setOpaque(true);
		labLogs.setVisible(true);
		
		add(labLogs);
		init();
	}
	public void init()
	{
		strText[0] = "<html><body>";
		for(int i=1; i<11; i++)
		{
			addText("" + i);		//String.valueOf(i);
		}
		strText[11] = "</body></html>";		
	}
	public void addText(String myText)
	{
		String myString = "";
		for(int i=1; i<11; i++)
		{
			strText[i] = strText[i+1];
		}
		strText[10]	= myText;
		for(int i=0; i<11; i++)
		{
			myString += strText[i] + "<br>";
		}
		labLogs.setText(myString);
		repaint();
	}
}
