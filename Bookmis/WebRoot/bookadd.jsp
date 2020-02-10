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
	<SCRIPT type="text/javascript" src="js/setdate.js"></SCRIPT>
	<SCRIPT type="text/javascript">
	    function vali(){
	       var name=document.getElementById("txtname").value;
	       var author=document.getElementById("txtauthor").value;
	       var pubs=document.getElementById("txtpubs").value;
	       var pubdate=document.getElementById("txtpubdate").value;
	       var price=document.getElementById("txtprice").value;
	       var isbn=document.getElementById("txtisbn").value;
	       if(name==""){
	          alert("图书名不能为空");
	          return false;
	       }
	       else if(author==""){
	          alert("作者不能为空");
	          return false;
	       }
	       else if(pubs==""){
	          alert("出版社不能为空");
	          return false;
	       }
	       else if(pubdate==""){
	          alert("出版日期不能为空");
	          return false;
	       }
	       else if(price==""){
	          alert("价格不是正确的数字格式");
	          return false;
	       }
	       else if(isbn==""){
	          alert("ISBN号不能为空");
	          return false;
	       }
	       else{
	          return true;
	       }
	    }
	</SCRIPT>

  </head>
  
  <body>
      <center>图书新增界面</center>
      <center>
            <s:actionerror/>
            <s:form action="book!add" method="post" enctype="multipart/form-data">
                <s:textfield name="book.name" label="图书名称" id="txtname"></s:textfield>
                <s:textfield name="book.author" label="作者" id="txtauthor"></s:textfield>
                <s:textfield name="book.pubs" label="出版社" id="txtpubs"></s:textfield>
                <s:textfield name="book.pubdate" label="出版日期" onfocus="HS_setDate(this)" id="txtpubdate"></s:textfield>
                <s:textfield name="book.price" label="价格" id="txtprice"></s:textfield>
                <s:textfield name="book.isbn" label="ISBN号" id="txtisbn"></s:textfield>
                <s:select list="#request.bclist" listValue="name" listKey="id" name="book.bookcategory.id" label="图书分类"></s:select>
                <s:textfield name="book.remark" label="备注"></s:textfield>
                <s:file name="pic" label="请选择图片" onchange="document.getElementById('picshow').src=this.value"></s:file>
                <s:submit value="新增" onclick="javascript:return vali();"></s:submit>
            </s:form>
            <img src="" alt="上传的图片预览" id="picshow" width="200" height="200"/>
      </center>
  </body>
</html>
