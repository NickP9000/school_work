/* Name: Nick Peters
 * Date: 4/15/22
 * Description: makes a visual representation of a VendingMachine object with interactable elements
 * Sources Cited: none
 */
package application;
	
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;


public class VendingMachineGUI extends Application {
	private Button snickersButton, twixButton, reesesButton;
	private VendingMachine iVend;
	private Label label; //main label
	private int cents; //used for tracking the amount of cents in the machine and displaying it for the customer
	private String key = "*6374"; //key used for accessing the getProfits method
	
	@Override
	public void start(Stage primaryStage) {
		
		iVend = new VendingMachine(2,1,5); 
		
		label = new Label("Welcome to iVend! \nInput cents or make a selection to start."); //initial message on the main label
		label.setPadding(new Insets(20));
		
		String part1 = "Credit in the machine: "; //a phrase used in multiple areas
		Label creditLabel = new Label(part1 + "0¢"); //initially, there is no credit in the machine
		creditLabel.setPadding(new Insets(20));
		
		
		//buttons for choosing snickers, twix, or reeses; no lambda expressions because of the same exception they can all generate
		snickersButton = new Button("Snickers: 100¢");
		snickersButton.setOnAction(new selectionButton());
		twixButton = new Button("Twix: 115¢");
		twixButton.setOnAction(new selectionButton());
		reesesButton = new Button("Reeses: 130¢");
		reesesButton.setOnAction(new selectionButton());
		
		
		//this vending machine uses a text field and button combo for the user to insert cents into the machine
		TextField centsTextField = new TextField();
		Button insertButton = new Button("Insert cents");
		HBox hbox = new HBox(10, insertButton, centsTextField);
		
		/* when the insertButton is pressed, it reads string information from the text field and converts it
		 * into int values to pass to the insertCents method.
		 */
		insertButton.setOnAction(event ->
		{
			try {
				if (Integer.parseInt(centsTextField.getText()) > 0)
				{
					iVend.insertCents(Integer.parseInt(centsTextField.getText()));
					cents += Integer.parseInt(centsTextField.getText());
					creditLabel.setText(part1 + cents + "¢"); //update with the current amount of cents in the machine
				}
				//Inform the customer the error of trying to insert negative cents into the machine
				else label.setText("Error: Cents must be input as positive integer values");
			}
			//display the message when an ImproperCoinsException is thrown
			catch (ImproperCoinsException e) {
				label.setText(e.getMessage());
			}
			/* If the customer tries to press the button with a word or sentence in the text field, it will
			 * catch the resulting error and change the main label to inform the customer of their error.
			 * This also occurs if the customer tries to insert a double value.
			 */
			catch(NumberFormatException e) {
				label.setText("Error: Cents must be input as positive integer values");
			}
		});
		
		/* If the purchase button is pressed, it uses the purchaseSelection method, storing the change.
		 * creditLabel is set to facilitate the return of the change.
		 * Lastly, cents and label are returned to their original values to reset the machine for
		 * the next customer.
		 */
		Button purchase = new Button("Purchase");
		purchase.setOnAction(event ->
		{
			try {
				int change = iVend.purchaseSelection();
				creditLabel.setText("Transaction completed\nChange: " + change + "¢");
				cents = 0;
				label.setText("Welcome to iVend! \nInput cents or make a selection to start.");
			}
			//inform the customer the error of trying to purchase without selecting or trying to purchase without inserting sufficient cents
			catch(ImproperPurchaseException e) {
				label.setText(e.getMessage());
			}
		});
		
		/* This function is used for returning cents to the customer if they decide not to purchase an item.
		 * I have also decided to use it for any functions that may need to be hidden from the customer
		 * such as the getProfits method.
		 */
		Button returnUCents = new Button("Return Unpsent Coins");
		returnUCents.setOnAction(event-> 
		{	
			if (cents != 0)
			{
				//return unspent cents and reset the machine for the next customer
				int change = iVend.returnUnspentCents();
				creditLabel.setText("Transaction completed\nChange: " + change);
				cents = 0;
				label.setText("Welcome to iVend! \nInput cents or make a selection to start.");
			}
			//if there are no credits in the machine, the user can input the key to use the getProfits function
			else if (centsTextField.getText().equals(key))
			{
				label.setText("Profit: " + iVend.getProfits());
			}
		});
		
		//All buttons are connected to the same gridpane. As a design choice, elements for
		//inserting cents/purchasing are on the right while the buttons for choosing an item are on the left
		GridPane pane = new GridPane();
		pane.setHgap(10);
		pane.setVgap(10);
		pane.add(snickersButton, 0, 0);
		pane.add(twixButton, 0, 1);
		pane.add(reesesButton, 0, 2);
		pane.add(purchase, 10, 0);
		pane.add(hbox, 10, 1);
		pane.add(returnUCents, 10, 2);
		pane.setPadding(new Insets(20));
		
		VBox vbox = new VBox(5, label, creditLabel, pane);
		
		Scene scene = new Scene(vbox, 500, 300);
		primaryStage.setScene(scene);
		primaryStage.setTitle("iVend");
		primaryStage.show();
		
		
	}

	//this class is used for the buttons snickers, twix, and reeses
	class selectionButton implements EventHandler<ActionEvent>
	{
		public void handle(ActionEvent event)
		{
			try
			{
				//check which button was pressed and change the label and use makeSelection accordingly
				if (snickersButton.isArmed())
				{
					iVend.makeSelection(0);
					label.setText("Selection: Snickers 100¢\nInsert sufficient cents and then press the purchase button");
				}
				if(twixButton.isArmed())
				{
					iVend.makeSelection(1);
					label.setText("Selection: Twix 115¢\nInsert sufficient cents and then press the purchase button");
				}
				if(reesesButton.isArmed())
				{
					iVend.makeSelection(2);
					label.setText("Selection: Reeses 130¢\nInsert sufficient cents and then press the purchase button");
				}
			}
			/* Not possible for the argument passed to makeSelection to throw the exception due to controlled nature.
			 * The exception is still thrown when one of the snacks runs out of stock.
			 */
			catch(ImproperSelectionException e)
			{
				label.setText(e.getMessage());
			}
		}
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
