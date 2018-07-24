package stage_mysql;
import java.awt.*;
import java.io.*;
import java.awt.event.*;

import javax.swing.*;

/**
 * @author Captain Doerk
 */
public class PanMP3Buttons extends JPanel implements ActionListener
{
	private static final long serialVersionUID = 1L;

	//Pfade
	String				strWorkDir  	= System.getProperty("user.dir");
	String				sep 			= File.separator;
	String				strBtnSounds 	= strWorkDir + sep + "SoundsBttn" + sep;
	
	//Buttons
	JButton[][]			butSound 	= new JButton[4][8];
	String[]			strSound;																	//für die MP3-Buttons
	int					intSound = 0;

	MP3Player			myBtnPlayer;
	MP3Thread			myMP3Thread;

	//Dateien
	File				myFile;
	FileHelper 			myFileHelper;

	public PanMP3Buttons()
	{
		setLayout(null);
//		this.myMP3Thread	= myMP3Thread;
		Font fontSml		= new Font("Arial Narrow", 	Font.PLAIN,  14);
	    myFileHelper 		= new FileHelper();														//zur Ermittlung der Dateinamen
	    myFile				= new File(strBtnSounds);
		strSound 			= myFileHelper.getFileNames(strBtnSounds); 								//Array von Dateinamen
		for(int y=0; y<8; y++)
		{
			for(int x=0; x<4; x++)
			{
				if(y*4+x < strSound.length)
				{
					int	myLength = strSound[y*4+x].length();
					butSound[x][y] = new JButton(strSound[y*4+x].substring(0, myLength-4));
					butSound[x][y].setFont(fontSml);
					butSound[x][y].setBounds((x*240+20), (y*50+20) , 220, 40);
					butSound[x][y].addActionListener(this);
					add(butSound[x][y]);
				}
			}
		}
	}
	@SuppressWarnings("deprecation")
	public void actionPerformed(ActionEvent evt) 
	{
		//MP3-Buttons abfangen und MP3 abspielen
		for (int y=0; y<8; y++)
		{
			for (int x=0; x<4; x++)
			{
				if(evt.getSource() == butSound[x][y])
				{
					intSound = y*4+x;
					//neue Version: abfragen, ob eine Instanz des MP3Players schon vorhanden ist. Wenn ja, zerstören und neue anlegen
					if(OMat.instanz.myMP3Thread != null) 
					{
						OMat.instanz.myMP3Thread.stop();
						OMat.instanz.myMP3Thread = new MP3Thread(strBtnSounds, intSound);
					}
					OMat.instanz.myMP3Thread.start();															//MP3 abspielen
	    		}
	    	}
	    }
	}	
}
