package org.web.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;
import org.web.dto.BoardDto;

public class BoardDetailService implements BoardService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse reponse)
			throws ServletException, IOException {
		System.out.println("게시글상세보기");
	
		Long board0626_id=Long.parseLong(request.getParameter("board0626_id"));
		
		BoardDao dao= BoardDao.getInstance();
		BoardDto boardDetail= dao.boardDetail(board0626_id);
		String returnURL ="";
		
		
		if(boardDetail!=null) {
			System.out.println("게시글 상세조회");
			returnURL="/boardDetail.jsp";
			request.setAttribute("boardDetail", boardDetail);
		}else {
			System.out.println("조회할 게시글이 없습니다");
			returnURL="/boardDetail.do";
		}
		request.setAttribute("returnURL", returnURL);
		

	}

}
