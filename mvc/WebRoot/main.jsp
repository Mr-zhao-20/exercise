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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <center>����ҳ��</center>
     <center><a href="Loginlist.bin">��¼��Ϣ��ѯ</a></center>
      <center><a href="loginadd.jsp">��¼��Ϣ����</a></center>
            
      <center><a href="productlist.jsp">��Ʒ��Ϣ��ѯ</a></center>
      <center><a href="padd.jsp">��Ʒ��Ϣ����</a></center>
      
  </body>
</html>
