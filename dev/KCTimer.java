package dev;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Timer;

public class KCTimer implements Runnable
{
	final Timer 	timer = new Timer();
	private String 	strhh, strmm, strss;
//	private String  uhrZeit = "";

	private int hh;
	private int mm;
	private int ss;
	
	public KCTimer()
	{
		GregorianCalendar cal = new GregorianCalendar();
		hh = cal.get(Calendar.HOUR_OF_DAY);
		mm = cal.get(Calendar.MINUTE);
		ss = cal.get(Calendar.SECOND);
//		int chk = 0;
		strhh  = String.valueOf(hh);
		strmm  = String.valueOf(mm);
		strss  = String.valueOf(ss);
	}
	public void run()
	{
		for (int i=1; i<5; i++)
		{
			getUhrzeit();
		}
	}
	public void getUhrzeit()  
    {
		if (hh < 10)
		{
			strhh = "0" + strhh;
		}
		if (mm < 10)
		{
			strmm = "0" + strmm;
		}
		if (ss < 10)
		{
			strss = "0" + strss;
		}
//		chk = ss;
		System.out.println(strhh + ":" + strmm + ":" + strss);
//		uhrZeit = strhh + ":" + strmm + ":" + strss;

//		return uhrZeit;
	}
}
