<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
  <head>
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	<SCRIPT type="text/javascript">
	   function vali(){
	      var rid=document.getElementById("txtrid").value;
	      var bid=document.getElementById("txtbid").value;
	      if(rid==""){
	         alert("读者编号不能为空");
	         return false;
	      }else if(bid==""){
	         alert("图书编号不能为空");
	         return false;
	      }else{
	         return true;
	      }
	   }
	</SCRIPT>
	<SCRIPT type="text/javascript" src="js/createXMLHttpRequest.js"></SCRIPT>
	<SCRIPT type="text/javascript">
	    function searchreader()
	    {
	       var strname=document.getElementById("txtrname").value;//获得姓名
	       var strdepartment=document.getElementById("txtdepartment").value;//获得单位
	       //alert(strname+" "+strdepartment);
	       var strparam="name="+strname+"&department="+strdepartment;//定义参数
	       //alert(strparam);
	       var xmlhttperqest=createXMLHttpRequest();//获得XMLHttpRequest对象
	       xmlhttperqest.onreadystatechange=callback;//状态改变时（即有数据返回时）查找callback函数
	       xmlhttperqest.open("post","readerajax!search?"+strparam,"true");//以post方法查找相应的readerajax的search方法，采用异步传输
	        xmlhttperqest.setRequestHeader("Content-type","appliction/x-www-form-urlencoded;charset=gbk");//用来传递中文
	        xmlhttperqest.send(null);//发送信息
	        function callback()
	        {
	           /*这个alert语句能够被连续执行几次，因为一个方法被调用时，可以有初始化，准备，传输，成功等状态，其中未初始化是0，调用open是1
	                                  调用setRequestHeader
	           */
	           //alert("222");
	             if(xmlhttperqest.readyState==4)
	             {
	                //alert(xmlhttperqest.status);
	                  if(xmlhttperqest.status==200)//服务器返回的http状态码，200表示成功，404表示失败，500表示服务器内部错误
	                  {
	                      //alert("33");
	                      /*对于服务器返回的json字符串，如果jquery异步请求没做类型说明，或者以字符串方式接受，那么需要做一次对象化处理
	                                                              方式不是太麻烦，就是将该字符串放于eval()中执行一次var dataObj=eval("("+data+")")转化为json
	                      */
	                      var strdata=xmlhttperqest.responseText;//获得服务器响应的内容，此时的strdata是一个字符串
	                    //  alert(strdata);
	                      var jsonreader=eval("("+strdata+")").jsonreader;//使用eval函数将一个json字符串转换成一个json对象
	                     // alert(jsonreader);
	                      var rs=eval("("+jsonreader+")").rs;//使用eval函数将jsonreader字符串转换成一个rs对象
	                     // alert(rs.length);
	                      var tnode=document.getElementById("treader");//此处的treader是选择读者编号的table的名字，如果在table中没有定义这个id的话后面的代码都运行不了
	                      while(tnode.rows.length>1)//如果table的表格中有内容，则将这些行全部删除
	                      {
	                            tnode.deleteRow(1);
	                      }
	                      
	                      for(var i=0;i<rs.length;i++)//根据	rs的长度将json字符串逐一放入表格指定的位置上
	                      {
	                          var trnode= tnode.insertRow(tnode.rows.length);//在tnode中指定位置插入一行
	                          var tdnodeid= trnode.insertCell(trnode.cells.length);//在该指定位置插入一列，在第一列插入
	                          var tdnodename= trnode.insertCell(trnode.cells.length);//在第二列插入
	                          var tdnodesex=trnode.insertCell(trnode.cells.length);//在第三列插入
	                          var tdnodephone=trnode.insertCell(trnode.cells.length);//在第四列插入
	                          var tdnodedepartment=trnode.insertCell(trnode.cells.length);//在第五列插入
	                          var tdnoderc=trnode.insertCell(trnode.cells.length);//第六列插入
	                          var tdnodesel=trnode.insertCell(trnode.cells.length);//第七列插入
	                          tdnodeid.innerHTML=rs[i].id;//插入id
	                          tdnodename.innerHTML=rs[i].name;//插入name
	                          tdnodesex.innerHTML=rs[i].sex;
	                          tdnodephone.innerHTML=rs[i].phone;
	                          tdnodedepartment.innerHTML=rs[i].department;
	                          tdnoderc.innerHTML=rs[i].rc;
	                          tdnodesel.innerHTML="<input type='button' value='选择' onclick='document.getElementById(\"txtrid\").value="+rs[i].id+";document.getElementById(\"divreader\").style.display=\"none\"'>"
	                      }
	                  }
	             }
	        }
	    }
	</SCRIPT>
	<SCRIPT type="text/javascript">
	    function searchbook()
	    {
	       var strname=document.getElementById("txtbname").value;//获得姓名
	       var strtxtauthor=document.getElementById("txtauthor").value;//获得作者
	       var strtxtpubs=document.getElementById("txtpubs").value;//获得出版社
	       //alert(strname+" "+strdepartment);
	       var strparam="name="+strname+"&author="+strtxtauthor+"&pubs="+strtxtpubs;//定义参数
	       //alert(strparam);
	       var xmlhttperqest=createXMLHttpRequest();//获得XMLHttpRequest对象
	       xmlhttperqest.onreadystatechange=callback;//状态改变时（即有数据返回时）查找callback函数
	       xmlhttperqest.open("post","bookajax!search?"+strparam,"true");//以post方法查找相应的readerajax的search方法，采用异步传输
	        xmlhttperqest.setRequestHeader("Content-type","appliction/x-www-form-urlencoded;charset=gbk");//用来传递中文
	        xmlhttperqest.send(null);//发送信息
	        function callback()
	        {
	           /*这个alert语句能够被连续执行几次，因为一个方法被调用时，可以有初始化，准备，传输，成功等状态，其中未初始化是0，调用open是1
	                                  调用setRequestHeader
	           */
	           //alert("222");
	             if(xmlhttperqest.readyState==4)
	             {
	                //alert(xmlhttperqest.status);
	                  if(xmlhttperqest.status==200)//服务器返回的http状态码，200表示成功，404表示失败，500表示服务器内部错误
	                  {
	                      //alert("33");
	                      /*对于服务器返回的json字符串，如果jquery异步请求没做类型说明，或者以字符串方式接受，那么需要做一次对象化处理
	                                                              方式不是太麻烦，就是将该字符串放于eval()中执行一次var dataObj=eval("("+data+")")转化为json
	                      */
	                      var strdata=xmlhttperqest.responseText;//获得服务器响应的内容，此时的strdata是一个字符串
	                    //  alert(strdata);
	                      var jsonbook=eval("("+strdata+")").jsonbook;//使用eval函数将一个json字符串转换成一个json对象
	                     // alert(jsonreader);
	                      var rs=eval("("+jsonbook+")").rs;//使用eval函数将jsonreader字符串转换成一个rs对象
	                     // alert(rs.length);
	                      var tnode=document.getElementById("tbook");//此处的treader是选择读者编号的table的名字，如果在table中没有定义这个id的话后面的代码都运行不了
	                      while(tnode.rows.length>1)//如果table的表格中有内容，则将这些行全部删除
	                      {
	                            tnode.deleteRow(1);
	                      }
	                      
	                      for(var i=0;i<rs.length;i++)//根据	rs的长度将json字符串逐一放入表格指定的位置上
	                      {
	                          var trnode= tnode.insertRow(tnode.rows.length);//在tnode中指定位置插入一行
	                          var tdnodeid= trnode.insertCell(trnode.cells.length);//在该指定位置插入一列，在第一列插入
	                          var tdnodename= trnode.insertCell(trnode.cells.length);//在第二列插入
	                          var tdnodeauthor=trnode.insertCell(trnode.cells.length);//在第三列插入
	                          var tdnodepubs=trnode.insertCell(trnode.cells.length);//在第四列插入
	                          var tdnodepubdate=trnode.insertCell(trnode.cells.length);//在第五列插入
	                          var tdnodeprice=trnode.insertCell(trnode.cells.length);//第六列插入
	                          var tdnodebc=trnode.insertCell(trnode.cells.length);//第七列插入
	                          var tdnodesel=trnode.insertCell(trnode.cells.length);//第八列插入
	                          tdnodeid.innerHTML=rs[i].id;//插入id
	                          tdnodename.innerHTML=rs[i].name;//插入name
	                          tdnodeauthor.innerHTML=rs[i].author;//插入图书作者
	                          tdnodepubs.innerHTML=rs[i].pubs;//插入出版社
	                          tdnodepubdate.innerHTML=rs[i].pubdate;//插入图书出版日期
	                          tdnodeprice.innerHTML=rs[i].price;//插入图书价格
	                          tdnodebc.innerHTML=rs[i].bc;//插入图书分类
	                          tdnodesel.innerHTML="<input type='button' value='选择' onclick='document.getElementById(\"txtbid\").value="+rs[i].id+";document.getElementById(\"divbook\").style.display=\"none\"'>"
	                      }
	                  }
	             }
	        }
	    }
	</SCRIPT>
  </head>
  
  <body>
    <center>图书借阅界面</center>
    <center>
        <s:form action="" method="post"  theme="simple">
                         读者编号：<s:textfield name="borrow.reader.id" label="读者编号" id="txtrid" onfocus="document.getElementById('divreader').style.display='block';document.getElementById('divbook').style.display='none'"></s:textfield>
                         图书编号：<s:textfield name="borrow.book.id" label="图书编号" id="txtbid" onfocus="document.getElementById('divbook').style.display='block';document.getElementById('divreader').style.display='none'"></s:textfield>
                         备注：<s:textfield name="borrow.remark" label="备注"></s:textfield>
               <s:submit value="借阅" onclick="javascript:vali();"></s:submit> <br/>  
     <br/>
     <div id="divreader" style="display:none;background:#abcdef;width:600;">
              姓名：<input type="text" id="txtrname"/>
             单位：<input type="text" id="txtdepartment"/>
             <input type="button" value="查询" onclick="javascripte:searchreader();"/> &nbsp;&nbsp;<input type="button" value="取消"/>
             <table border="1" id="treader">
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>单位</th>
                    <th>分类</th>
                    <th>选择</th>
                </tr>
             </table>
     </div>
     <div id="divbook" style="display:none;background:#abcdef;widht:600">
     <br/>
                             名称：<input type="text" id="txtbname"/>
                             作者：<input type="text" id="txtauthor"/>
                             出版社：<input type="text" id="txtpubs"/>
           <input type="button" value="查询" onclick="javascripte:searchbook();"/>&nbsp;&nbsp;<input type="button" value="取消"/>
           <table border="1" id="tbook">
                 <tr>
                      <th>编号</th>
                      <th>名称</th>
                      <th>作者</th>
                      <th>出版社</th>
                      <th>出版日期</th>
                      <th>价格</th>
                      <th>分类</th>
                      <th>选择 </th>
                 </tr>
           </table>
     </div> 
</s:form>
    </center>
  </body>
</html>
