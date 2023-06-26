package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;


public class BoardInsertService implements BoardService {
	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse reponse)
			throws ServletException, IOException {
		System.out.println("게시글 작성");
		
		String board_title=request.getParameter("board_title");
		String board_content=request.getParameter("board_content");
		String board_writer=request.getParameter("board_writer");
		
		BoardDao dao= BoardDao.getInstance();
		int rs=dao.insert(board_title,board_content,board_writer);

		String returnURL="";
		
		if(rs!=1) {
			System.out.println("게시글등록 실패!");
			returnURL="/writeFail.jsp";
		}else {
			System.out.println("게시글등록 성공!");
			returnURL="/writeView.jsp";
		}
		
		request.setAttribute("returnURL", returnURL);
	}
}
