<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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

<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/user-album.css" type="text/css" rel="stylesheet" />
<link href="css/material.css" type="text/css" rel="stylesheet" />

<script language="javascript" src="js/material.js" type="text/javascript"></script>
<script language="javascript" src="js/main.js" type="text/javascript"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<%
if(null==session.getAttribute("userInfo")){
response.sendRedirect("index.jsp");
}
%>

<body>
<div class="container">
   <jsp:include page="header.jsp" flush="true" />
   <div class="wrapper">   
   		<span class="page-album-title">我的相册</span>
       <a href="user_upload.jsp" class="page-album-upload-btn">上传图片</a>	  
       
	   <c:if test="${empty type}">
	      <c:out value="你还没有上传过图片"/>	      
	   </c:if>
	  	  
	   <c:if test="${!empty type}">	         
		  <%-- <%
		  String[] typePhoto=(String[])request.getAttribute("type");
		  int  lineCount=5;
		  int  typeLength=typePhoto.length;
		  int  rowCount=typeLength/lineCount;
		  if(typeLength%lineCount!=0){
			  rowCount++;
		  }
		  List list=(List)request.getAttribute("list");
		  %>
           
	      <%
	       for(int i=0;i<typeLength;i++){ 
	      %>           
     
	      <%
	        for(int j=0;j<list.size();j++){
	        	Photo photo=(Photo)list.get(j);
	        	if(photo.getPhotoType().equals(typePhoto[i])){
	      %>
       	  <a href="photoServlet?info=queryPhotoList&type=<%=photo.getPhotoType()%>">	   
			<img src="<%=photo.getSmallPhoto()%>">
	      </a>
    	  <%
       		break;
        	} }%>
   
    		<%=typePhoto[i]%>
           <%
            if(i%lineCount==lineCount-1){
             	  
             out.print("</tr><tr>");             	  
           }
         }  
      
         if(rowCount*lineCount-typeLength>0){
        	int overCount=rowCount*lineCount-typeLength;
        	  for(int j=0;j<overCount;j++){
              out.print("<td align=center width=155>&nbsp;</td>");
        	  }
        }
        %>       --%>
        
        <!-- album list -->
        <div class="mdl-grid page-album-list">
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
                <a href="photoServlet?info=user_gallery&type=web design" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=poster" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=person" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=carton" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=life" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=icon" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=sport" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
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
                <a href="photoServlet?info=user_gallery&type=blackwhite" class="mdl-button mdl-js-button mdl-js-ripple-effect">了解更多</a>
              </div>
            </div>
        </div>
    </div>    
</div>
<!--album  list-->
   	</c:if>      
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</div>
</body>
</html>
