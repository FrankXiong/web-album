package com.wy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wy.dao.OperationData;
import com.wy.form.UserInfo;

public class UserInfoServlet extends HttpServlet {
	private String info = null;

	private OperationData data = null; 

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		if (info.equals("saveUser")) {
			this.user_save(request, response);
		}
		if (info.equals("checkUser")) {
			this.user_check(request, response);
		}
		if (info.equals("cannleUser")) {
			this.user_cannle(request, response);
		}
		if (info.equals("userLand")) {
			this.user_land(request, response);
		}
	}

	private void user_land(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData(); 
		String username = com.wy.tools.Encrypt.toChinese(request
				.getParameter("username")); 
		UserInfo userInfo = data.user_query(username); 
		request.getSession().setAttribute("userInfo", userInfo); 
		request.getRequestDispatcher("index.jsp").forward(request, response); 
	}

	private void user_cannle(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (null != request.getSession().getAttribute("userInfo")) {
			request.getSession().invalidate();
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void user_check(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		String username = com.wy.tools.Encrypt.toChinese(request
				.getParameter("username"));
		String password = com.wy.tools.Encrypt.encode(request
				.getParameter("password")); 
		UserInfo userInfo = data.user_query(username); 
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

	private void user_save(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		data = new OperationData();
		UserInfo userInfo = new UserInfo();
		userInfo.setUsername(com.wy.tools.Encrypt.toChinese(request
				.getParameter("username"))); 
		userInfo.setPassword(com.wy.tools.Encrypt.encode(request
				.getParameter("password"))); 
		userInfo.setRealname(com.wy.tools.Encrypt.toChinese(request
				.getParameter("realname"))); 
		userInfo.setEmail(request.getParameter("email")); 
		userInfo.setQuestion(com.wy.tools.Encrypt.toChinese(request
				.getParameter("question"))); 
		userInfo.setResult(com.wy.tools.Encrypt.toChinese(request
				.getParameter("result"))); 
		String information = "";
		String code = request.getParameter("code"); 
		String codeSession = (String) request.getSession().getAttribute("rand"); 
		if (code.equals(codeSession)) { 
			if (!data.user_save(userInfo)) { 
				information = "注册失败";
			}
		} else {
			information = "注册成功";
		}
		if (information.equals("")) { 
			information = "注册信息不能为空";
			String username = com.wy.tools.Encrypt.toChinese(request
					.getParameter("username"));
			request.setAttribute("information", information); 
			request.setAttribute("username", username); 
			request.getRequestDispatcher("user_save.jsp").forward(request,
					response);
		}
		out.print("<script language=javascript>alert('" + information
				+ "');history.go(-1);</script>"); 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}

}
