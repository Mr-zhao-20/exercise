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
	<script type="text/javascript">
	   function vali(){
	     var name=document.getElementById("txtname").value;
	     if(name==""){
	        alert("图书分类名称不能为空");
	        return false;
	     }else{
	        return true;
	     }
	   }
	</script>

  </head>
  
  <body>
    <center>图书分类添加界面</center>
    <center>
         <s:form action="bookcategory!add" method="post">
            <s:textfield name="bc.name" label="图书分类名称" id="txtname"></s:textfield>
            <s:textfield name="bc.remark" label="备注"></s:textfield>
            <s:submit value="添加" onclick="javascript:return vali();"></s:submit>
         </s:form>
    </center>
  </body>
</html>
