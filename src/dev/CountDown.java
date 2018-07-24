package dev;
import javax.swing.*;

import java.io.File;
import java.util.*;

/**
 * @author Captain Doerk
 */
public class CountDown extends TimerTask
{
	//Hauptattribute
	long 			lngRestZeit, 	lngTempZeit, 	lngMaxMilli, 	lngGespielt, 	lngTempZeit2;
	//Helper		
	long 			startTime, 		endTime, 		currentTime;
	String			strRestZeit,	strGespielt;
	boolean 		stopped;
	JLabel 			myLabel, 		myLabel2;
	long			lngSpielDauer = 0;
	
	String			strDauer;
	
	public boolean 	sirene5Min = true;	//true heißt noch nicht gespielt
	public boolean 	sirene1Min = true;
	public boolean	sireneEnde = true;

	//MP3Player
	String			strWorkDir  = System.getProperty("user.dir");
	String			sep 		= File.separator;

	String			srn5MinPfad = strWorkDir + sep + "Sounds5min" + sep;
//	String			srn1MinPfad = strWorkDir + sep + "Sounds1min" + sep;
	String			srnEndePfad = strWorkDir + sep + "SoundsEnde" + sep;

	public CountDown(String strDauer, JLabel myLabel, JLabel myLabel2) 
	{
		this.strDauer		= strDauer;
		this.myLabel 		= myLabel;
		this.myLabel2		= myLabel2;
//		String 	strDauer 	= "600";
		lngSpielDauer 		= Long.parseLong(strDauer) * 1000;
		startTime 			= 0;
		endTime   			= 0;
		lngRestZeit  		= lngSpielDauer;
		lngGespielt			= 0;
		strRestZeit			= "";
		strGespielt			= "";
		lngTempZeit  		= 0;
		stopped				= true;
	}
	public void run()
	{
		getRestZeit();
	}
	public void start() 
	{
		//hole aktuellen TimeStamp
		startTime 	= System.currentTimeMillis();
		stopped 	= false;
	}
	public void stop() 
	{
		//hole aktuellen TimeStamp
		endTime 		= System.currentTimeMillis();
		//Aufsummierung 
		lngRestZeit  	= lngRestZeit - (endTime - startTime);
		lngGespielt		= lngGespielt + (endTime - startTime);
		myLabel.setText(getRestZeit(lngRestZeit));
		myLabel2.setText(getRestZeit(lngRestZeit));
		stopped 		= true;
	}
	public void reset() 
	{
		startTime 	= 0;
		endTime		= 0;
		stopped		= true;
		lngRestZeit	= lngSpielDauer;
		lngGespielt	= 0;
		sirene5Min	= true;
		sirene1Min	= true;
		sireneEnde  = true;
		getRestZeit();
	}
	
	public boolean isActive()
	{
		return (lngRestZeit != 0);
	}
	public String getRestZeit()		//war void
	{
		currentTime = System.currentTimeMillis();
		if(stopped)
		{
			myLabel.setText(getRestZeit(lngRestZeit));
			myLabel2.setText(getRestZeit(lngRestZeit));
		}
		else
		{
			lngTempZeit  	= lngRestZeit - (currentTime - startTime);
			lngTempZeit2	= lngGespielt + (currentTime - startTime);
			myLabel.setText(getRestZeit(lngTempZeit));
			myLabel2.setText(getRestZeit(lngTempZeit));
//			System.out.println("CountDown.getRestZeit(): " + lngTempZeit);
			checkSirene(lngTempZeit);
		}
		return getRestZeit(lngRestZeit);
	}
	public String getGespielt()
	{
//		System.out.println(lngTempZeit2);
		strGespielt = "";
		//Aufbereitung Minuten
		if(lngTempZeit2 > 600000)										//10 Min. und mehr
		{
			strGespielt = 			String.valueOf(lngTempZeit2 / 60000) + ":";
		}
		else if(lngTempZeit2 > 60000)									// 1 Min. und mehr
		{
			strGespielt = "0" + 	String.valueOf(lngTempZeit2 / 60000) + ":";
		}
		else															//weniger als 1 Min.
		{
			strGespielt = "00:";
		}
		//Aufbereitung Sekunden
		if(lngTempZeit2 % 60000 / 1000 >= 10)							//10 Sek. und mehr
		{
			strGespielt += 			String.valueOf(lngTempZeit2 % 60000 / 1000);//.substring(0, 2);
		}
		else if(lngTempZeit2 % 60000 / 1000 >= 0)								// 1 Sek. und mehr
		{
			strGespielt += "0" + 	String.valueOf(lngTempZeit2 % 60000 / 1000);//.substring(0, 2);
		}
		else															// 0 Sekunden --> obsolet?
		{
			strGespielt += "00";
		}
		return strGespielt;
	}
	//Anzeige restliche Spieldauer
	public String getRestZeit(long restZeit)
	{
		if (restZeit > 60000)
		{
			strRestZeit = String.valueOf(restZeit / 60000) + ":";
			if (restZeit % 60000 >= 10000)
			{
				strRestZeit = strRestZeit +
							  String.valueOf(restZeit % 60000).substring(0, 2);
			}
			else if (restZeit % 60000 >= 1000)
			{
				strRestZeit = strRestZeit + "0" +
							  String.valueOf(restZeit % 60000).substring(0, 1);
			}
			else	
			{
				strRestZeit = strRestZeit + "00";
			}
		}
		else if (restZeit >= 0)
		{
			strRestZeit = String.valueOf(restZeit / 1000) + "." +
						  String.valueOf(restZeit % 1000).substring(0, 1);
		}
		else
		{
			strRestZeit = "0.0";
		}
//		System.out.println(strRestZeit);
		return strRestZeit;
	}
	public void setRestZeit(long lngRestZeit)
	{
		if(!stopped)
		{
			startTime = System.currentTimeMillis();
		}
		this.lngRestZeit = lngRestZeit;
//		System.out.println("Countdown.setRestZeit(long restZeit): " + lngRestZeit);
	}
	public void addRestZeit(long lngZeit)
	{
		this.lngRestZeit += lngZeit;
//		System.out.println("Countdown.setRestZeit(long restZeit): " + lngRestZeit);
	}
	public void setRestZeit()
	{
		CountDownSetter myCountDownSetter = new CountDownSetter(lngRestZeit, lngMaxMilli);
		lngRestZeit = myCountDownSetter.getMillis();
	}
	public void set5MinSirene()												//falls vorher fünf Tore gefallen sind
	{
		sirene5Min = false;
//		System.out.println("CountDown.5MinSirene: " + sirene5Min);
	}
	public void checkSirene(long tempZeit)
	{
		if((tempZeit < lngSpielDauer/2) && (sirene5Min == true))			//Halbzeitsirene
		{
//			System.out.println("CountDown: löse Alarm aus bei " + tempZeit); //--> Zeit war negativ
			if(OMat.instanz.myMP3Thread != null) 
			{
				OMat.instanz.myMP3Thread.stop();
				OMat.instanz.myMP3Thread = new MP3Thread(srn5MinPfad, 100);
			}
			OMat.instanz.myMP3Thread.start();
			sirene5Min 	= false;
		}
		if((tempZeit < 0 * 60 * 1000) && (sireneEnde == true))				//Schlusssirene
		{
			if(OMat.instanz.myMP3Thread != null) 
			{
				OMat.instanz.myMP3Thread.stop();
				OMat.instanz.myMP3Thread = new MP3Thread(srnEndePfad, 100);
			}
			OMat.instanz.myMP3Thread.start();
			sireneEnde 	= false;
		}
	}
}