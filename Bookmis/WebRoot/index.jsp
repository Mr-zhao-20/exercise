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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	<STYLE type="text/css">
	.errorMessage
	{
	   color:red;
	}
	</STYLE>
  </head>
  
  <body>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" bgcolor="#002779"><!-- 外框的table -->
     <tr>
      <td align="center">
        <table border="0" cellpadding="0" cellspacing="0" width="468"><!-- 第一个table -->
           <tr>
             <td><img src="images/login_1.jpg" width="468" height="23"/></td>
           </tr>
           <tr>
             <td><img src="images/login_2.jpg" width="468" height="140"/></td>
           </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="468" bgcolor="#ffffff"><!-- 第二个table -->
           <tr>
             <td><img src="images/login_3.jpg" width="16" height="140"/></td><!-- 第一列 -->
             <td height="140" width="436" align="center"><!-- 第二列 -->
               <form action="userinfo!login" method="post">
                 <table border="0" cellpadding="0" cellspacing="0">
                   <tr height="10">
                      <td><s:textfield name="ui.username" label="用户名" cssStyle="border-right:#000000 1px solid;border-top:#000000 1px solid;border-left:#000000 1px solid;border-bottom:#000000 1px solid;"></s:textfield></td>
                   </tr>
                   <tr height="10">
                      <td><s:password name="ui.password" label="密码" cssStyle="border-right:#000000 1px solid;border-top:#000000 1px solid;border-left:#000000 1px solid;border-bottom:#000000 1px solid;"></s:password></td>
                   </tr>
                   <tr height="10">
                      <td><s:submit value="登录" cssStyle="width:60"></s:submit></td>
                   </tr>
                 </table>
               </form>
             </td>
             <td><img src="images/login_4.jpg" width="16" height="140" /></td><!-- 第三列 -->
           </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="468">
           <tr>
              <td><img src="images/login_5.jpg"/></td>
           </tr>
        </table>
      </td>
     </tr>
    </table>
  </body>
</html>
