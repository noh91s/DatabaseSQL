package org.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.service.BoardInsertService;
import org.web.service.BoardService;
import org.web.service.MemberInsertService;
import org.web.service.MemberService;

@WebServlet("*.do") // URL 패턴
public class MainController extends HttpServlet {
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
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String basicURL = uri.substring(path.length());
		// /index.do -> index.jsp
		System.out.println(uri + " <-uri");
		System.out.println(path + " <-path");
		System.out.println(basicURL + " <-basicURL");

		String returnURL = "";

		MemberService memberService = null;
		BoardService boardService = null;

		if (basicURL.equals("/index.do")) {
			System.out.println("index.jsp페이지 이동");
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
		} else {
			returnURL = "/joinFail.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(returnURL);
		dispatcher.forward(request, response);

	}

}
