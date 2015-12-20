<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="utf-8" %>
<jsp:directive.page import="com.xxr.utils.EncryptUtil"/>
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
</head>
<c:if test="${sessionScope.userInfo==null}">
    <%
    	response.sendRedirect("index.jsp");
    %>
</c:if>

<body>
<div class="container">
<jsp:include page="header.jsp" flush="true" />
   <div class="form-wrapper">
   		<span class="page-album-title">编辑图片信息</span>
	 <div class="mdl-cell mdl-cell--12-col">
	<div class="form-card cards mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
	          
	 <form action="#" method="post" enctype="multipart/form-data" name="form" onSubmit="return checkPhoto(form)">
	 	<input name="username" value="${sessionScope.userInfo.username}"  type="text" style="display:none">
	    <div class="form-line">
	     	<span>相片名称:</span>
	     	<input class="input" name="photoName" type="text" maxlength="20">
	    </div>
     	<div class="form-line">
        	<span>相片类型:</span>
            <select name="photoType">
			    <option value="web design">网页设计</option>
			    <option value="poster">海报</option>
			    <option value="person">人物</option>
			    <option value="carton">漫画</option>
			    <option value="life">生活</option>
			    <option value="beauty">风景</option>
            </select>
         </div>
         <div class="form-line">
	  		<span>上传时间：</span>
         	<span class="time-txt"><%=EncryptUtil.currentlyTime()%></span><input name="photoTime" type="hidden" value="<%=EncryptUtil.currentlyTime()%>">
         </div>
        <div class="form-submit">        
            <button class="upload-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast" onClick="updatePhoto()">上传</button>
            <a class="form-reset" href="#" onclick="javascript:form.reset();">重置</a>
	 	</div>
	 </form>	 
	<p class="hint-txt"> 注意：图片的格式只能为：“jpg”、“gif”、“bmp”、“png”<br>
	${requestScope.information}</p>
	</div>
	</div>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</div>
</body>
</html>
