<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.xml.sax.InputSource"%>



<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"  
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>GoogleWeatherTest</title>

</head>
                   
                   
	<body> 
	<%
	
	double tempLati = Double.parseDouble( request.getParameter("latitude"));
	double tempLong = Double.parseDouble (request.getParameter("longtitude"));
	
	%>
	<!--  
		alert("lati :" + <%=tempLati %> + ", long :" + <%=tempLong%>);
	-->
	
	              
<% //  part of weather
try{
	
	
	
	

	int latitude_e6 = (int)(tempLati * 1000000);
	int longtitude_e6 = (int)(tempLong * 1000000);

	//String szUrl = "http://www.google.com/ig/api?hl=ko&weather=seoul";
	String szUrl = "http://www.google.com/ig/api?hl=ko&weather=,,,"+latitude_e6+","+longtitude_e6;
	InputStream is = null;
	InputStreamReader isr = null;
	  
	is = new URL(szUrl).openStream();
	isr = new InputStreamReader(is, "EUC_KR");
/*
	StringBuffer sb = new StringBuffer(); 
	int c;

	while ((c = isr.read()) != -1)
		{
			sb.append((char) c);
		}

	isr.close(); 
	is.close();
*/
	//String tmp = new String(sb.toString());
//	System.out.println(tmp);

	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	DocumentBuilder db = dbf.newDocumentBuilder();
//	Document doc = db.parse("http://www.google.com/ig/api?hl=ko&weather=seoul"); //위치
	Document doc = db.parse(new InputSource(isr)); //위치

	NodeList nl_day_of_week = doc.getDocumentElement().getElementsByTagName("day_of_week");	//요일
	NodeList nl_icon = doc.getDocumentElement().getElementsByTagName("icon");				//아이콘
	NodeList nl_low = doc.getDocumentElement().getElementsByTagName("low");					//최저
	NodeList nl_high = doc.getDocumentElement().getElementsByTagName("high");				//최고
	NodeList nl_condition = doc.getDocumentElement().getElementsByTagName("condition");		//상태
%>
<table>
	<tr>
	
<%
	String str_DAY_NAME[] = {"오늘","내일","모레"};
	for(int i=0;i<3;i++){
		String str_condition	= (String)nl_condition.item(i).getAttributes().getNamedItem("data").getNodeValue();
		String str_icon			= (String)nl_icon.item(i+1).getAttributes().getNamedItem("data").getNodeValue();
		String str_day_of_week	= (String)nl_day_of_week.item(i).getAttributes().getNamedItem("data").getNodeValue();
		String str_low			= (String)nl_low.item(i).getAttributes().getNamedItem("data").getNodeValue();
		String str_high			= (String)nl_high.item(i).getAttributes().getNamedItem("data").getNodeValue();

%>
		<td>
			<table>
				<tr>
					<td style="font-size:12px" align="center" width="90"><%=str_DAY_NAME[i]%></td>
				</tr>
				<tr>
					<td style="font-size:12px" align="center"><img src="http://www.google.com<%=str_icon%>"></td>
				</tr>
				<tr>
					<td style="font-size:12px">최고 <font color="#FF4400"><%=str_high%>℃</font></td>
				</tr>
				<tr>
					<td style="font-size:12px">최저 <font color="#FF4400"><%=str_low%>℃</font></td>
				</tr>
			</table>
		</td>
<%
	}
%>
	</tr>
</table>
<%
	/*
	NodeList nl2_temp_f			= doc.getDocumentElement().getElementsByTagName("temp_f");			//현재온도(화씨)
	NodeList nl2_temp_c			= doc.getDocumentElement().getElementsByTagName("temp_c");			//현재온도(섭씨)
	NodeList nl2_humidity		= doc.getDocumentElement().getElementsByTagName("humidity");		//습도
	NodeList nl2_wind_condition = doc.getDocumentElement().getElementsByTagName("wind_condition");	//바람
	NodeList nl2_icon			= doc.getDocumentElement().getElementsByTagName("icon");			//아이콘
	NodeList nl2_condition		= doc.getDocumentElement().getElementsByTagName("condition");		//상태

	String str2_temp_f			= (String)nl2_temp_f.item(0).getAttributes().getNamedItem("data").getNodeValue();
	String str2_temp_c			= (String)nl2_temp_c.item(0).getAttributes().getNamedItem("data").getNodeValue();
	String str2_humidity		= (String)nl2_humidity.item(0).getAttributes().getNamedItem("data").getNodeValue();
	String str2_wind_condition	= (String)nl2_wind_condition.item(0).getAttributes().getNamedItem("data").getNodeValue();
	String str2_icon			= (String)nl2_icon.item(0).getAttributes().getNamedItem("data").getNodeValue();
	String str2_condition		= (String)nl2_condition.item(0).getAttributes().getNamedItem("data").getNodeValue();
	*/

%>
<!--
현재온도 : <%//=str2_temp_c%>℃/<%//=str2_temp_f%>℉<br />
<%//=str2_humidity%><br />
<%//=str2_wind_condition%><br />
<img src="http://www.google.com/<%//=str2_icon%>"><br />
<%//=str2_condition%><br />
-->
<%

}catch(Exception e){
	e.printStackTrace();
}
%>
	       </body>

</html>