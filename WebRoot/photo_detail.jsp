<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
<script src="js/main.js" type="text/javascript"></script>
<script src="js/material.js" type="text/javascript"></script>

<%
Photo photo=(Photo)request.getAttribute("photo");
%>
<body>
	<jsp:include page="header.jsp" flush="true" />
 
  	  <a href="#" class="a3" onclick="images11.src='${requestScope.photo.photoAddress}'">查看源相片</a>
      <img src="<%=photo.getPhotoAddress()%>" height="450" width="600" id="images">
      <b>相片信息</b>
       <p>相片名称：<%=photo.getPhotoName()%></p>
       <p>相册名称：<%=photo.getPhotoType()%></p>
       <p>相片大小：<%      
       float size = Integer.valueOf(photo.getPhotoSize()) /1024;
       out.print(size);          
       %>KB</p>
       <p>上传时间：<%=photo.getPhotoTime()%></p>
       <p>上传用户：<%=photo.getUsername()%></p>
	  
	   <%if(null!=session.getAttribute("userInfo")){ %>
	       <c:if test="${requestScope.photo.username==sessionScope.userInfo.username}">
	   <a href="photoServlet?info=user_delete&id=${requestScope.photo.id}">删除此相片</a>
	   <span>${requestScope.information}</span>
		   </c:if>		
	<%} %>
		
    <jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
