<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfoupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/admin.css">


  </head>
  
  <body>
    <center>用户信息修改界面</center>
    <center>
        <s:form action="userinfo!update" method="post">
            <s:hidden name="ui.id"></s:hidden>        
            <s:textfield name="ui.username" label="用户名"></s:textfield>
            <s:textfield name="ui.password" label="密码"></s:textfield>
            <s:submit value="修改"></s:submit>
        </s:form>
    </center>
  </body>
</html>
