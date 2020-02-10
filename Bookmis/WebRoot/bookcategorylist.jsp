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
    
    <title>My JSP 'bookcategorylist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	

  </head>
  
  <body>
    <center>图书分类浏览界面</center>
    <center> <s:actionerror cssStyle="color:red"/></center>
    <table border="1" width="400" align="center">
        <tr>
            <th>图书分类编号</th>
            <th>图书分类名称</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        <s:iterator value="#request.bclist">
            <tr align="center">
                <td><s:property value="id"/> </td>
                <td><s:property value="name"/> </td>
                <td><s:property value="remark"/><s:if test="remark==null||remark==''">无</s:if></td>
                <td><a href="bookcategory!preupdate?id=${id }">修改</a>    <a href="bookcategory!delete?id=${id }" onclick="return confirm('确定删除信息吗？')">删除</a></td>
            </tr>
        </s:iterator>
    </table>
  </body>
</html>
