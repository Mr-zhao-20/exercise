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
    
    <title>My JSP 'bookfind.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	<script type="text/javascript" src="js/setdate.js"></script>
	

  </head>
  
  <body>
   <center>ͼ���ѯ����</center>
   <center>
      <s:form action="book!find" method="post">
          <s:textfield  name="book.name" label="ͼ������"></s:textfield>
          <s:textfield  name="book.author" label="����"></s:textfield>
          <s:textfield  name="book.pubs" label="������"></s:textfield>
          <s:textfield  name="beginpubdate" label="��ʼ����" onfocus="HS_setDate(this)"></s:textfield>
          <s:textfield  name="endpubdate" label="��������" onfocus="HS_setDate(this)"></s:textfield>
          <s:textfield  name="minprice" label="��С�۸�"></s:textfield>
          <s:textfield  name="maxprice" label="��߼۸�"></s:textfield>
          <s:submit value="��ѯ"></s:submit>
      </s:form> 
   </center>
  </body>
</html>
