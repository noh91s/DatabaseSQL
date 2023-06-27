package org.web.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.MemberDao;
import org.web.dto.MemberDto;

public class MemberListViewService implements MemberService {

	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원목록");
		
		MemberDao dao= MemberDao.getInstance();
		 
		ArrayList<MemberDto> memberList=dao.memberList();
		 
		String returnURL="";		
		
		if(memberList.isEmpty()) {
			System.out.println("조회할 회원이 없습니다.");
			returnURL="/index.do";
		}else {
			System.out.println("조회할 회원이 있다.");
			returnURL="/memberListView.jsp";
			
//			for(MemberDto member: memberList) {
//				System.out.print(member.getMember0626_id());
//				System.out.print(member.getPassword());
//				System.out.print(member.getName());
//				System.out.print(member.getEmail());
//				System.out.println(member.getCreate_date());
//			}			
			// 회원목록 정보를 -> memberListView.jsp 가지고 이동
			request.setAttribute("memberList", memberList);
		}
		
		request.setAttribute("returnURL", returnURL);		 
		 
		 
		 

	}

}
