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
    <center>ͼ����Ϣ�޸Ľ���</center>
    <center>
          <s:form action="book!update" method="post" enctype="multipart/form-date">
              <s:hidden name="book.id"></s:hidden>
              <s:textfield name="book.name" label="ͼ������"></s:textfield>
              <s:textfield name="book.author" label="����"></s:textfield>
              <s:textfield name="book.pubs" label="������"></s:textfield>
              <s:textfield name="book.pudate" label="��������" onfocus="HS_setDate(this)"></s:textfield>
              <s:textfield name="book.price" label="�۸�"></s:textfield>
              <s:textfield name="book.isbn" label="ISBN��"></s:textfield>
              <s:hidden name="book.state"></s:hidden>
              <s:hidden name="book.picpath"></s:hidden>
              <s:select list="#request.bclist" listValue="name" listKey="id" name="book.bookcategory.id" label="ͼ�����"></s:select>
              <s:textfield name="remark" label="��ע"></s:textfield>
              <s:submit value="�޸�"></s:submit>
          </s:form>
          <table>
               <tr>
                  <td>ԭͼ����</td>
                  <TD><img src="upload/${book.picpath }" width="200" height="200"/></TD>
               </tr>
               <tr>
                  <td>��ͼ�����</td>
                  <TD><img src="" id="picshow" width="200" height="200"/></TD>
               </tr>
          </table>
    </center>
  </body>
</html>
