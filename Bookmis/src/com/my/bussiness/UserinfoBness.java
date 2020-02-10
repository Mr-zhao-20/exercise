package com.my.bussiness;

import java.util.ArrayList;
import java.util.List;

import com.my.hibernate.HibernateDao;
import com.my.hibernate.Userinfo;

public class UserinfoBness {
	private HibernateDao mydao=new HibernateDao();
	public int login(Userinfo ui)
	{
		int flag=0;
		String strsql="from Userinfo where username=?";
		List lstval=new ArrayList();
		lstval.add(ui.getUsername());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty())
			flag=-1;//用户名不正确返回-1；
		else
		{
			strsql="from Userinfo where username=? and password=?";
			lstval.add(ui.getPassword());
			list=mydao.find(strsql, lstval);
			if(list.isEmpty())
				flag=-2;//用户名正确，但是密码错误返回-2；
			else
				flag=0;//用户名正确，密码也正确返回0；
		}
		return flag;
	}
	public List findAll()//查询userinfo你表中的所有数据
	{
		String strsql="from Userinfo";
		List list=mydao.findAll(strsql);
		return list;
	}
	public int add(Userinfo ui)//新增，根据用户名查询得到列表有不同返回值
	{
		int flag=0;
		String strsql="from Userinfo where username=?";
		List lstval=new ArrayList();
		lstval.add(ui.getUsername());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty())//列表为空，说明该用户没有被占用
		{
			flag=1;//返回并新增
			mydao.save(ui);
		}
		else
		{
			flag=-1;//列表不为空，说明用户名被占用不能被新增
		}
		return flag;
	}
	public void delete(int id)
	{
		Userinfo ui=(Userinfo)mydao.findById(Userinfo.class.getName(), id);
		mydao.delete(ui);
	}
	public Userinfo preupdate(int id)//根据id获得对象，并返回这个对象
	{
		Userinfo ui=(Userinfo)mydao.findById(Userinfo.class.getName(), id);
		return ui;
	}
	public int update(Userinfo ui)//修改，修改成功返回1，不成功返回-1
	{
		int flag=0;
		String strsql="from Userinfo where username=? and id!=?";
		List lstval=new ArrayList();
		lstval.add(ui.getUsername());
		lstval.add(ui.getId());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty())
		{
			flag=1;
			mydao.update(ui);
		}
		else
		{
			flag=-1;
		}
		return flag;
	}
}
