package com.my.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BookBnessiness;
import com.my.bussiness.ReaderBussiness;
import com.my.hibernate.Book;
import com.my.hibernate.Reader;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.SimpleDate;

public class BookAjaxAction extends ActionSupport{
	private String jsonbook;
	
	public String getJsonbook() {
		return jsonbook;
	}

	public void setJsonbook(String jsonbook) {
		this.jsonbook = jsonbook;
	}

	public String search() throws Exception//查询方法
	{
		DateFormat formate= new SimpleDateFormat("yyyy-MM-dd");//日期格式设置
		HttpServletRequest request=ServletActionContext.getRequest();
		String name=request.getParameter("name");//通过request获得name
		String author=request.getParameter("author");//获得author
		String pubs=request.getParameter("pubs");//获得pubs
		//System.out.println(name+"   "+department);
		try
		{
			name=new String(name.getBytes("iso-8859-1"),"gbk");
			author =new String(author.getBytes("iso-8859-1"),"gbk");//中文转换
			pubs= new String(author.getBytes("iso-8859-1"),"gbk");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		BookBnessiness mybussiness=new BookBnessiness();
		List list=mybussiness.find(name,author,pubs);//根据所填的内容给出查询列表
		StringBuffer strbuf=new StringBuffer();
		//json以数组的形式设置查询出的记录
		strbuf.append("{");
		strbuf.append("rs:[");
		for(int i=0;i<list.size();i++)
		{
			Book b=(Book)list.get(i);
			if(i==0)
			{
				strbuf.append("{");
			}
			else
			{
				strbuf.append(",{");
			}
			strbuf.append("id:"+b.getId());//图书编号
			strbuf.append(",name:'"+b.getName()+"'");//图书名称
			strbuf.append(",author:'"+b.getAuthor()+"'");//作者
			strbuf.append(",pubs:'"+b.getPubs()+"'");//出版社
			strbuf.append(",pubdate:'"+formate.format(b.getPubdate())+"'");//出版日期
			strbuf.append(",price:'"+b.getPrice()+"'");//价格
			strbuf.append(",bc:'"+b.getBookcategory().getName()+"'");//图书分类
			strbuf.append("}");
		}
		strbuf.append("]");
		strbuf.append("}");
		System.out.println(strbuf);//打印输出json字符串样式
		this.setJsonbook(strbuf.toString());//把该字符串赋值给Josonbook变量，以便于在javascript页面中输出
		return "jsonresult";//响应界面
	}
}
