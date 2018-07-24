package stage_mysql;
import java.io.*;
import javazoom.jl.player.advanced.*;
import javazoom.jl.decoder.*;

/**
 * hängt sich gelegentlich auf, derzeit kein Fix verfügbar
 */
public class MP3Player implements Runnable
{
	int 			zufall;
	int				intSound;
	File 			myFile;														//ist in diesem Fall ein Verzeichnis (war zuvor "dir" genannt)
	File[] 			fileArray;	
	ZufallsZahl 	myZufallsZahl;
	String			strWorkDir  	= System.getProperty("user.dir");
	String			sep 			= File.separator;
	String			strFilePath		= strWorkDir + sep + "SoundsBttn" + sep; 	//zum Initialisieren das MP3-Buttons-Verzeichnis genommen
	boolean			winampPaused 	= false;

	// Prototype
	AdvancedPlayer 	myAdvPlayer;	
	
	/**
	 * @param strFilePath
	 * @param intSound
	 */
	public MP3Player(String strFilePath, int intSound)
	{
		this.strFilePath 	= strFilePath;
		this.intSound		= intSound;
		myFile 				= new File(strFilePath);
		fileArray 			= myFile.listFiles();
	}
	public MP3Player() //wird benötigt von Klasse MP3Thread zum initialisieren
	{
		myFile				= new File(strFilePath);
		fileArray 			= myFile.listFiles();
	}
	public void run()
	{
//		System.out.println("MP3Player.run(): Länge fileArray = " + fileArray.length);
		if (intSound == 100)
		{
			myZufallsZahl = new ZufallsZahl();
//			intSound = myZufallsZahl.generiere(fileArray.length-1);
			intSound = 0;
		}
		try
		{
			if(!winampPaused)
			{
//				Runtime.getRuntime().exec(strWorkDir + sep + "/Clever/clever playpause");
				winampPaused = true;
			}
			if(myAdvPlayer != null)
			{
				myAdvPlayer.stop();
			}
			FileInputStream in 	= new FileInputStream(fileArray[intSound]);
			myAdvPlayer 		= new AdvancedPlayer(in);
			Runtime.getRuntime().exec(strWorkDir + sep + "/Clever/clever volume 0");
//			System.out.println("setze volume 0");
			myAdvPlayer.play();
			Runtime.getRuntime().exec(strWorkDir + sep + "/Clever/clever volume 200");
//			System.out.println("setze volume 200");
		}
		catch(JavaLayerException jle) 
		{ 
			System.err.println("MP3Player.run() JavaLayerException:\n" + jle); 
		}
		catch(FileNotFoundException nfe) 
		{
			System.err.println("MP3Player.run() FileNotFoundException:\n" + nfe); 
		}
		catch(NullPointerException npe)
		{
			System.err.println("MP3Player.run() NullPointerException:\n" + npe);
		}
		catch(IOException ioe)
		{
			System.err.println("MP3Player.run() IOException:\n " + ioe);
		}
	}
	/**
	 * @param strPfad
	 * @param intSound
	 */
	public void play(String strPfad, int intSound)
	{
		this.intSound = intSound;
		fileArray = new File(strPfad).listFiles();									//Array aus Dateinamen
		
		if(intSound == 100)
		{
			myZufallsZahl = new ZufallsZahl();
			intSound = ZufallsZahl.generiere(fileArray.length-1);
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
