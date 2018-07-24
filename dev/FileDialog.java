package dev;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;
import javax.swing.JFileChooser;

public class FileDialog 
{
	File f;
	String		sep 			= File.separator;

	public File oeffnen() 
	{
		final JFileChooser chooser = new JFileChooser("Verzeichnis wählen");
		chooser.setDialogType(JFileChooser.OPEN_DIALOG);
//		chooser.setDialogType(JFileChooser.DIRECTORIES_ONLY);

		chooser.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);

		/**
		 * todo: Folgefehler prüfen, falls nicht "/home" gesetzt
		 */
//    	chooser.setCurrentDirectory(new File("/home"));
    	chooser.setCurrentDirectory(new File(System.getProperty("user.dir")));
    	
		chooser.addPropertyChangeListener(new PropertyChangeListener() 
		{	
			public void propertyChange(PropertyChangeEvent e) 
			{
				if (e.getPropertyName().equals(JFileChooser.SELECTED_FILE_CHANGED_PROPERTY)
				 || e.getPropertyName().equals(JFileChooser.DIRECTORY_CHANGED_PROPERTY)) 
				{
					f = (File)e.getNewValue();
				}
			}
		});

		chooser.setVisible(true);
		chooser.showOpenDialog(null);
		chooser.setVisible(false);
//		System.out.println("FileDialog:  " + f);
		return f;
	}
	public File oeffnen(String strSubFolder) 
	{
		final JFileChooser chooser = new JFileChooser("Verzeichnis wählen");
		chooser.setDialogType(JFileChooser.OPEN_DIALOG);
		chooser.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
//		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
    	chooser.setCurrentDirectory(new File(System.getProperty("user.dir") + sep + strSubFolder + sep));
    	
		chooser.addPropertyChangeListener(new PropertyChangeListener() 
		{	
			public void propertyChange(PropertyChangeEvent e) 
			{
				if (e.getPropertyName().equals(JFileChooser.SELECTED_FILE_CHANGED_PROPERTY)
				 || e.getPropertyName().equals(JFileChooser.DIRECTORY_CHANGED_PROPERTY)) 
				{
					f = (File)e.getNewValue();
				}
			}
		});

		chooser.setVisible(true);
		chooser.showOpenDialog(null);
		chooser.setVisible(false);
//		System.out.println("FileDialog:  " + f);
		return f;
	}

}
