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
    
    <title>My JSP 'borrowlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/admin.css">

  </head>
  
  <body>
    <center>借阅记录浏览界面</center>
    <center><s:actionerror cssStyle="color:red"/></center>
    <table border="1" width="800" align="center">
    <tr>
         <th>编号</th>
         <th>读者</th>
         <th>图书</th>
         <th>借阅日期</th>
         <th>归还日期</th>
         <th>备注</th>
    </tr>
    <s:iterator value="#request.borrowlist">
       <tr align="center">
           <td>${id }</td>
           <td>${reader.name }</td>
           <td>${book.name }</td>
           <td><s:date name="borrowdate" format="yyyy-MM-dd"/></td>
           <td><s:date name="returndate" format="yyyy-MM-dd"/>&nbsp;</td>
           <td><s:property value="remark"/> <s:if test="remark==null||remark==''">无</s:if></td>
       </tr>
    </s:iterator>
    </table>
    <center>${borrowpage.toolbar }</center>
  </body>
</html>
