<%@page import="org.web.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<MemberDto> memberList 
= (ArrayList<MemberDto>) request.getAttribute("memberList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberListView.jsp</title>
</head>
<body>
	<h1>회원목록</h1>
	<!-- java코드 작성 JSP(HTML+JAVA) -->
	<!-- for(MemberDto member : memberList) {
				System.out.println(member.getMember0626_id());
				System.out.println(member.getName());
				System.out.println(member.getPassword());
				System.out.println(member.getEmail());
				System.out.println(member.getCreate_date());
			}
-->
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>등록날짜</th>
		</tr>
		<%
		for (MemberDto member : memberList) {
		%>
		<tr>
			<td><%=member.getMember0626_id()%></td>
			<td><%=member.getName()%></td>
			<td><%=member.getPassword()%></td>
			<td><%=member.getEmail()%></td>
			<td><%=member.getCreate_date()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<a href="joinView.do">회원등록</a>
	<a href="index.do">HOME</a>
</body>
</html>