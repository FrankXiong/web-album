<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="utf-8"%>
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
<body>
<div class="container">
<jsp:include page="header.jsp"/>
<div class="form-wrapper">
<span class="page-album-title">新用户注册</span>  
<div class="mdl-cell mdl-cell--12-col">
    <div class="form-card cards mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
	<form action="userInfoServlet?info=user_reg" method="post" name="form" onSubmit="return checkUser(form)">
	 <div class="form-line">
	 	<span class="form-label">用户名：</span>
        <input name="username" type="text" maxlength="20" title="请输入用户名！" class="input">
     </div>
     <div class="form-line">
     	<span class="form-label">密码：</span>
        <input name="password" type="password" maxlength="20" title="请输入密码！" class="input" >
     </div>
     <div class="form-line">
     	<span class="form-label">确认密码：</span>
        <input name="repassword" type="password" maxlength="20" title="请输入确认密码！" class="input">
     </div>
     <div class="form-line">
    	<span class="form-label">真实姓名：</span>
        <input name="realname" type="text" maxlength="20" title="请输入用户真实姓名！" class="input">
     </div>
     <div class="form-line">
     	<span class="form-label">Email地址：</span>
        <input name="email" type="text" maxlength="20" title="请输入Email地址！" class="input">
     </div>
     <div class="form-line">
     	<span class="form-label">验证问题：</span>
          <select name="question" class="input2">
              <option value="What is your father\'s name">你父亲的姓名</option>
              <option value="What is your mother\'s name">你母亲的姓名</option>
              <option value="Where are you work">您在什么地方工作</option>
              <option value="When is your birthday">您的生日是多少号</option>
          </select>
     </div>
     <div class="form-line">
     	<span class="form-label">答案：</span>
        <input name="result" type="text" maxlength="20" title="请输入问题答案！" class="input">
     </div>
     <div class="form-line">
     	<span class="form-label">验证码：</span>
        <input name="code" type="text" maxlength="20" title="请输入校验码" class="input">
     	<a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a>
     </div>
     <div class="form-submit">   
        <button class="reg-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast" name="Submit" type="submit">注册</button>
        <a class="form-reset" href="#" onclick="javascript:form.reset();">重置</a>
     </div>
	</form>
	
	<c:if test="${requestScope.information!=null}">
     ${requestScope.information}<br><br>
     <a href="userInfoServlet?info=user_login&username=${requestScope.username}">如果要直接登录，请单击此连接</a>
   </c:if>
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />
</div>
</body>
</html>
