<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginupdate.jsp' starting page</title>
    
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
    <center>登录信息的修改界面</center>
    <hr/>
    <form action="LoginUpdate.bin" method="post">
      <table border="1" align="center" width="400">
         <tr>
             <td>用户名</td>
             <td><input type="text" name="username" value="${login.username}"/></td>
         </tr>
          <tr>
             <td>密码</td>
             <td><input type="text" name="password" value="${login.password}"/></td>
         </tr>
         <tr>
             <td colspan="2"><input type="submit" value="修改" onclick="return confirm('确认修改信息么?')"/></td>
         </tr>
      
      </table>
    </form>
  </body>
</html>
