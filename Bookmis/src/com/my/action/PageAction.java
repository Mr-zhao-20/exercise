package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.hibernate.HibernateDao;
import com.my.util.Page;
import com.opensymphony.xwork2.ActionContext;

public class PageAction {
       private String pagename;
       private int currentpage;
	public String getPagename() {
		return pagename;
	}
	public void setPagename(String pagename) {
		this.pagename = pagename;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public String execute() throws Exception{
		Page mypage=(Page)ActionContext.getContext().getSession().get(pagename);
		mypage.setCurrentpage(currentpage);
		HibernateDao mydao=new HibernateDao();
		List list=mydao.find(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		ServletActionContext.getRequest().setAttribute(mypage.getLstname(), list);
		ActionContext.getContext().getSession().put(mypage.getName(), mypage);
		return mypage.getResultname();
	}
}
