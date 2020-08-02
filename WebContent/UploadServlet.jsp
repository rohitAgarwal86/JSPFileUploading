<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FileUpload Servlet</title>
</head>
<%
session =request.getSession(false);
if(session.isNew())
{
	response.sendRedirect("LoginSessionTimeout.jsp");
}
%>
<body>
<jsp:useBean id="audit" class="loginBean.UploadAudit" scope="request"></jsp:useBean>
<jsp:useBean id="save" class="loginBean.FileUploadingBean" scope="request"></jsp:useBean>
<%
if(session !=null)
{
	audit.setUserName((String)session.getAttribute("uname"));
}
 File file;
 String runId ="1";
 int maxFileSize =5000*1024;
 int maxMemSize =5000*1024;
 ServletContext context=pageContext.getServletContext();
 String filePath =context.getInitParameter("file-upload");
 String filePathTemp =context.getInitParameter("temp-file");
 
 
 String type =request.getContentType();
 int a = type.indexOf("multipart/form-data");
 if(a >= 0)
 {
	 DiskFileItemFactory factory= new DiskFileItemFactory();
	 factory.setSizeThreshold(maxMemSize);
	 
	 factory.setRepository(new File(filePathTemp));
	 
	 ServletFileUpload upload =new ServletFileUpload(factory);
	 upload.setSizeMax(maxFileSize);
	 
	 try
	 {
		List<FileItem> files =upload.parseRequest(request);
		if(files !=null)
		{
			Iterator<FileItem> it=files.iterator();
			FileItem item=null;
			while(it.hasNext())
			{
				item=(FileItem)it.next();
				if(item.isFormField())
				{
					continue;
				}
					
			}
			
			if(!item.isFormField())
			{
				String fieldName =item.getFieldName();
				String fileName =item.getName();
				Boolean bool=item.isInMemory();
				long size =item.getSize();
				
				if(fileName.lastIndexOf("\\")>=0)
				{
					file =new File(filePath+ fileName.substring(fileName.lastIndexOf("\\")));
					audit.setFileName(fileName.substring(fileName.lastIndexOf("\\")));
				}
				else
				{
					file =new File(filePath + fileName.substring(fileName.lastIndexOf("\\")+1));
					audit.setFileName(fileName.substring(fileName.lastIndexOf("\\")+1));
					//out.print(filePath + fileName.substring(fileName.lastIndexOf("\\")+1));
				}
				item.write(file);
				audit.setStatus("S");
				boolean statusAudit =audit.saveUserAudit();
				if(statusAudit)
				{
					String cob_date =(String)session.getAttribute("Cobdate");
					//runId=request.getParameter("runID");
					//out.print(runId);
					save.saveFund(cob_date, runId,audit.getFileName(),filePath);
					response.sendRedirect("UploadFile.jsp");
				}
				
			}
		}
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
 }
%>
</body>
</html>