package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beans.User;

public class UserDao 
{
	public boolean checkLogin(final String email, final String password)
	{
		try
		{
			String query = "select * from login where email=? and password=?";
			Connection con = new DatabaseConnect().getConnection();
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1, email);
			pre.setString(2, password);
			ResultSet rs = pre.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public User getLoggedUser(final String email) 
	{
		User u = null;
		
		try
		{
			String query = "SELECT name, email from login where email=?";
			Connection con = new DatabaseConnect().getConnection();
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1, email);
			ResultSet rs = pre.executeQuery();
			
			while(rs.next())
			{
				u = new User();
				u.setName(rs.getString(1));
				u.setEmail(rs.getString(2));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return u;
	}
}
