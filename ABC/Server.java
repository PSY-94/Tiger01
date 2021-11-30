package pack;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.InputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

class ClientThread extends Thread{
	Socket ss;
	ClientThread(Socket ss){
		this.ss = ss;
	}
	public void run() {
		try {
			while(true) {
				InputStream is = ss.getInputStream();
				byte[] data = new byte[512];
				int size = is.read(data); // read : ���ŷ �Լ�
				String s = new String(data, 0, size, "UTF-8");
				System.out.println(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
class ConnectThread extends Thread{
	public void run() {
		ServerSocket mss = null;
		try {
			mss = new ServerSocket();
			System.out.println( "���μ������ϻ���" );

			mss.bind( new InetSocketAddress("localhost", 5001));
			System.out.println( "���ε� �Ϸ�" );

			Socket ss = mss.accept();
			System.out.println( "������ ���ӵ�" );
			ClientThread client = new ClientThread(ss);
			client.start();
		} catch (Exception e) {
		} 
	}
}
// ��������� �ʿ��ϴ�.
public class Server extends Application {
	public void start(Stage primaryStage) throws Exception{
		VBox root = new VBox();
		root.setPrefSize(400, 300);
		
		Button btn1 = new Button("���� ����");
		btn1.setOnAction(new EventHandler<>() {
			@Override
			public void handle(ActionEvent event) {
				ConnectThread ct = new ConnectThread();
				ct.start();
			}
		});
		
		root.getChildren().add(btn1);
		Scene scene = new Scene(root);
		primaryStage.setScene(scene);
		primaryStage.setTitle("Server");
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch();
	}
}
