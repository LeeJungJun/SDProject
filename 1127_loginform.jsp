<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login form</title>
</head>
<body>

<form action = "login.jsp" method = "post">
<table border = "1" width = "300">
<tr>
<td width = "100" align = "center">ID</td>
<td><input type = "text" name = "id" size = "12" maxlength = "12"></td>
</tr>

<tr>
<td align = "center">Password</td>
<td><input type = "password" name = "pw" size = "13" maxlength = "12"></td>
</tr>

<tr>
<td colspan = "2"> <%-- 합치기--%>
<input type = "submit" value = "login">
</td>
</tr>
</table>
</form>

<form action = "logintojoin.jsp" method = "post">
<tr>
<input type = "submit" value = "회원가입">
</tr>
</form>
</body>
</html>