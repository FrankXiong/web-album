<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.xxr.model.Photo"/>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Material风格的图片网站">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Picker</title>

<link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/material.css" type="text/css" rel="stylesheet" />
<link href="css/responsiveslides.min.css" type="text/css" rel="stylesheet" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<%
  List list=(List)request.getAttribute("list");
  Photo photo=(Photo)list.get(0);
%>

<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
   <%-- <%if(null!=session.getAttribute("userInfo")){ %>      
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
	</div> --%>
	<div class="pic-detail-wrapper">
	<div id="scroll-img">
		<div class="callbacks_container">
		      <ul class="rslides" id="slider">
		        <li>
		          <img src="images/life.jpg" alt="life">
		          <div class="caption">
		          	<h3 class="pic-title">Children</h3>
		          </div>
		          <div class="pic-btn-group">
		          	  <span class="pic-info">上传者：${sessionScope.userInfo.username}</span>
		          	  <span class="pic-info">分类：网页设计</span>
			          <button class="pic-del-btn mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" onClick="delPhoto(this)">
			            <i class="material-icons white">delete</i>
			          </button>
			          <button class="pic-edit-btn mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" onClick="redirectToEdit()">
			            <i class="material-icons white">edit</i>
			          </button>	
			       </div>		      		
		        </li>
		        <li>
		          <img src="images/person.jpg" alt="person">
		          <div class="caption">
		          	<h3 class="pic-title">When u call phone</h3>
		          	
		          </div>
		          <div class="pic-btn-group">
		          	  <span class="pic-info">上传者：${sessionScope.userInfo.username}</span>
		          	  <span class="pic-info">分类：网页设计</span>
			          <button class="pic-del-btn mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
			            <i class="material-icons white">delete</i>
			          </button>
			          <button class="pic-edit-btn mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
			            <i class="material-icons white">edit</i>
			          </button>	
			      </div>
		        </li>
		        <li>
		          <img src="images/sport.jpg" alt="sport">
		          <div class="caption">
		          	<h3 class="pic-title">Beauty of sport</h3>		          	
		          </div>
		          <div class="pic-btn-group">
		          	  <span class="pic-info">上传者：${sessionScope.userInfo.username}</span>
		          	  <span class="pic-info">分类：网页设计</span>
			          <button class="pic-del-btn mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
			            <i class="material-icons white">delete</i>
			          </button>
			          <button class="pic-edit-btn mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
			            <i class="material-icons white">edit</i>
			          </button>	
			      </div>
		        </li>
		      </ul>
	    </div>
	</div>
	</div>
 
<jsp:include page="footer.jsp" flush="true"></jsp:include>	
<script src="js/jquery.min.js"></script>
<script src="js/responsiveslides.min.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>
<script src="js/material.js" type="text/javascript"></script>
<script>
	$(function () {
      $("#slider").responsiveSlides({
        auto: true,
        pager: false,
        nav: true,
        speed: 500,
        namespace: "callbacks"
      });

    });
</script>	 
</body>
</html>
