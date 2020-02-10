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
	public String search() throws Exception//��ѯ����
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String name=request.getParameter("name");//ͨ��request���name
		String department=request.getParameter("department");//���department
		//System.out.println(name+"   "+department);
		try
		{
			name=new String(name.getBytes("iso-8859-1"),"gbk");
			department =new String(department.getBytes("iso-8859-1"),"gbk");//����ת��
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		ReaderBussiness mybussiness= new ReaderBussiness();
		List list=mybussiness.find(name, department);//������������ݸ�����ѯ�б�
		StringBuffer strbuf=new StringBuffer();
		//json���������ʽ���ò�ѯ���ļ�¼
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
		System.out.println(strbuf);//��ӡ���json�ַ�����ʽ
		this.setJsonreader(strbuf.toString());//�Ѹ��ַ�����ֵ��Josonreader�������Ա�����javascriptҳ�������
		return "jsonresult";//��Ӧ����
	}
}
