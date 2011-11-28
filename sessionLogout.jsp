<%@ page contentType = "text/html; charset=euc-kr" %>
<%
    session.invalidate();
 
    //session.removeAttribute("MEMBERID"); <- 라고 해도 로그아웃한 효과를 낼수있다.
%>
<html>
<head><title>로그아웃</title></head>
<body>
 
로그아웃하였습니다.
 
</body>
</html>
