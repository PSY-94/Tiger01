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
		VBox root = new VBox(); // Vertical(����)
		root.setPrefSize(400, 300);
		
		Button btn1 = new Button("��ư1");
		root.getChildren().add( btn1 );
		Button btn2 = new Button("��ư2");
		root.getChildren().add( btn2 );
		
		btn1.setOnAction( new EventHandler<>() {
			public void handle(ActionEvent event) {
				System.out.println("�͸��Լ� �ɱ� ��Ƴ�.");
			}
		});
		btn2.setOnAction( new EventHandler<>() {
			public void handle(ActionEvent event) {
				System.out.println("�͸��Լ� ���� ���� �˰� ���⵵.. ������ 110��.");
			}
		});
		
		primaryStage.setScene(new Scene(root));
		primaryStage.show(); // ������ â�� ����ִ� ������ �Ѵ�.
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
		System.out.println("���� ����");
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
		
		Tiger t3 = new Tiger() { // �͸� Ŭ����
			public void f1() {
				System.out.println("���� ����");
			}
		};
		t3.f1();
		
		Dog dog = new Dog();
		dog.cry(new Lion());
		dog.cry(new Tiger() {
			public void f1() {
				System.out.println("������");
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
		VBox root = new VBox(); // Vertical(����)
		root.setPrefSize(400, 300);
		
		Scene s = new Scene(root);
		
		primaryStage.setScene(s);
		primaryStage.setTitle("ȣ����");
		primaryStage.show(); // ������ â�� ����ִ� ������ �Ѵ�.
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
		launch(); // �ݵ�� start �Լ��� ȣ���ϰ� �Ǿ� �ִ�.
		System.out.println("2");
	}

}
*/