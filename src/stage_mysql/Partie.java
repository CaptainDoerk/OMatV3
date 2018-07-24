package stage_mysql;

import java.util.ArrayList;
import java.util.List;

public class Partie {
	private List<String> team1 = new ArrayList<>();
	private List<String> team2 = new ArrayList<>();

	public List<String> getAllPlayers() 
	{
		List<String> players = new ArrayList<String>();
		players.addAll(team1);
		players.addAll(team2);
		return players;
	}

	public List<String> getTeam1() {
		return team1;
	}

	public void setTeam1(List<String> team1) 
	{
		this.team1 = team1;
	}

	public List<String> getTeam2() 
	{
		return team2;
	}

	public void setTeam2(List<String> team2) 
	{
		this.team2 = team2;
	}
}
