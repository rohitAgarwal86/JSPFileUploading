<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>test</title>
</head>
<body>
<%
String url=null;
String url2=request.getRequestURL().toString();

int lastIndex=url2.lastIndexOf('/');
url=url2.substring(0, lastIndex+1);
out.print(url);
out.print(url2);
%>
</body>
</html>