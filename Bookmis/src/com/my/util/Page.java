package com.my.util;

import java.util.List;



import com.my.hibernate.HibernateDao;

public class Page {
	private String strsql;//���hql���
	private List lstval;//���hql����Ӧ�Ĳ���ֵ
	private int recordnumber;//����ܼ�¼��
	private int pagesize=3;//ҳ���С����ÿҳ��ʾ�ļ�¼��
	private int pagenum;//��ҳ��
	private int currentpage=1;//��ǰ��ҳ������1��ʼ
	private int currentrecord;//��ǰҳ�ĵ�һ����¼�ļ�¼�ţ��ӵ�һҳ��һ��0��ʼ
	private String name;//��ҳ��������ƣ���session��ʹ��
	private String lstname;//ҳ����ʾ�����б�����ƣ���request��ʹ��
	private String resultname;//ҳ����ת��Ҫ��ҳ�����ƣ���Action�ķ�����ʹ��
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
	/* ʹ��StringBuffer����洢������ʹ�õķ�ҳ�����������а�����һ��form������hidden��ǩ��	�����ҳ��صİ�ť��һ�������ı���ǩ�Լ����ɷ�ҳ��صľ�̬�ı���
	 * ����currentpage���ڴ�ŵ�ǰҳ����ҳ��ť�ı����������ֵ��Ȼ������ύ����ҳ�Ὣ����Ϊ1��ĩҳ�Ὣ����Ϊ��ҳ����һҳ��ѵ�ǰҳ��1����һҳ��ѵ�ǰҳ��1���ύ�����PageAction���д���		
	 *     pagename��ŵ��ǵ�ǰpage�����	���ƽ�������PageAction��session��ʹ�á�																				
	 **/
	public String getToolbar(){
		StringBuffer strtool = new StringBuffer();
		strtool.append("<form action='page' method='post' >");
		strtool.append("��"+this.getPagenum()+"ҳ&nbsp;&nbsp;");
		strtool.append("��"+this.getCurrentpage()+"ҳ&nbsp;&nbsp;");
		strtool.append("��"+this.getRecordnumber()+"����¼&nbsp;&nbsp;");
		strtool.append("<input type='hidden' name='currentpage' value='"+this.getCurrentpage()+"'  />");
		strtool.append("<input type='hidden' name='pagename' value='"+this.getName()+"' />");
		if(this.getCurrentpage() == 1){
			strtool.append("<input type='button' value='��ҳ' disabled onclick='this.form.currentpage.value=1;this.form.submit();' />");
			strtool.append("<input type='button' value='��һҳ' disabled "
					+"onclick='this.form.currentpage.value=this.form.currentpage.value-1;this.form.submit();' />");	
		}
		else{
			strtool.append("<input type='button' value='��ҳ' onclick='this.form.currentpage.value=1;this.form.submit();' />");
			strtool.append("<input type='button' value='��һҳ' "
				+"onclick='this.form.currentpage.value=this.form.currentpage.value-1;this.form.submit();' />");
		}
		if(this.getCurrentpage() == this.getPagenum()){
			strtool.append("<input type='button' value='��һҳ' disabled "
					+"onclick='this.form.currentpage.value=eval(this.form.currentpage.value)+1;this.form.submit();' />");
			strtool.append("<input type='button' value='ĩҳ' disabled "
					+"onclick='this.form.currentpage.value="+this.pagenum+";this.form.submit();' />&nbsp;&nbsp;");
		}
		else{
			strtool.append("<input type='button' value='��һҳ' "
				+"onclick='this.form.currentpage.value=eval(this.form.currentpage.value)+1;this.form.submit();' />");
			strtool.append("<input type='button' value='ĩҳ' "
				+"onclick='this.form.currentpage.value="+this.pagenum+";this.form.submit();' />&nbsp;&nbsp;");
		}
		strtool.append("<input type='text' name='jumppage' size='5' />");
		strtool.append("<input type='button' value='��ת' "
				+"onclick='this.form.currentpage.value=this.form.jumppage.value;this.form.submit();' >");
		strtool.append("</form>");
		return strtool.toString();
	}
    
}
