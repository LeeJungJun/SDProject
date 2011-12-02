<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 폼</title>
</head>
<body>
<h3> 회원 가입</h3>
<form action = "join.jsp" method = "post">
<tr>
<td width = "100" align = "center"> ID</td>
<td><input type = "text" name = "id" size = "12" maxlength = "12"></td>
</tr>

<tr>
<td width = "100" align = "center"> Password</td>
<td><input type = "password" name = "pw" size = "12" maxlength = "12"></td>
</tr>

<tr>
<td width = "100" align = "center"> 이름</td>
<td><input type = "text" name = "name" size = "20" maxlength = "20"></td>
</tr>

<tr>
<td width = "100" align = "center"> 전화번호</td>
<td><input type = "text" name = "tel" size = "30" maxlength = "30"></td>
</tr>

<tr>
<td width = "100" align = "center"> 이메일</td>
<td><input type = "text" name = "email" size = "30" maxlength = "30"></td>
</tr>

<tr>
<td colspan = "2">
<input type = "submit" value = "회원가입">
<input type = "reset" value = "취소">
</td>
</tr>

</form>

</body>
</html>