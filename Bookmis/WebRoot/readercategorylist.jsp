<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
 <head>
	<link rel="stylesheet" type="text/css" href="css/admin.css">

  </head>
  
  <body>
    <center>������Ϣ�������</center>
    <table border="1" width="600" align="center">
        <tr>
             <th>���</th>
             <th>���߷�������</th>
             <th>����������</th>
             <th>����ÿ�췣��</th>
             <th>�����ı���</th>
             <th>��ע</th>
             <th>����</th>
        </tr>
        <s:iterator value="#request.rclist">
             <tr>
                 <td>${id }</td>
                 <td>${name }</td>
                 <td>${maxperiod }</td>
                 <td>${fineperday }</td>
                 <td>${maxborrownumber }</td>
                 <td>${remark }</td>
                 <td><a href="">�޸�</a>  <a href="">ɾ��</a></td>
             </tr>
        </s:iterator>
    </table>
    <center>${rcpage.toolbar }</center>
  </body>
</html>
