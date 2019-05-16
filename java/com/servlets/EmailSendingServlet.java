package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utilities.EmailUtility;

@WebServlet("/email")
public class EmailSendingServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String from = "info@farintsol.com";
		String password = "Iamgod@101";
		List<String> to = new ArrayList<>();
		to.add("info@farintsol.com");
		String subject = request.getParameter("formName") + ": " + request.getParameter("formSubject");
		String text = "From: " + request.getParameter("formEmail") + "<br>" + request.getParameter("formMessage");
		
		if(new EmailUtility().sendMail(from, password, to, subject, text))
		{
			response.sendRedirect("contact.jsp?error=false");
		}
		else
		{
			response.sendRedirect("contact.jsp?error=true");
		}
	}
}