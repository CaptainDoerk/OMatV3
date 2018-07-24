package dev;

import java.util.*;

public class Uhr extends TimerTask
				 implements Runnable
{
	final Timer 	timer = new Timer();
	private String 	strhh, strmm, strss;
	public void run() 
	{
		if(true)
		{
		}	
//		else
//		{
//			timer.cancel();
//		}
	}
	public String getTime()
	{
		GregorianCalendar cal = new GregorianCalendar();
		int hh = cal.get(Calendar.HOUR_OF_DAY);
		int mm = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		strhh  = String.valueOf(hh);
		strmm  = String.valueOf(mm);
		strss  = String.valueOf(ss);
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
		return strhh + ":" + strmm + ":" + strss;
	}
}
