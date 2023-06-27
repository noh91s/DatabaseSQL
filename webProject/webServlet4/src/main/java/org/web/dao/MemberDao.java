package org.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.web.dbconnect.DBConnect;
import org.web.dto.MemberDto;

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
		if (memberEmailChecked(email) == 1) {
			rs = 2;
			return rs;
		} else {
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
		}
		return rs;
	}

	private int memberEmailChecked(String email) {
		int rs2 = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select count(*) from member0626 where email=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, email);
			rs = pstm.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					rs2 = rs.getInt(1); 
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs2;
	}

	public ArrayList<MemberDto> memberList() {
		
		ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select * from member0626";
			pstm = conn.prepareStatement(query);
			
			rs = pstm.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					memberList.add(new MemberDto(rs.getLong(1),
							rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5)));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberList;
	}
}
