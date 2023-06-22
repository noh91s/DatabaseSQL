package org.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.service.MemberInsertService;
import org.project.service.MemberService;

// 컨트롤러 설정
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("GET방식");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("POST방식");
		request.setCharacterEncoding("UTF-8");

		String path = request.getContextPath(); // 기본 서버 경로
		String uri = request.getRequestURI(); // 요청 uri
		String bUrl = uri.substring(path.length()); // 처리 url /joinOk.do

		System.out.println("path -> " + path);
		System.out.println("uri -> " + uri);
		System.out.println("bUri -> " + bUrl);

		// service
		MemberService service = null;
		if (bUrl.equals("/joinOk.do")) {
			service = new MemberInsertService();
			service.executeQuerySerivce(request, response);
		}

	}
}
