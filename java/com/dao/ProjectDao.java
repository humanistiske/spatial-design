package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.Part;
import com.beans.Project;

public class ProjectDao 
{	
	public int addImages(final List<Part> list)
	{
		int count = 0;
		int id = getCount();
		try
		{
			Connection con = new DatabaseConnect().getConnection();
			String query = "insert into project_images values(?,?)";
			PreparedStatement pre = con.prepareStatement(query);
			
			for(Part part : list)
			{
				pre.setInt(1, id);
				pre.setBlob(2, new javax.sql.rowset.serial.SerialBlob(part.getInputStream().readAllBytes()));
				pre.addBatch();
			}
			pre.executeBatch();
			count++;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int addProject(final Project project, List<Part> list)
	{
		int count = 0;
		int id = getCount();
		try
		{
			Connection con = new DatabaseConnect().getConnection();
			String query = "insert into projects values(?,?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, id);
			pre.setString(2, project.getName());
			pre.setString(3, project.getDescription());
			pre.setString(4, project.getCategory());
			pre.setBlob(5, new javax.sql.rowset.serial.SerialBlob(project.getPhoto()));
			
			addImages(list);
			
			count = pre.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}

	private int getCount() 
	{
		int count = 0;
		try
		{
			Connection con = new DatabaseConnect().getConnection();
			String query = "select count(*) from projects";
			PreparedStatement pre = con.prepareStatement(query);
			ResultSet rs = pre.executeQuery();
			
			while(rs.next())
			{
				count = rs.getInt(1) + 1;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}
	
	public byte[] getProjectPic(final int projectId)
	{
		byte[] photo = null;
		
		try
		{
			String query = "select photo from projects where id = ?";
			Connection con = new DatabaseConnect().getConnection();
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, projectId);
			ResultSet rs = pre.executeQuery();
			
			while(rs.next())
			{
				photo = rs.getBytes(1);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return photo;
	}
	
	public byte[] getProjectImages(final int projectId)
	{
		byte[] photo = null;
		
		try
		{
			String query = "select images from project_images where id = ?";
			Connection con = new DatabaseConnect().getConnection();
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, projectId);
			ResultSet rs = pre.executeQuery();
			
			while(rs.next())
			{
				photo = rs.getBytes(1);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return photo;
	}
}
