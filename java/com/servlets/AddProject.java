package com.servlets;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.beans.Project;
import com.dao.ProjectDao;

/**
 * Servlet implementation class AddProject
 */
@WebServlet("/addProject")
@MultipartConfig
public class AddProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Project project = new Project();
		project.setName(request.getParameter("formName"));
		project.setDescription(request.getParameter("formDescription"));
		project.setCategory(request.getParameter("formCategory"));
		Part photo = request.getPart("formPhoto");
		project.setPhoto(photo.getInputStream().readAllBytes());
		List<Part> list = request.getParts().stream().filter(part -> "formImages".equals(part.getName())).collect(Collectors.toList());
		
		if(new ProjectDao().addProject(project, list) > 0)
		{
			response.sendRedirect("addProject.jsp?error=false");
		}
		else
		{
			response.sendRedirect("addProject.jsp?error=true");
		}
	}

}
