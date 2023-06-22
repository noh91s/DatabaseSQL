package org.project.dbconnet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static Connection getConnection() {
		
		Connection conn = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";

		try {
			Class.forName(driver);
			System.out.println("Driver OK!");			
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB Success!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("Driver No!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB Fail!");
		}
		
		return conn;
	}
}
