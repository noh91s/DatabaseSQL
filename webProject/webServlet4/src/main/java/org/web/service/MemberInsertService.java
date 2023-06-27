package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.MemberDao;


public class MemberInsertService implements MemberService{
	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			System.out.println("회원가입");
			
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			
			MemberDao dao= MemberDao.getInstance();
			int rs=dao.insert(name,password,email);

			String returnURL="";
			
			if(rs!=1) {
				if(rs==2) {
					System.out.println("이미등록된 사용자");
					returnURL="/joinFail.jsp";
				} else {
				System.out.println("회원가입 실패!");
				returnURL="/joinFail.jsp";
				}
			}else {
				System.out.println("회원가입 성공!");
				returnURL="/memberListView.do";
			}
			
			request.setAttribute("returnURL", returnURL);
	}
}
