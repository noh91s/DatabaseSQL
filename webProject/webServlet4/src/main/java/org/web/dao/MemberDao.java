package org.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.web.dbconnect.DBConnect;

public class MemberDao {
	private MemberDao() {
		System.out.println("MemberDao <- 싱글톤");
	}
	
	private static class SingletonClass {
		private static final MemberDao INSTANCE = new MemberDao();
	}

	public static MemberDao getInstance() {
		return SingletonClass.INSTANCE;
	}

	public int insert(String name, String password, String email) {
		int rs=0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "insert into member0626(member0626_id, name, password, email)" 
					+ "values(member0626_seq.nextval,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, name);
			pstm.setString(2, password);
			pstm.setString(3, email);
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
