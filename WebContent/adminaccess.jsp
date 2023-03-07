<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/neon", "root", "1234");
	String query = "select * from logindemo where email=? and password=?";
	PreparedStatement ps = con.prepareStatement(query);

	ps.setString(1, email);
	ps.setString(2, password);
	ResultSet rs = ps.executeQuery();

	if (rs.next()) {
		// login successful

		response.sendRedirect("newlead.html");
	} else {
		// display error message
		out.println("please enter the valid username and password");
	}

	con.close();
	%>
</body>
</html>