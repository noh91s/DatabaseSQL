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

	<a href="BoardListView.do">게시글목록</a>
</body>
</html>