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
    
    <title>My JSP 'readerlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/admin.css">

  </head>
  
  <body>
    <center>读者浏览界面</center>
    <center><s:actionerror cssStyle="color:red"/></center>
    <table border="1" width="800" align="center">
       <tr>
          <th>读者编号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>电话</th>
          <th>单位</th>
          <th>读者分类</th>
          <th>照片</th>
          <th>备注</th>
          <th>操作</th>
       </tr>
        <s:iterator value="#request.readerlist">
          <tr align="center">
             <td>${id }</td>
             <td>${name }</td>
             <td>${sex }</td>
             <td>${phone }</td>
             <td>${department }</td>
             <td>${readercategory.name }</td>
             <td><img src="upload/${photopath }" width="40" height="40"/></td>
             <td><s:property value="remark"/> <s:if test="remark==null||remark==''">无</s:if></td>
             <td><a href="">查看</a> <a href="">删除</a></td>
          </tr>
        </s:iterator>
    </table>
    <center>${readerpage.toolbar}</center>
  </body>
</html>
