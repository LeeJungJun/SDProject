<%@ page import = "SD.project.member.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String email = request.getParameter("email");


MemberDto dto = new MemberDto();


dto.setId(id);
dto.setPw(pw);
dto.setTel(tel);
dto.setEmail(email);

MemberDao memberDao = new MemberDao();
boolean saveOk = memberDao.insert(dto);

if(saveOk){
%>
회원가입이 완료되었습니다<br>
<a href= "loginform.jsp">로그인</a>
<%
} else{
%>
회원 가입 실패했습니다! 다시 가입 바랍니다.<br>
<a href = "joinform.jsp">회원가입</a>
<%
} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>