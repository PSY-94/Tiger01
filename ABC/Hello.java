package pack;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
/*
// 111
public class Hello extends Application {
	public void start(Stage primaryStage) throws Exception {
		VBox root = new VBox(); // Vertical(세로)
		root.setPrefSize(400, 300);
		
		Button btn1 = new Button("버튼1");
		root.getChildren().add( btn1 );
		Button btn2 = new Button("버튼2");
		root.getChildren().add( btn2 );
		
		btn1.setOnAction( new EventHandler<>() {
			public void handle(ActionEvent event) {
				System.out.println("익명함수 쪼금 어렵넹.");
			}
		});
		btn2.setOnAction( new EventHandler<>() {
			public void handle(ActionEvent event) {
				System.out.println("익명함수 이제 조금 알것 같기도.. 복습은 110번.");
			}
		});
		
		primaryStage.setScene(new Scene(root));
		primaryStage.show(); // 윈도우 창을 띄워주는 역할을 한다.
	}
	public static void main(String[] args) {
		launch();
		System.out.println("exit");
	}
}
*/
/*
//110
interface Tiger{
	void f1();
}
class Lion implements Tiger{
	public void f1() {
		System.out.println("나는 사자");
	}
}
class Dog{
	void cry(Tiger t) {
		t.f1();
	}
}
public class Hello  {
	public static void main(String[] args) {
		System.out.println("100");
		Lion t1 = new Lion();
		t1.f1();
		
		Tiger t2 = new Lion();
		t2.f1();
		
		Tiger t3 = new Tiger() { // 익명 클래스
			public void f1() {
				System.out.println("나도 사자");
			}
		};
		t3.f1();
		
		Dog dog = new Dog();
		dog.cry(new Lion());
		dog.cry(new Tiger() {
			public void f1() {
				System.out.println("찡찡찡");
			}
		});
	}
}
*/
/*
// 109
public class Hello extends Application {
	public void start(Stage primaryStage) throws Exception {
		System.out.println("2");
		VBox root = new VBox(); // Vertical(세로)
		root.setPrefSize(400, 300);
		
		Scene s = new Scene(root);
		
		primaryStage.setScene(s);
		primaryStage.setTitle("호랑이");
		primaryStage.show(); // 윈도우 창을 띄워주는 역할을 한다.
		System.out.println("3");
	}
	public static void main(String[] args) {
		System.out.println("1");
		launch();
		System.out.println("2");
	}
}
*/
/*
// 108
public class Hello extends Application {
	public void start(Stage primaryStage) throws Exception {
		System.out.println("3");
		primaryStage.show();
		System.out.println("4");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("1");
		launch(); // 반드시 start 함수를 호출하게 되어 있다.
		System.out.println("2");
	}

}
*/