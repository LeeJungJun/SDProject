<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SD Project - Lionel Mash</title>
</head>
<body>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="javax.xml.parsers.*"%>
<%


request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

final String apiurl = "http://api.twitter.com/1/statuses/user_timeline.xml?screen_name="+id;
final int max_count = 10;

String[][] info = null;
HttpURLConnection conn = null;
int max = 0;
int k = 0;
try{   
    URL url = new URL(apiurl);
    conn = (HttpURLConnection) url.openConnection();
    conn.setRequestProperty("accept-language","ko");
   
    DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    byte[] bytes = new byte[4096];
    InputStream in = conn.getInputStream();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    while(true){
        int red = in.read(bytes);
        if(red < 0)
            break;
        baos.write(bytes, 0, red);
    }
    String xmlData = baos.toString("euc-kr");
    baos.close();
    in.close();
    conn.disconnect();
   
    Document doc = docBuilder.parse(new InputSource(new StringReader(xmlData)));
    Element el = (Element)doc.getElementsByTagName("statuses").item(0);
   
    max = el.getChildNodes().getLength();
    info = new String[max][];
    String reg = "(http:\\/\\/\\w+\\.\\w+(\\.\\w+)?(\\.\\w+)?/\\w+)";
    for(int i=0; i<max; i++){
        Node node = el.getChildNodes().item(i);
        if(!node.getNodeName().equals("status")){
            continue;
        }
        if(k >= max_count) break;
        Element el2 = (Element)node;
        String text = el2.getElementsByTagName("text").item(0).getFirstChild().getNodeValue();
        String created_at = el2.getElementsByTagName("created_at").item(0).getFirstChild().getNodeValue();
        
        Element el3 = (Element)(el2.getElementsByTagName("user").item(0));
        String name = el3.getElementsByTagName("name").item(0).getFirstChild().getNodeValue();
        String screen_name = el3.getElementsByTagName("screen_name").item(0).getFirstChild().getNodeValue();
        String profile_image_url = el3.getElementsByTagName("profile_image_url").item(0).getFirstChild().getNodeValue();
        Date date = new Date(created_at);
        
        Pattern p = Pattern.compile(reg);
        Matcher m = p.matcher(text);
        if(m.find()){
            text = text.replaceAll(reg, "<a href='"+m.group(1)+"' target='_blank'>"+m.group(1)+"</a>");
        }
        long cha = (System.currentTimeMillis() - date.getTime())/1000;
        String ago = "";
        if(cha < 60) {
            ago = "1분전";
        }
        else if(cha < 3600){
            ago = (cha / 60)+"분전";
        }
        else if(cha < 86400){
            ago = (cha / 60 / 60)+"시간전";
        }
        else{
            ago = (cha / 60 / 60 / 24)+"일전";
        }
        info[i] = new String[]{text,name,screen_name,profile_image_url,ago};
        k++;
    }
}catch(Exception e){
    e.printStackTrace();
}finally{
    try{if(conn != null) conn.disconnect(); } catch(Exception e){}
}
 %>

<%if(k > 0){%>

<table border="1" width="100%">
	<%for(int i=0; i<max; i++){
     if(info[i] == null) continue;
 %>
	<tr>
		<td><img src="<%=info[i][3]%>" alt="" /></td>
		<td><%=info[i][1]%>&nbsp;<%=info[i][2]%><br /><%=info[i][0]%><br /><%=info[i][4]%></td>
	</tr>
	<%}%>
</table>
<%}else{%>
<p>트래픽 초과로 잠시 데이터를 가져올 수 없습니다.</p>
<%}%>
</body>
</html>