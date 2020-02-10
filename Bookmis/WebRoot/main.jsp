<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin.css">

  </head>
  <frameset border="0" framespacing="0" rows="56,*,40">
     <frame src="header.jsp" frameborder="0">
     <frameset border="0" framespacing="0" cols="160,*">
        <frame src="lefter.jsp" frameborder="0">
        <frame src="maincontent.jsp" frameborder="0" name="main">
     </frameset>
     <frame src="footer.jsp" frameborder="0">
  </frameset>
</html>
