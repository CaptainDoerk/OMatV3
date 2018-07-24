package dev;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javazoom.jl.decoder.JavaLayerException;
import javazoom.jl.player.advanced.AdvancedPlayer;

/**
 * @author Captain Doerk
 */
public class MP3Thread extends Thread
{
	String			strPath;
	int				intSound;
	MP3Player		myMP3Player;
	File[] 			fileArray;	
	ZufallsZahl 	myZufallsZahl;
	String			strWorkDir  	= System.getProperty("user.dir");
	String			sep 			= File.separator;
	String			strFilePath		= strWorkDir + sep + "SoundsBttn" + sep; 	//zum Initialisieren das MP3-Buttons-Verzeichnis genommen
	AdvancedPlayer 	myAdvPlayer;	

	public MP3Thread()
	{
		myMP3Player 		= new MP3Player();
		strPath				= "";
		intSound			= 0;
	}
	public MP3Thread(String strPath, int intSound)
	{	
		this.strPath		= strPath;
		this.intSound		= intSound;
		myMP3Player			= new MP3Player(strPath, intSound);
	}
	public void run()
	{
/*		try
		{
//			System.out.println("MP3Thread.run(): spiele " + strPath + ", " + intSound);
			myMP3Player.play(strPath, intSound);
		}
		catch(IllegalThreadStateException ex)
		{
			System.err.println(ex);
		}*/
//		this.intSound = intSound;
		fileArray = new File(strPath).listFiles();									//Array aus Dateinamen
		
		if(intSound == 100)
		{
			myZufallsZahl = new ZufallsZahl();
			intSound = myZufallsZahl.generiere(fileArray.length-1);
		}

		try
		{
			FileInputStream in = new FileInputStream(fileArray[intSound]);
			// Player-Instanz
			myAdvPlayer = new AdvancedPlayer(in);
			// Abspielen
			Runtime.getRuntime().exec(strWorkDir + sep + "/Clever/clever volume 0");
//			System.out.println("setze volume 0");
			myAdvPlayer.play();
			Runtime.getRuntime().exec(strWorkDir + sep + "/Clever/clever volume 200");
//			System.out.println("setze volume 200");
		}
		catch(JavaLayerException jle) 
		{ 
			System.err.println ("MP3Player.run() JavaLayerException: " + jle); 
		}
		catch(FileNotFoundException fnf) 
		{
			System.err.println ("MP3Player.run() FileNotFoundException: " + fnf); 
		}
		catch(IOException ioe)
		{
			System.err.println("MP3Player.run() IOException:\n " + ioe);
		}
	}
}