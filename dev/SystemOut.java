package dev;

public class SystemOut
{
	int logLevel;
	public SystemOut()
	{
		logLevel = 4;
	}	
	public SystemOut(int logLevel)
	{
		this.logLevel = logLevel;
	}
	public void println(String message)
	{
		println(4, message);
	}
	public void println(int msgLevel, String message)
	{
		if(logLevel >= msgLevel)
		{
			System.out.println(msgLevel + ":" + message);
		}
	}
}
