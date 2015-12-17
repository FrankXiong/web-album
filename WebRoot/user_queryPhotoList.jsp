<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.Photo"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Material风格的图片网站">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Picker</title>

<link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/material.css" type="text/css" rel="stylesheet" />
<script src="js/main.js" type="text/javascript"></script>
<script src="js/material.js" type="text/javascript"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<%
  List list=(List)request.getAttribute("list");
  Photo photo=(Photo)list.get(0);
%>

<body>
   <header><jsp:include page="header.jsp" flush="true" /></header>   
   <%if(null!=session.getAttribute("userInfo")){ %>      
   		<a href="user_upLoadPhoto.jsp" class="a1">请您上传自己的相片</a>
    <%} %>	  
	<a href="photoServlet?info=queryPhotoList&type=<%=photo.getPhotoType()%>" class="a3">滚动浏览图片</a>
	<!--<a href="photoServlet?info=queryPhotoSlide&type=<%=request.getAttribute("type")%>" class="a3">幻灯片浏览</a>-->
  	<a href="photoServlet?info=queryOnePhoto&id=<%=photo.getId()%>" id="toward">
  		<img src="<%=photo.getPhotoAddress()%>" width="400" height="300" id="images11" >
  	</a>
	  
    <div id="demo" style="overflow:hidden;width:500;"> 
   		<%for(int j=0;j<list.size();j++){
			Photo photo1=(Photo)list.get(j);
		%> 
	 	<img src="<%=photo1.getSmallPhoto()%>"  
	 		onclick="images11.src='<%=photo1.getPhotoAddress()%>';
	 		toward.href='photoServlet?info=queryOnePhoto&id=<%=photo1.getId()%>'"> 
		 <%}%>
	</div>

<script>
var speed=30 ;
marquePic2.innerHTML=marquePic1.innerHTML; 
function Marquee(){ 
 if(demo.scrollLeft>=marquePic1.scrollWidth){ 
  demo.scrollLeft=0; 
 }
 else{ 
  demo.scrollLeft=demo.scrollLeft+5;
 } 
} 
var MyMar=setInterval(Marquee,speed);
 demo.onmouseover=function() {
 clearInterval(MyMar);
} 
demo.onmouseout=function() {
 MyMar=setInterval(Marquee,speed);
} 
</script>	   
<jsp:include page="footer.jsp" flush="true"></jsp:include>		 
</body>
</html>
