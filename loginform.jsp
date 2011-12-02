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

<tr>
<td width = "100" align = "right">ID</td>
<td><input type = "text" name = "id" size = "12" maxlength = "12"></td>
</tr>

<br></br>
<tr>
<td width = "100" align = "right">Password</td>
<td><input type = "password" name = "pw" size = "13" maxlength = "12"></td>
</tr>

<br></br>
<td colspan = "2"> <%-- 합치기--%>
<input type="image" src="./Pic_01/button_login.png" border="0"></input>
</td>


</form>

<form action = "logintojoin.jsp" method = "post">

<input type="image" src="./Pic_01/button_join.png" border="0"></input>

</form>
</body>
</html>