package com.xxr.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * @author xiongxianren
 * @desciption 图片工具类：创建缩略图
 */
@SuppressWarnings({ "restriction", "unused" })
public class ImageUtil {
	public static void createSmallPhoto(String photoPath, String smallPath) {
		File _file = new File(photoPath); 
		Image src;
		try {
			src = javax.imageio.ImageIO.read(_file);
			int wideth = 110; 
			int height = 80; 
			BufferedImage tag = new BufferedImage(wideth, height,
					BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, wideth, height, null); 
			FileOutputStream out = new FileOutputStream(smallPath);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag); 
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
