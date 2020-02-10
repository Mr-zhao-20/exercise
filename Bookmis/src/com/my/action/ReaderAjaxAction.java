package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.ReaderBussiness;
import com.my.hibernate.Reader;
import com.opensymphony.xwork2.ActionSupport;

public class ReaderAjaxAction extends ActionSupport{
	private String jsonreader;

	public String getJsonreader() {
		return jsonreader;
	}

	public void setJsonreader(String jsonreader) {
		this.jsonreader = jsonreader;
	}	
	public String search() throws Exception//查询方法
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String name=request.getParameter("name");//通过request获得name
		String department=request.getParameter("department");//获得department
		//System.out.println(name+"   "+department);
		try
		{
			name=new String(name.getBytes("iso-8859-1"),"gbk");
			department =new String(department.getBytes("iso-8859-1"),"gbk");//中文转换
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		ReaderBussiness mybussiness= new ReaderBussiness();
		List list=mybussiness.find(name, department);//根据所填的内容给出查询列表
		StringBuffer strbuf=new StringBuffer();
		//json以数组的形式设置查询出的记录
		strbuf.append("{");
		strbuf.append("rs:[");
		for(int i=0;i<list.size();i++)
		{
			Reader r=(Reader)list.get(i);
			if(i==0)
			{
				strbuf.append("{");
			}
			else
			{
				strbuf.append(",{");
			}
			strbuf.append("id:"+r.getId());
			strbuf.append(",name:'"+r.getName()+"'");
			strbuf.append(",sex:'"+r.getSex()+"'");
			strbuf.append(",phone:'"+r.getPhone()+"'");
			strbuf.append(",department:'"+r.getDepartment()+"'");
			strbuf.append(",rc:'"+r.getReadercategory().getName()+"'");
			strbuf.append("}");
		}
		strbuf.append("]");
		strbuf.append("}");
		System.out.println(strbuf);//打印输出json字符串样式
		this.setJsonreader(strbuf.toString());//把该字符串赋值给Josonreader变量，以便于在javascript页面中输出
		return "jsonresult";//响应界面
	}
}
