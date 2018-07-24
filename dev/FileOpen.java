package dev;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class FileOpen
{
	public String ReadFileContents(String sFileName) throws Exception 
	{
		String sFileContent = "";
		try 
		{
			FileInputStream inFile = new FileInputStream(sFileName);
			BufferedReader inData = new BufferedReader(new InputStreamReader(inFile));
			
			if (inData.ready()) 
			{
				sFileContent = inData.readLine();
				sFileContent += "<br>";

				while (inData.ready()) 
				{
					sFileContent += inData.readLine();
					sFileContent += "<br>";
				}
				inData.close();
				inFile.close();
			} 
			else 
			{
				throw new Exception("Problem reading File");
			}
		}
		catch (Exception ex) 
		{
			throw new Exception("Problem reading File, \n" + ex.getMessage());
		}
		return sFileContent;
	}
}