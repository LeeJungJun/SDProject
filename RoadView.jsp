<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.xml.sax.InputSource"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>SD Project - Lionel Mash</title>
<%
	
	double tLati = Double.parseDouble( request.getParameter("Dlatitude"));
	double tLong = Double.parseDouble (request.getParameter("Dlongtitude"));
	
%>
<script src="http://apis.daum.net/maps/maps2.js?apikey=bdccd9f1f6b6ad16857b17446ec3be55ff2cf150"></script>

</head>

<body>



	

<div id="roadview"></div>

<script type="text/javascript">

//<![CDATA[

var latlng = new DLatLng(<%=tLati%>, <%=tLong%>);

var opt = {point:latlng,width:500,height:400,pan:30,tilt:-13,zoom:2};

var rv = new DRoadView("roadview",opt);

//]]>

 </script>

</body>

</html>