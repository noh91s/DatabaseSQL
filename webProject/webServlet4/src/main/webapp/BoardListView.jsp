<%@page import="org.web.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<BoardDto> boardList 
= (ArrayList<BoardDto>) request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardListView.jsp</title>
</head>
<body>
	<h1>게시글목록</h1>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>글내용</th>
			<th>글쓴이</th>
			<th>등록날짜</th>
			<th>글상세보기</th>
		</tr>
		<%
		for (BoardDto board : boardList) {
		%>
		<tr>
			<td><%=board.getBoard0626_id()%></td>
			<td><%=board.getBoard_title()%></td>
			<td><%=board.getBoard_content()%></td>
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

<a href="writeView.do">게시글등록</a>
<a href="index.do">HOME</a>
</body>
</html>