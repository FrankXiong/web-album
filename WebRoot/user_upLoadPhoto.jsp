<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="GB2312" %>
<jsp:directive.page import="com.wy.tools.Encrypt"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Material����ͼƬ��վ">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Picker</title>

<link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/upload.css" type="text/css" rel="stylesheet" />
<link href="css/material.css" type="text/css" rel="stylesheet" />
<script src="js/main.js" type="text/javascript"></script>
<script src="js/material.js" type="text/javascript"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<c:if test="${sessionScope.userInfo==null}">
    <%response.sendRedirect("index.jsp");%>
</c:if>

<body>
<div class="container">
<header><jsp:include page="header.jsp" flush="true" /></header>
   <div class="upload-wrapper">
	 <div class="mdl-cell mdl-cell--12-col">
    		<div class="cards mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
	          <div class="form-title"><span>�ϴ�ͼƬ</span></div>
	 <form action="photoServlet?info=userUploadPhoto" method="post" enctype="multipart/form-data" name="form" onSubmit="return checkPhoto(form)">
	 	<input name="username" value="${sessionScope.userInfo.username}"  type="text" style="display:none">
	    <div class="form-line">
	     	<span>��Ƭ����:</span>
	     	<input name="photoName" type="text" maxlength="20">
	    </div>
     	<div class="form-line">
        	<span>��Ƭ����:</span>
            <select name="photoType">
			    <option value="web design">��ҳ���</option>
			    <option value="poster">����</option>
			    <option value="person">����</option>
			    <option value="carton">����</option>
			    <option value="life">����</option>
			    <option value="beauty">�羰</option>
            </select>
         </div>
         <div class="form-line">
	  		<span>�ϴ�ʱ�䣺</span>
         	<%=Encrypt.currentlyTime()%><input name="photoTime" type="hidden" value="<%=Encrypt.currentlyTime()%>">
         </div>
        <div class="form-line" id="more">
        	<span>��Ƭλ�ã�</span>
        	<input name="file" type="file" maxlength="20">
        	<input type="button" name="more.." value="����..." onClick="addMore()">
        </div>
        <!-- <div class="form-line">
       		<span>��֤��:</span>
         	<input name="code" type="text" maxlength="20">  
         	<a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a>   
         </div> -->
        <div class="form-line form-submit">        
            <input class="input mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast" type="submit" name="Submit" value="�ϴ�" >
            <input class="reset-btn" href="#" type="reset" name="Submit2" value="����">
	 	</div>
	 </form>	 
	<p class="hint-txt"> ע�⣺ͼƬ�ĸ�ʽֻ��Ϊ����jpg������gif������bmp����ʽ<br>
	${requestScope.information}</p>
	</div>
	</div>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>
</div>
</body>
</html>
