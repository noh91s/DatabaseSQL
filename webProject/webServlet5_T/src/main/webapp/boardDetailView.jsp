<%@page import="org.web.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDto board = (BoardDto) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
</head>
<body>

	<h1>게시글 상세보기</h1>
	<form action="boardUpdate.do" method="POST">
		글번호: <input type="text" name="board0626_id" id="board0626_id"
			value="<%=board.getBoard0626_id()%>" readonly="true" /> <br /> 제목: <input
			type="text" name="board_title" id="board_title"
			value="<%=board.getBoard_title()%>" /> <br /> 내용: <input
			type="text" name="content" id="content"
			value="<%=board.getContent()%>" /> <br /> 작성자: <input type="text"
			name="board_writer" id="board_writer"
			value="<%=board.getBoard_writer()%>"   readonly="true" /> <br /> 작성일: <span><%=board.getCreate_date()%></span>
		<br /> <input type="submit" value="게시글수정실행" />


	</form>
	<div>
<a href="index.do">HOME</a>
	<a href="joinView.do">회원등록</a>
		<a href="memberListView.do">회원목록</a>
	<a href="writeView.do">게시글등록</a>
		<a href="boardListView.do">게시글목록</a>

</div>
	
</body>
</html>