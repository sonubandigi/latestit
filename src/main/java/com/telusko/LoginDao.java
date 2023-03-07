package com.telusko;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao
{
	
public boolean check(String u, String p)
	{
	try {
			String sql="select * from login where uname=? and pass=? ";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/neon","root","1234");
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1,u);
			ps.setString(2,p);
			
			ResultSet rs =ps.executeQuery();			
			
			while(rs.next())
			{
				return true;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}
	
}