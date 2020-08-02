<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>ABC Bank Login</title>
  <link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<%
session =request.getSession(false);
if(session.isNew())
{
	response.sendRedirect("LoginSessionTimeout.jsp");
}
%>
<body>
<div id="contain">
<div id="header">
<h1 class="style7">ABC Bank</h1>
</div>
<div id="leftcol">
<h3>Links</h3>
<div id="navcontainer">
<ul id="navlist">
	<li><a href="UploadFile.jsp" >Upload File</a></li>
	<li><a href="" >Trigger Calculation</a></li>
	<li><a href="" >Logout</a></li>   
</ul>
    </div>
</div>
<div id="content">
<h4> Welcome
<%
if(session != null)
{
String name =(String)session.getAttribute("uname");
if(name !=null)
	name =name.toUpperCase();
	out.print(name);
}
%>
</h4>
<br />
<p>&nbsp;</p>
<p>Please Choose from the option available in the side</p>
<p>&nbsp;</p>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>