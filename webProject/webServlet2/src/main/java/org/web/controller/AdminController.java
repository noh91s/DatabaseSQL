package org.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.service.AdminInsertService;
import org.web.service.AdminService;

// URL 패턴 -> 사용자 요청 URL 처리
@WebServlet("*.do") // .do로 끝나는 모든 사용자 URL을 AdminController(서블릿) 처리하겠다
public class AdminController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET"); // 웹에서는 기본 GET
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST");
		// 사용자 요청정보를 처리
		request.setCharacterEncoding("UTF-8"); // 요청URL 한글처리
		// /경로 -> 서버의 기본경로
		String path=request.getContextPath(); // 기본서버 패스(경로) /webSerblet
		String uri=request.getRequestURI();
		
		String basicURL=uri.substring(path.length()); 
		
		System.out.println(path +" <-path"); // 기본패스
		System.out.println(uri +" <-uri"); // 기본패스 + 사용자 요청 uri
		System.out.println(basicURL+" <-basicURL");
		
		AdminService service=null;
		
		if(basicURL.equals("/admin_insert.do")) {
			System.out.println("상품관리자등록 서비스를 실행");
			service=new AdminInsertService();
			service.executeQuerySerivce(request, response);
			
		} else if(basicURL.equals("/admin_update.do")) {
			System.out.println("상품관리자수정 서비스를 실행");
		}	
	}
}
