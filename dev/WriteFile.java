package dev;

import java.io.*; 

public class WriteFile
{
	public static void main(String[] argv) 
	{ 
		String			nameAusgabedatei = "d:\\test"; 
		String			zeile, newline;
		File 			ausgabedatei; 
		FileWriter 		fw; 
		BufferedWriter 	bw; 

		newline = System.getProperty("line.separator"); 
		try 
		{ 
			ausgabedatei = new File(nameAusgabedatei+".html"); 
			fw = new FileWriter(ausgabedatei); 
			bw = new BufferedWriter(fw); 
			schreibeKopf(bw,newline,nameAusgabedatei); 
			schreibeFuss(bw,newline); 
			bw.close(); 
		} 
		catch (ArrayIndexOutOfBoundsException aioobe) 
		{ 
			System.out.println("Aufruf mit: java SchreibeDatei name"); 
			System.out.println("erzeugt eine Datei name.html"); 
		} 
		catch (IOException ioe) 
		{ 
			System.out.println("Habe gefangen: "+ioe); 
		} 
	}

	static void schreibeKopf(BufferedWriter bw, String newline, String code) 
		throws IOException 
	{ 
//    bw.write(""+newline); 

		bw.write("<html>" 		+ newline); 
		bw.write("<head>" 		+ newline); 
		bw.write("<title>"		+ newline); 
		bw.write("Listing von " + code + " " + newline); 
		bw.write("</title> " 	+ newline); 
		bw.write("</head> "		+ newline); 

		bw.write("<body>"		+ newline); 
		bw.write(" "			+ newline); 	
		bw.write("<hr>"			+ newline); 
		bw.write(" "			+ newline); 

		bw.write("<table border='0' width='100%'>" 					+ newline); 	
		bw.write("<tr>"			+ newline); 
		bw.write("<td>Java Quellcode</td> "							+ newline); 
		bw.write("<td><b><tt> " + code + ".java </tt></b></td>"		+ newline); 
		bw.write("</tr> "		+ newline); 
		bw.write("</table>"		+ newline); 
		bw.write(" "			+ newline); 

		bw.write("<table width='100%'> "+newline); 
		bw.write("<tr>"			+ newline); 
		bw.write("<td>"			+ newline); 
		bw.write("<pre>"+newline); 
	} 

	static void schreibeFuss(BufferedWriter bw, String newline) 
		throws IOException 
	{ 
		bw.write("</pre>" 			+ newline); 
		bw.write("</td>"			+ newline); 
		bw.write("</tr>"			+ newline); 
		bw.write("</table>"			+ newline); 
		bw.write(" "				+ newline); 
		bw.write("<hr>"				+ newline); 
		bw.write(" "				+ newline); 
		bw.write("</body>"			+ newline); 
		bw.write("</html>"			+ newline); 
	}

}
