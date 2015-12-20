package com.xxr.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FormFilter implements Filter {

	private String encoding=null;//编码格式
    public FormFilter() {
    }

	public void destroy() {
		encoding=null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if(encoding!=null)
		  {
		   request.setCharacterEncoding(encoding);
		   response.setContentType("text/html;charset="+encoding);
		  }
		  chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		encoding=config.getInitParameter("encoding");
	}

}
