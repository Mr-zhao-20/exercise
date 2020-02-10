package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.ListView;

import com.my.hibernate.HibernateDao;
import com.my.util.Page;

public class ReaderBussiness {
	private HibernateDao mydao=new HibernateDao();
	public List findAll(Page mypage){
  	  List list=mydao.find(mypage);
  	  return list;
    }
	public List find(String name,String department)//json模糊多条件查询  ReaderAjaxAction中调用
	{
		String strsql="from Reader where 1=1";
		List lstval=new ArrayList();
		if(name!=null&&!name.equals(""))
		{
			strsql=strsql+" and name like ?";
			lstval.add("%"+name+"%");
		}
		if(department!=null&&!department.equals(""))
		{
			strsql=strsql+" and department like ?";
			lstval.add("%"+department+"%");
		}
		List list=mydao.find(strsql, lstval);
		return list;
	}
}
