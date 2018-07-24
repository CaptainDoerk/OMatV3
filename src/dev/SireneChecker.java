package dev;

public class SireneChecker 
{
	long 		atRestZeit;
	CountDown 	myCountDown;

	public SireneChecker(long atRestZeit, CountDown myCountDown)
	{
		this.atRestZeit = atRestZeit;
		this.myCountDown = myCountDown;
	}
	public void run()
	{
		myCountDown.getRestZeit();
	}
}
