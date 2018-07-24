package stage_mysql;
import javax.swing.*;
import java.util.*;
import java.text.SimpleDateFormat;

/**
 * @author Captain Doerk
 */
public class Clock extends TimerTask
{
	JLabel 	myLabel;
	String 	myString;
	int    	inthrs, intmin, intsec;
	String 	strhrs, strmin, strsec;
	long	timeStamp;

	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	
	public Clock(JLabel myLabel) 
	{
		this.myLabel = myLabel;
	}
	public void run()
	{
		timeStamp = System.currentTimeMillis();
//		System.out.println(sdf.format(timeStamp));
		myLabel.setText(sdf.format(timeStamp));
	}
	public String getUhrZeit()
	{
		return sdf.format(timeStamp);
	}
}