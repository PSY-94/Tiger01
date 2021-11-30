package pack;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Scanner;

public class Client extends Application{
	Socket cs;
	public void start(Stage primaryStage) throws Exception{
		VBox root = new VBox();
		root.setPrefSize(400, 300);
		
		Button btn1 = new Button("����");
		btn1.setOnAction(new EventHandler<>() {
			@Override
			public void handle(ActionEvent event) {
				try {
					cs = new Socket();
					cs.connect(new InetSocketAddress("localhost", 5001));
				} catch (Exception e) {

				}

			}
		});
		
		Button btn2 = new Button("������ ����");
		btn2.setOnAction(new EventHandler<>() {
			int ct = 0;
			@Override
			public void handle(ActionEvent event) {
				try {
					OutputStream os = cs.getOutputStream();
					byte[]data; //�迭
					String s = "apple" + ct++;
					data = s.getBytes("UTF-8");
					os.write(data); // ������ ������ �Ͼ.
					System.out.println("������ ����");
				} catch (Exception e) {

				}
			}
		});
		
		root.getChildren().add(btn1);
		root.getChildren().add(btn2);
		Scene scene = new Scene(root);
		primaryStage.setScene(scene);
		primaryStage.setTitle("Clicent");
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch();
	}

}
