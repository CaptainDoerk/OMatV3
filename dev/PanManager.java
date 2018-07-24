package dev;

import java.util.HashMap;

public class PanManager 
{
	public static PanManager instance;
	
	private PanSpielPlan 				panSpielPlan;
	private HashMap<String, PanGruppe> 	panGruppen;
	private PanSchuetzen				panSchuetzen;
	
	private PanManager()
	{	
		panGruppen = new HashMap<String, PanGruppe>();
	}
	
	/**
	 * Singleton Pattern
	 * @return
	 */
	public static PanManager getInstance() 
	{
		if (instance == null) 
		{
			instance = new PanManager();
		}
		return instance;
	}
	
	/**
	 * SpielPlan
	 */
	public void setSpielPlan(PanSpielPlan mySpielPlan) 
	{
		panSpielPlan = mySpielPlan;
	}
	public PanSpielPlan getSpielPlan() 
	{
		return panSpielPlan;
	}
	/*
	 * NEU
	 */
	public int refreshSet()
	{
		return panSpielPlan.refreshSet();
	}
	public String[] getGruppen()
	{
		String[] gruppen = new String[panGruppen.size()];
		int index = 0;
		
		for (String key : panGruppen.keySet())
		{
			gruppen[index] = key;
			index++;
		}
		return gruppen;
	}
	
	/**
	 * Gruppen
	 */
	public void addGruppe(String strGruppe, PanGruppe panGruppe) 
	{
		panGruppen.put(strGruppe, panGruppe);
	}
	public PanGruppe getGruppe(String strGruppe) 
	{
		return panGruppen.get(strGruppe);
	}
	
	public void setSchuetzen(PanSchuetzen mySchuetzen)
	{
		panSchuetzen = mySchuetzen;
	}
	
	public PanSchuetzen getSchuetzen()
	{
		return panSchuetzen;
	}

}
