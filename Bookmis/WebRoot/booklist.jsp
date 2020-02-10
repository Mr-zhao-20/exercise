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
    <center>图书浏览界面</center>
    <center><s:actionerror cssStyle="color:red"/></center>
    <table border="1" width="100%" align="center"/>
       <tr>
           <th>图书编号</th>
           <th>图书名称</th>
           <th>作者</th>
           <th>出版社</th>
           <th>出版日期</th>
           <th>价格</th>
           <th>ISBN号</th>
           <th>状态</th>
           <th>图书分类</th>
           <th>图书封面</th>
           <th>操作</th>
       </tr>
       <s:iterator value="#request.blist">
          <tr align="center">
              <td><s:property value="id"/> </td>
              <td><s:property value="name"/> </td>
              <td><s:property value="author"/> </td>
              <td><s:property value="pubs"/> </td>
              <td><s:date name="pubdate" format="yyyy-MM-dd"/> </td>
              <td><s:property value="price"/> </td>
              <td><s:property value="isbn"/><s:if test="isbn==null||isbn==''">无</s:if> </td>
              <td><s:property value="state"/> </td>
              <td><s:property value="bookcategory.name"/> </td>
              <td><img src="upload/${picpath }" height="40" width="40"/></td>
              <td><a href="book!showOne?id=${id }">查看</a> <a href="book!preupdate?id=${id }">修改</a> <a href="book!delete?id=${id }" onclick="return confirm('确定删除信息？')">删除</a></td>
          </tr>
       </s:iterator>
    </table>
    ${bookpage.toolbar }
  </body>
</html>
