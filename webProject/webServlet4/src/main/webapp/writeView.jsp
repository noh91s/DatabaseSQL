<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeView.jsp</title>
</head>
<body>
<h1>게시글등록페이지</h1>
<form action="writeOk.do">
글제목 : <input type="text" name="board_title" id="board_title" /><br />
글내용 : <input type="text" name="board_content" id="board_content" /><br />
글쓴이 : <input type="text" name="board_writer" id="board_writer" /><br />
<input type="submit" value="게시글등록실행" />
</form>
<a href="index.do">HOME</a>
</body>
</html>