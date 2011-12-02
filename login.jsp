<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "SD.project.member.MemberDao" %>
<%


request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
MemberDao dao = new MemberDao();


int flag = dao.checkIdPw(id,pw);



if(flag ==0){ //틀린경우
	response.sendRedirect("loginfail.jsp");
} else if(flag ==1){ //	맞은경우
	response.sendRedirect("MainFrame.html");
}

%>
