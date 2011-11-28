<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.ArrayList" %>
<%!

	public class Forecast_conditions {
	
		private String   day_of_week
						,icon
						,condition;
		private int		 low, high;
		
		public void setDay_of_week(String day_of_week){
			this.day_of_week = day_of_week;
		}
		
		public String getDay_of_week(){
			return this.day_of_week;
		}
		
		public void setIcon(String icon){
			this.icon = icon;
		}
		
		public String getIcon(){
			return this.icon ;
		}
		
		public void setCondition(String condition){
			this.condition = condition;
		}
		
		public String getCondtion(){
			return this.condition;
		}
		
		public void setLow(int low){
			this.low = low;
		}
		
		public int getLow(){
			return this.low;
		}
		
		public void setHigh(int high){
			this.high = high;
		}
		
		public int getHigh(){
			return this.high;
		}
	}

%>
<%
	String XMLPathURL = "http://www.google.co.kr/ig/api?weather=Suwon&ie=utf-8&oe=utf-8&hl=ko";
	ArrayList	weahterArray = new ArrayList();
	
	String weatherCurrent[] = new String[6];
	
	try
	{
		DocumentBuilderFactory	factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder 		builder = factory.newDocumentBuilder();
		factory.setIgnoringElementContentWhitespace(true);
		
		Document	path	=  builder.parse(XMLPathURL);		
		Element		root 	=  path.getDocumentElement();
		Element		weather = (Element)root.getFirstChild();
		
		boolean isForecast	= false;
		boolean isCurrent	= false;
		
		int i = 0;
		while ( weather != null){
			Element xmlTagName = (Element) weather.getFirstChild();
			while (xmlTagName != null){
				Element childTagName = (Element) xmlTagName.getFirstChild();
				//out.println( "[" + xmlTagName.getTagName() + "] <br/> " );
				Forecast_conditions forecast_conditions = null; 
				if( "forecast_conditions".equals(xmlTagName.getTagName().toString().trim())){
					isForecast = true;
					forecast_conditions = new Forecast_conditions();
				}
				else
					isForecast = false;
				
				if( "current_conditions".equals(xmlTagName.getTagName().toString().trim()))
					isCurrent = true;
				else
					isCurrent = false;

				
				while ( childTagName != null ){				
					String tagName = childTagName.getTagName();
					String tagValue = childTagName.getAttribute("data");
			
					//out.println( tagName + " : " + tagValue );
					//out.println( " <br> ");
					
					if(isForecast){
						if ( "day_of_week".equals(tagName))	
							forecast_conditions.setDay_of_week(tagValue);
						else if ("low".equals(tagName))
							forecast_conditions.setLow(Integer.parseInt(tagValue));
						else if ("high".equals(tagName))
							forecast_conditions.setHigh(Integer.parseInt(tagValue));
						else if ("icon".equals(tagName))
							forecast_conditions.setIcon(tagValue);
						else if ("condition".equals(tagName))
							forecast_conditions.setCondition(tagValue);

					}
					
					if(isCurrent){
						if ("condition".equals(tagName))
							weatherCurrent[0] = tagValue;
						if ("temp_f".equals(tagName))
							weatherCurrent[1] = tagValue;
						if ("temp_c".equals(tagName))
							weatherCurrent[2] = tagValue;
						if ("humidity".equals(tagName))
							weatherCurrent[3] = tagValue;
						if ("icon".equals(tagName))
							weatherCurrent[4] = tagValue;
						if ("wind_condition".equals(tagName))
							weatherCurrent[5] = tagValue;
					}
					childTagName = (Element) childTagName.getNextSibling();
				}
				out.println(" <br/><br/>" );
				
				if(isForecast)
					weahterArray.add(forecast_conditions);
				
				xmlTagName = (Element) xmlTagName.getNextSibling();
			}
			weather = (Element) weather.getNextSibling();
		}
	}
	catch (Exception e){ System.out.println(e); }
	
	
	out.println("<table border=1 align=left width='30%'>");
	out.println("<tr><td align=center colspan='2'> 오늘 </td></tr>");
	out.println("<tr><td>현재</td><td> " + weatherCurrent[0] + "</td></tr>");
	out.println("<tr><td>온도(상)</td><td> " + weatherCurrent[1] + "</td></tr>");
	out.println("<tr><td>온도(하)</td><td> " + weatherCurrent[2] + "</td></tr>");
	out.println("<tr><td>습도</td><td> " + weatherCurrent[3] + "</td></tr>");
	out.println("<tr><td>아이콘</td><td><img src=\"http://www.google.co.kr" + weatherCurrent[4] + "\"/></td></tr>");
	out.println("<tr><td>바람</td><td> " + weatherCurrent[5] + "</td></tr>");
	out.println("<tr><td>요번주</td><td>");
	out.println("<table border=1 align=center>");
	
	
	for ( int x = 0 ; x < weahterArray.size(); x++)	{
		Forecast_conditions forecast_conditions = (Forecast_conditions) weahterArray.get(x);
		out.println("<tr><td>" + forecast_conditions.getDay_of_week() + "요일");
		out.println("(" + forecast_conditions.getCondtion() + ")</td><td><img src=\"http://www.google.co.kr" + forecast_conditions.getIcon() + "\"/></td>");
		out.println("<td>" + forecast_conditions.getLow() + "°/" + forecast_conditions.getHigh() + "°</td></tr>");
	}
	out.println("</table></td></tr>");
	out.println("</table>");
			
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"><title>Insert title here</title></head><body></body></html>