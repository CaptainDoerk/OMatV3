package dev;

class DateThread   implements Runnable  
{
    public void run()  
    {
    	for ( int i = 0; i < 200; i++ )
    	System.out.println("DateThread " + i);
    }
}
