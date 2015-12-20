<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,com.xxr.model.*" errorPage="" %>

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
<script src="js/main.js" type="text/javascript"></script>
<script src="js/material.js" type="text/javascript"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" scope="page" class="com.xxr.dao.OperationData"></jsp:useBean>
</head>

<body>
<div class="container">
<jsp:include page="header.jsp" flush="true" />
<div class="wrapper">      
	<span class="page-album-title">所有图片</span>
<%-- <%
List<Photo> list1=(List<Photo>)request.getAttribute("list");
int a=0;
for(Photo photo1:list1){
%>
   <%=photo1.getPhotoType()%>
   <a href="photoServlet?info=queryPhotoList&type=<%=photo1.getPhotoType()%>">更多</a>
    <%
  List<Photo> list2=dao.photo_queryList("photoType='"+photo1.getPhotoType()+"'");
  int b=0;
  for(Photo photo2:list2){
  %>
    <a href="photoServlet?info=queryOnePhoto&id=<%=photo2.getId()%>"><img src="<%=photo2.getSmallPhoto()%>"  class="cannelBorder"></a>
    <% 
  b++;
  if(b==3)
  break;  }
  if(list2.size()<3){  
  for(int i=0;i<3-list2.size();i++){  %>
    <%}
  } %>
<%
a++;
if(a==3)
break;
} %> --%>
<div class="mdl-grid">
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="web-design mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">网页设计</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=web design" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="poster mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">海报</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=poster" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="person mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">人物</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=person" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>   
    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="carton mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">漫画</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=carton" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
    
    
    
    
    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="life mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">生活</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=life" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="icon mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">图标</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=icon" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="sport mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">运动</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=sport" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>   
    
    <div class="mdl-cell mdl-cell--3-col">
    	<div class="cards">
			<div class="blackwhite mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
              <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                <h2 class="mdl-card__title-text">黑白</h2>
              </div>
              <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                收录当下网页设计佳作
              </div>
              <div class="mdl-card__actions mdl-card--border">
                <a href="photoServlet?info=queryPhotoList&type=blackwhite" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
</div>
		
		
</div>
<jsp:include page="footer.jsp" flush="true" />
</div>
</body>
</html>
