<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>ABC Bank Register User</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
String key="message";
String message =null;
session.setAttribute(key,message);

String Status="status";
boolean validationStatus=false;
session.setAttribute(Status, validationStatus);
%>
<div id="contain">
<div id="header">
<h1 class="style7">Register Page</h1>
</div>
<div id="leftcol">
<h3>Links</h3>
<div id="navcontainer">
<ul id="navlist">
	<li><a href="Index.jsp" >Home Page</a></li>
</ul>
    </div>
</div>
<div id="content">
<h3>Enter User Details</h3>
<form id="Reg" action="RegisterAction.jsp" method="post">
<table>
<tr>
	<td style="bold">UserName :*</td> 
	<td><input type="text" id="uname" name="uname" required ="required" maxlength="20"> </td>
</tr>
<tr>
	<td style="bold">Password :* </td>
	<td><input type="password" id="pass" name="pass" required ="required" maxlength="20"></td>
</tr>
<tr>
	<td style="bold">Email :* </td>
	<td><input type="text" id="email" name="email" required ="required" maxlength="50"></td>
</tr>
<tr>
	<td style="bold">First-Name :* </td>
	<td><input type="text" id="fname" name="fname" required="required" maxlength="50"></td>
</tr>
<tr>
	<td style="bold">Last-Name :* </td>
	<td><input type="text" id="lname" name="lname" required ="required" maxlength="50"></td>
</tr>
<tr>
	<td>Date Of Birth : </td>
	<td><input type="date" id="dob" name="dob"></td>
</tr>
<tr>
	<td>Sex : </td>
	<td>Male  :<input type="radio" id="sex" name="sex" value="Male">
		Female:<input type="radio" id="sex" name="sex" value="Female"></td>
</tr>	
<tr>
	<td>Role :* </td>
	<td>
	<select id="role" name="role" required="required">
		<option></option>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/transaction?user=root&password=rhtaaa@86");
		Statement smt =con.createStatement();
		ResultSet res= smt.executeQuery("select distinct role_name from user_roles");
		while(res.next())
		{
			out.print("<option>");
			out.print(res.getString("role_name"));
			out.print("</option>");
		}
	}
catch(Exception e)
{
	e.printStackTrace();
}
%> 
</select>
</td>
<tr>
	<th></th> 
	<th><input type="submit" name="submit" value="Register"></th>
</table>
</form>
<!--Non usable code at present -->
<% 
boolean afterstatus=(boolean)session.getAttribute("status");
if(afterstatus)
{
	out.println(session.getAttribute("message"));
}
else
{
	String newMessage=(String)session.getAttribute("message");
	if(newMessage!=null)
	{
		out.println(newMessage);
		
	}
}

%>
</div>
<div id="footer">
<p class="style5 style6">Copyright © 2017 | All Rights Reserved  </p>
</div>
</div>
</body>
</html>