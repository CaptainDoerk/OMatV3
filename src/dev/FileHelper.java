package dev;
import java.io.File;
import java.util.*;

/**
 * @author Captain Doerk
 */
public class FileHelper 
{
	File				myFilePath;
	String				myFileName;
	String[]			myFileNames;
	ArrayList <String>	myNames 	= new ArrayList<String>();
	String				myFileContent;
	String[]			myFileContents;
	String				myString;
	int					myLength;
	int					myLineCount;
	int					myLineIndex;
	int					myBeginIndex;
	int					myEndIndex;
		
	String				sep = File.separator;
	String 				myTempString;
	String 				mySpielPlan[] = new String[100];
	
	SystemOut			sout;
	/**
	 * Angabe eines Pfades liefert die Verzeichnisse und die Dateinamen zurück
	 * @param 	filePath
	 * @return 	myFileNames
	 */
	public String[] getFileNames(String filePath)
	{
		sout						= new SystemOut();
		myFilePath					= new File(filePath);
		File[] 		fileList 		= myFilePath.listFiles();
		int			intLength		= fileList.length;
		myFileNames					= new String[intLength];
		int i	= 0;

		sout.println("FileHelper.getFileNames([Suche in Pfad: " + filePath + "])");
		for(File f : fileList) 
		{
			myString = f.getName();
			myLength = myString.length();
			if(f.isDirectory())
			{
				myFileNames[i] = myString;
				i++;
			}
			else if(myString.substring(myLength - 4, myLength).equals(".txt"))
			{
				myFileNames[i] = myString.substring(0, myLength - 4);
				i++;
			}
			else if(myString.substring(myLength - 4, myLength).equals(".mp3"))
			{
				myFileNames[i] = myString;
				i++;
			}
			else if(myString.substring(myLength - 4, myLength).equals(".jpg"))
			{
				myFileNames[i] = myString;
				i++;
			}
			else if(myString.substring(myLength - 5, myLength).equals(".html"))
			{
				myFileNames[i] = myString;
				i++;
			}
		}
		return myFileNames;
	}	
	/**
	 * Öffnet ein Verzeichnis, das durch einen FileDialog
	 * ausgewählt werden kann. 
	 * 
	 * @return alle Ordner 
	 *     und txt-Dateien (ohne Endung),
	 *     und mp3-Dateien (mit  Endung), 
	 * die sich im ausgewählten Verzeichnis befinden
	 * ==> die Namen der Teams 
	 * ==> die Namen der MP3s
	 * @author captain doerk
	 */
	public ArrayList <String> openDir()
	{
		FileDialog 	myFileDialog 	= new FileDialog(); 
		myFilePath 					= myFileDialog.oeffnen();
		File[] 		fileList 		= myFilePath.listFiles();
		for(File f : fileList) 
		{
			myString = f.getName();
			myLength = myString.length();
			if(f.isDirectory())
			{
				myNames.add(myString);
			}
			else if(myString.substring(myLength - 4, myLength).equals(".txt"))
			{
				myNames.add(myString.substring(0, myLength - 4));
			}
			else if(myString.substring(myLength - 4, myLength).equals(".mp3"))
			{
				myNames.add(myString);
			}
		}
		return myNames;
	}	
	// TESTMETHODE
	/**
	 * Öffnet ein Verzeichnis. 
	 * 
	 * @return alle Ordner 
	 *     und txt-Dateien (ohne Endung),
	 *     und mp3-Dateien (mit  Endung), 
	 *     und jpg-Dateien (ohne Endung),
	 * die sich im ausgewählten Verzeichnis befinden
	 * ==> die Namen der Teams 
	 * ==> die Namen der MP3s
	 * ==> die Namen der Spieler
	 * @author captain doerk
	 */
	public ArrayList<String> openDir(File myFilePath)
	{
		File[] 		fileList 		= myFilePath.listFiles();
//		myNames						= new String[fileList.length];

		for(File f : fileList) 
		{
			myString = f.getName();
			myLength = myString.length();
			if(f.isDirectory())
			{
//				System.out.println(myString);
				myNames.add(myString);
			}
			else if(myString.substring(myLength - 4, myLength).equals(".txt"))
			{
//				System.out.println(myString.substring(0, myLength - 4));
				myNames.add(myString.substring(0, myLength - 4));
			}
			else if(myString.substring(myLength - 4, myLength).equals(".mp3"))
			{
				myNames.add(myString);
			}
		}
		return myNames;
	}	

	public ArrayList<String> getPortraits(File myFilePath)
	{
		File[] 		myFileList 		= myFilePath.listFiles();
		myNames.clear();
		try
		{	
			for(File f : myFileList)	
			{
				myString = f.getName();
				myLength = myString.length();
				if((!myString.equals("_Wappen.jpg"))							//Wenn nicht Wappen..
					&&(myString.substring(myLength - 4, myLength).equals(".jpg"))) 	//..aber .jpg Datei
				{
					myNames.add(myString.substring(0, myLength - 4));
				}
			}
		}
		catch(NullPointerException ex)
		{
			System.err.println("Keine Schützen gefunden..");
		}
		System.out.println(myNames);
		return myNames;
	}	

