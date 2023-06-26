package org.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.web.dbconnect.DBConnect;

public class BoardDao {
	private BoardDao() {
		System.out.println("BoardDao <- 싱글톤");
	}
	
	private static class SingletonClass {
		private static final BoardDao INSTANCE = new BoardDao();
	}

	public static BoardDao getInstance() {
		return SingletonClass.INSTANCE;
	}

	public int insert(String board_title, String board_content, String board_writer) {
		int rs=0;
		
		if(boardWriterChecked(board_writer)!=1) {
			System.out.println("작성자가 등록되지 않았다");
			rs=2;
			return rs;
		} else {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "insert into board0626(board0626_id, board_title, board_content, board_writer)"
					+ "values(board0626_seq.nextval,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, board_title);
			pstm.setString(2, board_content);
			pstm.setString(3, board_writer);
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

	private int boardWriterChecked(String board_writer) {
		int rs=0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select count(*) member0626 from email=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, board_writer);
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
