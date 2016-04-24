package lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ConnectDbLib {
	private String db = "zoo_management";
	private String url;
	private String user = "root";
	private String password = "";
	Connection connection;
	public ConnectDbLib(){
		this.url= "jdbc:mysql://localhost:3306/"+db+"?useUnicode=true&characterEncoding=UTF8";
	}
	// open connection
	public Connection getConnectMySQL(){
		try {
			//Register the driver class
			Class.forName("com.mysql.jdbc.Driver");
			//Creating connection
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	//close connection
	public void closeConnect(){
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
