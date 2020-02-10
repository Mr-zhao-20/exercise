package com.my.hibernate;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.my.util.Page;

public class HibernateDao {
	private Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	public void save(Object mybean)//����
	{
		Session session=getSession();
		Transaction tx=null;
		try
		{
			tx=session.beginTransaction();
			session.save(mybean);
			tx.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	public List find(String strsql,List lstval)//��ѯ��ʹ�ö��������ѯ�����
	{
		List list=null;
		Session session=getSession();
		try
		{
			Query query=session.createQuery(strsql);
			for(int i=0;i<lstval.size();i++)
			{
				query.setParameter(i, lstval.get(i));
			}
			list=query.list();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return list;
	}
	public void update(Object mybean)//�޸�
	{
		Session session=getSession();
		Transaction tx=null;
		try
		{
			tx=session.beginTransaction();
			session.update(mybean);
			tx.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	public void delete(Object mybean)//ɾ��
	{
		Session session=getSession();
		Transaction tx=null;
		try
		{
			tx=session.beginTransaction();
			session.delete(mybean);
			tx.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
	}
	public Object findById(String classname,Integer id)//ͨ��ID�����Ӧ����
	{
		Object object=null;
		Session session=getSession();
		try
		{
			object=session.get(classname, id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return object;
	}
	public List findAll(String strsql)//��ѯ�������м�¼
	{
		List list=null;
		Session session=getSession();
		try
		{
			Query query=session.createQuery(strsql);
			list=query.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public List find(Page mypage)//��ѯ��ʹ���ڶ��������ѯ�����
	{
		List list=null;
		Session session=getSession();
		try{
			Query query=session.createQuery(mypage.getStrsql());
			List lstval=mypage.getLstval();
			if(lstval!=null&&!lstval.isEmpty()){
				for(int i=0;i<lstval.size();i++)
				{
					query.setParameter(i,lstval.get(i));
				}
			}
			query.setFirstResult(mypage.getCurrentrecord());
			query.setMaxResults(mypage.getPagesize());
			list=query.list();
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public static void main(String args[]){
		Page mypage=new Page();
		String strsql="from Book";
		mypage.setStrsql(strsql,null);
		System.out.println("��¼��:"+mypage.getRecordnumber());
		mypage.setPagesize(3);
		System.out.println("��ҳ����"+mypage.getPagenum());
		mypage.setCurrentpage(2);
		HibernateDao mydao=new HibernateDao();
		List list=mydao.find(mypage);
		Iterator it=list.iterator();
		while(it.hasNext()){
			Book temp=(Book)it.next();
			System.out.println(temp.getId()+" "+temp.getName()+" "+temp.getAuthor());
		}
	}
}
