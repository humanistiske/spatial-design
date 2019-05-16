package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.ProjectDao;


/**
 * Servlet implementation class ViewPhoto
 */
@WebServlet("/viewProjectImages")
public class ViewProjectImages extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
		byte[] photo = new ProjectDao().getProjectImages(Integer.parseInt(request.getParameter("id")));
		response.getOutputStream().write(photo);
	}
}