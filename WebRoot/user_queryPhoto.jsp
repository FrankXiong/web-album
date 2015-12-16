<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.Photo"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Material风格的图片网站">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Picker</title>

<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/material.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/material.js" type="text/javascript"></script>
<script language="javascript" src="js/js.js" type="text/javascript"></script>

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
   <header><jsp:include page="right.jsp" flush="true" /></header>
   <div class="wrapper">   
       <a href="user_upLoadPhoto.jsp" class="a1">上传图片</a>	  
       <span>查询个人相册</span>    
	   <c:if test="${empty type}">
	      <c:out value="你还没有上传过图片"/>	      
	   </c:if>
	  	  
	   <c:if test="${!empty type}">	         
		  <%
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
   
    	 <b><%=typePhoto[i]%></b>
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
        %>      
   	</c:if>      
</div>
<jsp:include page="down.jsp" flush="true"></jsp:include>
</div>
</body>
</html>
