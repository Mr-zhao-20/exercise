<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
 <head>
	<link rel="stylesheet" type="text/css" href="css/admin.css">

  </head>
  
  <body>
    <center>读者信息浏览界面</center>
    <table border="1" width="600" align="center">
        <tr>
             <th>编号</th>
             <th>读者分类名称</th>
             <th>最大借阅天数</th>
             <th>超期每天罚金</th>
             <th>最大借阅本数</th>
             <th>备注</th>
             <th>操作</th>
        </tr>
        <s:iterator value="#request.rclist">
             <tr>
                 <td>${id }</td>
                 <td>${name }</td>
                 <td>${maxperiod }</td>
                 <td>${fineperday }</td>
                 <td>${maxborrownumber }</td>
                 <td>${remark }</td>
                 <td><a href="">修改</a>  <a href="">删除</a></td>
             </tr>
        </s:iterator>
    </table>
    <center>${rcpage.toolbar }</center>
  </body>
</html>
