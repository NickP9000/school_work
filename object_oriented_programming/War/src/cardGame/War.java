/* Name: Nick Peters
 * Date: 03/14/22
 * Description: Plays the game of war with one player and one computer
 * Sources Cited: None
 */
package cardGame;

import java.io.IOException;

public class War {

	public static void main(String[] args)
	{
		System.out.println("Creating the deck...");
		Deck d = new Deck();
		
		System.out.println("Shuffling the deck...");
		d.shuffle();
		
		int p1_total_cards = 0;
		int com_total_cards = 0;
		//game of war begins
		while (!(d.isEmpty()))
		{
			//draw cards
			System.out.println("Press ENTER to draw a card");
			promptEnterKey();
			Card p1_card1 = d.draw();
			Card com_card1 = d.draw();
			
			System.out.println("Player One drew: " + p1_card1.getSuit() + ", " + p1_card1.getRank());
			System.out.println("Computer drew: " + com_card1.getSuit() + ", " + com_card1.getRank());
			
			if (p1_card1.getRank() > com_card1.getRank())//if player one's card is greater
			{
				System.out.println("Player One has a higher ranked card \nPlayer One wins the round");
				p1_total_cards+=2;
			}
			else if (p1_card1.getRank() < com_card1.getRank())//if the computer's card is greater
			{
				System.out.println("Computer has a higher ranked card \nComuper wins the round");
				com_total_cards+=2;
			}
			else//cards are equal
			{
				//draw 2 cards for both players
				System.out.println("Cards are equal rank, a WAR is started \nPress ENTER to draw two more cards");
				promptEnterKey();
				
				Card p1_card2;
				Card p1_card3;
				if (!d.isEmpty()) //check if deck is empty
				{
					p1_card2 = d.draw();
					p1_card3 = d.draw();
				}
				else break; //end loop if deck is empty
				
				Card com_card2;
				Card com_card3;
				if (!d.isEmpty()) //check if deck is empty
				{
					com_card2 = d.draw();
					com_card3 = d.draw();
				}
				else break;//end loop if deck is empty
				
				System.out.println("For the second card, Player One drew: " + p1_card2.getSuit() + ", " + p1_card2.getRank());
				System.out.println("For the second card, Computer drew: " + com_card2.getSuit() + ", " + com_card2.getRank());
				
				if (p1_card2.getRank() > com_card2.getRank())//if player one's second card is greater
				{
					System.out.println("Player One's second card has a higher rank \nPLayer One wins the WAR ");
					p1_total_cards+=4;
				}
				else if (p1_card2.getRank() < com_card2.getRank())//if computer's second card is greater
				{
					System.out.println("Computer's second card has a higher ranked card \nComuper wins the WAR");
					com_total_cards+=4;
				}
				else//both players' second cards are equal
				{
					System.out.println("For the third card, Player One drew: " + p1_card3.getSuit() + ", " + p1_card3.getRank());
					System.out.println("For the third card, Computer drew: " + com_card3.getSuit() + ", " + com_card3.getRank());
					
					if (p1_card3.getRank() > com_card3.getRank())//if player one's third card is greater
					{
						System.out.println("Player One's third card has a higher rank \nPLayer One wins the WAR ");
						p1_total_cards+=4;
					}
					else if (p1_card3.getRank() > com_card3.getRank())//if comuter's third card is greater
					{
						System.out.println("Computer's third card has a higher rank \nComputer wins the WAR ");
						com_total_cards+=4;
					}
					else//both players' third cards are equal
					{
						System.out.println("STALEMATE \nWAR ends with no victor");
						p1_total_cards+=2;
						com_total_cards+=2;
					}
				}
			}
		}
		
		if (p1_total_cards > com_total_cards)//if player one has more cards
		{
			System.out.println("Player One has more card\nPLAYER ONE WINS");
		}
		else if (p1_total_cards < com_total_cards)//if computer has more cards
		{
			System.out.println("Computer has more cards\nCOMPUTER WINS");
		}
		else System.out.println("Player One and Computer have the same amount of cards\nSTALEMATE");//if both players have the same amount of cards
		
	}
	
	public static void promptEnterKey()
	{
		try
		{
			System.in.read(new byte[2]);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

}
