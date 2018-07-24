package dev;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Arrays;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

public class JCooleSuche implements ActionListener, KeyListener {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JTextField txtSearch;
	private JList listAllGroups;
	private JLabel lGroup1;
	private JList listGroup1;
	
	private JLabel lGroup2;
	private JList listGroup2;
	
	private JLabel lGroup3;
	private JList listGroup3;
	
	private JLabel lGroup4;
	private JList listGroup4;
	
	private JLabel lGroup5;
	private JList listGroup5;
	
	private void init(Container pane) {
		txtSearch = new JTextField();
		txtSearch.setSize(500, 30);
		txtSearch.addKeyListener(this);
		Vector<String> names = new Vector<String>();
		listAllGroups = new JList(new DefaultListModel());
		for(int i = 0; i<29; i++) {
			names.add("Team" + i);
			((DefaultListModel)(listAllGroups.getModel())).add(i, "Team" + i);
		}
		
		lGroup1 = new JLabel("Group 1");
		lGroup2 = new JLabel("Group 2");
		lGroup3 = new JLabel("Group 3");
		lGroup4 = new JLabel("Group 4");
		lGroup5 = new JLabel("Group 5");
		DefaultListModel m1 = new DefaultListModel();
		DefaultListModel m2 = new DefaultListModel();
		DefaultListModel m3 = new DefaultListModel();
		DefaultListModel m4 = new DefaultListModel();
		DefaultListModel m5 = new DefaultListModel();
		
		listGroup1 = new JList(m1);
		listGroup2 = new JList(m2);
		listGroup3 = new JList(m3);
		listGroup4 = new JList(m4);
		listGroup5 = new JList(m5);
		
		JPanel p = new JPanel();
		p.setLayout(new BorderLayout());
		p.add(txtSearch, BorderLayout.NORTH);
		JScrollPane jSP = new JScrollPane(listAllGroups);
		jSP.setBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3));
		p.add(jSP, BorderLayout.CENTER);
		p.setSize(510,610);
		p.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
		
		JPanel p1 = new JPanel();
		p1.setLayout(new BorderLayout());
		JPanel box1 = new JPanel();
		box1.setLayout(new BoxLayout(box1, BoxLayout.X_AXIS));
		box1.add(lGroup1);
		JCooleSucheBtn b11 = new JCooleSucheBtn(">", listGroup1);
		b11.addActionListener(this);
		JCooleSucheBtn b12 = new JCooleSucheBtn("<", listGroup1);
		b12.addActionListener(this);
		box1.add(b11);
		box1.add(b12);
		p1.add(box1, BorderLayout.NORTH);
		JScrollPane jSP1 = new JScrollPane(listGroup1);
		jSP1.setBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3));
		p1.add(jSP1, BorderLayout.CENTER);
		
		JPanel p2 = new JPanel();
		p2.setLayout(new BorderLayout());
		p2.add(lGroup2, BorderLayout.NORTH);
		JScrollPane jSP2 = new JScrollPane(listGroup2);
		jSP2.setBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3));
		p2.add(jSP2, BorderLayout.CENTER);
		
		JPanel p3 = new JPanel();
		p3.setLayout(new BorderLayout());
		p3.add(lGroup3, BorderLayout.NORTH);
		JScrollPane jSP3 = new JScrollPane(listGroup3);
		jSP3.setBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3));
		p3.add(jSP3, BorderLayout.CENTER);
		
		JPanel p4 = new JPanel();
		p4.setLayout(new BorderLayout());
		p4.add(lGroup4, BorderLayout.NORTH);
		JScrollPane jSP4 = new JScrollPane(listGroup4);
		jSP4.setBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3));
		p4.add(jSP4, BorderLayout.CENTER);
		
		JPanel p5 = new JPanel();
		p5.setLayout(new BorderLayout());
		p5.add(lGroup5, BorderLayout.NORTH);
		JScrollPane jSP5 = new JScrollPane(listGroup5);
		jSP5.setBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3));
		p5.add(jSP5, BorderLayout.CENTER);
		
		JPanel pRight = new JPanel();
		pRight.setLayout(new BoxLayout(pRight, BoxLayout.Y_AXIS));
		pRight.add(p1);
		pRight.add(p2);
		pRight.add(p3);
		pRight.add(p4);
		pRight.add(p5);
		pRight.add(Box.createVerticalGlue());
		
		JPanel main = new JPanel();
		main.setLayout(new BoxLayout(main, BoxLayout.X_AXIS));
		p.setBounds(5, 5, 300, 500);
		main.add(p);
		main.add(Box.createRigidArea(new Dimension(3,3)));
		main.add(Box.createHorizontalGlue());
		main.add(Box.createRigidArea(new Dimension(3,3)));
		main.add(pRight, BorderLayout.CENTER);
		main.setSize(600,600);
		
		pane.add(main);
		pane.setSize(600, 600);
	}

    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event-dispatching thread.
     */
    private static void createAndShowGUI() {
    	new JCooleSuche();
    }

    public JCooleSuche() {
        //Create and set up the window.
        JFrame frame = new JFrame("Coole Suche");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 600);
        //Set up the content pane.
        init(frame.getContentPane());

        //Display the window.
        //frame.pack();
        frame.setVisible(true);
    }
    
    public static void main(String[] args) {
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
    }

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() instanceof JCooleSucheBtn) {
			JCooleSucheBtn btn = (JCooleSucheBtn)e.getSource();
			if (btn.getText().equals(">")) {
				if (listAllGroups.getSelectedValues() != null) {
					// add name to group
					int pos = btn.getNames().getModel().getSize();
					
					for(int i = 0; i < listAllGroups.getSelectedValues().length; i++) {
						((DefaultListModel)(btn.getNames().getModel())).add(pos+i, listAllGroups.getSelectedValues()[i]);
					}
					
					DefaultListModel m2 = (DefaultListModel)(listAllGroups.getModel()); 					
					// remove label from list of all groups
					Object[] n = listAllGroups.getSelectedValues();
					for (int i = 0; i< n.length; i++) {
						m2.removeElement(n[i]);
					}
				}
			} else {
				// remove name from group
				if (btn.getNames().getSelectedValues() != null) {
					// add name to list of all groups
					int pos = listAllGroups.getModel().getSize();
					for(int i = 0; i < btn.getNames().getSelectedValues().length; i++) {
						((DefaultListModel)(listAllGroups.getModel())).add(pos+i, btn.getNames().getSelectedValues()[i]);
					}
					
					DefaultListModel m2 = (DefaultListModel)(btn.getNames().getModel()); 					
					// remove label from list of all groups
					Object[] n = btn.getNames().getSelectedValues();
					for (int i = 0; i< n.length; i++) {
						m2.removeElement(n[i]);
					}
				}
			}
			sortGroupList();
		}
	}

	public void sortGroupList() {
		Object[] s = ((DefaultListModel)listAllGroups.getModel()).toArray();  
		Arrays.sort(s);
		((DefaultListModel)listAllGroups.getModel()).removeAllElements();
		for(int i = 0; i<s.length;i++) {
			((DefaultListModel)listAllGroups.getModel()).add(i, s[i]);
		}
	}
	@Override
	public void keyPressed(KeyEvent e) {
		if (e.getSource().equals(txtSearch)) {
			String searchText = ((JTextField)e.getSource()).getText();
			useSQLFilter(searchText);
		}
	}
	
	@Override
	public void keyReleased(KeyEvent e) {
		if (e.getSource().equals(txtSearch)) {
			String searchText = ((JTextField)e.getSource()).getText();
			useSQLFilter(searchText);
		}
	}

	@Override
	public void keyTyped(KeyEvent e) {
		if (e.getSource().equals(txtSearch)) {
			String searchText = ((JTextField)e.getSource()).getText();
			useSQLFilter(searchText);
		}
	}
	
	public void useSQLFilter(String searchText) {
		Object[] s;  
		
		if (searchText != "") {
			// get all names like searchText sorted
			s = null;  // TODO fill in SQL result here ... // = ((DefaultListModel)listAllGroups.getModel()).toArray();
		} else {
			s = null; // TODO get All names!
		}
		((DefaultListModel)listAllGroups.getModel()).removeAllElements();
		for(int i = 0; i<s.length;i++) {
			((DefaultListModel)listAllGroups.getModel()).add(i, s[i]);
		}
	}
}
