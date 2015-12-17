package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wy.form.Photo;
import com.wy.form.UserInfo;
import com.wy.tools.JDBConnection;

public class OperationData {
	private JDBConnection connection = null; 
	@SuppressWarnings("rawtypes")
	private List list = null;                
	String sql = "";                        
	                       
	public UserInfo user_query(String username) {
		UserInfo userInfo = null;        
		connection = new JDBConnection(); 
		sql = "SELECT * FROM tb_userInfo WHERE username='" + username + "'";
		
		ResultSet rs = connection.executeQuery(sql); 
		try {
		
			while (rs.next()) {
				userInfo = new UserInfo();
				userInfo.setUsername(rs.getString("username"));  
				userInfo.setPassword(rs.getString("password"));  
				userInfo.setRealname(rs.getString("realname")); 
				userInfo.setEmail(rs.getString("email"));        
				userInfo.setQuestion(rs.getString("question"));  
				userInfo.setResult(rs.getString("result"));      
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			connection.closeConnection();                       
		}
		return userInfo;                                        
	}

	public boolean user_save(UserInfo userinfo) {
		connection = new JDBConnection(); 
		sql = "INSERT INTO tb_userInfo VALUES ('"
				+ userinfo.getUsername() + "','"
				+ userinfo.getPassword() + "','"
				+ userinfo.getRealname() + "','" 
				+ userinfo.getEmail() + "','"
				+ userinfo.getQuestion() + "','" 
				+ userinfo.getResult() + "')";
		boolean flag = connection.executeUpdate(sql); 
		connection.closeConnection();                 
		return flag;                                  
	}

	public boolean photo_save(Photo photo) {
		connection = new JDBConnection(); 
		sql = "insert into tb_photo values ('" 
				+ photo.getPhotoName() + "','"
				+ photo.getPhotoSize() + "','" 
				+ photo.getPhotoType() + "','"
				+ photo.getPhotoTime() + "','" 
				+ photo.getPhotoAddress()+ "','" 
				+ photo.getUsername() + "','" 
				+ photo.getSmallPhoto()+ "')";
		boolean flag = connection.executeUpdate(sql); 
		connection.closeConnection(); 
		return flag; 
	}

	public boolean photo_delete(Integer id) {
		connection = new JDBConnection(); 
		sql = "delete from tb_photo where id=" + id + ""; 
		boolean flag = connection.executeUpdate(sql); 
		connection.closeConnection(); 
		return flag; 
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List photo_queryList(String condition) {
		Photo photo = null; 
		list = new ArrayList();
		sql = "SELECT * FROM tb_photo";
		if (condition != null) { 
			sql = "SELECT * FROM tb_photo WHERE " + condition + "";
		}
		connection = new JDBConnection(); 
		ResultSet rs = connection.executeQuery(sql); 
		try {
			while (rs.next()) {
				photo = new Photo();  
				photo.setPhotoName(rs.getString("photoName"));
				photo.setPhotoSize(rs.getString("photoSize"));
				photo.setPhotoType(rs.getString("photoType"));
				photo.setPhotoTime(rs.getString("photoTime"));
				photo.setPhotoAddress(rs.getString("photoAddress"));
				photo.setUsername(rs.getString("username"));
				photo.setSmallPhoto(rs.getString("smallPhoto"));
				list.add(photo); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection(); 
		}
		return list;
	}

	public String[] queryPhotoType(String username) {
		String[] type = null; 
		sql = "select photoType from tb_photo  where username='" + username
				+ "' group by photoType"; 
		connection = new JDBConnection();
		ResultSet rs = connection.executeQuery(sql); 
		try {
			rs.last(); 
			int length = rs.getRow(); 
			type = new String[length];
			rs.beforeFirst(); 
			int i = 0; 
			while (rs.next()) {
				type[i++] = rs.getString("photoType");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection();
		}
		return type; 
	}

//	public boolean updatePhoto(Photo photo) {
//		connection = new JDBConnection();
//		sql = "update tb_photo set printAddress = '" + photo.getPrintAddress()
//				+ "' where id = '" + photo.getId() + "'";
//
//		if (connection.executeUpdate(sql)) {
//			return true;
//		} else {
//			return false;
//		}
//	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryPhotoList() {
		connection = new JDBConnection();
		list = new ArrayList(); 
		sql = "select photoType,count(*) as number from tb_photo group by photoType order by number desc";
		Photo photo = null;
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				photo = new Photo();
				photo.setPhotoType(rs.getString("photoType"));
				photo.setNumber(rs.getInt("number"));
				list.add(photo); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection(); 
		}
		return list;
	}


}
