<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>ABC Bank Login</title>
  <link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<div id="contain">
<div id="header">
<h1 class="style7">ABC Bank</h1>
</div>
<div id="leftcol">
<h3>Links</h3>
<div id="navcontainer">
<ul id="navlist">
	<li><a href="RegistorPage.jsp" >Registor Page</a></li>
	<li><a href="Index.jsp" >Home</a></li>
	<li><a href="" >Contact Us</a></li>   
</ul>
    </div>
</div>
<div id="content">
<h4> Welcome</h4>
<p>Welcome to ABC Bank</p>
<br />
<p>&nbsp;</p>
<p>Please Enter the Login Details to continue</p>
<p>&nbsp;</p>
<form action="LoginAction.jsp" method="post" id="login" name="Login">
<table>
	<tr>
		<th><label>UserName</label></th>
		<td><input type="text" id="uname" name="uname" required="required"></td>
	</tr>
	<tr>
		<th><label>Password</label></th>
		<td><input type="password" id="pass" name="pass" required="required"></td>
	</tr>
	<tr>
		<th></th>
		<td><input type="submit" value="Login">
		<input type="button" value="Cancel" onclick="resetForm();">
		</td>
	</tr>
</table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>