package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;

public class BoardUpdateService implements BoardService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse reponse)
			throws ServletException, IOException {
		System.out.println("게시글 수정");
		
		Long board0626_id=Long.parseLong(request.getParameter("board0626_id"));
		String board_title=request.getParameter("board_title");
		String board_content=request.getParameter("board_content");
//		String board_writer=request.getParameter("board_writer");
		
		// 생성시간, 수정시간은 자동으로 설정할수 있다 -> spring boot JPA 자동 설정한다
		
		BoardDao dao= BoardDao.getInstance();
		int rs=dao.update(board0626_id,board_title,board_content);

		String returnURL="";
		
		if(rs!=1) {
			System.out.println("게시글수정 실패!");
			returnURL="/BoardListView.do";
		}else {
			System.out.println("게시글수정 성공!");
			returnURL="/boardDetail.do?board0626_id="+board0626_id;
		}
		
		request.setAttribute("returnURL", returnURL);
		
	}

}