	/**
	 * Liefert einen über FileOpen-Dialog gesetzten Pfad zurück.
	 * @return myFilePath
	 * @author captain doerk
	 */
	public File getDir()
	{
		FileDialog 	myFileDialog 	= new FileDialog(); 
		myFilePath 					= myFileDialog.oeffnen();
		System.out.println("FileHelper.getDir(): " + myFilePath);
		return myFilePath;
	}

	/**
	 * Liefert einen über FileOpen-Dialog ausgewählten Dateinamen zurück.
	 * @return myFileName
	 * @author captain doerk
	 */
	public String getFileName(String strDirectory)
	{
		FileDialog 	myFileDialog 	= new FileDialog(); 
		myFilePath 					= myFileDialog.oeffnen(strDirectory);
//		System.out.println("FileHelper.getFileName(): " + myFilePath);
		return myFilePath.toString().substring(myFilePath.toString().lastIndexOf(sep)+1, myFilePath.toString().length());		
	}

	/**
	 * Gibt den Inhalt einer Datei in der Konsole aus 
	 * ==> als Testmethode, ob der Zugriff funktioniert.
	 * @author captain doerk
	 */
	public String openFile()
	{
		myFilePath = getDir();
		FileOpen myFileOpen = new FileOpen();
		try
		{
			myFileContent = myFileOpen.ReadFileContents(myFilePath.toString());
		}
		catch (Exception e)
		{
			System.err.println("Fehler in FileHelper.openFile() \t" + e);
		}		
//		System.out.println(myFileContent);
		return myFileContent;
	}
	
	/**
	 * Liefert nur die i-te Zeile eines Dateistroms zurück
	 * Trenner <br> --> evtl. als Übergabeparameter
	 * @param fileContent
	 * @param index
	 * @return lineIndexString
	 * @author captain doerk
	 */
	public void showLine(String fileContent, int lineIndex)
	{
		myFileContent 		= fileContent;
		myLineIndex			= lineIndex;
		myLineCount		 	= 1;

		//Übergebenen String nach Trennern durchsuchen
		for (int i=0; i<myFileContent.length()-4; i++)
		{
			if(myFileContent.substring(i, i+4).equalsIgnoreCase("<br>"))
			{
				System.out.println(i + " " + myFileContent.substring(i, i+8));
				myLineCount++;
				if(myLineCount == myLineIndex)
				{
					myBeginIndex = i+4;
					System.out.println("myBeginIndex: " + myBeginIndex);
				}
				if(myLineCount == myLineIndex + 1)
				{
					myEndIndex = i;
					System.out.println("myEndIndex: " + myEndIndex);
					break;
				}
			}
		}
		System.out.println(myLineIndex + ". Spiel: " + myFileContent.substring(myBeginIndex, myEndIndex));

//		System.out.println("myBeginIndex: " + i);
//		System.out.println("myEndIndex: " + i);
//		myString = myFileContent.substring(myBeginIndex, myEndIndex);
//		System.out.println(lineIndex + ". Zeile: " + myString);
	}
	
	/**
	 * Öffnet eine Datei
	 * @param myFileName
	 * @return myFileContent
	 * @author captain doerk
	 */
	public String openFile(String myFileName)
	{
		myFileName = this.myFilePath.toString();
		FileOpen myFileOpen = new FileOpen();
		try
		{
			myFileContent = myFileOpen.ReadFileContents(myFileName);
		}
		catch (Exception e)
		{
			System.err.println("Fehler in FileHelper.openFile() \t" + e);
		}		
//		System.out.println(myFileContent);
		return myFileContent;
	}

	/**
	 * wandelt ein Ã¼bergebenes .CSV-File in ein HTML-Format um.
	 * Dieses muss noch mit "<html><body><table>" erweitert werden.
	 * 
	 * @param myFilePath
	 */
	public String csvToHtml(String myString, int index)
	{
		//Datei-Stream in Array umwandeln
		int row   = 0;
		int begin = 0;
		int end   = 0;
//		System.out.println(myString.length());
		for (int i = 0; i < myString.length() - 4; i++)
		{
			if(myString.substring(i, i + 4).equalsIgnoreCase("<br>"))
			{
				end = i;
				myTempString = myString.substring(begin, end).replaceAll(";", "</td><td>");
				myTempString = "<tr><td>" + myTempString + "</td></tr>";
				myTempString = myTempString.replaceAll("<td>false</td>", "<td colspan=2>n/a</td>");
				mySpielPlan[row] = myTempString;
				row++;
				begin = i + 4;
			}
		}
		//letztes Spiel noch anfügen
		myTempString = myString.substring(begin, myString.length()).replaceAll(";", "</td><td>");	//ok
		myTempString = "<tr><td>" + myTempString + "</td></tr>";									//ok
		myTempString = myTempString.replaceAll("<td>false<br></td>", "<td colspan=2>n/a</td>");		//schlampig, aber ok
		mySpielPlan[row] = myTempString;
/*		for (int i = 0; i < mySpielPlan.length-1; i++)
		{
			if(mySpielPlan[i] != null)
				System.out.println(mySpielPlan[i]);
			else
				break;
		}
*/
		return mySpielPlan[index];
	}
}
