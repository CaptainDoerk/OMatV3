package dev;

import javax.swing.JButton;
import javax.swing.JList;

public class JCooleSucheBtn extends JButton {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JList names;
	
	public JCooleSucheBtn(String text, JList names) {
		super(text);
		this.setNames(names);
	}

	public void setNames(JList names) {
		this.names = names;
	}

	public JList getNames() {
		return names;
	}
	
	

}
