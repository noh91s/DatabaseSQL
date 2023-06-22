package org.project.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.dao.MemberDao;

public class MemberInsertService implements MemberService{
	@Override
	public void executeQuerySerivce(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("회원가입");
		
		// 요청 -> userId
		// form -> name="userId"
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		
		System.out.println("userId -> "+userId);
		System.out.println("userPw -> "+userPw);
		System.out.println("userName -> "+userName);
		
		MemberDao dao=MemberDao.getInstance();
		int rs= dao.MemberInsertService(userId, userPw, userName);
		
		if(rs!=1) {
			System.out.println("회원가입 실패");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('Member Fail!!')");
			out.println("</script>");
		}else {
			System.out.println("회원가입 성공");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('Member Success!!')");
			out.println("</script>");
		}
	}
}
