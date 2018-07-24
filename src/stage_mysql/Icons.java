package stage_mysql;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 * @author Captain Doerk
 */
public class Icons 
{
	ImageIcon			myIcon;
	InputStream			myInputStream;
	BufferedImage		myBufferedImage;

	String				strWorkDir  		= System.getProperty("user.dir");
	String				sep 				= File.separator;
	String				strTeamPfad			= strWorkDir + sep + "Portraits" + sep;
	String				strDeflPfad			= strWorkDir + sep + "_default" + sep + "default.jpg";

	public ImageIcon getIcon(ResultSet myResultSet)
	{
		try 
		{
			myInputStream 			= myResultSet.getBinaryStream("Wappen40");
			if(myInputStream != null)
			{
				myBufferedImage 	= ImageIO.read(myInputStream);
				myIcon 				= new ImageIcon(myBufferedImage);
			}
			else
			{
				myIcon		 		= new ImageIcon(strDeflPfad);
			}
		}
		catch (IOException e) 
		{
			System.err.println("Icons.getIcon: IOException: " + e);
		}
		catch (SQLException ex)
		{
			System.err.println("Icons.getIcon: SQLException: " + ex);
		}
		return myIcon;
	}
	public ImageIcon getIcon(InputStream myInputStream)
	{
		try 
		{
			if(myInputStream != null)
			{
				myBufferedImage 	= ImageIO.read(myInputStream);
				myIcon 				= new ImageIcon(myBufferedImage);
			}
			else
			{
				myIcon		 		= new ImageIcon(strDeflPfad);
			}
		}
		catch (IOException e) 
		{
			System.err.println("Icons.getIcon: IOException: " + e);
		}
		return myIcon;
	}
	//ohne Größenangabe wird das Bild auf den Standardwert von 100x100 Pixeln skaliert
	public ImageIcon getIcon(String strTeamName, String strFileName)
	{
		myIcon = getIcon(strTeamName, strFileName, 100);
		return myIcon;
	}	
	//mit Größenangabe wird das Bild auf den angegebenen Wert skaliert
	public ImageIcon getIcon(String strTeamName, String strFileName, int intSize)
	{
		if(strTeamName != null)
		{
			myIcon 			= new ImageIcon(strTeamPfad + strFileName + ".jpg");
			System.out.println(strTeamPfad + strFileName + ".jpg");
		}
		else
		{
			myIcon				= new ImageIcon(strDeflPfad);
			System.out.println(strDeflPfad);
		}
        myIcon.setImage(myIcon.getImage().getScaledInstance(intSize, intSize, Image.SCALE_SMOOTH)); 
		return myIcon;
	}
	public Icon getIcon(String strSpieler) 
	{
		if(strSpieler != null)
		{
			myIcon 			= new ImageIcon(strTeamPfad + strSpieler + ".jpg");
//			System.out.println(strTeamPfad + string + ".jpg");
		}
		else
		{
			myIcon			= new ImageIcon(strDeflPfad);
			System.out.println(strDeflPfad);
		}
		return myIcon;	
	}
	public Icon getIcon(String strSpieler, int size) 
	{
		if(strSpieler != null)
		{
			myIcon 			= new ImageIcon(strTeamPfad + strSpieler + ".jpg");
		}
		else
		{
			myIcon			= new ImageIcon(strDeflPfad);
			System.out.println(strDeflPfad);
		}
        myIcon.setImage(myIcon.getImage().getScaledInstance(size, size, Image.SCALE_SMOOTH)); 
		return myIcon;	
	}
}
