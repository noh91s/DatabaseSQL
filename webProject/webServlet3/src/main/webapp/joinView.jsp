<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원등록페이지</title>
</head>
<body>
<h>직원등록페이지!!</h>
<form action="joinOk.do" method="POST">
사원이름: <input type="text" name="emp_name" /><br />
사원부서: <select name="emp_depart" id="emp_depart" />
<option value="영업부">영업부</option>
<option value="기획부">기획부</option>
<option value="마케팅부">마케팅부</option>
<option value="흥보부">흥보부</option>
<option value="기술부">기술부</option></select><br />
사원이메일: <input type="text" name="emp_email" /><br />


<input type="submit" value="직원등록실행"/>

</form>

<div>
</div>
</body>
</html>