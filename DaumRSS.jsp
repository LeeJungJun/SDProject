
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Daum RSS AJAX API</title>
<script type="text/javascript" src="http://apis.daum.net/ajax/sparrow_ajaxapi.daum?apikey=f72ba15fc2a778db4482369dc85aad5095e37456"></script>
<script language="javascript" type="text/javascript">
//<![CDATA[
daum.include("daum.ajaxapi.RSSReader");

function main() {
 var RSSReaderControl = new daum.ajaxapi.RSSReader(); 

 // RSS의 본문을 보고 싶으면 아래 옵션에서 viewcontents를 true로 셋팅하세요.
 RSSReaderControl.setOptions({viewcontents:15}); 
 
 RSSReaderControl.draw(document.getElementById("results"));
 RSSReaderControl.execute("http://www.khan.co.kr/rss/rssdata/total_news.xml");
}
//]]>
</script>
</head>
<body>
 <div id="results">Loading</div>
</body>
</html>