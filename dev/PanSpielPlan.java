package dev;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class PanSpielPlan extends JPanel implements MouseListener
{
	SystemOut	sout;
	static final long 		serialVersionUID 	= 31L;
    private 	PanSpiel	panSelected;

    DbAccess	myAccess 	= new DbAccess();
    ResultSet	myResultSet = null;
    String		strTurnierName;
    boolean		hasNext 	= false;

    public PanSpielPlan(String strTurnierName)
    {
    	this.strTurnierName = strTurnierName;
    	this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    	sout = new SystemOut();
    	myResultSet = myAccess.getSet("kc", strTurnierName + "_v_spl", "*", "true");
    	try
    	{
    		while(myResultSet.next())
    		{
    			PanSpiel mySpiel = new PanSpiel();
    			mySpiel.setSpiel(myResultSet);
    			mySpiel.addMouseListener(this);
    			this.add(mySpiel);
    		}
    	}
    	catch(SQLException ex)
    	{
    		sout.println(2, "PanSpielPlan.Konstruktor(" + strTurnierName + "): " + ex.toString());
    	}
    }
    public int refreshSet()
    {
    	myResultSet = myAccess.getSet("kc", strTurnierName + "_v_spl", "*", "true");	//ResultSet neu laden
    	try																				//Spiele dem Panel hinzufügen
    	{
    		while(myResultSet.next())
    		{
    			if(myResultSet.getString("X").equals("0"))								//nur ungespielte Spiele hinzufügen
    			{
    				PanSpiel mySpiel = new PanSpiel();
    				mySpiel.setSpiel(myResultSet);
    				mySpiel.addMouseListener(this);
    				this.add(mySpiel);
    			}
    		}
    	}
    	catch(SQLException ex)
    	{
    		sout.println(2, "PanSpielPlan.refreshSet(): " + ex.toString());
    	}
    	return Integer.parseInt(myAccess.selectCOUNT("kc", strTurnierName + "_spl", "SpielID", "X = 0"));
    }
    public void mouseClicked(MouseEvent e)
    {
    	PanSpiel source = (PanSpiel)(e.getSource());
    	if(!source.isEnabled())
    	{
    		return;
    	}
        if (panSelected != source)
        {
        	if (panSelected != null)
            { 
        		panSelected.setSelected(false);
            }
        	panSelected = source;
        	panSelected.setSelected(true);
        }
    	//Doppelklick abfangen
    	if (e.getClickCount() >= 2) 
    	{
    		sout.println(9, "PanSpielPlan.mouseClicked(): Doppelklick");
    		TestOMat.instanz.setSpiel();
    	}
    }
    public PanSpiel getSelectedSpiel()
    {
    	return panSelected;
    }
    public void selectNext()
    {
    	for(Component c: this.getComponents())
    	{
    		if(c instanceof PanSpiel)
    		{
        		PanSpiel s = (PanSpiel)(c);
				sout.println(9, "PanSpielPlan.selectNext(): intSpielID = " + s.getSpielID());
    			if(s.isEnabled())
    			{
    	        	if (panSelected != null)
    	            { 
    	        		panSelected.setSelected(false);
    	            }
    				s.setSelected(true);
    				panSelected = s;
    				hasNext = true;
    				break;
    			}
    			else
    			{
    				hasNext = false;
    			}
    		}
    	}
    	if(hasNext = false)
    	{
    		sout.println(4, "PanSpielPlan.selectNext(): kein weiteres Spiel gefunden!");
    	}
    }
    public PanSpiel getSpielByID(int intSpielID)
    {
    	for(Component c: this.getComponents())
    	{
    		if(c instanceof PanSpiel)
    		{
    			if(((PanSpiel)c).getSpielID() == intSpielID)
    			{
    				return (PanSpiel)c;
    			}
    		}
    	}
    	return null;
    }
    public void mouseEntered(MouseEvent e){}
    public void mouseExited(MouseEvent e){}
    public void mousePressed(MouseEvent e){}
    public void mouseReleased(MouseEvent e){}
}
