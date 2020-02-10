<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfoadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	<script type="text/javascript">
	   function vali()
	   {
	      var username=document.getElementById("txtusername").value;
	      var password=document.getElementById("txtpassword").value;
	      if(username=="")
	      {
	         alert("用户名不能为空!");
	         return false;
	      }
	      else
	      {
	         if(password=="")
	         {
	            alert("密码不能为空！");
	            return false;
	         }
	         else
	         {
	            return true;
	         }
	      }
	   }
	</script>
  </head>
  
  <body>
    <center>用户信息添加界面</center>
    <center>
      <s:form action="userinfo!add" method="post">
        <s:textfield name="ui.username" label="用户名" id="txtusername"></s:textfield>
        <s:textfield name="ui.password" label="密码" id="txtpassword"></s:textfield>
        <s:submit value="添加" onclick="javascript:return vali();"></s:submit>
      </s:form>
    </center>
  </body>
</html>
