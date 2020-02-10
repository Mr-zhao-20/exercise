package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import com.my.hibernate.Bookcategory;
import com.my.hibernate.HibernateDao;

public class BookcategoryBussiness {
	private HibernateDao mydao=new HibernateDao();
	public List findAll(){
		String strsql="from Bookcategory";
		List list=mydao.findAll(strsql);
		return list;
	}
	public int add(Bookcategory bc){
		int flag=0;
		String strsql="from Bookcategory where name=?";
		List lstval=new ArrayList();
		lstval.add(bc.getName());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			flag=1;
			mydao.save(bc);
		}else{
			flag=-1;
		}
		return flag;
	}
	public int delete(int id){
		int flag=0;
		Bookcategory bc=(Bookcategory)mydao.findById(Bookcategory.class.getName(), id);
		String strsql="from Book where bookcategory=?";
		List lstval=new ArrayList();
		lstval.add(bc);
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty()){
			flag=1;
			mydao.delete(bc);
		}else{
			flag=-1;
		}
		return flag;
	}
	public Bookcategory preupdate(int id){
		Bookcategory bc=(Bookcategory)mydao.findById(Bookcategory.class.getName(), id);
		return bc;
	}
	
}
