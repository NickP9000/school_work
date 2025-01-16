/* Name: Nick Peters
 * Date: 03/14/22
 * Description: A blueprint for a deck of cards. Primary function is for games that rely on drawing cards from the top of the deck.
 * Sources Cited: Random Class documentation
 */
package cardGame;

import java.util.Random;

public class Deck {
	private Card[] deck;
	private int top;
	
	public Deck()
	{
		deck = new Card[52];//deck with 52 cards
		for (int i = 0; i < 52; i+=13)
		{
			for (int j = 0; j < 13; j++)
			{
				if (i < 13) //cards 0-12
					deck[j] = new Card(j+2, 'H');
				else if (i < 26) //cards 13-25
					deck[i+j] = new Card(j+2, 'D');
				else if (i < 39) //cards 26-38
					deck[i+j] = new Card(j+2, 'S');
				else deck[i+j] = new Card(j+2, 'C'); //cards 39-51
			}
		}
		
		top = 0;//top of deck starts at 0
	}
	
	//uses random to randomly shuffle the cards
	public void shuffle()
	{
		Random num = new Random();
		for (int i = 0; i < 51; i++)
		{
			int r = num.nextInt(51);
			swap(i, r);
		}
	}
	
	//draws the top card
	public Card draw()
	{
		Card temp = deck[top];
		deck[top] = null; //remove card from deck
		if (top < 51)
			top++; //set new top of deck
		return temp;
	}
	
	//checks if the deck is empty by checking if the final card has been removed
	public boolean isEmpty()
	{
		if (deck[deck.length-1] == null) //checks if the last card has been removed
		{
			return true;
		}
		else return false;
	}
	
	//swaps two cards, used for the draw method
	private void swap(int i, int j)
	{
		Card temp = deck[i];
		deck[i] = deck[j];
		deck[j] = temp;
	}
	
}