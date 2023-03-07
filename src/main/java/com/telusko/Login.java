package com.telusko;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.telusko.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
              String uname = request.getParameter("uname");
              String pass = request.getParameter("pass");
              
              
              HttpSession session = request.getSession();
        	  session.setAttribute("username",uname);
        	  
        	  LoginDao dao = new LoginDao();
        	  
              if(dao.check(uname,pass))
              {  
            	  response.sendRedirect("admin.html");
              }

              else
              {
            	  response.sendRedirect("login.html");
              }
		
		
	}}