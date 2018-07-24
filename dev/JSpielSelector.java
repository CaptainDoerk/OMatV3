package dev;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class JSpielSelector extends JFrame implements ActionListener
{
	private static final long serialVersionUID = 23L;
	JPanel			frmWindw;
	JSpielPlan		myJSpielPlan;

	public JSpielSelector()
	{
		super("JSpielSelector V0.1");
		setLocation(100, 100);
		setSize(640, 500);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);		
		setLayout(null);
		setVisible(true);

//		frmWindw = new JSpielPlan();
	    frmWindw.setBounds( 0,  0, 600, 480);
	    frmWindw.setBackground(Color.white);
	    frmWindw.setOpaque(true);

		init();
	}
	
	public void init()
	{
        add(frmWindw);
	}

	public void actionPerformed(ActionEvent e) 
	{
	}
}
