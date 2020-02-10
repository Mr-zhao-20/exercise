package com.my.util;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub	
	}
	public void doFilter(ServletRequest arg0, ServletResponse arg1,FilterChain arg2) throws IOException, ServletException {
		    HttpServletRequest request = (HttpServletRequest) arg0;
	        HttpServletResponse response = (HttpServletResponse) arg1;
	        HttpSession session = request.getSession();
	         String url=request.getServletPath(); 
	         System.out.println(url);
	       
	         if (url.indexOf("index.jsp") > -1||url.indexOf("images")>-1||url.indexOf("css")>-1) 
	         {
		            arg2.doFilter(arg0, arg1);
		     } 
	         else 
	         {
	        	   
	        	   String username=(String)session.getAttribute("username");  //��session�л�ñ���ĵ�¼�û����û���    
	        	 //�粻��������ô��Ҫ�ж� session�з��б�־�����û�б�־����ô��������������ȥ��¼����ִ֮�в�����
		            if (username == null || username.equals("")) {
		                response.sendRedirect("index.jsp");
		            } else {
		                arg2.doFilter(arg0, arg1);
		            }
		        }	
	}
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}
