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
    
    <title>My JSP 'userinfolist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/admin.css">

  </head>
  
  <body>
    <center>�û���Ϣ�������</center>
    <center>
      <table border="1" width="400">
         <tr>
            <th>���</th>
            <th>�û���</th>
            <th>����</th>
            <th>����</th>
         </tr>
       <s:iterator value="#request.uilist">
         <tr align="center">
            <td><s:property value="id"/></td>
            <td><s:property value="username"/></td>
            <td><s:property value="password"/></td>
            <td><a href="userinfo!preupdate?id=${id }">�޸�</a>  <a href="userinfo!delete?id=${id}" onclick="return confirm('ȷ��ɾ����?')">ɾ��</a></td>
         </tr>
       </s:iterator>
      </table>
    </center>
  </body>
</html>
