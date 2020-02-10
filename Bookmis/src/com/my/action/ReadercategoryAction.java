package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.ReadercategoryBussiness;
import com.my.hibernate.Readercategory;
import com.my.util.Page;
import com.opensymphony.xwork2.ActionContext;

public class ReadercategoryAction {
	private Readercategory rc;
	private ReadercategoryBussiness mybBussiness=new ReadercategoryBussiness();
	public Readercategory getRc(){
		return rc;
	}
	public void setRc(Readercategory rc){
		this.rc=rc;
	}
	public String findAll() throws Exception{
		Page mypage=new Page();
		mypage.setStrsql("from Readercategory", null);
		mypage.setName("rcpage");
		mypage.setLstname("rclist");
		mypage.setResultname("readercategorylist");
		List list=mybBussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		ActionContext.getContext().getSession().put(mypage.getName(), mypage);
		return mypage.getResultname();
	}
}
