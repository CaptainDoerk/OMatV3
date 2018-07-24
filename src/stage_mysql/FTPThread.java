package stage_mysql;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
//import java.io.OutputStream;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
 
public class FTPThread extends Thread
{
	FTPClient	myFTPClient;
	FileHelper 	myHelper;
	String		sep 			= File.separator;
	SystemOut	sout;
	String 		strTurnierName;

	public FTPThread(int intDebugLvl, String strTurnierName)
	{
		this.strTurnierName = strTurnierName;
		myHelper 	= new FileHelper();
		myFTPClient = new FTPClient();
		sout		= new SystemOut(intDebugLvl);
	}
	public void run()
	{
		uploadToFTP(strTurnierName);
	}
	public void connectToFTP()
	{
		String 	server 	= "ftp.captaindoerk.de";	//TODO: Config lesen
		int 	port 	= 21;
		String 	user 	= "captaindoerk.de";
		String 	pass 	= "Turr1can0naD21878";
 
		try 
		{
			myFTPClient.connect(server, port);
			myFTPClient.login(user, pass);
			myFTPClient.enterLocalPassiveMode();
			myFTPClient.setFileType(FTP.BINARY_FILE_TYPE);
		}
        catch(IOException ex) 
        {
            ex.printStackTrace();
        }		
	}
	public void uploadToFTP(String strTurnierName) 
	{
		connectToFTP();
		File 	myLocalFile;
		String 	myRemotFile;
		String 	myFiles[] = myHelper.getFileNames("HTML" + sep + strTurnierName);

		for(int i=0; i<myFiles.length; i++)
		{
			//Upload mittels InputStream
			myLocalFile = new File("HTML" + sep + strTurnierName + sep + myFiles[i]);
			myRemotFile = new String("OMatV2/" + strTurnierName + "/" + myFiles[i]);
			try
			{
				InputStream inputStream = new FileInputStream(myLocalFile);
				sout.println(6, "Start Upload: " + myFiles[i]);
				boolean done = myFTPClient.storeFile(myRemotFile, inputStream);
				inputStream.close();
				if(done) 
				{
					sout.println(7, "Ende Upload:  " + myFiles[i]);
				}
			}
			catch(FileNotFoundException fnfex)
			{
				sout.println(1, "FTPUpload.uploadToFTP(1)\n: " + fnfex);
			}
			catch(IOException ioex)
			{
				sout.println(1, "FTPUpload.uploadToFTP(2):\n" + ioex);
			}
		}
		if (myFTPClient.isConnected()) 
		{
			try
			{
				myFTPClient.logout();
				myFTPClient.disconnect();
				sout.println(7, "FTP-Verbindung geschlossen");
			}
			catch(IOException ioex2)
			{
				sout.println(1, "FTPUpload.uploadToFTP(3):\n" + ioex2);				
			}
		}
    }
}