<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <html>
  <body>
      <center>��¼��Ϣ�б�</center>
      <table border="1" width="600" align="center">
         <tr bgcolor="#abcdef">
            <th>���</th>
            <th>�û���</th>
            <th>����</th>
            <th>����</th>
         </tr>
         <c:forEach items="${loginlist }" var="mybean">
          <tr>
              <td>${mybean.id }</td>
              <td>${mybean.username }</td>
              <td>${mybean.password }</td>
              <td><a href="LoginGet.bin?id=${mybean.id}">�޸�</a> <a href="">ɾ��</a></td>
          </tr>
         </c:forEach>
         
          
      </table>
  </body>
</html>
