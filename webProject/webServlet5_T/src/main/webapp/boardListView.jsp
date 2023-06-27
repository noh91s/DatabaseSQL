<%@page import="org.web.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 스크립틀릿	
ArrayList<BoardDto> boardList = (ArrayList<BoardDto>) request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
</head>
<body>
	<h1>게시글 목록</h1>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>글내용</th>
			<th>글작성자</th>
			<th>글작성일</th>
			<th>글상세보기</th>
		</tr>
		<%
		for (BoardDto board : boardList) {
		%>
		<tr>
			<td><%=board.getBoard0626_id()%></td>
			<td><%=board.getBoard_title()%></td>
			<td><%=board.getContent()%></td>
			<td><%=board.getBoard_writer()%></td>
			<td><%=board.getCreate_date()%></td>
			<td>
			<a href="boardDetail.do?board0626_id=<%=board.getBoard0626_id()%>">상세보기</a>
			</td>
		</tr>

		<%
		}
		%>


	</table>



<div>
<a href="index.do">HOME</a>
	<a href="joinView.do">회원등록</a>
	<a href="writeView.do">게시글등록</a>
	<a href="memberListView.do">회원목록</a>
</div>









</body>
</html>