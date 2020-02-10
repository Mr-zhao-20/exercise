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
	        if(confirm('确认退出吗？'))
	        {
	            window.parent.location="userinfo!logout";
	        }
	    }
	</script>
  </head>
  
  <body background="images/menu_bg.jpg">
      <div class="dtree">
          <p><a href="javascript:d.openAll();">全部打开</a>|<a href="javascript:d.closeAll();">全部关闭</a></p>
          <script type="text/javascript">
           d = new dTree('d');
		   d.add(0,-1,'图书管理系统');
		   d.add(1,0,'用户管理');
		      d.add(11,1,'用户添加','userinfoadd.jsp','','main');
		      d.add(12,1,'用户浏览','userinfo!findAll','','main');
		   d.add(2,0,'图书分类管理');
		      d.add(21,2,'图书分类添加','bookcategoryadd.jsp','','main');
		      d.add(22,2,'图书分类浏览','bookcategory!findAll','','main');
		   d.add(3,0,'图书管理');
		      d.add(31,3,'图书添加','book!preadd','','main');
		      d.add(32,3,'图书浏览','book!findAll','','main');
		      d.add(33,3,'图书查询','bookfind.jsp','','main');
		   d.add(4,0,'读者分类管理');
		      d.add(41,4,'读者分类添加');
		      d.add(42,4,'读者分类浏览','readercategory!findAll','','main');
		   d.add(5,0,'读者管理');
		      d.add(51,5,'读者添加');
		      d.add(52,5,'读者浏览','reader!findAll','','main');
		   d.add(6,0,'图书借阅管理');
		      d.add(61,6,'图书借阅','borrow.jsp','','main');
		      d.add(62,6,'图书借阅记录浏览','borrow!findAll','','main');
		   d.add(7,0,'图书归还管理');
		      d.add(71,7,'图书归还');
		      d.add(72,7,'图书归还记录浏览');
		   d.add(8,0,'罚金管理');
		      d.add(81,8,'缴纳罚金');
		      d.add(82,8,'罚金记录浏览');
		   d.add(9,0,"安全退出",'javascript:funlogout();');
		   document.write(d);
          </script> 
      </div>
  </body>
</html>
