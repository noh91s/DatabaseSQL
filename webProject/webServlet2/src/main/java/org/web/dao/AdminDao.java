package org.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.web.dbconnect.DBConnect;



public class AdminDao {
	private AdminDao() {
		
	}
	private static class SingletonClass {
		private static final AdminDao INSTANCE = new AdminDao();	
	}
	public static AdminDao getInstance() {
		return SingletonClass.INSTANCE;
	}
	public int insert(String adminName, String adminPassword) {
		int rs=0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "insert into admin_tb(admin_Id, admin_Name, admin_Password)" + "values(admin_tb_seq.nextval,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, adminName);
			pstm.setString(2, adminPassword);
			rs = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}
}
