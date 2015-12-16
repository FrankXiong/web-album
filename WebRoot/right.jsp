<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div class="android-header mdl-layout__header mdl-layout__header--waterfall">
        <div class="mdl-layout__header-row">
          <span class="android-title mdl-layout-title">
            Picker
          </span>
          <!-- Add spacer, to align navigation to the right in desktop -->
          <div class="android-header-spacer mdl-layout-spacer"></div>
          
          
      <c:if  test="${empty sessionScope.userInfo}">	
		<form name="userInfo" method="post" action="userInfoServlet?info=checkUser" onSubmit="return checkEmpty(userInfo)">
		  <span>用户名：</span>
	      <input name="username" type="text" size="15" title="请输入用户名" class="input">
	       <span>密码：</span>
	      <input name="password" type="password" size="15" title="请输入密码" class="input">
	       <span>验证码：</span>
	      <input name="code" type="text" size="15" title="请输入校验码" class="input">       
	      <a href="#" onClick="reload()"><img border=0 src="image.jsp" name="checkCode"></a>        
			<input class="login-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast" type="submit" name="Submit" value="登录">          
			<a href="user_save.jsp">注册</a>
		</form>	
	</c:if>

	<c:if  test="${!empty sessionScope.userInfo}">
	 <p>${sessionScope.userInfo.username}登录成功！</p>
	 <p><a href="userInfoServlet?info=cannleUser">退出</a></p>
	</c:if>
	
	<!-- Navigation -->
          <div class="android-navigation-container">
            <nav class="android-navigation mdl-navigation">
              <a class="mdl-navigation__link mdl-typography--text-uppercase" href="index.jsp">首页</a>
              <!-- <a class="mdl-navigation__link mdl-typography--text-uppercase" href="photoServlet?info=userQueryPhoto">我的相册</a>
               -->
              <c:if test="${sessionScope.userInfo==null}">
		          <a class="mdl-navigation__link mdl-typography--text-uppercase" href="#" onclick="javascript:checkUserInfo()" title="请您先登录">我的相册</a>
		      </c:if>
		      <c:if test="${sessionScope.userInfo!=null}">
		          <a class="mdl-navigation__link mdl-typography--text-uppercase" href="photoServlet?info=userQueryPhoto">我的相册</a>
		      </c:if>	
            </nav>
          </div>
</div>

