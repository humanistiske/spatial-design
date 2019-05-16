package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnect 
{
	public Connection getConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-02.cleardb.net:3306/heroku_a216ad1612d9c4e", "bcf6e75eb2a987", "06f46e11");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
}
