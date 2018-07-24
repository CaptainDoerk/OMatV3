package dev;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;

public class HTMLWriter 
{
	FileWriter 	myFileWriter;
	File 		myFile;
	String		strFileName;
	String		strWorkDir;
	String		strTurnierName;
	String		ret;				//Carrier Return für strukturierte HTML-Seiten
	String		sep;				//Windows: \, Linux: / für Verzeichnisstruktur
	String		strText;
	int			intAnzGrupp;
	String		strCode;
	
	DbAccess	myAccess;
	ResultSet	myResultSet;
	int			intDebugLvl;

	public HTMLWriter(int intDebugLvl, String strTurnierName)
	{
		this.intDebugLvl	= intDebugLvl;
		this.strTurnierName = strTurnierName;
		
		//Pfade	
		strWorkDir  		= System.getProperty("user.dir");
		ret					= System.getProperty("line.separator");
		sep 				= File.separator;		
		myAccess			= new DbAccess(intDebugLvl);
//		myAccess.init();
		intAnzGrupp 		= Integer.parseInt(myAccess.select("__turniere", "AnzGrupp", "TurnierName = '" + strTurnierName + "'"));
		myResultSet			= null;

	}
	public String writeHeader(String strUhrZeit)
	{
		strText = "<html>" + ret +
			"<head>" + ret +
			"<link rel='stylesheet' type='text/css' href='../_css/style.css'>" + ret +
			"</head>" + ret +
			"<body>" + ret +
			"<table width='640px'><tr><th width='160px'>(" + strUhrZeit + ")</th><th width='160px'><a href='spielplan.html'>Spielplan</a></th>" ;
			for (int i=1; i<=intAnzGrupp; i++)
			{
				switch(i)
				{
					case 1: strText += "<th class='gr_a'><a href='gruppe_a.html'>A</a></th>"; break;
					case 2: strText += "<th class='gr_b'><a href='gruppe_b.html'>B</a></th>"; break;
					case 3: strText += "<th class='gr_c'><a href='gruppe_c.html'>C</a></th>"; break;
					case 4: strText += "<th class='gr_d'><a href='gruppe_d.html'>D</a></th>"; break;
					case 5: strText += "<th class='gr_e'><a href='gruppe_e.html'>E</a></th>"; break;
					case 6: strText += "<th class='gr_f'><a href='gruppe_f.html'>F</a></th>"; break;
					case 7: strText += "<th class='gr_g'><a href='gruppe_g.html'>G</a></th>"; break;
					case 8: strText += "<th class='gr_h'><a href='gruppe_h.html'>H</a></th>"; break;
				}
			}
			strText += "</tr></table>";
		return strText;
	}
	public void writeIndex()
	{
		writeIndex("[init]");
	}
	public void writeIndex(String strUhrZeit)
	{
		myFile = new File(strWorkDir + sep + "HTML" + sep + strTurnierName + sep + "index.html");
		try
		{
			myFileWriter = new FileWriter(myFile, false);
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		strText		= writeHeader(strUhrZeit);
		try
		{
			myFileWriter.write(strText);
			myFileWriter.flush();
			myFileWriter.close();
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}		
	}

	public void writeSpielPlan()
	{
		writeSpielPlan("[init]");
	}
	public void writeSpielPlan(String strUhrZeit)
	{
		myFile = new File(strWorkDir + sep + "HTML" + sep + strTurnierName + sep + "spielplan.html");
		try
		{
			myFileWriter = new FileWriter(myFile, false);
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		strText		= writeHeader(strUhrZeit);
		try 
		{
			strText		+= "<table width='640px'><tr><td><h1>Spielplan</h1></td></table>" ;
			strText		+= "<table width='640px'><tr>";
			strText		+= "<th width='5%'>ID</th>";
			strText		+= "<th width='5%'>Gr</th>";
			strText		+= "<th width='36%'>Team 1</th>";
			strText		+= "<th width='36%'>Team 2</th>";
			strText		+= "<th width='18%'>Tore</th>";
			strText		+= "</tr>" + ret;
			myResultSet = myAccess.getSet("v_" + strTurnierName + "_spl", "*", "true");
	    	try
	    	{
	    		while(myResultSet.next())
	    		{
	    			strCode = 				myResultSet.getString("X");		//abfragen, ob das Spiel schon gespielt wurde --> einfärben
	    			String strGrpp = 		myResultSet.getString("Gruppe");
	    			if(Integer.parseInt(strCode) == 0)
	    			{
    					strText += "<tr>";
    					strText	+= "<td class='gr_" + strGrpp + "'>" + myResultSet.getString("SpielID") + "</td>";
    					strText	+= "<td class='gr_" + strGrpp + "'>" + myResultSet.getString("Gruppe") + "</td>";
    					strText	+= "<td class='gr_" + strGrpp + "'>" + myResultSet.getString("Team1Nm") + "</td>";
    					strText	+= "<td class='gr_" + strGrpp + "'>" + myResultSet.getString("Team2Nm") + "</td>";
    					strText	+= "<td class='gr_" + strGrpp + "'>" + myResultSet.getString("Tore1") + " : " + myResultSet.getString("Tore2") + "</td>";
    					strText += "</tr>"+ ret;  				
	    			}
	    			if(Integer.parseInt(strCode) == 1)
	    			{
	    				strText += "<tr>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("SpielID") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Gruppe") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Team1Nm") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Team2Nm") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Tore1") + " : " + myResultSet.getString("Tore2") + "</td>";
	    				strText += "</tr>"+ ret;
	    			}
	    			if(Integer.parseInt(strCode) == 8)
	    			{
	    				strText += "<tr>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("SpielID") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Gruppe") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Team1Nm") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Team2Nm") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Tore1") + " : " + myResultSet.getString("Tore2") + "</td>";
	    				strText += "</tr>"+ ret;
	    			}
	    		}
			}
			catch(SQLException ex)
			{
				System.err.println("HTMLWriter.writeSpielPlan(" + strTurnierName + "): " + ex);
			}
			strText		+= "</body><tr></table></html>";
			
