package com.my.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.ServletActionRedirectResult;

import com.my.bussiness.UserinfoBness;
import com.my.hibernate.Userinfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserinfoAction extends ActionSupport{
	private Userinfo ui;
	private UserinfoBness mybness=new UserinfoBness();
	public Userinfo getUi() {
		return ui;
	}
	public void setUi(Userinfo ui) {
		this.ui = ui;
	}
	public String login() throws Exception
	{
		int flag=mybness.login(ui);
		if(flag==0)
		{
			ActionContext.getContext().getSession().put("username", ui.getUsername());
			return "main";
		}
		else
		{
			if(flag==-1)
			{
				this.addFieldError("ui.username", "用户名错误！");
				return "error";
			}
			else
			{
				this.addFieldError("ui.username", "密码错误！");
				return "error";
			}
		}
	}
	public String findAll() throws Exception//查询userinfo变种的数据，并将列表打包
	{
		List list=mybness.findAll();
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("uilist", list);
		return "userinfolist";
	}
    public String add() throws Exception
    {
    	int flag=mybness.add(ui);
    	if(flag==1)
    	{
    		return findAll();
    	}
    	else
    	{
    		this.addFieldError("ui.username","用户名已被占用!");
    		return "userinfoadd";
    	}
    }
    public String delete() throws Exception
    {
    	HttpServletRequest request=ServletActionContext.getRequest();
    	int id=Integer.parseInt(request.getParameter("id"));
    	mybness.delete(id);
    	return findAll();
    }
    public String preupdate() throws Exception
    {
    	HttpServletRequest request=ServletActionContext.getRequest();
    	int id=Integer.parseInt(request.getParameter("id"));
    	ui=mybness.preupdate(id);
    	return "userinfoupdate";
    }
    public String update() throws Exception
    {
    	int flag=mybness.update(ui);
    	if(flag==1)
    	{
    		return findAll();
    	}
    	else
    	{
    		this.addFieldError("ui.username","该用户名已被占用");
    		return "userinfoupdate";
    	}
    }
    public String logout() throws Exception
	{
		ActionContext.getContext().getSession().remove("username");
		return "error";
	}
}
