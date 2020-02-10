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
	<script type="text/javascript" src="js/setdate.js"></script>
	
  </head>
  
  <body>
    <center>图书信息修改界面</center>
    <center>
          <s:form action="book!update" method="post" enctype="multipart/form-date">
              <s:hidden name="book.id"></s:hidden>
              <s:textfield name="book.name" label="图书名称"></s:textfield>
              <s:textfield name="book.author" label="作者"></s:textfield>
              <s:textfield name="book.pubs" label="出版社"></s:textfield>
              <s:textfield name="book.pudate" label="出版日期" onfocus="HS_setDate(this)"></s:textfield>
              <s:textfield name="book.price" label="价格"></s:textfield>
              <s:textfield name="book.isbn" label="ISBN号"></s:textfield>
              <s:hidden name="book.state"></s:hidden>
              <s:hidden name="book.picpath"></s:hidden>
              <s:select list="#request.bclist" listValue="name" listKey="id" name="book.bookcategory.id" label="图书分类"></s:select>
              <s:textfield name="remark" label="备注"></s:textfield>
              <s:submit value="修改"></s:submit>
          </s:form>
          <table>
               <tr>
                  <td>原图封面</td>
                  <TD><img src="upload/${book.picpath }" width="200" height="200"/></TD>
               </tr>
               <tr>
                  <td>新图书封面</td>
                  <TD><img src="" id="picshow" width="200" height="200"/></TD>
               </tr>
          </table>
    </center>
  </body>
</html>
