<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookcategoryupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	

  </head>
  
  <body>
    <center>ͼ������޸Ľ���</center>
    <center>
        <s:form action="book!bookcategory" method="post">
            <s:hidden name="bc.id"></s:hidden>
            <s:textfield name="bc.name" label="ͼ���������"></s:textfield>
            <s:textfield name="bc.remark" label="��ע"></s:textfield>
            <s:submit value="�޸�"></s:submit>
        </s:form>
    </center>
  </body>
</html>
