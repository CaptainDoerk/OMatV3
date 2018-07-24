package stage_mysql;
import java.awt.Color;
import java.awt.Font;

import javax.swing.*;

/**
 * @author Captain Doerk
 */
public class XtraWindow extends JFrame
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 101L;
	JLabel  	labNameH, 	labNameG;
	JLabel		labWappH, 	labWappG;
	JLabel		labToreH, 	labToreG;
	JLabel		labTimer;
	
	CountDown	myCountDown;
	
	public XtraWindow(JLabel labTimer)
	{
		this.labTimer	= labTimer;
		setLayout(null);
		setLocation(1024, 0);
		setSize(1280, 1024);
		setVisible(true);
		
        Font fontBig		= new Font("Arial Narrow", 	Font.BOLD,  270);
        Font fontMed		= new Font("Arial Narrow", 	Font.BOLD,   80);
		
        labNameH = new JLabel("", SwingConstants.CENTER);
        labNameH.setBounds( 40,  40, 580, 120);
        labNameH.setBackground(Color.white);
        labNameH.setOpaque(true);
        labNameH.setFont(fontMed);
        add(labNameH);

        labWappH = new JLabel("", SwingConstants.CENTER);
        labWappH.setBounds( 40, 200, 270, 270);
        labWappH.setBackground(Color.white);
        labWappH.setOpaque(true);
        add(labWappH);

        labToreH = new JLabel("0", SwingConstants.CENTER);
        labToreH.setBounds(350, 200, 270, 270);
        labToreH.setBackground(Color.white);
        labToreH.setOpaque(true);
        labToreH.setFont(fontBig);
        add(labToreH);

        labNameG = new JLabel("", SwingConstants.CENTER);
        labNameG.setBounds(660,  40, 580, 120);
        labNameG.setBackground(Color.white);
        labNameG.setOpaque(true);
        labNameG.setFont(fontMed);
        add(labNameG);

        labToreG = new JLabel("0", SwingConstants.CENTER);
        labToreG.setBounds(660, 200, 270, 270);
        labToreG.setBackground(Color.white);
        labToreG.setOpaque(true);
        labToreG.setFont(fontBig);
        add(labToreG);

        labWappG = new JLabel("", SwingConstants.CENTER);
        labWappG.setBounds(970, 200, 270, 270);
        labWappG.setBackground(Color.white);
        labWappG.setOpaque(true);
        add(labWappG);
        
        labTimer.setBounds(40, 500, 1200, 270);
        labTimer.setBackground(Color.white);
        labTimer.setOpaque(true);
        labTimer.setFont(fontBig);
        add(labTimer);
	}
	
	public void setIcon(String myString, ImageIcon myIcon)
	{
		if(myString.equals("H"))
		{
			labWappH.setIcon(myIcon);
		}
		if(myString.equals("G"))
		{
			labWappG.setIcon(myIcon);
		}
	}
}
