<%@ page language="java" import="java.sql.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginadd.jsp' starting page</title>
    
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
    <center>登录信息新增</center>
    <form action="LoginAdd.bin" method="post">
        <table border="1" width="400" align="center">
         <tr>
            <td>用户名：</td>
            <td><input type="text" name="username"/></td>
         </tr>
         <tr>
             <td>密码：</td>
             <td><input type="text" name="password"/></td>
         </tr>
         <tr>
             <td colspan="2" align="center"><input type="submit" value="新增"/></td>
         </tr>
        </table>
    </form>
  </body>
</html>
