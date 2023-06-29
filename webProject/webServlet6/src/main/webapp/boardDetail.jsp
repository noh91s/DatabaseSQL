<%@page import="org.web.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDto boardDetail 
= (BoardDto) request.getAttribute("boardDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail.jsp</title>
</head>
<body>
<h1>게시글상세조회</h1>

	<form action="boardUpdate.do" method="POST">
		글번호: <input type="text" name="board0626_id" id="board0626_id"
			value="<%=boardDetail.getBoard0626_id()%>" readonly="true" /> <br /> 
			글제목: <input type="text" name="board_title" id="board_title"
			value="<%=boardDetail.getBoard_title()%>" /> <br /> 
			글내용: <input type="text" name="board_content" id="board_content"
			value="<%=boardDetail.getBoard_content()%>" /> <br /> 
			글쓴이: <input type="text" name="board_writer" id="board_writer"
			value="<%=boardDetail.getBoard_writer()%>" readonly="true" /> <br /> 
			작성일: <span><%=boardDetail.getCreate_date()%></span>
		<br /> <input type="submit" value="게시글수정실행" />
	</form>
	<form action="boardDelete.do" method="POST">
		<input type="hidden" name="board0626_id" id="board0626_id"
			value="<%=boardDetail.getBoard0626_id()%>" readonly="true" />
	  <input type="submit" value="게시글삭제실행" />
	</form>

	<div>
<a href="index.do">HOME</a>
<a href="writeView.do">게시글등록</a>
<a href="BoardListView.do">게시글목록</a>
<a href="boardDeleteView.do">게시글삭제</a>
</body>
</html>