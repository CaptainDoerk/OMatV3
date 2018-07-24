package dev;

import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
//import java.sql.*;
//import java.util.*;

/**
 * @author Captain Doerk
 *
 *	todo: Referenzen auf Teams, die nicht im Teams-Verzeichnis liegen
 */
public class JConfig 	extends JFrame 
						implements ActionListener, MouseListener
{
	//Allgemeine Attribute
	static final long 		serialVersionUID 	= 31L;
	String					strWorkDir  		= System.getProperty("user.dir");
	String					sep 				= File.separator;

	//Ping
	Ping					myPing;

	int						intErrorCode;
//	FileHelper				myFileHelper;
	
	//Icons
	String					iconPfad = strWorkDir + sep + "Icons" + sep;
	ImageIcon				iconFrsh = new ImageIcon(iconPfad + "frsh.jpg");
	ImageIcon				iconBlnk = new ImageIcon(iconPfad + "blank.jpg");
	ImageIcon				iconChck = new ImageIcon(iconPfad + "checked.jpg");
	ImageIcon				iconAddi = new ImageIcon(iconPfad + "add.jpg");
	ImageIcon				iconRedu = new ImageIcon(iconPfad + "reduce.jpg");
	ImageIcon				iconHelp = new ImageIcon(iconPfad + "help.jpg");

	//Labels
	JLabel					labHost___,	labPort___,	labUser___, labPass___, labPing___,	labSubmit_;	
	JTextField				jtxHost___,	jtxPort___, jtxUser___, jtxPass___;
	//Buttons
	JButton					butPing___, butConnect;
	
	//Font
	Font					fontSmall_;
 	public JConfig()
    {
 		super("JConfig V0.1");
		setSize(1024, 768);
		setLocation(0,0);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
        setVisible(true);

        //Fonts
        fontSmall_ = new Font("Arial Narrow", Font.PLAIN,  14);

        labHost___ = new JLabel("Host", JLabel.CENTER);
        labHost___.setBounds( 20,  20, 140,  40);
        labHost___.setBackground(Color.WHITE);
        labHost___.setOpaque(true);
        jtxHost___ = new JTextField("localhost", JTextField.CENTER);
        jtxHost___.setBounds(180,  20, 140,  40);
        jtxHost___.setBackground(Color.WHITE);
        jtxHost___.setOpaque(true);

        labPort___ = new JLabel("Port", JLabel.CENTER);
        labPort___.setBounds( 20,  80, 140,  40);
        labPort___.setBackground(Color.WHITE);
        labPort___.setOpaque(true);
        jtxPort___ = new JTextField("3306", JTextField.CENTER);
        jtxPort___.setBounds(180,  80, 140,  40);
        jtxPort___.setBackground(Color.WHITE);
        jtxPort___.setOpaque(true);
        
        labUser___ = new JLabel("DB-User", JLabel.CENTER);
        labUser___.setBounds( 20, 140, 140,  40);
        labUser___.setBackground(Color.WHITE);
        labUser___.setOpaque(true);
        jtxUser___ = new JTextField("root", JTextField.CENTER);
        jtxUser___.setBounds(180, 140, 140,  40);
        jtxUser___.setBackground(Color.WHITE);
        jtxUser___.setOpaque(true);
 
        labPass___ = new JLabel("Passwort", JLabel.CENTER);
        labPass___.setBounds( 20, 200, 140,  40);
        labPass___.setBackground(Color.WHITE);
        labPass___.setOpaque(true);
        jtxPass___ = new JPasswordField("pass", JTextField.CENTER);
        jtxPass___.setBounds(180, 200, 140,  40);
        jtxPass___.setBackground(Color.WHITE);
        jtxPass___.setOpaque(true);
        
        butPing___ = new JButton("Test Ping");
        butPing___.setBounds( 20, 260, 140,  40);
        labPing___ = new JLabel("", JLabel.CENTER);
		labPing___.setBounds(180, 260, 140,  40);
		labPing___.setBackground(Color.white);
		labPing___.setFont(fontSmall_);
		labPing___.setOpaque(true);
		
		butConnect = new JButton("Verbinde mit DB");
	}
	public static void main (String args[])
	{
		JConfig myCfg = new JConfig();
		myCfg.init();
	}   
	public void init()
	{
		add(labHost___); 	add(jtxHost___);	
		add(labPort___);	add(jtxPort___);
		add(labUser___);	add(jtxUser___);
		add(labPass___);	add(jtxPass___);
		add(labPing___);	add(butPing___);	butPing___.addActionListener(this);
		
		myPing			= new Ping();
		
        validate();
        repaint();
	}
	public void actionPerformed(ActionEvent evt) 
	{
		if(evt.getSource() == butPing___)
		{
			String strReturn = myPing.ping(jtxHost___.getText());
			labPing___.setText(strReturn);
			if(strReturn.equals("ok"))
			{
				labPing___.setBackground(Color.GREEN);
			}
			else
			{
				labPing___.setBackground(Color.RED);
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
	public void mousePressed(MouseEvent arg0) 
	{
	}
	public void mouseReleased(MouseEvent arg0) 
	{
	}
}