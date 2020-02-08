<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <html>
  <body>
      <center>登录信息列表</center>
      <table border="1" width="600" align="center">
         <tr bgcolor="#abcdef">
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>操作</th>
         </tr>
         <c:forEach items="${loginlist }" var="mybean">
          <tr>
              <td>${mybean.id }</td>
              <td>${mybean.username }</td>
              <td>${mybean.password }</td>
              <td><a href="LoginGet.bin?id=${mybean.id}">修改</a> <a href="">删除</a></td>
          </tr>
         </c:forEach>
         
          
      </table>
  </body>
</html>
