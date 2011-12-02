<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>SD Project - Lionel Mash</title>

<script src="http://apis.daum.net/maps/maps2.js?apikey=bdccd9f1f6b6ad16857b17446ec3be55ff2cf150"></script>

</head>

<body>

<div></div>

<div id="roadview1"></div>

<script type="text/javascript">

var map = new DMap("roadview1",{width:500,height:400});
map.setCenter(new DLatLng(37.60297, 126.954972), 5);

var ov = new DRoadViewOverlay(map);

var mapTypeControl = new DMapTypeControl();
map.addControl(mapTypeControl);

ov.show();

DEvent.addListener(map,"move",function(point){
	//alert(point.x+","+point.y+"로 이동했습니다.")
	
	
	// 이 소스코드를 이용하여 맵의 중앙의 위치를 가져옴
	var center = map.getCenter();
	
	
	document.daumpoint.Dlatitude.value=center.getLat();
	document.daumpoint.Dlongtitude.value=center.getLng();

	document.daumpoint.submit();
	});
 </script>

<form name = "daumpoint" method ="post" target = "frameRoadView" action = "./RoadView.jsp">
	<input type="hidden" name="Dlatitude" value="37.60297">
	<input type="hidden" name="Dlongtitude" value="126.954972">
</form>
</body>

</html>