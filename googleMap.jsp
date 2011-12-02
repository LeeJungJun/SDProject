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
<title>SD Project - Lionel Mash</title>

<%!		//전역변수
double latitude = 37.60297;
double longtitude = 126.954972;

double tempLatitude;
double tempLongtitude;

%>
                  <script src="http://maps.google.co.kr/maps?file=api&amp;v=2&amp;key=ABQIAAAA723K0W3O3tu4FEbyqOLN9hRrb41JoWUZrahluOk81y-6F6GuWhRMhzV-n64XEG0bUrW-5tnIIorJvw&sensor=true"
                               type="text/javascript"></script>
                  <script type="text/javascript">

                  function initialize() {
                      if (GBrowserIsCompatible()) {

                        //	System.out.println("init_latitude : "+latitude);
                  		//System.out.println("init_longtitude : "+longtitude);
                  		//System.out.println("Test");
                  		
                        var map = new GMap2(document.getElementById("map_canvas"));
                        map.addControl(new GSmallMapControl());
                        map.addControl(new GMapTypeControl());
                        map.setCenter(new GLatLng(37.60297,126.954972), 15);
                        map.setMapType(G_NORMAL_MAP);
                        //map.openInfoWindow(map.getCenter(), document.createTextNode("Hello SangmyungUniversity"));
                        //latitude = 37.60297;
                        //longtitude = 126.954972;
                        
                        
                        GEvent.addListener(map, "click", function(marker, point)  
                        { 
                          if (marker){ 
                        		    //map.removeOverlay(marker);
                        	  marker.openInfoWindowHtml("Marker<b>"); 
                          } else {
                        	 	    map.addOverlay(new GMarker(point)); 
                        		    //alert("new_latitude: " + point.lat()); 
                        		    
                        		    latitude = point.lat();
                        		    longtitude = point.lng();
                        		    
                        		    document.pointFrm.latitude.value=latitude;
                        		    document.pointFrm.longtitude.value=longtitude;

                        		  	
//                          	    alert("lat :" + document.pointFrm.latitude.value + ", long " + document.pointFrm.longtitude.value);
                        		   
                        		    //latitude = 5.0;
                        		    //longtitude = point.lng();
                        		   
                        		    // ==============
                        		    // run a weather
                        		    document.pointFrm.submit();

//                        		    out.println(latitude);
                        		    //System.out.println("aa");
                        		    //System.out.println("point_lat : " + point.lat());
                        		    //System.out.println("point_lng : " + point.lng());
                       	  } 
                          

                           
                  		}); 
                                        
                        //map.setUIToDefault();
                    }
                  }
                  </script>
   </head>
   
	<body onload="initialize()" onunload="GUnload()">
		<div id="map_canvas" style="width: 700px; height: 350px"></div>
		
		<!--
		 ================
		 add a form
		 --> 
		<form name="pointFrm" method="post" target="frameWeather" action="./googleWeather.jsp">
				<input type="hidden" name="latitude" value="37.60297">
				<input type="hidden" name="longtitude" value="126.954972">
		</form>       
		
		
		<iframe src="http://www.facebook.com/plugins/like.php?href=SD_Project_Lionel_Mash"
        scrolling="no" frameborder="0"
        style="border:none; width:450px; height:80px"></iframe>
	</body>
		 
</html>


   
    

 
 