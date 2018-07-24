package stage_mysql;

/**
 * @author Captain Doerk
 */
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
	public void print(String message)
	{
		print(4, message);
	}
	public void println(int msgLevel, String message)
	{
		if(msgLevel == 1)
		{
			System.err.println(msgLevel + ":" + message);
		}
		else if(msgLevel <= logLevel)
		{
			System.out.println(msgLevel + ":" + message);
		}
	}
	public void print(int msgLevel, String message)
	{
		if(msgLevel == 1)
		{
			System.err.print(msgLevel + ":" + message);
		}
		else if(msgLevel <= logLevel)
		{
			System.out.print(msgLevel + ":" + message);
		}
	}
}
