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
	         alert("���߱�Ų���Ϊ��");
	         return false;
	      }else if(bid==""){
	         alert("ͼ���Ų���Ϊ��");
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
	       var strname=document.getElementById("txtrname").value;//�������
	       var strdepartment=document.getElementById("txtdepartment").value;//��õ�λ
	       //alert(strname+" "+strdepartment);
	       var strparam="name="+strname+"&department="+strdepartment;//�������
	       //alert(strparam);
	       var xmlhttperqest=createXMLHttpRequest();//���XMLHttpRequest����
	       xmlhttperqest.onreadystatechange=callback;//״̬�ı�ʱ���������ݷ���ʱ������callback����
	       xmlhttperqest.open("post","readerajax!search?"+strparam,"true");//��post����������Ӧ��readerajax��search�����������첽����
	        xmlhttperqest.setRequestHeader("Content-type","appliction/x-www-form-urlencoded;charset=gbk");//������������
	        xmlhttperqest.send(null);//������Ϣ
	        function callback()
	        {
	           /*���alert����ܹ�������ִ�м��Σ���Ϊһ������������ʱ�������г�ʼ����׼�������䣬�ɹ���״̬������δ��ʼ����0������open��1
	                                  ����setRequestHeader
	           */
	           //alert("222");
	             if(xmlhttperqest.readyState==4)
	             {
	                //alert(xmlhttperqest.status);
	                  if(xmlhttperqest.status==200)//���������ص�http״̬�룬200��ʾ�ɹ���404��ʾʧ�ܣ�500��ʾ�������ڲ�����
	                  {
	                      //alert("33");
	                      /*���ڷ��������ص�json�ַ��������jquery�첽����û������˵�����������ַ�����ʽ���ܣ���ô��Ҫ��һ�ζ��󻯴���
	                                                              ��ʽ����̫�鷳�����ǽ����ַ�������eval()��ִ��һ��var dataObj=eval("("+data+")")ת��Ϊjson
	                      */
	                      var strdata=xmlhttperqest.responseText;//��÷�������Ӧ�����ݣ���ʱ��strdata��һ���ַ���
	                    //  alert(strdata);
	                      var jsonreader=eval("("+strdata+")").jsonreader;//ʹ��eval������һ��json�ַ���ת����һ��json����
	                     // alert(jsonreader);
	                      var rs=eval("("+jsonreader+")").rs;//ʹ��eval������jsonreader�ַ���ת����һ��rs����
	                     // alert(rs.length);
	                      var tnode=document.getElementById("treader");//�˴���treader��ѡ����߱�ŵ�table�����֣������table��û�ж������id�Ļ�����Ĵ��붼���в���
	                      while(tnode.rows.length>1)//���table�ı���������ݣ�����Щ��ȫ��ɾ��
	                      {
	                            tnode.deleteRow(1);
	                      }
	                      
	                      for(var i=0;i<rs.length;i++)//����	rs�ĳ��Ƚ�json�ַ�����һ������ָ����λ����
	                      {
	                          var trnode= tnode.insertRow(tnode.rows.length);//��tnode��ָ��λ�ò���һ��
	                          var tdnodeid= trnode.insertCell(trnode.cells.length);//�ڸ�ָ��λ�ò���һ�У��ڵ�һ�в���
	                          var tdnodename= trnode.insertCell(trnode.cells.length);//�ڵڶ��в���
	                          var tdnodesex=trnode.insertCell(trnode.cells.length);//�ڵ����в���
	                          var tdnodephone=trnode.insertCell(trnode.cells.length);//�ڵ����в���
	                          var tdnodedepartment=trnode.insertCell(trnode.cells.length);//�ڵ����в���
	                          var tdnoderc=trnode.insertCell(trnode.cells.length);//�����в���
	                          var tdnodesel=trnode.insertCell(trnode.cells.length);//�����в���
	                          tdnodeid.innerHTML=rs[i].id;//����id
	                          tdnodename.innerHTML=rs[i].name;//����name
	                          tdnodesex.innerHTML=rs[i].sex;
	                          tdnodephone.innerHTML=rs[i].phone;
	                          tdnodedepartment.innerHTML=rs[i].department;
	                          tdnoderc.innerHTML=rs[i].rc;
	                          tdnodesel.innerHTML="<input type='button' value='ѡ��' onclick='document.getElementById(\"txtrid\").value="+rs[i].id+";document.getElementById(\"divreader\").style.display=\"none\"'>"
	                      }
	                  }
	             }
	        }
	    }
	</SCRIPT>
	<SCRIPT type="text/javascript">
	    function searchbook()
	    {
	       var strname=document.getElementById("txtbname").value;//�������
	       var strtxtauthor=document.getElementById("txtauthor").value;//�������
	       var strtxtpubs=document.getElementById("txtpubs").value;//��ó�����
	       //alert(strname+" "+strdepartment);
	       var strparam="name="+strname+"&author="+strtxtauthor+"&pubs="+strtxtpubs;//�������
	       //alert(strparam);
	       var xmlhttperqest=createXMLHttpRequest();//���XMLHttpRequest����
	       xmlhttperqest.onreadystatechange=callback;//״̬�ı�ʱ���������ݷ���ʱ������callback����
	       xmlhttperqest.open("post","bookajax!search?"+strparam,"true");//��post����������Ӧ��readerajax��search�����������첽����
	        xmlhttperqest.setRequestHeader("Content-type","appliction/x-www-form-urlencoded;charset=gbk");//������������
	        xmlhttperqest.send(null);//������Ϣ
	        function callback()
	        {
	           /*���alert����ܹ�������ִ�м��Σ���Ϊһ������������ʱ�������г�ʼ����׼�������䣬�ɹ���״̬������δ��ʼ����0������open��1
	                                  ����setRequestHeader
	           */
	           //alert("222");
	             if(xmlhttperqest.readyState==4)
	             {
	                //alert(xmlhttperqest.status);
	                  if(xmlhttperqest.status==200)//���������ص�http״̬�룬200��ʾ�ɹ���404��ʾʧ�ܣ�500��ʾ�������ڲ�����
	                  {
	                      //alert("33");
	                      /*���ڷ��������ص�json�ַ��������jquery�첽����û������˵�����������ַ�����ʽ���ܣ���ô��Ҫ��һ�ζ��󻯴���
	                                                              ��ʽ����̫�鷳�����ǽ����ַ�������eval()��ִ��һ��var dataObj=eval("("+data+")")ת��Ϊjson
	                      */
	                      var strdata=xmlhttperqest.responseText;//��÷�������Ӧ�����ݣ���ʱ��strdata��һ���ַ���
	                    //  alert(strdata);
	                      var jsonbook=eval("("+strdata+")").jsonbook;//ʹ��eval������һ��json�ַ���ת����һ��json����
	                     // alert(jsonreader);
	                      var rs=eval("("+jsonbook+")").rs;//ʹ��eval������jsonreader�ַ���ת����һ��rs����
	                     // alert(rs.length);
	                      var tnode=document.getElementById("tbook");//�˴���treader��ѡ����߱�ŵ�table�����֣������table��û�ж������id�Ļ�����Ĵ��붼���в���
	                      while(tnode.rows.length>1)//���table�ı���������ݣ�����Щ��ȫ��ɾ��
	                      {
	                            tnode.deleteRow(1);
	                      }
	                      
	                      for(var i=0;i<rs.length;i++)//����	rs�ĳ��Ƚ�json�ַ�����һ������ָ����λ����
	                      {
	                          var trnode= tnode.insertRow(tnode.rows.length);//��tnode��ָ��λ�ò���һ��
	                          var tdnodeid= trnode.insertCell(trnode.cells.length);//�ڸ�ָ��λ�ò���һ�У��ڵ�һ�в���
	                          var tdnodename= trnode.insertCell(trnode.cells.length);//�ڵڶ��в���
	                          var tdnodeauthor=trnode.insertCell(trnode.cells.length);//�ڵ����в���
	                          var tdnodepubs=trnode.insertCell(trnode.cells.length);//�ڵ����в���
	                          var tdnodepubdate=trnode.insertCell(trnode.cells.length);//�ڵ����в���
	                          var tdnodeprice=trnode.insertCell(trnode.cells.length);//�����в���
	                          var tdnodebc=trnode.insertCell(trnode.cells.length);//�����в���
	                          var tdnodesel=trnode.insertCell(trnode.cells.length);//�ڰ��в���
	                          tdnodeid.innerHTML=rs[i].id;//����id
	                          tdnodename.innerHTML=rs[i].name;//����name
	                          tdnodeauthor.innerHTML=rs[i].author;//����ͼ������
	                          tdnodepubs.innerHTML=rs[i].pubs;//���������
	                          tdnodepubdate.innerHTML=rs[i].pubdate;//����ͼ���������
	                          tdnodeprice.innerHTML=rs[i].price;//����ͼ��۸�
	                          tdnodebc.innerHTML=rs[i].bc;//����ͼ�����
	                          tdnodesel.innerHTML="<input type='button' value='ѡ��' onclick='document.getElementById(\"txtbid\").value="+rs[i].id+";document.getElementById(\"divbook\").style.display=\"none\"'>"
	                      }
	                  }
	             }
	        }
	    }
	</SCRIPT>
  </head>
  
  <body>
    <center>ͼ����Ľ���</center>
    <center>
        <s:form action="" method="post"  theme="simple">
                         ���߱�ţ�<s:textfield name="borrow.reader.id" label="���߱��" id="txtrid" onfocus="document.getElementById('divreader').style.display='block';document.getElementById('divbook').style.display='none'"></s:textfield>
                         ͼ���ţ�<s:textfield name="borrow.book.id" label="ͼ����" id="txtbid" onfocus="document.getElementById('divbook').style.display='block';document.getElementById('divreader').style.display='none'"></s:textfield>
                         ��ע��<s:textfield name="borrow.remark" label="��ע"></s:textfield>
               <s:submit value="����" onclick="javascript:vali();"></s:submit> <br/>  
     <br/>
     <div id="divreader" style="display:none;background:#abcdef;width:600;">
              ������<input type="text" id="txtrname"/>
             ��λ��<input type="text" id="txtdepartment"/>
             <input type="button" value="��ѯ" onclick="javascripte:searchreader();"/> &nbsp;&nbsp;<input type="button" value="ȡ��"/>
             <table border="1" id="treader">
                <tr>
                    <th>���</th>
                    <th>����</th>
                    <th>�Ա�</th>
                    <th>�绰</th>
                    <th>��λ</th>
                    <th>����</th>
                    <th>ѡ��</th>
                </tr>
             </table>
     </div>
     <div id="divbook" style="display:none;background:#abcdef;widht:600">
     <br/>
                             ���ƣ�<input type="text" id="txtbname"/>
                             ���ߣ�<input type="text" id="txtauthor"/>
                             �����磺<input type="text" id="txtpubs"/>
           <input type="button" value="��ѯ" onclick="javascripte:searchbook();"/>&nbsp;&nbsp;<input type="button" value="ȡ��"/>
           <table border="1" id="tbook">
                 <tr>
                      <th>���</th>
                      <th>����</th>
                      <th>����</th>
                      <th>������</th>
                      <th>��������</th>
                      <th>�۸�</th>
                      <th>����</th>
                      <th>ѡ�� </th>
                 </tr>
           </table>
     </div> 
</s:form>
    </center>
  </body>
</html>
