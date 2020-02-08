package com.my.bean;

import java.sql.*;
import java.util.ArrayList;

import sun.org.mozilla.javascript.internal.EcmaError;

import com.my.util.DataBase;
public class javabean {
	private String username;
	private int id;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int login()
	{
		int flag=0;
		try
		{
			Connection conn=DataBase.getConnection();
			String sql="select * from login where username='"+username+"' and password='"+password+"'";
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
				flag=1;
			}
			else
			{
				flag=0;
			}
			rs.close();
			st.close();
			conn.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	public int Add()
	{
		int flag=0;
		try
		{
			Connection conn=DataBase.getConnection();
			String sql="insert into login(username,password) values('"+username+"','"+password+"')";
			Statement st=conn.createStatement();
			flag=st.executeUpdate(sql);
			st.close();
			conn.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
		
	}
	public ArrayList findAll()
	{
		ArrayList mylist=new ArrayList();
		try
		{
			Connection conn=DataBase.getConnection();
			String sql="select * from login";
			Statement st=conn.createStatement();
		    ResultSet rs=st.executeQuery(sql);
		    while(rs.next())
		    {
		    	javabean mybean=new javabean();
		    	mybean.setId(rs.getInt(1));
		    	mybean.setUsername(rs.getString(2));
		    	mybean.setPassword(rs.getString(3));
		    	mylist.add(mybean);
		    }
		    rs.close();
		    st.close();
		    conn.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return mylist;
	}
	public static void main(String args[])
	{
		javabean mybean=new javabean();
		System.out.println("显示list中数据");
		ArrayList mylist=mybean.findAll();
		for(int i=0;i<mylist.size();i++)
		{
			javabean jb=new javabean();
			jb=(javabean)mylist.get(i);
			System.out.println(jb.getId()+" "+jb.getUsername()+" "+jb.getPassword());
		}
		
	}
	public javabean get()
	{
		javabean mybean=new javabean();;
		try
		{
		  Connection conn=DataBase.getConnection();
		  String sql="select * from login where id="+id;
		  Statement st=conn.createStatement();
		  ResultSet rs=st.executeQuery(sql);
		  if(rs.next())
		  {
			  int id=rs.getInt(1);
			  String name=rs.getString(2);
			  String password=rs.getString(3);
			  mybean.setId(id);
			  mybean.setUsername(username);
			  mybean.setPassword(password);
		  }
		  rs.close();
		  st.close();
		  conn.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return mybean;
	}
	public int update()
	{
		int flag=0;
		try
		{
		 Connection conn=DataBase.getConnection();
		 String sql="update login set username=?,password=? where id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setString(1, username);
		 ps.setString(2, password);
		 ps.setInt(3, id);
		 flag=ps.executeUpdate();
		 ps.close();
		 conn.close();
		}catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return flag;
	}
}

