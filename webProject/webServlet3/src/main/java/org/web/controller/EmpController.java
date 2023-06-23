package org.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.service.EmployeeInsertService;
import org.web.service.EmployeeService;

@WebServlet("*.do") // 서블릿이 Controller
public class EmpController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET~emp");
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST");
		request.setCharacterEncoding("UTF-8");
		String uri =request.getRequestURI();
		String path =request.getContextPath(); // 기본 애플리케이션 패스(
		String basicURL=uri.substring(path.length());
		// /index.do -> index.jsp
		System.out.println(uri+ " <-uri");
		System.out.println(path+ " <-path");
		System.out.println(basicURL+ " <-basicURL");
		
		String returnURL="";
		
		EmployeeService service=null;
		
		
		if(basicURL.equals("/index.do")) {
			System.out.println("index.jsp페이지 이동");
			returnURL="/Index.jsp";
		} else if(basicURL.equals("/joinView.do")) {
			returnURL="/joinView.jsp";
		} else if(basicURL.equals("/joinOk.do")) {
			service=new EmployeeInsertService();
			service.executeQueryService(request, response);
			returnURL=(String) request.getAttribute("returnURL");
		} else {
			returnURL="/fail.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(returnURL);
		dispatcher.forward(request, response);
		
	}
}
