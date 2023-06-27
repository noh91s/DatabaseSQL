package org.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.service.BoardDetailViewService;
import org.web.service.BoardInsertService;
import org.web.service.BoardListViewService;
import org.web.service.BoardService;
import org.web.service.MemberInsertService;
import org.web.service.MemberListViewService;
import org.web.service.MemberService;

import oracle.net.aso.d;

// 컨트롤러 @Controller
@WebServlet("*.do") // URL패턴
public class MainCotroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("GET");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("POST");
		request.setCharacterEncoding("UTF-8");

		String path = request.getContextPath();// 기본패스
		String uri = request.getRequestURI();// 요청 URI
		String basicURL = uri.substring(path.length());//

		System.out.println("path -> " + path);
		System.out.println("uri -> " + uri);
		System.out.println("basicURL -> " + basicURL);

		MemberService memberService = null;
		BoardService boardService = null;

		String returnURL = "";// 컨트롤러가 일 시키고 반화 URL ->View

		if (basicURL.equals("/index.do")) {
			returnURL = "/index.jsp";

		} else if (basicURL.equals("/joinView.do")) {
			returnURL = "/joinView.jsp";

		} else if (basicURL.equals("/writeView.do")) {
			returnURL = "/writeView.jsp";

		} else if (basicURL.equals("/joinOk.do")) {
			memberService = new MemberInsertService();
			memberService.executeQueryService(request, response);
			returnURL = (String) request.getAttribute("returnURL");

		} else if (basicURL.equals("/writeOk.do")) {
			boardService = new BoardInsertService();
			boardService.executeQueryService(request, response);
			returnURL = (String) request.getAttribute("returnURL");

		} else if (basicURL.equals("/memberListView.do")) {
			memberService = new MemberListViewService();
			memberService.executeQueryService(request, response);
			returnURL = (String) request.getAttribute("returnURL");
		} else if (basicURL.equals("/boardListView.do")) {
			boardService = new BoardListViewService();
			boardService.executeQueryService(request, response);
			returnURL = (String) request.getAttribute("returnURL");

		} else if (basicURL.equals("/boardDetail.do")) {
			boardService = new BoardDetailViewService();
			boardService.executeQueryService(request, response);
			returnURL = (String) request.getAttribute("returnURL");
		}

		// 정보를 가지고 View페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(returnURL);
		dispatcher.forward(request, response);

	}

}
