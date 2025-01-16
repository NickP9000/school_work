package application;
	
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.geometry.Pos;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;


public class Main extends Application {
	
	Label myLabel;
	
	public void start(Stage primaryStage)
	{
		myLabel = new Label("Click the button to have your social security number stolen.");
		Button myButton = new Button("Click Me");
		myButton.setOnAction(new ButtonClickHandler());
		VBox vbox = new VBox(10, myLabel, myButton);
		Scene scene = new Scene(vbox, 400, 100);
		vbox.setAlignment(Pos.CENTER);
		primaryStage.setScene(scene);
		primaryStage.setTitle("Button Demo");
		primaryStage.show();
	}
	
	class ButtonClickHandler implements EventHandler<ActionEvent>
	{
		public void handle(ActionEvent event)
		{
			myLabel.setText("Your social security number has been stolen!");
		}
	}
	
}
