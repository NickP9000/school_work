package Calculator;



import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class Calculator extends Application 
{
	private Label label;
	private Button number0, number1, number2, number3, number4, number5, number6, number7, number8, number9, plus, minus, multiply, divide, clear, equals; 
	
	@Override
	public void start (Stage primaryStage)
	{
		label = new Label("");
		number0 = new Button("0");
		number0.setOnAction(new ButtonClickHandler());
		number1 = new Button("1");
		number1.setOnAction(new ButtonClickHandler());
		number2 = new Button("2");
		number2.setOnAction(new ButtonClickHandler());
		number3 = new Button("3");
		number3.setOnAction(new ButtonClickHandler());
		number4 = new Button("4");
		number4.setOnAction(new ButtonClickHandler());
		number5 = new Button("5");
		number5.setOnAction(new ButtonClickHandler());
		number6 = new Button("6");
		number6.setOnAction(new ButtonClickHandler());
		number7 = new Button("7");
		number7.setOnAction(new ButtonClickHandler());
		number8 = new Button("8");
		number8.setOnAction(new ButtonClickHandler());
		number9 = new Button("9");
		number9.setOnAction(new ButtonClickHandler());
		plus = new Button("+");
		plus.setOnAction(new ButtonClickHandler());
		minus = new Button("-");
		minus.setOnAction(new ButtonClickHandler());
		multiply = new Button("*");
		multiply.setOnAction(new ButtonClickHandler());
		divide = new Button("/");
		divide.setOnAction(new ButtonClickHandler());
		clear = new Button("C");
		clear.setOnAction(new ButtonClickHandler());
		equals = new Button("=");
		equals.setOnAction(new ButtonClickHandler());
		
		
		GridPane pane = new GridPane();
		pane.setHgap(5);
		pane.setVgap(10);
		pane.add(number1, 0, 0);
		pane.add(number2, 1, 0);
		pane.add(number3, 2, 0);
		pane.add(plus, 3, 0);
		pane.add(number4, 0, 1);
		pane.add(number5, 1, 1);
		pane.add(number6, 2, 1);
		pane.add(minus, 3, 1);
		pane.add(number7, 0, 2);
		pane.add(number8, 1, 2);
		pane.add(number9, 2, 2);
		pane.add(multiply, 3, 2);
		pane.add(clear, 0, 3);
		pane.add(number0, 1, 3);
		pane.add(equals, 2, 3);
		pane.add(divide, 3, 3);
		pane.setPadding(new Insets(20));
		
		VBox vbox = new VBox(10, label, pane);
		
		Scene scene = new Scene(vbox);
		primaryStage.setScene(scene);
		primaryStage.setTitle("Calculator");
		primaryStage.show();
		
		
	}
	
	class ButtonClickHandler implements EventHandler<ActionEvent>
	{
		public void handle(ActionEvent event)
		{
			String temp = label.getText();
			if (number0.isArmed())
				label.setText(temp+"0");
			if (number1.isArmed())
				label.setText(temp+"1");
			if (number2.isArmed())
				label.setText(temp+"2");
			if (number3.isArmed())
				label.setText(temp+"3");
			if (number4.isArmed())
				label.setText(temp+"4");
			if (number5.isArmed())
				label.setText(temp+"5");
			if (number6.isArmed())
				label.setText(temp+"6");
			if (number7.isArmed())
				label.setText(temp+"7");
			if (number8.isArmed())
				label.setText(temp+"8");
			if (number9.isArmed())
				label.setText(temp+"9");
			if (clear.isArmed())
				label.setText("");
			if (plus.isArmed())
				label.setText(temp+" + ");
			if (minus.isArmed())
				label.setText(temp+" - ");
			if (multiply.isArmed())
				label.setText(temp+" * ");
			if (divide.isArmed())
				label.setText(temp+" / ");
			if (equals.isArmed())
			{
				int answer = Integer.parseInt(temp);
				label.setText(""+answer);
			}
		}
	}
	
	public static void main(String[] args)
	{
		launch(args);
	}
}
