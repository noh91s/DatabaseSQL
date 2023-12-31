package org.web.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.BoardDao;
import org.web.dto.BoardDto;

public class BoardListViewService implements BoardService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse reponse)
			throws ServletException, IOException {
		
		System.out.println("게시글목록");
		
		BoardDao dao= BoardDao.getInstance();
		ArrayList<BoardDto> boardList= dao.boardList();
		String returnURL ="";
		
		
		if(boardList.isEmpty()) {
			System.out.println("조회할 게시글이 없습니다");
			returnURL="/index.do";
		}else {
			System.out.println("게시글목록 조회");
			returnURL="/BoardListView.jsp";
			request.setAttribute("boardList", boardList);
		}
		request.setAttribute("returnURL", returnURL);
		
		
		
	}
}

