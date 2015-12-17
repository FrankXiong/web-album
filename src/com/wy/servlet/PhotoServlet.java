package com.wy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.wy.dao.OperationData;
import com.wy.form.Photo;
import com.wy.form.UserInfo;

public class PhotoServlet extends HttpServlet {

	private String info = "";

	private OperationData data = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		if (info.equals("userQueryPhoto")) {
			this.user_queryPhoto(request, response);
		}
		if (info.equals("userUploadPhoto")) {
			this.user_uploadPhoto(request, response);
		}
		if (info.equals("queryOnePhoto")) {
			this.queryOnePhoto(request, response);
		}
		if (info.equals("queryPhotoList")) {
			this.user_queryPhotoList(request, response);
		}
		if (info.equals("queryOnePhoto")) {
			this.queryOnePhoto(request, response);
		}
		if (info.equals("queryPhotoSlide")) {
			this.queryPhotoSlide(request, response);
		}
		if (info.equals("userDeletePhoto")) {
			this.user_deletePhoto(request, response);
		}
//		if (info.equals("userprintPhoto")) {
//
//			this.user_printPhoto(request, response);
//		}
		if (info.equals("forward_index")) {
			this.forward_index(request, response);
		}

	}

	@SuppressWarnings("rawtypes")
	public void forward_index(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = new OperationData().queryPhotoList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("photoIndex.jsp").forward(request,
				response);
	}

