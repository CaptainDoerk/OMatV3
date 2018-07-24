package dev;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileWrite
{
	FileWriter myFileWriter;
	File myFile;
  
	public void create(String strFileName)
	{
		myFile = new File(strFileName + ".html");
	}
	public void write(String strText)
	{
		try 
		{
			myFileWriter = new FileWriter(myFile, true);
       
			// Text wird in den Stream geschrieben
			myFileWriter.write(strText);
       
			// Platformunabhängiger Zeilenumbruch wird in den Stream geschrieben
			myFileWriter.write(System.getProperty("line.separator"));

			myFileWriter.flush();
			myFileWriter.close();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
}