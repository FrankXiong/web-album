<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="753" height="237" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="681" height="222" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="222" valign="bottom">
		<a href="index.jsp" class="a1">首页</a>
		
         <c:if test="${sessionScope.userInfo==null}">
            <a href="#" onclick="javascript:checkUserInfo()" title="请您先登录" class="a1">我的相册</a>
         </c:if>
         <c:if test="${sessionScope.userInfo!=null}">
             <a href="photoServlet?info=userQueryPhoto" class="a1">我的相册</a>
         </c:if>
								
											 
		</td>
      </tr>
    </table></td>
  </tr>
</table>