<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
	<link rel="stylesheet" type="text/css" href="css/dtree.css">
	
	<script type="text/javascript" src="js/dtree.js"></script>
	<script type="text/javascript">
	    function funlogout()
	    {
	        if(confirm('ȷ���˳���'))
	        {
	            window.parent.location="userinfo!logout";
	        }
	    }
	</script>
  </head>
  
  <body background="images/menu_bg.jpg">
      <div class="dtree">
          <p><a href="javascript:d.openAll();">ȫ����</a>|<a href="javascript:d.closeAll();">ȫ���ر�</a></p>
          <script type="text/javascript">
           d = new dTree('d');
		   d.add(0,-1,'ͼ�����ϵͳ');
		   d.add(1,0,'�û�����');
		      d.add(11,1,'�û�����','userinfoadd.jsp','','main');
		      d.add(12,1,'�û����','userinfo!findAll','','main');
		   d.add(2,0,'ͼ��������');
		      d.add(21,2,'ͼ���������','bookcategoryadd.jsp','','main');
		      d.add(22,2,'ͼ��������','bookcategory!findAll','','main');
		   d.add(3,0,'ͼ�����');
		      d.add(31,3,'ͼ������','book!preadd','','main');
		      d.add(32,3,'ͼ�����','book!findAll','','main');
		      d.add(33,3,'ͼ���ѯ','bookfind.jsp','','main');
		   d.add(4,0,'���߷������');
		      d.add(41,4,'���߷�������');
		      d.add(42,4,'���߷������','readercategory!findAll','','main');
		   d.add(5,0,'���߹���');
		      d.add(51,5,'��������');
		      d.add(52,5,'�������','reader!findAll','','main');
		   d.add(6,0,'ͼ����Ĺ���');
		      d.add(61,6,'ͼ�����','borrow.jsp','','main');
		      d.add(62,6,'ͼ����ļ�¼���','borrow!findAll','','main');
		   d.add(7,0,'ͼ��黹����');
		      d.add(71,7,'ͼ��黹');
		      d.add(72,7,'ͼ��黹��¼���');
		   d.add(8,0,'�������');
		      d.add(81,8,'���ɷ���');
		      d.add(82,8,'�����¼���');
		   d.add(9,0,"��ȫ�˳�",'javascript:funlogout();');
		   document.write(d);
          </script> 
      </div>
  </body>
</html>