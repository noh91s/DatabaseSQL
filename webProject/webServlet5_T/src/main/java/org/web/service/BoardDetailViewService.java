package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;
import org.web.dto.BoardDto;

public class BoardDetailViewService implements BoardService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 상세보기");
		
							// board0626_id -> Long타입으로 변환 
		Long board0626_id
		=Long.parseLong(request.getParameter("board0626_id"));
		
		BoardDao dao= BoardDao.getInstance();
		BoardDto board=dao.boardDetail(board0626_id);
		
		String returnURL="";
		if(board!=null) {
			System.out.println("게시글 상세보기");
			returnURL="/boardDetailView.jsp";
			request.setAttribute("board", board);
		}else {
			System.out.println("게시글 상세보기Fail!");
			returnURL="/boardListView.do";			
		}
		request.setAttribute("returnURL", returnURL);
	}

}
