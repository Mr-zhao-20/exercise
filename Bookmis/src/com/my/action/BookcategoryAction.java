package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BookcategoryBussiness;
import com.my.hibernate.Bookcategory;
import com.my.hibernate.HibernateDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookcategoryAction extends ActionSupport{
	private Bookcategory bc;
	private BookcategoryBussiness mybussiness=new BookcategoryBussiness();
	public Bookcategory getBc() {
		return bc;
	}

	public void setBc(Bookcategory bc) {
		this.bc = bc;
	}
	public String findAll() throws Exception{
		List list=mybussiness.findAll();
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("bclist", list);
		return "bookcategorylist";
	}
	public String add() throws Exception{
		int flag=mybussiness.add(bc);
		if(flag==1){
			return findAll();
		}else{
			this.addFieldError("bc.name","该图书分类名称已经存在");
			return "bookcategoryadd";
		}
	}
	public String delete() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
    	int id=Integer.parseInt(request.getParameter("id"));
    	int flag=mybussiness.delete(id);
    	if(flag==1){
    		return findAll();
    	}else{
    		this.addActionError("该图书分类下有相关图书，如想删除，请先删除相关图书信息！");
    		return findAll();
    	}
	}public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		bc=mybussiness.preupdate(id);
		return "bookcategoryupdate";
	}
	
}
