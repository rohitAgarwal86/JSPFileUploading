<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="RegistorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Action</title>
</head>
<body>
<jsp:useBean id="register" class="loginBean.Register"></jsp:useBean> 
<%
register.setUserName(request.getParameter("uname"));
register.setPassword(request.getParameter("pass"));
register.setEmail(request.getParameter("email"));
register.setFirstName(request.getParameter("fname"));
register.setLastName(request.getParameter("lname"));

String temp =request.getParameter("dob");
if(!temp.isEmpty())
	{
		Date dob= new SimpleDateFormat("YYYY-MM-DD").parse(temp);
		register.setDateOfBirth(dob);
	}
else
	{
		register.setDateOfBirth(null);	
	}

register.setSex(request.getParameter("sex"));
register.setRole(request.getParameter("role"));

boolean status=register.validatedUsername();
if(status)
	{
		session.setAttribute("status", status);
		session.setAttribute("message", "UserId already Exists , choose another one");
%>
<p style="color:Red"> <% out.println("UserId already Exists , choose another one"); %></p>
<%
	}
	else
	{
		status=register.saveUser();
		session.setAttribute("status", status);
		if(status)
		{
			session.setAttribute("message","Register Successfull , Please login to proceed");
%>
<p style="color:Green"><%out.println("Register Successfull , Please login to proceed"); %> 
<a href="LoginPage.jsp">Login</a>
</p>
<%
		}
		
	}
%>	
</body>
</html>