package dev;

import javax.swing.*;

import java.awt.*;
import java.util.*;

public class Penalty extends TimerTask
{
	//Hauptattribute
	long 			lngRestZeit, 	lngTempZeit, 	lngMaxMilli, 	lngGespielt, 	lngTempZeit2;
	//Helper		
	long 			startTime, 		endTime, 		currentTime;
	String			strRestZeit,	strGespielt;
	boolean 		stopped;
	JLabel 			myLabel, 		myLabel2;
	long			lngSpielDauer = 0;
	boolean			sirene;
	String			strDauer;
	
	public Penalty(JLabel myLabel, JLabel myLabel2) 
	{
		this.myLabel 		= myLabel;
		this.myLabel2		= myLabel2;
		startTime 			= 0;
		endTime   			= 0;
		lngRestZeit  		= lngSpielDauer;
		lngGespielt			= 0;
		strRestZeit			= "";
		strGespielt			= "";
		lngTempZeit  		= 0;
		stopped				= true;
		sirene				= true;		//true = sirene noch nicht abgespielt
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
		getRestZeit();
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
		}
		return getRestZeit(lngRestZeit);
	}
	public long getRestZeitMillis()
	{
		return lngRestZeit;
	}
	public String getGespielt()
	{
		System.out.println(lngTempZeit2);
		strGespielt = "";
		//Aufbereitung Minuten
		if(lngTempZeit2 > 60000)										// 1 Min. und mehr
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
		else if(lngTempZeit2 % 60000 / 1000 >= 0)						// 1 Sek. und mehr
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
	public String setRestZeit(long RestZeit)		//Strafen setzen
	{
		this.lngRestZeit = RestZeit;
		System.out.println("Penalty.setRestZeit(" + lngRestZeit + ")");
		return getRestZeit(lngRestZeit);
	}
	public String enlRestZeit(long EnlgZeit)		//Strafen erweitern
	{
		this.lngRestZeit += EnlgZeit;
		System.out.println("Penalty.enlRestZeit(" + lngRestZeit + ")");
		return getRestZeit(lngRestZeit);
	}
	public void setRestZeit()
	{
		CountDownSetter myCountDownSetter = new CountDownSetter(lngRestZeit, lngMaxMilli);
		lngRestZeit = myCountDownSetter.getMillis();
	}
	public void checkSirene(long tempZeit)
	{
		if((tempZeit == 0) && (sirene == true))
		{
			TestOMat.instanz.myMP3Thread.start();
			sirene	 	= false;
			myLabel.setBackground(Color.red);
		}
	}
}