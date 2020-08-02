<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Login Error page</title>
  <link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<div id="contain">
<div id="header">
<h1 class="style7">ABC Bank</h1>
</div>
<div id="content">
<p style="color: red;">Your are not logged in please choose from the below Options to Continue</p>
<p style="color: blue;">Click Here to Login<br/>  <a href="LoginPage.jsp">Click Here</a></p>
<p style="color: green;">Click here to Register<br/> <a href="RegistorPage.jsp">Click Here</a></p>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>