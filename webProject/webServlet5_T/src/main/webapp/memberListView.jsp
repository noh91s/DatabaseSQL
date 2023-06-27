<%@page import="java.util.ArrayList"%>
<%@page import="org.web.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록페이지</title>
</head>
<body>
	<h1>회원목록</h1>
	<!--  java코드 작성 JSP(HTML+JAVA) -->
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비빌번호</th>
			<th>이메일</th>
			<th>등록일</th>
		</tr>
	<%	
	ArrayList<MemberDto> memberList = 	(ArrayList<MemberDto>) request.getAttribute("memberList");	
	for (MemberDto member : memberList) {
	%>
		<tr>
			<td><%=member.getMember0626_id() %></td>
			<td><%=member.getName() %></td>
			<td><%=member.getPassword() %></td>
			<td><%=member.getEmail()%></td>
			<td><%=member.getCreate_date() %></td>
		</tr>
	<%
	}
	%>
	</table>
<div>
<a href="index.do">HOME</a>
	<a href="joinView.do">회원등록</a>
	<a href="writeView.do">게시글등록</a>
	<a href="boardListView.do">게시글목록</a>
</div>


</body>
</html>