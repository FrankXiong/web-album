<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
<script language="javascript" src="js/main.js" type="text/javascript"></script>
<script language="javascript" src="js/material.js" type="text/javascript"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>


<table width="753" height="46" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="753" height="56" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td valign="top"><table width="287" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <th width="287" height="33" align="center" valign="bottom">新用户注册</th>
      </tr>
    </table></td>
  </tr>
</table>
<table width="753" height="494" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="393" align="center" valign="top">

<br><br>
	<form action="userInfoServlet?info=saveUser" method="post" name="form" onSubmit="return checkUser(form)">
	  <table width="439" border="0" align="center">
      <tr>
        <td width="92" height="30">用户名：</td>
        <td width="337"><input name="username" type="text" maxlength="20" title="请输入用户名！" class="input2"></td>
      </tr>
      <tr>
        <td height="30">密码：</td>
        <td><input name="password" type="password" maxlength="20" title="请输入密码！" class="input2" ></td>
      </tr>
      <tr>
        <td height="30">确认密码：</td>
        <td><input name="repassword" type="password" maxlength="20" title="请输入确认密码！" class="input2"></td>
      </tr>
      <tr>
        <td height="30">真实姓名：</td>
        <td><input name="realname" type="text" maxlength="20" title="请输入用户真实姓名！" class="input2"></td>
      </tr>
      <tr>
        <td height="30">Email地址：</td>
        <td><input name="email" type="text" maxlength="20" title="请输入Email地址！" class="input2"></td>
      </tr>
      <tr>
        <td height="30">问题：</td>
        <td>
          <select name="question" class="input2">
              <option value="您的父亲叫什么名字">您的父亲叫什么名字</option>
              <option value="您的母亲叫什么名字">您的母亲叫什么名字</option>
              <option value="您在什么地方工作">您在什么地方工作</option>
              <option value="您的生日是多少号">您的生日是多少号</option>
          </select>
        </td>
      </tr>
      <tr>
        <td height="30">答案：</td>
        <td><input name="result" type="text" maxlength="20" title="请输入问题答案！" class="input2"></td>
      </tr>
      <tr>
        <td height="30">校验码：</td>
        <td><input name="code" type="text" maxlength="20" title="请输入校验码" class="input2"></td>
      </tr>
      <tr>
        <td height="30">&nbsp;</td>
        <td><a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a></td>
      </tr>
	   <tr>
        <td height="50">&nbsp;</td>
        <td>               
            <button name="Submit" type="submit" class="cannelBorder">注册</button>
            <button onclick="javascript:form.reset();">重置</button>
        </td>
      </tr>	
    </table>
	</form>
	<br><br><br>
	<c:if test="${requestScope.information!=null}">
     ${requestScope.information}<br><br>
     <a href="userInfoServlet?info=userLand&username=${requestScope.username}">如果要直接登录，请单击此连接</a>
   </c:if>
	</td>
  </tr>
</table>

<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
