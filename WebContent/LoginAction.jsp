<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Login Action Page</title>
  <link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<jsp:useBean id="login" class="loginBean.Login"></jsp:useBean>
<%
 login.setUserName(request.getParameter("uname"));
 login.setPassword(request.getParameter("pass"));
 boolean status=login.validateLogin();
 
 String serverURL=request.getRequestURL().toString();
 int lastIndex=serverURL.lastIndexOf('/');
 String serverAddr=serverURL.substring(0, lastIndex+1);
 
 if(status)
 {
	 serverAddr=serverAddr+"Welcome.jsp";
	 session =request.getSession();
	 session.setAttribute("uname", login.getUserName());
	 response.sendRedirect(serverAddr);
 }
 else
 {
	 serverAddr=serverAddr+"LoginError.jsp";
	 response.sendRedirect(serverAddr);
 }

%>
</body>
</html>