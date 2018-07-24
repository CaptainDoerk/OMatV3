package stage_mysql;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

/**
 * @author Captain Doerk
 */
public class PanSpielPlan extends JPanel implements MouseListener
{
	SystemOut	sout;
	static final long 		serialVersionUID 	= 31L;
    private 	PanSpiel	panSelected;

    DbAccess	myAccess;
    ResultSet	myResultSet 	= null;
    int			intDebugLvl;
    String		strTurnierName;
    boolean		hasNext 		= false;

    public PanSpielPlan(int intDebugLvl, DbAccess myAccess, String strTurnierName)
    {
    	this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    	
    	this.intDebugLvl	= intDebugLvl;
    	this.myAccess		= myAccess;
    	this.strTurnierName = strTurnierName;
    	sout 				= new SystemOut(intDebugLvl);
    	myResultSet 		= myAccess.getSet(strTurnierName + "_spl", "*", "true");
    	try
    	{
    		int i = 0;
    		while(myResultSet.next())
    		{
    			i++;
    			sout.println(8, "PanSpielPlan(): i = " + i);
    			PanSpiel mySpiel = new PanSpiel(intDebugLvl, myAccess, strTurnierName);
    			mySpiel.setSpiel(myResultSet);
    			mySpiel.addMouseListener(this);
    			this.add(mySpiel);
    		}
    		sout.println(7, "PanSpielPlan(): Anzahl Spiele: " + i);
    		myAccess.update(strTurnierName + "_spl", "X = 1", "X = 0");							//Setze Status der hinzugefügten Spiele auf 1
    	}
    	catch(SQLException ex)
    	{
    		sout.println(1, "PanSpielPlan.Konstruktor(" + strTurnierName + "): " + ex.toString());
    	}
    }
    public int refreshSet()
    {
    	myResultSet = myAccess.getSet(strTurnierName + "_spl", "*", "X = 0");			//ResultSet neu laden
    	try																						//Spiele dem Panel hinzufügen
    	{
    		while(myResultSet.next())
    		{
   				PanSpiel mySpiel = new PanSpiel(intDebugLvl, myAccess, strTurnierName);
   				mySpiel.setSpiel(myResultSet);
   				mySpiel.addMouseListener(this);
   				this.add(mySpiel);
    		}
    		myAccess.update(strTurnierName + "_spl", "X = 1", "X = 0");							//Setze Status der hinzugefügten Spiele auf 1
    	}
    	catch(SQLException ex)
    	{
    		sout.println(1, "PanSpielPlan.refreshSet(): \n " + ex);
    	}
    	return Integer.parseInt(myAccess.selectCOUNT(strTurnierName + "_spl", "SpielID", "X = 1"));
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
    		sout.println(8, "PanSpielPlan.mouseClicked(): Doppelklick");
    		OMat.instanz.setSpiel();
    	}
    }
    public PanSpiel getSelectedSpiel()
    {
    	return panSelected;
    }
    public void selectNext()
    {
    	int i = 0;
    	for(Component c: this.getComponents())
    	{
    		i++;
    		sout.println(8, "PanSpielPlan.selectNext(): " + i);
    		if(c instanceof PanSpiel)
    		{
        		PanSpiel s = (PanSpiel)(c);
				sout.println(8, "PanSpielPlan.selectNext(): intSpielID = " + s.getSpielID());
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
   				hasNext = false;
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
    public void mouseEntered(MouseEvent e){ /** */ }
    public void mouseExited(MouseEvent e){ /** */ }
    public void mousePressed(MouseEvent e){ /** */ }
    public void mouseReleased(MouseEvent e){ /** */ }
}
