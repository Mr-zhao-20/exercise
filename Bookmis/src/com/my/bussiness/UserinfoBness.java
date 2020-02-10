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
			flag=-1;//�û�������ȷ����-1��
		else
		{
			strsql="from Userinfo where username=? and password=?";
			lstval.add(ui.getPassword());
			list=mydao.find(strsql, lstval);
			if(list.isEmpty())
				flag=-2;//�û�����ȷ������������󷵻�-2��
			else
				flag=0;//�û�����ȷ������Ҳ��ȷ����0��
		}
		return flag;
	}
	public List findAll()//��ѯuserinfo����е���������
	{
		String strsql="from Userinfo";
		List list=mydao.findAll(strsql);
		return list;
	}
	public int add(Userinfo ui)//�����������û�����ѯ�õ��б��в�ͬ����ֵ
	{
		int flag=0;
		String strsql="from Userinfo where username=?";
		List lstval=new ArrayList();
		lstval.add(ui.getUsername());
		List list=mydao.find(strsql, lstval);
		if(list.isEmpty())//�б�Ϊ�գ�˵�����û�û�б�ռ��
		{
			flag=1;//���ز�����
			mydao.save(ui);
		}
		else
		{
			flag=-1;//�б�Ϊ�գ�˵���û�����ռ�ò��ܱ�����
		}
		return flag;
	}
	public void delete(int id)
	{
		Userinfo ui=(Userinfo)mydao.findById(Userinfo.class.getName(), id);
		mydao.delete(ui);
	}
	public Userinfo preupdate(int id)//����id��ö��󣬲������������
	{
		Userinfo ui=(Userinfo)mydao.findById(Userinfo.class.getName(), id);
		return ui;
	}
	public int update(Userinfo ui)//�޸ģ��޸ĳɹ�����1�����ɹ�����-1
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
