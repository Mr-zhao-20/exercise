package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.my.bussiness.BorrowBussiness;
import com.my.hibernate.Borrow;
import com.my.util.Page;
import com.opensymphony.xwork2.ActionContext;

public class BorrowAction {
    private Borrow borrow;
    private BorrowBussiness mybussiness=new BorrowBussiness();
	public Borrow getBorrow() {
		return borrow;
	}
	public void setBorrow(Borrow borrow) {
		this.borrow = borrow;
	}
	public String findAll() throws Exception{
	    Page mypage=new Page();
		mypage.setStrsql("from Borrow",null);
		mypage.setName("borrowpage");
		mypage.setPagesize(2);
		mypage.setLstname("borrowlist");
		mypage.setResultname("borrowlist");
		List list=mybussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		ActionContext.getContext().getSession().put(mypage.getName(), mypage);
		return mypage.getResultname();
   }
}
