package com.my.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import com.my.bussiness.ReaderBussiness;
import com.my.bussiness.ReadercategoryBussiness;
import com.my.hibernate.Reader;
import com.my.util.Page;
import com.opensymphony.xwork2.ActionContext;
import com.sun.net.httpserver.HttpServer;

public class ReaderAction {
   private Reader reader;
   private ReaderBussiness mybussiness=new ReaderBussiness();
   public Reader getReader() {
	return reader;
}
   public void setReader(Reader reader) {
	this.reader = reader;
}
   public String findAll() throws Exception{
	    Page mypage=new Page();
		mypage.setStrsql("from Reader",null);
		mypage.setName("readerpage");
		mypage.setPagesize(2);
		mypage.setLstname("readerlist");
		mypage.setResultname("readerlist");
		List list=mybussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		ActionContext.getContext().getSession().put(mypage.getName(), mypage);
		return mypage.getResultname();
   }
}
