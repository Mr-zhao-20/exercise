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
    <center>ͼ������������</center>
    <center> <s:actionerror cssStyle="color:red"/></center>
    <table border="1" width="400" align="center">
        <tr>
            <th>ͼ�������</th>
            <th>ͼ���������</th>
            <th>��ע</th>
            <th>����</th>
        </tr>
        <s:iterator value="#request.bclist">
            <tr align="center">
                <td><s:property value="id"/> </td>
                <td><s:property value="name"/> </td>
                <td><s:property value="remark"/><s:if test="remark==null||remark==''">��</s:if></td>
                <td><a href="bookcategory!preupdate?id=${id }">�޸�</a>    <a href="bookcategory!delete?id=${id }" onclick="return confirm('ȷ��ɾ����Ϣ��')">ɾ��</a></td>
            </tr>
        </s:iterator>
    </table>
  </body>
</html>
