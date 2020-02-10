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

	public String search() throws Exception//��ѯ����
	{
		DateFormat formate= new SimpleDateFormat("yyyy-MM-dd");//���ڸ�ʽ����
		HttpServletRequest request=ServletActionContext.getRequest();
		String name=request.getParameter("name");//ͨ��request���name
		String author=request.getParameter("author");//���author
		String pubs=request.getParameter("pubs");//���pubs
		//System.out.println(name+"   "+department);
		try
		{
			name=new String(name.getBytes("iso-8859-1"),"gbk");
			author =new String(author.getBytes("iso-8859-1"),"gbk");//����ת��
			pubs= new String(author.getBytes("iso-8859-1"),"gbk");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		BookBnessiness mybussiness=new BookBnessiness();
		List list=mybussiness.find(name,author,pubs);//������������ݸ�����ѯ�б�
		StringBuffer strbuf=new StringBuffer();
		//json���������ʽ���ò�ѯ���ļ�¼
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
			strbuf.append("id:"+b.getId());//ͼ����
			strbuf.append(",name:'"+b.getName()+"'");//ͼ������
			strbuf.append(",author:'"+b.getAuthor()+"'");//����
			strbuf.append(",pubs:'"+b.getPubs()+"'");//������
			strbuf.append(",pubdate:'"+formate.format(b.getPubdate())+"'");//��������
			strbuf.append(",price:'"+b.getPrice()+"'");//�۸�
			strbuf.append(",bc:'"+b.getBookcategory().getName()+"'");//ͼ�����
			strbuf.append("}");
		}
		strbuf.append("]");
		strbuf.append("}");
		System.out.println(strbuf);//��ӡ���json�ַ�����ʽ
		this.setJsonbook(strbuf.toString());//�Ѹ��ַ�����ֵ��Josonbook�������Ա�����javascriptҳ�������
		return "jsonresult";//��Ӧ����
	}
}
