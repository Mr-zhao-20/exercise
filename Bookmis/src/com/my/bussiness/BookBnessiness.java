package com.my.bussiness;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.hibernate.mapping.Array;

import com.my.hibernate.Book;
import com.my.hibernate.HibernateDao;
import com.my.util.Page;
import com.my.util.Util;

public class BookBnessiness {
      private HibernateDao mydao=new HibernateDao();         
      public List findAll(Page mypage){
    	  List list=mydao.find(mypage);
    	  return list;
      }
      public int add(Book book,File pic,String picFileName,String realpath){
    	  int flag=0;
    	  if(picFileName!=null&&!picFileName.equals("")){
    		  try{
    			  String newPicFileName=Util.generateFileName(picFileName);
    			  File targetFile=new File(realpath+"\\"+newPicFileName);
    			  FileUtils.copyFile(pic, targetFile);
    			  book.setPicpath(newPicFileName);
    		  }catch(Exception e){
    			  e.printStackTrace();
    			  flag=-1;
    		  }
    	  }
    	  mydao.save(book);
    	  flag=1;
    	  return flag;
      }
      public Book findById(int id){
    	  Book b=(Book) mydao.findById(Book.class.getName(), id);
    	  return b;
      }
      public int delete(int id,String realpath){
    	  int flag=0;
    	  String strsql="from Borrow where book=?";
    	  List lstval=new ArrayList();
    	  Book book=(Book)mydao.findById(Book.class.getName(), id);
    	  lstval.add(book);
    	  List list=mydao.find(strsql, lstval);
    	  if(list.isEmpty()){
    		  File delFile=new File(realpath+"\\"+book.getPicpath());
    		  if(delFile.exists()){
    			  delFile.delete();
    		  }
    		  mydao.delete(book);
    		  flag=1;
    	  }else{
    		  flag=-1;
    	  }
    	  return flag;
      }
      public int update(Book book,File pic,String picFileName,String realpath){
    	  int flag=0;
    	  String strsql="from Book where isbn=? and id!=?";
    	  List lstval=new ArrayList();
    	  lstval.add(book.getIsbn());
    	  lstval.add(book.getId());
    	  List list=mydao.find(strsql, lstval);
    	  if(list.isEmpty()){
    		  if(picFileName!=null&&!picFileName.equals("")){
    			  try{
    				  File oldFile=new File(realpath+"\\"+book.getPicpath());
    				  if(oldFile.exists()){
    					  oldFile.delete();
    				  }
    				  String newFileName=Util.generateFileName(picFileName);
    				  File newFile=new File(realpath+"\\"+newFileName);
    				  FileUtils.copyFile(pic, newFile);
    				  book.setPicpath(newFileName);
    			  }catch (Exception e) {
					e.printStackTrace();
					flag=-1;
				}
    		  }
    		  mydao.update(book);
			  flag=1;
    	  }else{
    		  flag=-1;
    	  }
    	  return flag;
      }
      public Page creatPage(Book book,Date beginpubdate,Date endpubdate,Float minprice,Float maxprice){
    	  Page mypage=new Page();
    	  String strsql="from Book where 1=1";
    	  List lstval=new ArrayList();
    	  if(book.getName()!=null&&book.getName().equals("")){
    		  strsql=strsql+" and name like ?";
    		  lstval.add("%"+book.getName()+"%");
    	  }
    	  if(book.getAuthor()!=null&&book.getAuthor().equals("")){
    		  strsql=strsql+" and author like ?";
    		  lstval.add("%"+book.getAuthor()+"%");
    	  }
    	  if(book.getPubs()!=null&&book.getPubs().equals("")){
    		  strsql=strsql+" and pubs like ?";
    		  lstval.add("%"+book.getPubs()+"%");
    	  }
    	  if(beginpubdate!=null){
    		  strsql=strsql+" and pubdate>=?";
    		  lstval.add(beginpubdate);
    	  }
    	  if(endpubdate!=null){
    		  strsql=strsql+" and pubdate>=?";
    		  lstval.add(endpubdate);
    	  }
    	  if(minprice!=null){
    		  strsql=strsql+" and price>=?";
    		  lstval.add(minprice);
    	  }
    	  if(maxprice!=null){
    		  strsql=strsql+" and price<=?";
    		  lstval.add(maxprice);
    	  }
    	  mypage.setStrsql(strsql, lstval);
    	  return mypage;
      }
      
      public List find(String name,String author,String pubs)
      {
    	  String strsql="from Book where state='可借'";//借阅中对图书信息的多条件查询
    	  List lstval=new ArrayList();
    	  if(name!=null&&!name.equals(""))
    	  {
    		  strsql=strsql+" and name like ?";
    		  lstval.add("%"+name+"%");
    		  
    	  }
    	  if(author!=null&&!author.equals(""))
    	  {
    		  strsql=strsql+" and author like ?";
    		  lstval.add("%"+author+"%");
    	  }
    	  if(pubs!=null&&!pubs.equals(""))
    	  {
    		  strsql=strsql+" and pubs like ?";
    		  lstval.add("%"+pubs+"%");
    	  }
    	  List list=mydao.find(strsql, lstval);
    	  return list;
      }
}
