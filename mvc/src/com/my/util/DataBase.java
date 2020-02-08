package com.my.util;
import java.sql.*;
public class DataBase {
    public static Connection getConnection()
    {
    	Connection conn=null;
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/qq","root","123456");
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return conn;
    }
}
