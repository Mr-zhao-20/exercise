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
    
    <title>My JSP 'bookcategoruadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin.css">


  </head>
  
  <body>
    <center>ͼ���������</center>
    <table align="center" width="400">
        <tr>
            <td>ͼ����:</td><td>${book.id }</td>
        </tr>
        <tr>
            <td>ͼ������:</td><td>${book.name }</td>
        </tr>
        <tr>
            <td>����:</td><td>${book.author }</td>
        </tr>
        <tr>
            <td>������:</td><td>${book.pubs }</td>
        </tr>
        <tr>
            <td>��������:</td><td><s:date name="book.pubdate" format="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <td>�۸�:</td><td>${book.price }</td>
        </tr>
        <tr>
            <td>ISBN��:</td><td>${book.isbn }</td>
        </tr>
        <tr>
            <td>״̬:</td><td>${book.state }</td>
        </tr>
        <tr>
            <td>ͼ���������:</td><td>${book.bookcategory.name }</td>
        </tr>
        <tr>
            <td>��ע:</td><td>${book.remark }</td>
        </tr>
        <tr>
            <td>ͼ�����:</td><td><img src="upload/${book.picpath }" width="200" height="200"/></td>
        </tr>
    </table>
    <center><a href="javascript:history.back();">����</a></center>
  </body>
</html>
