<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"  
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
   <html xmlns="http://www.w3.org/1999/xhtml">  
   <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <title>Google Maps JavaScript API Example</title>
                  <script src="http://maps.google.co.kr/maps?file=api&amp;v=2&amp;key=ABQIAAAA723K0W3O3tu4FEbyqOLN9hRrb41JoWUZrahluOk81y-6F6GuWhRMhzV-n64XEG0bUrW-5tnIIorJvw&sensor=true"
                               type="text/javascript"></script>
                  <script type="text/javascript">

                  function initialize() {
                      if (GBrowserIsCompatible()) {
                        var map = new GMap2(document.getElementById("map_canvas"));
                        map.addControl(new GSmallMapControl());
                        map.addControl(new GMapTypeControl());
                        map.setCenter(new GLatLng(37.60297,126.954972), 17);
                        map.setMapType(G_NORMAL_MAP);
                        //map.openInfoWindow(map.getCenter(), document.createTextNode("Hello SangmyungUniversity"));

                        GEvent.addListener(map, "click", function(marker, point)  
                        { 
                          if (marker){ 
                        		    //map.removeOverlay(marker);
                        	  marker.openInfoWindowHtml("Marker<b>"); 
                          } else { 
                        		    map.addOverlay(new GMarker(point)); 
                       	  } 
                           
                  		}); 
                                        
                        //map.setUIToDefault();
                    }
                  }
                  
                  </script>
   </head>
              <body onload="initialize()" onunload="GUnload()">
                   <div id="map_canvas" style="width: 500px; height: 300px"></div>
              </body> 
   </html>