<%@page import="loginBean.UploadAudit"%>
<%@page import="loginBean.GetDate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>ABC Bank Login</title>
  <link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<jsp:useBean id="upload" class="loginBean.FileUploadingBean" scope="request" ></jsp:useBean>
<jsp:useBean id="audit" class="loginBean.UploadAudit"></jsp:useBean>
<script type="text/javascript">
function checkValue() {
	var cob_date =document.getElementById("CobDate").value;
	if(cob_date =="select")
		alert("please choose Cob date");
	var run_id =document.getElementById("runID").value;
	if(run_id=="0")
		alert("please choose RunID")
}
</script>
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
<h4>Upload the file</h4>
<form id="cobDate" method="post" onsubmit="return false">
<table border="0.25">
	<tr>
	<th>COB date</th>
	<td>
<select name="Cobdate" id="CobDate" onchange="this.form.submit();">
<option value="select">Select</option>
<%
response.setIntHeader("Refresh", 100);
List<GetDate> Cob_date =upload.getDates();
if(Cob_date !=null)
{
Iterator<GetDate> date =Cob_date.iterator();
String temp=null;
while(date.hasNext())
{
	GetDate dt=date.next();
	if(dt.getCob_date().toString().equals(temp))
	{
		continue;
	}
	else
	{
%>
<option value= "<%= dt.getCob_date() %>">
<%
	temp=dt.getCob_date().toString();
	out.print(dt.getCob_date());
	}
%>
</option>
<%  	
}
}
String selectedData =(String)request.getParameter("Cobdate");
if(selectedData!=null && !selectedData.equals("select"))
{
	session.setAttribute("Cobdate",selectedData);
%>
<option disabled="disabled" selected="selected">
<%
	out.print(selectedData);
}
%>
</option>
</select></td></tr>
<tr><th>Run ID</th>
<td>
<select id="runID" name="runID">
<option value="0" selected="selected">Select</option>
<%
String selectedDate =(String)request.getParameter("Cobdate");
if(selectedDate !=null)
{
	if(Cob_date!=null)
	{
		Iterator<GetDate> it=Cob_date.iterator();
		while(it.hasNext())
		{
			GetDate gt=it.next();
			if(gt.getCob_date().toString().equals(selectedDate))
			{
				
%>
<option value="<%= gt.getRunId()%>">
<% 
				out.print(gt.getRunId());
			}
			else
			{
				continue;
			}
%>
</option>
<% 
		}
	}
}
%>
</select>
</td></tr>
</table>
</form>
<form action="UploadServlet.jsp" method="post" enctype = "multipart/form-data">
<table border="0.25" align="left">
<tr>
	<th>Please Select File</th>
	<td><input type="file" id="file" name="file" size="25" required="required"></td>
</tr>
<tr>
	<th></th>
	<th><input type="submit" value="Upload" id="submit" onclick="checkValue()"></th>
</tr>
</table>
</form>

<div align="left">
<p align="left" style="font-size: 14pt; font-style: bold">Audit Details</p>
<table border="3" align="left" cellpadding="5" >
	<tr>
		<th>Audit ID</th>
		<th>User ID</th>
		<th>File Name</th> 
		<th>Status</th>
		<th> Date </th>
	</tr>
<%
List<UploadAudit> au=audit.getAudit();
if(au !=null)
{
	Iterator<UploadAudit> it=au.iterator();
	while(it.hasNext())
	{
		UploadAudit ua=it.next();
		String statusValue =ua.getStatus();
		if(statusValue.equals("S"))
			statusValue="Initiated";
		else if(statusValue.equals("C"))
			statusValue="Completed";
		else if(statusValue.equals("F"))
			statusValue="Failed";
		String [] value ={new Integer(ua.getAuditID()).toString(),ua.getUserName(),ua.getFileName(),statusValue,ua.getUploadDate().toString()};
		out.print("<tr>");
		for (int i=0;i<value.length;i++)
		{
			out.print("<td>");
			out.print(value[i]);
			out.print("</td>");
		}
		out.print("</tr>");
	}
}
%>	
</table>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>