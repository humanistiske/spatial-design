package com.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.dao.UserDao;

/**
 * Servlet Filter implementation class LoginAuthentication
 */
@WebFilter("/login")
public class LoginAuthentication implements Filter {

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		String email = request.getParameter("formEmail");
		String password = request.getParameter("formPassword");
		if(new UserDao().checkLogin(email, password))
			chain.doFilter(request, response);
		else
		{
			request.setAttribute("error", "true");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {}
}
