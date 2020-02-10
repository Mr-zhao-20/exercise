package com.my.bussiness;

import java.util.List;

import com.my.hibernate.HibernateDao;
import com.my.util.Page;

public class BorrowBussiness {
	private HibernateDao mydao=new HibernateDao();
    
    public List findAll(Page mypage){
  	  List list=mydao.find(mypage);
  	  return list;
    }
}
