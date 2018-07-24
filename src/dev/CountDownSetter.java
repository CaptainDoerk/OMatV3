package dev;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;

import javax.swing.*;
import java.awt.event.*;

/**
 * @author Captain Doerk
 */
public class CountDownSetter extends JFrame
							 implements ActionListener
{
	static final long serialVersionUID = 40L;
	int			intMinuten;
	int			intSekundn;
	
	long		lngMaxMilli;
	long		lngRestZeit;
	
//	CountDown	myCountDown;

	//Icons
	String		iconPfad = "c:\\temp\\Icons\\";;
	ImageIcon	iconAddi = new ImageIcon(iconPfad + "up.jpg");
	ImageIcon	iconRedu = new ImageIcon(iconPfad + "down.jpg");
	ImageIcon	iconChck = new ImageIcon(iconPfad + "checked.jpg");
	ImageIcon	iconBlnk = new ImageIcon(iconPfad + "blank.jpg");
	ImageIcon	iconHelp = new ImageIcon(iconPfad + "help.jpg");

	JLabel		labMinuten;
	JButton		addMinuten,	redMinuten;

	JLabel		labSekundn;
	JButton		addSekundn, redSekundn;
	
	JButton		butTakeOvr;

	public CountDownSetter(long lngRestZeit, long lngMaxMilli)
	{
		super("Restspielzeit ändern:");
		setSize(240, 260);
		setLocation(300, 300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);
        setVisible(true);
        
        this.lngRestZeit = lngRestZeit;
		this.lngMaxMilli = lngMaxMilli;
        
        intMinuten = (int)lngRestZeit / (60 * 1000);
        System.out.println("Min: " + intMinuten + " ");
        intSekundn = (int)lngRestZeit % (60 * 1000) / 1000;
        System.out.println("Sek: " + intSekundn + " ");
        
        Font fontMed = new Font("Arial Narrow", Font.BOLD,   40);

		addMinuten = new JButton(iconAddi);
		addMinuten.setBounds( 40,  40,  40,  40);
		labMinuten = new JLabel(intToStr(intMinuten), JLabel.CENTER);
        labMinuten.setBounds( 40, 100,  40,  40);
        labMinuten.setFont(fontMed);
        labMinuten.setBackground(Color.white);
        labMinuten.setOpaque(true);	
		redMinuten = new JButton(iconRedu);
		redMinuten.setBounds( 40, 160,  40,  40);

		addSekundn = new JButton(iconAddi);
		addSekundn.setBounds(100,  40,  40,  40);
        labSekundn = new JLabel(intToStr(intSekundn), JLabel.CENTER);
        labSekundn.setBounds(100, 100,  40,  40);
        labSekundn.setFont(fontMed);
        labSekundn.setBackground(Color.white);
        labSekundn.setOpaque(true);	
		redSekundn = new JButton(iconRedu);
		redSekundn.setBounds(100, 160,  40,  40);
		
		butTakeOvr = new JButton(iconChck);
		butTakeOvr.setBounds(160, 160,  40,  40);
		init();
	}
	public void init()
	{
		//Buttons und Labels aufbringen: Minuten
		add(redMinuten);	redMinuten.addActionListener(this);
		add(labMinuten);
		add(addMinuten);	addMinuten.addActionListener(this);
		//Buttons und Labels aufbringen: Sekunden
		add(redSekundn);	redSekundn.addActionListener(this);
		add(labSekundn);
		add(addSekundn);	addSekundn.addActionListener(this);
		
		add(butTakeOvr);	butTakeOvr.addActionListener(this);
		
		if(lngMaxMilli <= intMinuten * 1000 * 60)
		{
			lngMaxMilli = (intMinuten + 1) * 1000 * 60;
		}
	}
	public void actionPerformed(ActionEvent evt) 
	{
		if(evt.getSource() == addMinuten && intMinuten < lngMaxMilli - 1000 * 60)
		{
			intMinuten ++;
			labMinuten.setText(intToStr(intMinuten));
		}
		if(evt.getSource() == redMinuten && intMinuten > 0)
		{
			intMinuten --;
			labMinuten.setText(intToStr(intMinuten));
		}
		if(evt.getSource() == addSekundn && intSekundn < 50)
		{
			intSekundn += 10;
			labSekundn.setText(intToStr(intSekundn));
		}
		else if(evt.getSource() == addSekundn && intSekundn >= 50)
		{
			intSekundn = 0;
			labSekundn.setText(intToStr(0));
			if(intMinuten * 1000 * 60 < lngMaxMilli)
			{
				intMinuten ++;
				labMinuten.setText(intToStr(intMinuten));
			}
		}
		if(evt.getSource() == redSekundn && intSekundn > 10)
		{
			intSekundn -= 10;
			labSekundn.setText(intToStr(intSekundn));
		}
		else if(evt.getSource() == redSekundn)
		{
			intSekundn = 0;
			labSekundn.setText("00");
		}
		if(evt.getSource() == butTakeOvr)
		{
			dispose();
			lngRestZeit = intMinuten * 1000 * 60
			            + intSekundn * 1000; 
		}		
	}
	public String intToStr(int myInt)
	{
		String myStr;
		if(myInt >= 10)
		{
			myStr = String.valueOf(myInt);
		}
		else if(myInt > 0)
		{
			myStr = "0" + String.valueOf(myInt);
		}
		else
		{
			myStr = "00";
		}
		return myStr;
	}
	public long getMillis()
	{
		return intMinuten * 1000 * 60
		     + intSekundn * 1000;
	}
}
