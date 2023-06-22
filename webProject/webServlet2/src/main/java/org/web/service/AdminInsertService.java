package org.web.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.AdminDao;

public class AdminInsertService implements AdminService{
	@Override
	public void executeQuerySerivce(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String adminName=request.getParameter("adminName");
		String adminPassword=request.getParameter("adminPassword");
		
		AdminDao dao=AdminDao.getInstance();
		int rs= dao.insert(adminName,adminPassword);
		String reurnURL="";
		response.setCharacterEncoding("UTF-8");
		PrintWriter out= response.getWriter();
		
		if(rs!=1) {
			System.out.println("상품관리자 등록 실패!!");
			reurnURL="/실패페이지";
			out.println("<script>");
			out.println("alert('Admin Fail!!')");
			out.println("</script>");
		}else {
			System.out.println("상품관리자 등록 성공!!");
			reurnURL="/성공페이지";
			out.println("<script>");
			out.println("alert('Admin Success!!')");
			out.println("</script>");
		}
	}

}
