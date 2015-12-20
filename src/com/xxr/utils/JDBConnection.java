package com.xxr.utils;

import java.sql.*;

/**
 * @author xiongxianren
 * @desciption 数据库连接工具类
 */
public class JDBConnection {
	private final String dbDriver = "com.mysql.jdbc.Driver"; 
	String driverName = "com.mysql.jdbc.Driver";         
    String userName = "root";           
    String userPasswd = "951013xm";           
    String dbName = "album";            
    String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
            + userName + "&password=" + userPasswd;  
	private Connection con = null; 
	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance();
		} catch (Exception ex) {
			System.out.println("JDBC line 18");
		}
	}

	public boolean creatConnection() {
		try {
			con = DriverManager.getConnection(url); 
			con.setAutoCommit(true);
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("creatConnectionError!");
			return false;
		}
	}

	public boolean executeUpdate(String sql) {
		if (con == null) {
			creatConnection();
		}
		try {
			Statement stmt = con.createStatement();
			int iCount = stmt.executeUpdate(sql); 
			System.out.println("success excute "+iCount+" lines sql"); 
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false; 
		}
	}
	public ResultSet executeQuery(String sql) {
		ResultSet rs;
		try {
			if (con == null) { 
				creatConnection();
			}
			Statement stmt = con.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			try {
				rs = stmt.executeQuery(sql); 
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("executeQueryError!");
			return null;
		}
		return rs;
	}
	
	public void closeConnection() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Failed to close connection!");
			} finally {
				con = null;
			}
		}
	}

}
