package dev;
import java.util.*;

public class Task extends TimerTask
{
	private String strhh, strmm, strss;
	private int chk;

	public void run()  
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
		if (ss == 0)
		{
			strss = "00";
		}
		else if (ss < 10)
		{
			strss = "0" + strss;
		}
		if(ss > chk || ss == 0)
		{
			chk = ss;
			System.out.println(strhh + ":" + strmm + ":" + strss);
		}
	}
}
