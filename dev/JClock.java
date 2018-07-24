package dev;

import javax.swing.*;
import java.awt.*;
import java.util.Timer;

public class JClock extends JFrame
{
	private static final long serialVersionUID = 3L;
	
	private JLabel	labUhrzeit;

	public JClock()
    {
		super("Uhrzeit");
		
		setSize(620, 280);
		setLocation(262, 284);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(null);   
		setVisible(true);
    }
	public void init()
	{
		labUhrzeit = new JLabel();
        labUhrzeit.setBounds( 20,  20, 200, 200);
    	labUhrzeit.setEnabled(true);
    	labUhrzeit.setBackground(Color.white);
    	labUhrzeit.setOpaque(true);
		add(labUhrzeit);
		
	    Timer timer = new Timer();
	    timer.schedule(new Clock(labUhrzeit), 0, 100 );
		validate();
	}
}
