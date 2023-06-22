package org.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.project.dbconnet.DBConnect;

public class MemberDao {
	private MemberDao() {
		// 싱글톤
		System.out.println("MemberDao <- 싱글톤");
	}

	private static class SingletonClass {
		private static final MemberDao INSTANCE = new MemberDao();
	}

	public static MemberDao getInstance() {
		return SingletonClass.INSTANCE;
	}

	public int MemberInsertService(String userId, String userPw, String userName) {
		int rs = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "insert into writer_tb(userId, userPw, userName)" + "values(?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			pstm.setString(2, userPw);
			pstm.setString(3, userName);
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