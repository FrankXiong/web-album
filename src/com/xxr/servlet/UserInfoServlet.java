package com.xxr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xxr.dao.OperationData;
import com.xxr.model.UserInfo;
import com.xxr.utils.EncodeUtil;
import com.xxr.utils.EncryptUtil;

public class UserInfoServlet extends HttpServlet {
	private String info = null;
	private OperationData data = null; 

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		if (info.equals("user_reg")) {
			this.userReg(request, response);
		}
		if (info.equals("user_check")) {
			this.userCheck(request, response);
		}
		if (info.equals("user_logout")) {
			this.userLogout(request, response);
		}
		if (info.equals("user_login")) {
			this.userLogin(request, response);
		}
	}

	private void userLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData(); 
		String username = EncodeUtil.toChinese(request
				.getParameter("username")); 
		UserInfo userInfo = data.userQuery(username); 
		request.getSession().setAttribute("userInfo", userInfo); 
		request.getRequestDispatcher("index.jsp").forward(request, response); 
	}

	private void userLogout(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (null != request.getSession().getAttribute("userInfo")) {
			request.getSession().invalidate();
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void userCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		String username = EncodeUtil.toChinese(request
				.getParameter("username"));
		String password = EncryptUtil.MD5(request
				.getParameter("password")); 
		UserInfo userInfo = data.userQuery(username); 
		String code = request.getParameter("code"); 
		String codeSession = (String) request.getSession().getAttribute("rand"); 
		if (code.equals(codeSession)) {
			if (null != userInfo) {				
				if (userInfo.getPassword().equals(password)) {
					request.getSession().setAttribute("userInfo", userInfo);
				}
			}
		}

		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void userReg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		data = new OperationData();
		UserInfo userInfo = new UserInfo();
		userInfo.setUsername(request
				.getParameter("username")); 
		userInfo.setPassword(EncryptUtil.MD5(request
				.getParameter("password"))); 
		userInfo.setRealname(request
				.getParameter("realname")); 
		userInfo.setEmail(request.getParameter("email")); 
		userInfo.setQuestion(request
				.getParameter("question")); 
		userInfo.setResult(request
				.getParameter("result")); 
		String information = "";
		String code = request.getParameter("code"); 
		String codeSession = (String) request.getSession().getAttribute("rand"); 
		if (code.equals(codeSession)) { 
			if (!data.userSave(userInfo)) { 
				information = "注册失败";
			}
			else {
				information = "注册成功";
			}
		}
		if (information.equals("")) { 
			String username = EncodeUtil.toChinese(request
					.getParameter("username"));
			request.setAttribute("information", information); 
			request.setAttribute("username", username); 
			request.getRequestDispatcher("user_reg.jsp").forward(request,
					response);
		}
		out.print("<script language=javascript>alert('" + "success!"
				+ "');history.go(-1);</script>"); 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}

}
