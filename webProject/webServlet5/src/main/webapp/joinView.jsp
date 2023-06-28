<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinView.jsp</title>
</head>
<body>
<h1>회원가입페이지</h1>
<form action="joinOk.do" method="POST">
이름 : <input type="text" name="name" id="name" /><br />
비밀번호 : <input type="password" name="password" id="password" /><br />
이메일 : <input type="text" name="email" id="email" /><br />
<input type="submit" value="회원등록실행" />
</form>
<a href="index.do">HOME</a>
</body>
</html>