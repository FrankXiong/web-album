<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.tools.Encrypt"/>
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
<link href="css/upload.css" type="text/css" rel="stylesheet" />
<link href="css/material.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="js/js.js" type="text/javascript"></script>
<script language="javascript" src="js/material.js" type="text/javascript"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<c:if test="${sessionScope.userInfo==null}">
    <%response.sendRedirect("index.jsp");%>
</c:if>


<script type="text/javascript">
    function addMore(){
    var td = document.getElementById("more");
    var br= document.createElement("br");
    var input= document.createElement("input");
    var button= document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除...";
    
    
    button.onclick = function(){
      td.removeChild(br);
      td.removeChild(input);
      td.removeChild(button);
    }
   
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
    }
</script>
 
<body>
<div class="container">

   <header><jsp:include page="right.jsp" flush="true" /></header>
   <div class="wrapper">
	   <div class="mdl-cell mdl-cell--12-col">
    	<div class="cards">
    		<div class="poster mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
	   <table width="753" height="54" border="0" align="center" cellpadding="0" cellspacing="0">
	     <tr>
	       <td height="51"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
	         <tr>
	           <th width="287" height="33" align="center" valign="bottom">上传图片</th>
	         </tr>
	       </table></td>
	     </tr>
	   </table>
   
   
   
   
   <table width="753" height="504" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr>
       <td height="120" align="center" valign="top">    
	   
	      
	   <form action="photoServlet?info=userUploadPhoto" method="post" enctype="multipart/form-data" name="form" onSubmit="return checkPhoto(form)">
	     <table width="525" border="0">
         <tr>
           <td width="75" height="20"><b>相片名称：</b></td>
           <td width="434"><input name="photoName" type="text" maxlength="20"></td>
         </tr>
         <tr>
           <td height="20"><b>相片类型：</b></td>
           <td>
             <select name="photoType">
			    <option value="网页设计">网页设计</option>
			    <option value="海报">海报</option>
			    <option value="人物">人物</option>
			    <option value="漫画">漫画</option>
			    <option value="生活">生活</option>
			    <option value="风景">风景</option>
             </select>
		   </td>
         </tr>
         <tr>
           <td height="20"><b>上传时间：</b></td>
           <td><%=Encrypt.currentlyTime()%><input name="photoTime" type="hidden" value="<%=Encrypt.currentlyTime()%>"></td>
         </tr>
         <tr>
           <td height="20"><b>相片位置：</b></td>
           <td id="more"><input name="file" type="file" maxlength="20"><input type="button" name="more.." value="增加..." onClick="addMore()"></td>
         </tr>
         <tr>
           <td height="20"><b>上传用户：</b></td>
           <td>${sessionScope.userInfo.username}<input name="username" type="hidden" value="${sessionScope.userInfo.username}" class="input2"></td>
         </tr>
         <tr>
           <td height="20"><b>验&nbsp;证&nbsp;码：</b></td>
           <td><input name="code" type="text" maxlength="20"></td>
         </tr>
         <tr>
           <td height="20">&nbsp;</td>
           <td><a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a></td>
         </tr>
         <tr>
           <td height="20">&nbsp;</td>
           <td>             
               <input type="submit" name="Submit" value="上传" >
             &nbsp;&nbsp;
               <input type="reset" name="Submit2" value="重置">
             &nbsp;&nbsp;
               <input type="button" name="Submit3" value="返回" onClick="javascript:window.location.href='photoServlet?info=userQueryPhoto';">
            </td>
         </tr>         
       </table>	   
	 </form>	 
	<b> 注意：图片的格式只能为：“jpg”、“gif”、“bmp”格式<br><br>
	 ${requestScope.information}</b>
       </td>
     </tr>
</table>
	</div>
	</div>
	</div>
</div>
<jsp:include page="down.jsp" flush="true"></jsp:include>

</div>
</body>
</html>
