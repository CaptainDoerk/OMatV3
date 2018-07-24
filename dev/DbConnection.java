package dev;
import java.rmi.RemoteException;
//import java.rmi.server.UnicastRemoteObject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	/**
	 * @author 	captaindoerk
	 * @date 	02.12.2008
	 * Richtet Verbindung zur Datenbank ein
	 */
	private Connection 	connection = null;

	private String 		hostname;
	private String 		username;
	private String 		password;
	
	public DbConnection(String dbHostname, String dbUsername, String dbPassword) 
	{
		hostname	= dbHostname;
		username 	= dbUsername;
		password 	= dbPassword;
	}
	
	public Connection getConnection() 
	{
		if( connection == null ) 
		{
			try 
			{
				connection = openConnection();
			} 
			catch (Exception e) 
			{
				System.out.println("Datenbankverbindung konnte nicht aufgebaut werden." + "\n" + e.getMessage());
			}
		}
		return connection;
	}
	
	/**
	 * getConnection stellt bei jedem Aufruf eine Verbindung zur MySQL-Datenbank her.
	 * Dazu wird zuerst der MySQL-Treiber geladen und anschlie&szlig;end eine Verbindung zur
	 * Datenbank hergestellt, wof&uuml;r die bereitgestellten Daten benutzt werden.
	 * 
	 * @return Die erstellte Datenbankverbindung wird an die Aufrufende Methode zur&uuml;ckgegeben.
	 */
	public Connection openConnection() throws Exception 
	{
		final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
		
		String url = hostname;
		
		// Laden der Treiber
		try 
		{
			Class.forName(MYSQL_DRIVER).newInstance();
		} 
		catch (InstantiationException e) 
		{
			System.out.println("InstantiationException beim Laden der MySQL-Treiber" + "\n" + e.getMessage());
			throw new Exception("Fehler beim Laden des MySQL-Treibers");
		} 
		catch (IllegalAccessException e) 
		{
			System.out.println("IllegalAccessException beim Laden der MySQL-Treiber" + "\n" + e.getMessage());
			throw new Exception("Fehler beim Laden des MySQL-Treibers: Fehlende Rechte");
		} 
		catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException beim Laden der MySQL-Treiber" + "\n" + e.getMessage());
			throw new Exception("Fehler beim Laden des MySQL-Treibers: Treiber nicht gefunden");
		}
			
		// Baut eine Verbindung zur Datanbank auf
		try 
		{
			connection = DriverManager.getConnection(url, username, password);	
		} 
		catch (SQLException e) 
		{
			System.out.println("Fehler beim Verbinden zur Datenbank" + "\n" + e.getMessage());
			throw new Exception("Fehler beim Verbinden zur Datenbank");
		}
		return connection;
	}
		
	public void closeConnection() throws RemoteException 
	{
		try 
		{
			connection.close();
		} 
		catch (SQLException e) 
		{
			System.out.println("Fehler beim Schliessen der Datenbankverbindung" + "\n" + e.getMessage());
			throw new RemoteException("Datenbankverbindung konnte nicht geschlossen werden");
		}
	}
}
