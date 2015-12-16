package com.wy.tools;

import java.sql.*;

public class JDBConnection {
	private final String dbDriver = "com.mysql.jdbc.Driver"; 
	String driverName = "com.mysql.jdbc.Driver";         
    String userName = "root";           
    String userPasswd = "951013xm";           
    String dbName = "album";            
    String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
            + userName + "&password=" + userPasswd;  
	private Connection con = null; // �������Ӷ��󣬲���ֵΪnull
	// ͨ���췽��������ݿ���
	public JDBConnection() {
		try {
			Class.forName(dbDriver).newInstance(); // ͨ��Java������ƽ��м�����ݿ������
		} catch (Exception ex) {
			System.out.println("��ݿ����ʧ��");
		}
	}
	// ������ݿ�����
	public boolean creatConnection() {
		try {
			con = DriverManager.getConnection(url); // ����û���url��ַ�Լ��������������Ӳ���
			con.setAutoCommit(true); // ����ϵͳ���Զ����Ӳ���
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("creatConnectionError!");
			return false;
		}
	}
	// ����ݿ�����ӡ��޸ĺ�ɾ��Ĳ���
	public boolean executeUpdate(String sql) {
		if (con == null) { // ��con����Ϊ�գ�����creatConnection()������ʵ����ݿ����Ӳ���
			creatConnection();
		}
		try {
			Statement stmt = con.createStatement();
			int iCount = stmt.executeUpdate(sql); // ִ�в���SQL���
			System.out.println("�����ɹ�����Ӱ��ļ�¼��Ϊ" + String.valueOf(iCount)); // �ڿ���̨����ʾִ�еĽ��
			return true; // ���SQL���ִ�гɹ�������true
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false; // ���SQL���ִ��ʧ�ܣ�����false
		}
	}
	// ����ݿ�Ĳ�ѯ����
	public ResultSet executeQuery(String sql) {
		ResultSet rs; // ����ResultSet������rs
		try {
			if (con == null) { // ��con����Ϊnull��ȡ����ݿ����Ӳ���
				creatConnection();
			}
			Statement stmt = con.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			try {
				rs = stmt.executeQuery(sql); // ִ�в����е�SQL���
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("executeQueryError!");
			return null;
		}
		return rs; // ����ѯ�Ľ��ͨ��return�ؼ��ֽ��з���
	}
	// �ر���ݿ�Ĳ���
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
