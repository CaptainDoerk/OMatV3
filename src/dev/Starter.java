package dev;

public class Starter
{
	public static void main( String args[] )
	{
		int intDebugLvl = 7;
		System.out.println("Start..");
		OMatStarter myApp = new OMatStarter(intDebugLvl);
		myApp.init();
	}
}
