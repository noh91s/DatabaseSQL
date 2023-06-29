package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;

public class BoardDeleteService implements BoardService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse reponse)
			throws ServletException, IOException {
		System.out.println("게시글 삭제");
		
		Long board0626_id=Long.parseLong(request.getParameter("board0626_id"));
		
		BoardDao dao= BoardDao.getInstance();
		int rs=dao.delete(board0626_id);

		String returnURL="";
		
		if(rs!=1) {
			if(rs==2) {
				// JPA -> findById(), findByName(), findByBoard0626_id()
				System.out.println("게시글조회 실패");
				returnURL="/BoardListView.do";
			} else {
				System.out.println("게시글삭제 실패!");
				returnURL="/BoardListView.do";
			}
		}else {
			System.out.println("게시글삭제 성공!");
			returnURL="/BoardListView.do";
		}
		request.setAttribute("returnURL", returnURL);
	}

}