			myFileWriter.write(strText);
			myFileWriter.flush();
			myFileWriter.close();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}

	public void writeGruppe(String strGruppe)
	{
		writeGruppe(strGruppe, "[init]");
	}
	public void writeGruppe(String strGruppe, String strUhrZeit)
	{
		myFile = new File(strWorkDir + sep + "HTML" + sep + strTurnierName + sep + "gruppe_" + strGruppe + ".html");
		try
		{
			myFileWriter = new FileWriter(myFile, false);
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		strText		= writeHeader(strUhrZeit);
		try 
		{
			//Tabelle der Gruppe
			strText		+= "<table width='640px'><tr><td><h1>Gruppe " + strGruppe.toUpperCase() + "</h1></td></table>" ;
			strText		+= "<table width='640px'><tr>";
			strText		+= "<th class='gr_" + strGruppe + "' width='44%'>Team</th>";
			strText		+= "<th class='gr_" + strGruppe + "' width='6%'>Sp.</th>";
			strText		+= "<th class='gr_" + strGruppe + "' width='12%'>P</th>";
			strText		+= "<th class='gr_" + strGruppe + "' width='6%'>S</th>";
			strText		+= "<th class='gr_" + strGruppe + "' width='6%'>U</th>";
			strText		+= "<th class='gr_" + strGruppe + "' width='6%'>N</th>";
			strText		+= "<th class='gr_" + strGruppe + "' width='18%'>Tore</th>";
			strText		+= "</tr>" + ret;
			myResultSet = myAccess.getSet("v_" + strTurnierName + "_tbl", "*", "Gruppe = '" + strGruppe + "'");
	    	try
	    	{
	    		while(myResultSet.next())
	    		{
    				strText += "<tr>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("TeamName") + "</td>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("Spiele") + "</td>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("Punkte") + "</td>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("S") + "</td>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("U") + "</td>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("N") + "</td>";
    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("ToreP") + " : " + myResultSet.getString("ToreM") + "</td>";
	    			strText += "</tr>"+ ret;
	    		}
			}
			catch(SQLException ex)
			{
				System.err.println("HTMLWriter.writeGruppe(" + strTurnierName + ", Gruppe = " + strGruppe + "): " + ex);
			}
			strText		+= "</body><tr></table></html>";

			//Spiele der Gruppe 
			strText		+= "<table width='640px'><tr>";
			strText		+= "<th width='10%'>ID</th>";
			strText		+= "<th width='36%'>Team 1</th>";
			strText		+= "<th width='36%'>Team 2</th>";
			strText		+= "<th width='18%'>Tore</th>";
			strText		+= "</tr>" + ret;
			myResultSet = myAccess.getSet("v_" + strTurnierName + "_spl", "*", "Gruppe = '" + strGruppe + "'");
	    	try
	    	{
	    		while(myResultSet.next())
	    		{
    				strCode = 			myResultSet.getString("X");		//abfragen, ob das Spiel schon gespielt wurde --> einfärben
	    			if(Integer.parseInt(strCode) == 0)
	    			{
	    				strText += "<tr>";
	    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("SpielID") + "</td>";
	    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("Team1Nm") + "</td>";
	    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("Team2Nm") + "</td>";
	    				strText	+= "<td class='gr_" + strGruppe + "'>" + myResultSet.getString("Tore1") + " : " + myResultSet.getString("Tore2") + "</td>";
	    				strText += "</tr>"+ ret;
	    			}
	    			if(Integer.parseInt(strCode) == 1)
	    			{
	    				strText += "<tr>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("SpielID") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Team1Nm") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Team2Nm") + "</td>";
	    				strText	+= "<td class='active'>" + myResultSet.getString("Tore1") + " : " + myResultSet.getString("Tore2") + "</td>";
	    				strText += "</tr>"+ ret;
	    			}
	    			if(Integer.parseInt(strCode) == 8)
	    			{
	    				strText += "<tr>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("SpielID") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Team1Nm") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Team2Nm") + "</td>";
	    				strText	+= "<td class='played'>" + myResultSet.getString("Tore1") + " : " + myResultSet.getString("Tore2") + "</td>";
	    				strText += "</tr>"+ ret;
	    			}
	    		}
			}
			catch(SQLException ex)
			{
				System.err.println("HTMLWriter.writeSpielPlan(" + strTurnierName + "): " + ex);
			}
			strText		+= "</body><tr></table></html>";
			
			myFileWriter.write(strText);
			myFileWriter.flush();
			myFileWriter.close();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}		
	}
	
	public void writeAll()
	{
		writeAll("[init]");
	}
	public void writeAll(String strUhrZeit)
	{
		writeIndex(strUhrZeit);
		writeSpielPlan(strUhrZeit);
		writeGruppe("a", strUhrZeit);
		if(intAnzGrupp >= 2)	writeGruppe("b", strUhrZeit);
		if(intAnzGrupp >= 3)	writeGruppe("c", strUhrZeit);
		if(intAnzGrupp >= 4)	writeGruppe("d", strUhrZeit);
		if(intAnzGrupp >= 5)	writeGruppe("e", strUhrZeit);
		if(intAnzGrupp >= 6)	writeGruppe("f", strUhrZeit);
	}
}