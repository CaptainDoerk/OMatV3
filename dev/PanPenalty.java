package dev;

import java.awt.Color;
import java.awt.Font;
import java.io.*;
import java.util.Timer;
import java.awt.event.*;
//import java.util.Timer;

import javax.swing.*;

public class PanPenalty extends JPanel implements ActionListener
{
	private static final long serialVersionUID = 100L;
	//Pfade	
	String				strWorkDir  		= System.getProperty("user.dir");
	String				sep 				= File.separator;

	JLabel				labPnlty1,	labPnlty2;
	JButton				btnPnlty1, 	btnPnlty2,	btnPnlty3,	btnPnlty4;
	Timer 				myPnlty1Timer;
	Timer 				myPnlty2Timer;
	CountDown			myPnlty1;
	CountDown			myPnlty2;
	String				strAdd2Min = strWorkDir + sep + "Icons" + sep + "plus1.jpg";
	String				strSet2Min = strWorkDir + sep + "Icons" + sep + "set1.jpg";
	ImageIcon			imgAddPnlty = new ImageIcon(strAdd2Min);
	ImageIcon			imgSetPnlty = new ImageIcon(strSet2Min);

	public PanPenalty()
	{
		setLayout(null);
		setVisible(true);

        //Fonts
        Font fontSml		= new Font("Arial Narrow", 	Font.PLAIN, 14);
        Font fontMed		= new Font("Arial Narrow", 	Font.BOLD,  40);

//      labTafel.setBounds(640,  40, 340, 200);
		
		labPnlty1 = new JLabel("", JLabel.CENTER);
		labPnlty1.setBounds( 20,  20, 100,  60);
		labPnlty1.setFont(fontMed);
		labPnlty1.setBackground(Color.white);
		labPnlty1.setOpaque(true);
		labPnlty1.setVisible(true);
		btnPnlty1 = new JButton(imgSetPnlty);
        btnPnlty1.setFont(fontSml);
		btnPnlty1.setBounds(140,  20,  60,  60);
		btnPnlty3 = new JButton(imgAddPnlty);
        btnPnlty3.setFont(fontSml);
		btnPnlty3.setBounds(220,  20,  60,  60);
		
		labPnlty2 = new JLabel("", JLabel.CENTER);
		labPnlty2.setBounds( 20, 100, 100,  60);
		labPnlty2.setFont(fontMed);
		labPnlty2.setBackground(Color.white);
		labPnlty2.setOpaque(true);
		labPnlty2.setVisible(true);
		btnPnlty2 = new JButton(imgSetPnlty);
        btnPnlty2.setFont(fontSml);
		btnPnlty2.setBounds(140, 100,  60,  60);
		btnPnlty4 = new JButton(imgAddPnlty);
        btnPnlty4.setFont(fontSml);
		btnPnlty4.setBounds(220, 100,  60,  60);

		myPnlty1Timer = new Timer();
		myPnlty2Timer = new Timer();
		
		init();
	}
	public void init()
	{
		//Timer	myPenltyTimer = new Timer();
		myPnlty1 = new CountDown("60", labPnlty1, labPnlty1);
		myPnlty2 = new CountDown("60", labPnlty2, labPnlty2);
		myPnlty1Timer.scheduleAtFixedRate(myPnlty1, 0, 50); 
		myPnlty2Timer.scheduleAtFixedRate(myPnlty2, 0, 50); 

	    add(labPnlty1);
	    add(labPnlty2);
	    add(btnPnlty1);	btnPnlty1.addActionListener(this);	    
	    add(btnPnlty2);	btnPnlty2.addActionListener(this);	    
	    add(btnPnlty3);	btnPnlty3.addActionListener(this);	    
	    add(btnPnlty4);	btnPnlty4.addActionListener(this);	    
	}
	public void actionPerformed(ActionEvent evt) 
	{
		if(evt.getSource() == btnPnlty1) myPnlty1.setRestZeit(60000);
		if(evt.getSource() == btnPnlty2) myPnlty2.setRestZeit(60000);
		if(evt.getSource() == btnPnlty3) myPnlty1.addRestZeit(60000);
		if(evt.getSource() == btnPnlty4) myPnlty2.addRestZeit(60000);
	}
	public void reset()
	{
		myPnlty1.setRestZeit(0);
		myPnlty2.setRestZeit(0);
	}
	public void xstart() 
	{
		if(myPnlty1.isActive())
		{
			myPnlty1.start();
		}
		if(myPnlty2.isActive())
		{
			myPnlty2.start();
		}
	}
	public void stop() 
	{
		myPnlty1.stop();
		myPnlty2.stop();
	}
}
