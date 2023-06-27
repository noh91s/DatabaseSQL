<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeView.jsp</title>
</head>
<body>
<h1>writeView페이지</h1>
<form action="writeOk.do" method="POST">
	제목: <input type="text" name="board_title" id="board_title" /> <br />
	내용: <input type="text" name="content" id="content" /> <br />
	작성자: <input type="text" name="board_writer" id="board_writer" /> <br />
	<input type="submit" value="게시글등록실행" />
</form>
<a href="index.do">HOME</a>
</body>
</html>