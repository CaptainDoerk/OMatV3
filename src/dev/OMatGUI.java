package dev;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.File;

import javax.swing.*;

public class OMatGUI extends JFrame
{
	static final long 	serialVersionUID = 0L;

	Container			myContainer;
	JMenuItem 			menuItem;
	String				strWorkDir  	= System.getProperty("user.dir");
	String				sep 			= File.separator;
	
	JMenuBar			menuBar;
	JMenu				menDatei;
	JMenu				menBearb;
	JMenu				menExtra;
	JMenu				menHilfe;

	String				strBtnNeu		= strWorkDir + sep + "Icons" + sep + "btn_new.gif";
	ImageIcon			myNewIcn		= new ImageIcon(strBtnNeu);
	JButton				butNeu			= new JButton(myNewIcn);
	String				strBtnOpn		= strWorkDir + sep + "Icons" + sep + "btn_open.gif";
	ImageIcon			myOpnIcn		= new ImageIcon(strBtnOpn);
	JButton				butOpn			= new JButton(myOpnIcn);
	
	String				strCapDoerk		= strWorkDir + sep + "Icons" + sep + "captaindoerk.jpg";
	ImageIcon			imgCapDoerk		= new ImageIcon(strCapDoerk);
	JLabel				labCapDoerk		= new JLabel(imgCapDoerk);
	
	String				mySaveBtn		= strWorkDir + sep + "Icons" + sep + "btn_save.gif";
	ImageIcon			mySaveIcn		= new ImageIcon(mySaveBtn);
	String				mySaveAsBtn		= strWorkDir + sep + "Icons" + sep + "btn_saveas.gif";
	ImageIcon			mySaveAsIcn		= new ImageIcon(mySaveAsBtn);

	public OMatGUI()
	{
		super("Captain Doerk's OMat");
		
		setSize(1024, 768);
		setLocation(0,0);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
        setVisible(true);
        
        labCapDoerk.setBounds(32, 10, 960, 721);
        add(labCapDoerk);        
        
        menuBar 	= new JMenuBar();
		menDatei	= new JMenu("Datei");
		menBearb	= new JMenu("Bearbeiten");
		menExtra	= new JMenu("Extras");
		menHilfe 	= new JMenu("Hilfe");
	}

	public void init()
	{		
		menuBar.add(menDatei);
		menuBar.add(menBearb);
		menuBar.add(menExtra);
		menuBar.add(menHilfe);
		setJMenuBar(menuBar);

		// Datei-Menü aufbauen
		menDatei.add(new AbstractAction("Neuer Cup", myNewIcn)
		{
			private static final long serialVersionUID = 1L;
			public void actionPerformed(ActionEvent e) 
			{
				createCup();
			} 
		});		  
		menDatei.add(new AbstractAction("Cup bearbeiten", myOpnIcn) 
		{ 
			private static final long serialVersionUID = 2L;
			public void actionPerformed(ActionEvent e) 
			{
				System.out.println("Cup bearbeiten");
			} 
		});
		menDatei.add(new AbstractAction("Speichern", mySaveIcn) 
		{ 
			private static final long serialVersionUID = 3L;
			public void actionPerformed(ActionEvent e) 
			{
				System.out.println("Speichern");
			}
		});
		menDatei.add(new AbstractAction("Speichern als..", mySaveAsIcn) 
		{ 
			private static final long serialVersionUID = 3L;
			public void actionPerformed(ActionEvent e) 
			{
				System.out.println("Speichern als.. gedrückt"); 
				// Etwas Sinnvolles tun
			}
		});

        validate();
        repaint();
	}
	public void createCup()
	{
		System.out.println("Neuer Cup");
//		myCreator.init();
//		myCreator.setVisible(true);
	}
}
