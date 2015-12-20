package com.xxr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.xxr.dao.OperationData;
import com.xxr.model.Photo;
import com.xxr.model.UserInfo;
import com.xxr.utils.EncodeUtil;
import com.xxr.utils.ImageUtil;

@SuppressWarnings("unused")
public class PhotoServlet extends HttpServlet {

	private String info = "";

	private OperationData data = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
//		查看用户所有相册
		if (info.equals("user_album")) {
			this.userAlbum(request, response);
		}
//		用户上传图片
		if (info.equals("user_upload")) {
			this.userUpload(request, response);
		}
//		用户浏览相册下的所有图片
		if (info.equals("user_gallery")) {
			this.userGallery(request, response);
		}
//		用户删除单个图片
		if (info.equals("user_delete")) {
			this.userDeletePhoto(request, response);
		}
//		用户更新图片
		if (info.equals("user_update")) {
			this.userUpdatePhoto(request, response);
		}
//		用户查看单个图片详细信息
		if (info.equals("user_photo_detail")) {
			this.userPhotoDetail(request, response);
		}
//		重定向到首页
		if (info.equals("forward_index")) {
			this.forward_index(request, response);
		}

	}

	@SuppressWarnings("rawtypes")
	public void forward_index(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = new OperationData().queryPhotoList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("photo_index.jsp").forward(request,
				response);
	}

	@SuppressWarnings({ "rawtypes"})
	public void userDeletePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		data = new OperationData();
		String photoName = request.getParameter("photoName");
		String condition = "photoName=" + photoName; 
		List list = data.photoQueryList(condition); 
		String address = null; 
		String type = null;
		if (list.size() == 1) { 
			Photo photo = (Photo) list.get(0);
			address = photo.getPhotoAddress(); 
			type = photo.getPhotoType(); 
		}
		String path = this.getServletContext().getRealPath("/" + address);
		data.photoDelete(photoName); 
		java.io.File file = new java.io.File(path);
		if (file.exists()) {
			file.delete();
		}
		request.setAttribute("type", type);
		request.getRequestDispatcher("dealwith.jsp").forward(request, response);
	}

	public void userUpload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		data = new OperationData();
		com.jspsmart.upload.SmartUpload su = new com.jspsmart.upload.SmartUpload();
		String information = "图片上传成功！";
		try {
			su.initialize(this.getServletConfig(), request, response);
			su.setMaxFileSize(20 * 1024 * 1024); 
			su.upload();
			Files files = su.getFiles(); 

			for (int i = 0; i < files.getCount(); i++) {
				// 获取上传文件的单个文件
				File singleFile = files.getFile(i); 
				// 获取上传文件的扩展名
				String fileType = singleFile.getFileExt(); 
				String[] type = { "JPG", "jpg", "gif", "bmp", "BMP", "png"};
				// 判断上传文件的类型是否正确
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
						String filedir = "/savefile/"
								+ System.currentTimeMillis() + "."
								+ singleFile.getFileExt();
						String smalldir = "/saveSmall/"
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
						
						if (data.photoUpload(photo)) { 
							//存储到以web应用程序的根目录为文件根目录的目录下							
							singleFile.saveAs(filedir, File.SAVEAS_VIRTUAL);
							//创建缩略图
							ImageUtil.createSmallPhoto(
									this.getServletContext().getRealPath("/" + filedir),
									this.getServletContext().getRealPath("/" + smalldir));
							information = "图片上传成功！";
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e+"in upload photo");
		}
		request.setAttribute("information", information);
		request.getRequestDispatcher("user_upload.jsp").forward(request,
				response);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public void userAlbum(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); 
		String username = userInfo.getUsername(); 
		String[] type = data.queryPhotoType(username); 
		request.setAttribute("type", type); 
		String condition = "username = '" + username + "'";
		List list = data.photoQueryList(condition); 
		request.setAttribute("list", list); 
		request.getRequestDispatcher("user_album.jsp").forward(request,
				response);
	}

	@SuppressWarnings({ "rawtypes" })
	public void userGallery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		data = new OperationData();
		String type = request.getParameter("type"); 
		String condition = "photoType = '" + type + "'";
		if (null != request.getSession().getAttribute("userInfo")) {
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
					"userInfo"); 
			String username = userInfo.getUsername(); 
			condition = "username ='" + username + "' and photoType = '" + type
					+ "'"; 
		}
		List list = data.photoQueryList(condition);
		if (list.size() == 0) {
			PrintWriter out = response.getWriter();
			out.print("<script language=javascript>history.go(-1);</script>");
		} else {
			request.setAttribute("list", list); 
			request.setAttribute("type", type); 
			request.getRequestDispatcher("user_gallery.jsp").forward(
					request, response);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public void userPhotoDetail(HttpServletRequest request,
			HttpServletResponse response) {
		data = new OperationData();
		String photoName = request.getParameter("photoName"); // 获取页面中相册的ID号
		String condition = "photoName = '" + photoName + "'"; // 设置查询条件：以id号为查询条件
		List list = data.photoQueryList(condition); // 执行查询的方法
		Photo photo = null;
		if (list.size() == 1) { // 由于id号的值在数据库中是唯一的，因此只存在一组数据
			photo = (Photo) list.get(0);
		}
		request.setAttribute("photo", photo); // 将查询的结果保存在request范围内
		try {
			request.getRequestDispatcher("photoShow.jsp").forward(request,
					response);
			return;
		} catch (Exception e) {

		}
	}
	
	public void userUpdatePhoto(HttpServletRequest request,
			HttpServletResponse response){
		
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
	
	
}
