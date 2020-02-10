package com.my.action;

import java.io.File;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;
import com.my.bussiness.BookBnessiness;
import com.my.bussiness.BookcategoryBussiness;
import com.my.hibernate.Book;
import com.my.util.Page;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport{
	private Book book;
	private BookBnessiness mybussiness=new BookBnessiness();
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	public String findAll() throws Exception{
		/*List list=mybussiness.findAll();
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("blist", list);
		return "booklist";*/
		Page mypage=new Page();
		mypage.setStrsql("from Book",null);
		mypage.setName("bookpage");
		mypage.setPagesize(5);
		mypage.setLstname("blist");
		mypage.setResultname("booklist");
		
		
		
		List list=mybussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		ActionContext.getContext().getSession().put(mypage.getName(), mypage);
		return mypage.getResultname();
	}
	public String preadd() throws Exception{
		BookcategoryBussiness bcbussiness=new BookcategoryBussiness();
		List list=bcbussiness.findAll();
		if(list.isEmpty()){
			this.addActionError("现在还没有图书分类，如果想添加图书，请先添加图书分类");
		}
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("bclist", list);
		return "bookadd";
	}
	private File pic;
	private String picContentType;
	private String picFileName;
	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	public String add() throws Exception {
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		book.setState("可惜");
		int flag=mybussiness.add(book,pic,picFileName,realpath);
		if(flag==1){
			return findAll();
		}else{
			this.addFieldError("book.name", "文件上传失败");
			return preadd();
		}
	}
	public String showOne() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		book =mybussiness.findById(id);
		return "bookshowone";
	}
	public String delete() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		String realpath=ServletActionContext.getServletContext().getRealPath("/uplaod");
		int flag=mybussiness.delete(id, realpath);
		if(flag==1){
			return findAll();
		}else{
			this.addActionError("请先删除该图书的相关借阅信息");
			return findAll();
		}
		
	}
	public String preupdate() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		book=mybussiness.findById(id);
		BookcategoryBussiness bcBussiness=new BookcategoryBussiness();
		List list=bcBussiness.findAll();
		request.setAttribute("bclist", list);
		return "bookupdate";
	}
	public String update() throws Exception{
		String realpath=ServletActionContext.getServletContext().getRealPath("/upload");
		HttpServletRequest request=ServletActionContext.getRequest();
		int flag=mybussiness.update(book, pic, picFileName,realpath);
		if(flag==1){
			return findAll();
		}else{
			if(flag==-1){
				this.addFieldError("book.name", "上传文件失败");
				BookcategoryBussiness bcBussiness=new BookcategoryBussiness();
				List list=bcBussiness.findAll();
				request.setAttribute("bclist", list);
				return "bookupdate";
			}else{
				this.addFieldError("bookname", "该ISBN号图书已经存在，请重新输入！");
				BookcategoryBussiness bcBussiness=new BookcategoryBussiness();
				List list=bcBussiness.findAll();
				request.setAttribute("bclist", list);
				return "bookupdate";
			}
		}
	}
	private Date beginpubdate;
	private Date endpubdate;
	private Float minprice;
	private Float maxprice;
	public Date getBeginpubdate() {
		return beginpubdate;
	}

	public void setBeginpubdate(Date beginpubdate) {
		this.beginpubdate = beginpubdate;
	}

	public Date getEndpubdate() {
		return endpubdate;
	}

	public void setEndpubdate(Date endpubdate) {
		this.endpubdate = endpubdate;
	}

	public Float getMinprice() {
		return minprice;
	}

	public void setMinprice(Float minprice) {
		this.minprice = minprice;
	}

	public Float getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(Float maxprice) {
		this.maxprice = maxprice;
	}
	public String find() throws Exception{
		Page mypage=mybussiness.creatPage(book, beginpubdate, endpubdate, minprice, maxprice);
		mypage.setName("bookpage");
		mypage.setLstname("booklist");
		mypage.setResultname("booklist");
		List list=mybussiness.findAll(mypage);
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute(mypage.getLstname(), list);
		ActionContext.getContext().getSession().put(mypage.getName(), mypage);
		return mypage.getResultname();
	}
	
}
