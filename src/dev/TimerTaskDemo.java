package dev;
import 	java.util.*;

public class TimerTaskDemo
{
	public static void main( String args[] )
	{
	    Timer timer = new Timer();
	    timer.scheduleAtFixedRate(new Task(), 0, 100 );
	}
}