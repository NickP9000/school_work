package cardGame;
/*
 * This is the Card class.
 * Do not modify this file.
 */

public class Card {
	private int rank;
	private char suit;
	
	Card(int r, char s)
	{
		rank = r;
		suit = s;
	}

	public int getRank()
	{
		return rank;
	}
	
	public char getSuit()
	{
		return suit;
	}
}