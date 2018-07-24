package dev;
import java.io.File;
import javax.swing.*;

public class JChooser 
{
	String				strWorkDir;
	String				sep;
	JFileChooser		myJFileChooser;
	JFrame				myJCFrame;
	
	public JChooser()
	{
		strWorkDir 		= System.getProperty("user.dir");
		sep				= File.separator;
		myJCFrame 		= new JFrame();
	}
	public String choose(String strPath)
	{
		myJFileChooser 	= new JFileChooser(strWorkDir + sep + strPath);
		myJFileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		myJFileChooser.showOpenDialog(myJCFrame);
		int returnVal = 0;//myJFileChooser.showOpenDialog(myComp);
		System.out.println("1" + myJFileChooser.getFileSelectionMode());
		if(returnVal == JFileChooser.APPROVE_OPTION) 
		{
			return myJFileChooser.getSelectedFile().getName();
		}
		return "";
	}
}
