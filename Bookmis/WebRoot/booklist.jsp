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
    <center><s:actionerror cssStyle="color:red"/></center>
    <table border="1" width="100%" align="center"/>
       <tr>
           <th>ͼ����</th>
           <th>ͼ������</th>
           <th>����</th>
           <th>������</th>
           <th>��������</th>
           <th>�۸�</th>
           <th>ISBN��</th>
           <th>״̬</th>
           <th>ͼ�����</th>
           <th>ͼ�����</th>
           <th>����</th>
       </tr>
       <s:iterator value="#request.blist">
          <tr align="center">
              <td><s:property value="id"/> </td>
              <td><s:property value="name"/> </td>
              <td><s:property value="author"/> </td>
              <td><s:property value="pubs"/> </td>
              <td><s:date name="pubdate" format="yyyy-MM-dd"/> </td>
              <td><s:property value="price"/> </td>
              <td><s:property value="isbn"/><s:if test="isbn==null||isbn==''">��</s:if> </td>
              <td><s:property value="state"/> </td>
              <td><s:property value="bookcategory.name"/> </td>
              <td><img src="upload/${picpath }" height="40" width="40"/></td>
              <td><a href="book!showOne?id=${id }">�鿴</a> <a href="book!preupdate?id=${id }">�޸�</a> <a href="book!delete?id=${id }" onclick="return confirm('ȷ��ɾ����Ϣ��')">ɾ��</a></td>
          </tr>
       </s:iterator>
    </table>
    ${bookpage.toolbar }
  </body>
</html>