//	public void user_printPhoto(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		data = new OperationData();
//		Integer id = Integer.valueOf(request.getParameter("id"));
//		String condition = "id = '" + id + "'";
//		List list = data.photo_queryList(condition);
//		Photo photo1 = (Photo) list.get(0);
//		String filePath = request.getRealPath(photo1.getPhotoAddress()); 
//		String print = "savePrint/" + System.currentTimeMillis() + ".JPG";
//		String printPath = request.getRealPath(print);
//		if (!photo1.getPrintAddress().equals("0")) {
//			String path = request.getRealPath(photo1.getPrintAddress());
//			java.io.File file1 = new java.io.File(path);
//			if (file1.exists()) {
//				file1.delete();
//			}
//		}
//		String printInforamtion = com.wy.tools.Encrypt.toChinese(request
//				.getParameter("information"));
//		String information = "photoServlet line 90";
//		if (com.wy.tools.ImageUtils.createMark(filePath, printPath,
//				printInforamtion)) {
//			Photo photo2 = new Photo();
//			photo2.setId(photo1.getId());
//			photo2.setPrintAddress(print);
//			if (data.updatePhoto(photo2)) {
//				information = "photoServlet line 97";
//			}
//		}
//
//		request.setAttribute("information", information);
//		List list1 = data.photo_queryList(condition);
//		Photo photo3 = (Photo) list1.get(0);
//		request.setAttribute("photo", photo3);
//		request.getRequestDispatcher("photoShow.jsp")
//				.forward(request, response);
//	}

	@SuppressWarnings({ "rawtypes", "unused"})
	public void user_deletePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id"));
		String condition = "id=" + id; 
		List list = data.photo_queryList(condition); 
		String address = null; 
		String print = null;
		String type = null;
		if (list.size() == 1) { 
			Photo photo = (Photo) list.get(0);
			address = photo.getPhotoAddress(); 
//			print = photo.getPrintAddress();
			type = photo.getPhotoType(); 
		}
		String path = this.getServletContext().getRealPath("/" + address);
		data.photo_delete(id); 
		java.io.File file1 = new java.io.File(path);
		if (file1.exists()) {
			file1.delete();
		}
		String printPath = this.getServletContext().getRealPath("/" + print);
		java.io.File file2 = new java.io.File(printPath);
		if (file2.exists()) {
			file2.delete();
		}
		request.setAttribute("type", type);
		request.getRequestDispatcher("dealwith.jsp").forward(request, response);
	}

	public void user_uploadPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=gb2312");
			response.setCharacterEncoding("utf-8");
		
		data = new OperationData();
		com.jspsmart.upload.SmartUpload su = new com.jspsmart.upload.SmartUpload();
		String information = "photoServlet line 147!";
		try {
			su.initialize(this.getServletConfig(), request, response);
			su.setMaxFileSize(20 * 1024 * 1024); 
			su.upload();
			Files files = su.getFiles(); 

			for (int i = 0; i < files.getCount(); i++) {
				File singleFile = files.getFile(i); 

				String fileType = singleFile.getFileExt(); 
				String[] type = { "JPG", "jpg", "gif", "bmp", "BMP" }; 
				int place = java.util.Arrays.binarySearch(type, fileType);

				if (place != -1) { 
					if (!singleFile.isMissing()) { 
						String photoName = su.getRequest().getParameter(
								"photoName");
						String photoType = su.getRequest().getParameter(
								"photoType");
						String photoTime = su.getRequest().getParameter(
								"photoTime");
						String username = su.getRequest().getParameter(
								"username"); 
						String photoSize = String.valueOf(singleFile
								.getSize()); 
						String filedir = "savefile/"
								+ System.currentTimeMillis() + "."
								+ singleFile.getFileExt(); 
						String smalldir = "saveSmall/"
								+ System.currentTimeMillis() + "."
								+ singleFile.getFileExt();

						Photo photo = new Photo();
						photo.setPhotoName(photoName);
						photo.setPhotoType(photoType);
						photo.setPhotoSize(photoSize);
						photo.setPhotoTime(photoTime);
						photo.setUsername(username);
						photo.setPhotoAddress(filedir);
						photo.setSmallPhoto(smalldir);
						if (data.photo_save(photo)) { 
							singleFile.saveAs(filedir, File.SAVEAS_VIRTUAL);
							//创建缩略图
							com.wy.tools.ImageUtils.createSmallPhoto(
									this.getServletContext().getRealPath("/" + filedir),
									this.getServletContext().getRealPath("/" + smalldir));
							information = "photoServlet line 203!";
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e+"in upload photo");
		}
		request.setAttribute("information", information);
		request.getRequestDispatcher("user_upLoadPhoto.jsp").forward(request,
				response);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public void user_queryPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); 
		String username = userInfo.getUsername(); 
		String[] type = data.queryPhotoType(username); 
		request.setAttribute("type", type); 
		String condition = "username = '" + username + "'";
		List list = data.photo_queryList(condition); 
		request.setAttribute("list", list); 
		request.getRequestDispatcher("user_queryPhoto.jsp").forward(request,
				response);
	}

	@SuppressWarnings({ "rawtypes" })
	public void user_queryPhotoList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		data = new OperationData();
		String type = com.wy.tools.Encrypt.toChinese(request
				.getParameter("type")); 
		String condition = "photoType = '" + type + "'";
		if (null != request.getSession().getAttribute("userInfo")) {
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
					"userInfo"); 
			String username = userInfo.getUsername(); 
			condition = "username ='" + username + "' and photoType = '" + type
					+ "'"; 
		}
		List list = data.photo_queryList(condition);
		if (list.size() == 0) {
			request.setCharacterEncoding("gb2312");
			PrintWriter out = response.getWriter();
			out.print("<script language=javascript>history.go(-1);</script>");
		} else {
			request.setAttribute("list", list); 
			request.setAttribute("type", type); 
			request.getRequestDispatcher("user_queryPhotoList.jsp").forward(
					request, response);
		}
	}

	@SuppressWarnings({ "rawtypes" })
	public void queryOnePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id")); 
		String condition = "id = '" + id + "'";
		List list = data.photo_queryList(condition);
		Photo photo = null;
		if (list.size() == 1) { 
			photo = (Photo) list.get(0);
		}
		request.setAttribute("photo", photo);
		try {
			request.getRequestDispatcher("photoShow.jsp").forward(request,
					response);
			return;
		} catch (Exception e) {

		}

	}

	@SuppressWarnings({ "rawtypes" })
	public void queryPhotoSlide(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); 
		String username = userInfo.getUsername();
		String type = com.wy.tools.Encrypt.toChinese(request
				.getParameter("type"));
		String condition = "username ='" + username + "' and photoType = '"
				+ type + "'"; 
		List list = data.photo_queryList(condition);
		String address[] = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			Photo photo = (Photo) list.get(i);
			address[i] = photo.getPhotoAddress(); 
		}
		request.setAttribute("address", address); 
		request.getRequestDispatcher("photoShowSlide.jsp").forward(request,
				response);
	}
	
//	public void uploadPhoto(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException{
//		
//	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
	
	
	
//	public void uploadPhoto(HttpServletRequest request, HttpServletResponse response) throws ServletException{
//		ServletConfig config = this.getServletConfig();
//		
//		SmartUpload mSmartUpload = new SmartUpload();
//		mSmartUpload.initialize(config, request,response);
//		
//		try {
//			mSmartUpload.upload();
//			com.jspsmart.upload.File file = mSmartUpload.getFiles().getFile(0);
//			String fileName = file.getFileName();
//			int idx = fileName.lastIndexOf(".");
//			String fileFormat = fileName.substring(idx, fileName.length());
//			Calendar cal = Calendar.getInstance();
//			int year = cal.get(Calendar.YEAR);
//			int mouth = cal.get(Calendar.MONTH)+1;
//			int day = cal.get(Calendar.DAY_OF_MONTH);
//			int hour = cal.get(Calendar.HOUR_OF_DAY);
//
//			//获取当前系统时间的毫秒数，用于标识图片			
//			String photoName = String.valueOf(System.currentTimeMillis());
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SmartUploadException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}

}
