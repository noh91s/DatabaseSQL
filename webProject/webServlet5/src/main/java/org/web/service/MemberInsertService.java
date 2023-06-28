package org.web.service;

import java.io.IOException;
import java.io.PrintWriter;

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
//			PrintWriter out = response.getWriter();
			
			if(rs!=1) {
				if(rs==2) {
					System.out.println("이미등록된 사용자");
					returnURL="/joinFail.jsp";
				} else {
				System.out.println("회원가입 실패!");
				returnURL="/joinFail.jsp";
//				
//				
//				out.println("<!doctype html>");
//				out.println("<html>");
//				out.println("<head>");
//				out.println("<meta charset='UTF-8'>");			
//				out.println("<title>회원가입실패페이지</title>");			
//				out.println("<body>");
//				out.println("<script>");
//				out.println("<alert('회원가입실패, 회원목록으로 이동합니다.!!!')>");
//				out.println("location.herf='memberListView.do';");
//				out.println("</script>");
//				out.println("</body>");
//				out.println("</html>");
//				out.close();
//				
			}
				

			}else {
				System.out.println("회원가입 성공!");
				returnURL="/memberListView.do";
		}
			
			request.setAttribute("returnURL", returnURL);
	}
}
