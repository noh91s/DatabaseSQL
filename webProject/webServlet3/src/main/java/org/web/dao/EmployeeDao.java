package org.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.web.dbconnect.DBConnect;

public class EmployeeDao {
	
	private EmployeeDao() {
		System.out.println("EmployeeDao <- 싱글톤");
	}
	
	private static class SingletonClass {
		private static final EmployeeDao INSTANCE = new EmployeeDao();
	}

	public static EmployeeDao getInstance() {
		return SingletonClass.INSTANCE;
	}

	public int insert(String emp_name, String emp_depart, String emp_email) {
		int rs=0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "insert into employee(emp_id, emp_name, emp_depart, emp_email)" 
					+ "values(employee_seq.nextval,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, emp_name);
			pstm.setString(2, emp_depart);
			pstm.setString(3, emp_email);
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
