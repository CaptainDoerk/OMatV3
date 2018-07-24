package dev;

import javazoom.jl.player.advanced.*;
import javazoom.jl.decoder.*;
import java.io.*;

public class MP3Test
{
	public static void main(String[] args) throws FileNotFoundException, JavaLayerException 
	{
		AdvancedPlayer p = new AdvancedPlayer(new FileInputStream("D:/Musik/abba - dance.mp3"));
		p.play();
	}
}

