import javafx.application.Application;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.stage.Stage;

public class GUITest extends Application {

	@Override
	public void start(Stage primaryStage) {
		RadioButton r1 = new RadioButton("A");
		RadioButton r2 = new RadioButton("B");
		RadioButton r3 = new RadioButton("C");
		
		ToggleGroup radioGroup = new ToggleGroup();
		r1.setToggleGroup(radioGroup);
		r2.setToggleGroup(radioGroup);
		r3.setToggleGroup(radioGroup);
		

	}
}
