package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;
import org.web.dao.MemberDao;

public class BoardInsertService implements BoardService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 등록");


		String board_title=request.getParameter("board_title");
		String content=request.getParameter("content");
		String board_writer=request.getParameter("board_writer");
		
		System.out.println("작성자: "+board_writer);
		
		BoardDao dao= BoardDao.getInstance();
		int rs=dao.boardInsert(board_title,content,board_writer);
		
		String returnURL="";
		
		if(rs!=1) {
			System.out.println("게시글등록 실패");
			if(rs==2) {
				System.out.println("회원등록페이지로 이동합니다.");
				returnURL="/joinView.jsp";				
			}else {
				returnURL="/boardFail.jsp";				
			}
		}else {
			System.out.println("게시글등록 성공");
			returnURL="/boardListView.do";			
		}
		
		request.setAttribute("returnURL", returnURL);

	}

}
