package com.my.util;

import java.util.List;



import com.my.hibernate.HibernateDao;

public class Page {
	private String strsql;//存放hql语句
	private List lstval;//存放hql语句对应的参数值
	private int recordnumber;//存放总记录数
	private int pagesize=3;//页面大小，即每页显示的记录数
	private int pagenum;//总页数
	private int currentpage=1;//当前的页数，从1开始
	private int currentrecord;//当前页的第一条记录的记录号，从第一页第一条0开始
	private String name;//分页对象的名称，在session中使用
	private String lstname;//页面显示数据列表的名称，在request中使用
	private String resultname;//页面跳转需要的页面名称，在Action的方法中使用
	public String getStrsql() {
		return strsql;
	}
	public void setStrsql(String strsql,List lstval) {
		 String strcount="select count(*)"+strsql;
    	 HibernateDao mydao=new HibernateDao();
    	 if(lstval==null||lstval.isEmpty()){
    		 List list=mydao.findAll(strcount);
    		 int num=Integer.parseInt(list.get(0).toString());
    		 this.setRecordnumber(num);
    	 }else{
    		 List list=mydao.find(strcount, lstval);
    		 int num=Integer.parseInt(list.get(0).toString());
    		 this.setRecordnumber(num);
    	 }
    	 this.setLstval(lstval);
		this.strsql = strsql;
	}
	public List getLstval() {
		return lstval;
	}
	public void setLstval(List lstval) {
		this.lstval = lstval;
	}
	public int getRecordnumber() {
		return recordnumber;
	}
	public void setRecordnumber(int recordnumber) {
		if(recordnumber%pagesize==0){
			this.setPagenum(recordnumber/pagesize);
		}else{
			this.setPagenum(recordnumber/pagesize+1);
		}
		this.recordnumber = recordnumber;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		if(recordnumber%pagesize==0){
			this.setPagenum(recordnumber/pagesize);
		}else{
			this.setPagenum(recordnumber/pagesize+1);
		}
		this.pagesize = pagesize;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		if(currentpage<=0)
			currentpage=1;
		if(currentpage>pagenum)
			currentpage=pagenum;
		this.setCurrentrecord((currentpage-1)*pagesize);
		this.currentpage = currentpage;
	}
	public int getCurrentrecord() {
		return currentrecord;
	}
	public void setCurrentrecord(int currentrecord) {
		this.currentrecord = currentrecord;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLstname() {
		return lstname;
	}
	public void setLstname(String lstname) {
		this.lstname = lstname;
	}
	public String getResultname() {
		return resultname;
	}
	public void setResultname(String resultname) {
		this.resultname = resultname;
	}
	/* 使用StringBuffer缓冲存储界面上使用的分页工具条，其中包括，一个form，两个hidden标签，	五个翻页相关的按钮，一个单行文本标签以及若干分页相关的静态文本，
	 * 其中currentpage用于存放当前页，翻页按钮改变这个变量的值，然后进行提交。首页会将其置为1，末页会将其置为总页数上一页会把当前页减1，下一页会把当前页加1，提交后会由PageAction进行处理。		
	 *     pagename存放的是当前page对象的	名称将来会在PageAction的session中使用。																				
	 **/
	public String getToolbar(){
		StringBuffer strtool = new StringBuffer();
		strtool.append("<form action='page' method='post' >");
		strtool.append("共"+this.getPagenum()+"页&nbsp;&nbsp;");
		strtool.append("第"+this.getCurrentpage()+"页&nbsp;&nbsp;");
		strtool.append("共"+this.getRecordnumber()+"条记录&nbsp;&nbsp;");
		strtool.append("<input type='hidden' name='currentpage' value='"+this.getCurrentpage()+"'  />");
		strtool.append("<input type='hidden' name='pagename' value='"+this.getName()+"' />");
		if(this.getCurrentpage() == 1){
			strtool.append("<input type='button' value='首页' disabled onclick='this.form.currentpage.value=1;this.form.submit();' />");
			strtool.append("<input type='button' value='上一页' disabled "
					+"onclick='this.form.currentpage.value=this.form.currentpage.value-1;this.form.submit();' />");	
		}
		else{
			strtool.append("<input type='button' value='首页' onclick='this.form.currentpage.value=1;this.form.submit();' />");
			strtool.append("<input type='button' value='上一页' "
				+"onclick='this.form.currentpage.value=this.form.currentpage.value-1;this.form.submit();' />");
		}
		if(this.getCurrentpage() == this.getPagenum()){
			strtool.append("<input type='button' value='下一页' disabled "
					+"onclick='this.form.currentpage.value=eval(this.form.currentpage.value)+1;this.form.submit();' />");
			strtool.append("<input type='button' value='末页' disabled "
					+"onclick='this.form.currentpage.value="+this.pagenum+";this.form.submit();' />&nbsp;&nbsp;");
		}
		else{
			strtool.append("<input type='button' value='下一页' "
				+"onclick='this.form.currentpage.value=eval(this.form.currentpage.value)+1;this.form.submit();' />");
			strtool.append("<input type='button' value='末页' "
				+"onclick='this.form.currentpage.value="+this.pagenum+";this.form.submit();' />&nbsp;&nbsp;");
		}
		strtool.append("<input type='text' name='jumppage' size='5' />");
		strtool.append("<input type='button' value='跳转' "
				+"onclick='this.form.currentpage.value=this.form.jumppage.value;this.form.submit();' >");
		strtool.append("</form>");
		return strtool.toString();
	}
    
}
