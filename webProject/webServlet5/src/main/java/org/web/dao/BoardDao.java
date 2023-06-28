package org.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.web.dbconnect.DBConnect;
import org.web.dto.BoardDto;

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
		int rs = 0;

		if (boardWriterChecked(board_writer) != 1) {
			System.out.println("회원등록이 필요한 서비스입니다");
			rs = 2;
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
		int rs2 = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select count(*) from member0626 where email=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, board_writer);
			rs = pstm.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					rs2 = rs.getInt(1); // 작성자가 존재하면1
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

	public ArrayList<BoardDto> boardList() {
		ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select * from board0626 order by board0626_id DESC";
			pstm = conn.prepareStatement(query);

			rs = pstm.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					boardList.add(new BoardDto(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getDate(5)));
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
		return boardList;
	}

	public BoardDto boardDetail(Long board0626_id) {
		BoardDto boardDetail = new BoardDto();

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select * from board0626 where board0626_id=?";
			pstm = conn.prepareStatement(query);
			pstm.setLong(1, board0626_id);

			rs = pstm.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					boardDetail = new BoardDto(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getDate(5));
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
		return boardDetail;
	}

	public int update(Long board0626_id, String board_title, String board_content) {
		int rs = 0;

		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "update board0626 set board_title=?,board_content=? where board0626_id=?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, board_title);
			pstm.setString(2, board_content);
			pstm.setLong(3, board0626_id);
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

	public int delete(Long board0626_id) {
		int rs = 0;
		if(boardIdChecked(board0626_id)!=1) {
			System.out.println("삭제할 게시글이 없습니다");
			rs=2;
			return rs;
		}
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "delete from board0626 where board0626_id=?";
			pstm = conn.prepareStatement(query);
			pstm.setLong(1, board0626_id);
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

	private int boardIdChecked(Long board0626_id) {
		int rs2 = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "select count(*) from board0626 where board0626_id=?";
			pstm = conn.prepareStatement(query);
			pstm.setLong(1, board0626_id);
			rs = pstm.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					rs2 = rs.getInt(1); // 작성자가 존재하면1
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

	public int deleteOk(Long board0626_id, String board_writer) {
		int rs = 0;
		if(boardIdChecked(board0626_id)!=1) {
			System.out.println("삭제할 게시글이 없습니다");
			rs=2;
			return rs;
		}
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";
		try {
			conn = DBConnect.getConnection();
			query = "delete from board0626 where board0626_id=? and board_writer=?";
			pstm = conn.prepareStatement(query);
			pstm.setLong(1, board0626_id);
			pstm.setString(2, board_writer);
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
