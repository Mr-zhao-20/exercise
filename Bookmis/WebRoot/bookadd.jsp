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
	          alert("ͼ��������Ϊ��");
	          return false;
	       }
	       else if(author==""){
	          alert("���߲���Ϊ��");
	          return false;
	       }
	       else if(pubs==""){
	          alert("�����粻��Ϊ��");
	          return false;
	       }
	       else if(pubdate==""){
	          alert("�������ڲ���Ϊ��");
	          return false;
	       }
	       else if(price==""){
	          alert("�۸�����ȷ�����ָ�ʽ");
	          return false;
	       }
	       else if(isbn==""){
	          alert("ISBN�Ų���Ϊ��");
	          return false;
	       }
	       else{
	          return true;
	       }
	    }
	</SCRIPT>

  </head>
  
  <body>
      <center>ͼ����������</center>
      <center>
            <s:actionerror/>
            <s:form action="book!add" method="post" enctype="multipart/form-data">
                <s:textfield name="book.name" label="ͼ������" id="txtname"></s:textfield>
                <s:textfield name="book.author" label="����" id="txtauthor"></s:textfield>
                <s:textfield name="book.pubs" label="������" id="txtpubs"></s:textfield>
                <s:textfield name="book.pubdate" label="��������" onfocus="HS_setDate(this)" id="txtpubdate"></s:textfield>
                <s:textfield name="book.price" label="�۸�" id="txtprice"></s:textfield>
                <s:textfield name="book.isbn" label="ISBN��" id="txtisbn"></s:textfield>
                <s:select list="#request.bclist" listValue="name" listKey="id" name="book.bookcategory.id" label="ͼ�����"></s:select>
                <s:textfield name="book.remark" label="��ע"></s:textfield>
                <s:file name="pic" label="��ѡ��ͼƬ" onchange="document.getElementById('picshow').src=this.value"></s:file>
                <s:submit value="����" onclick="javascript:return vali();"></s:submit>
            </s:form>
            <img src="" alt="�ϴ���ͼƬԤ��" id="picshow" width="200" height="200"/>
      </center>
  </body>
</html>
