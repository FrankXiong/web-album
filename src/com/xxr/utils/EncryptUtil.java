package com.xxr.utils;

import java.security.*;
import java.text.DateFormat;
import java.util.Date;

public class EncryptUtil {

	public static String MD5(String str) {
		if (str == null) 
			return null;
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest code = MessageDigest.getInstance("MD5");
			code.update(str.getBytes());
			byte[] bs = code.digest();
			for (int i = 0; i < bs.length; i++) {
				int v = bs[i] & 0xFF;
				if (v < 16)
					sb.append(0);
				sb.append(Integer.toHexString(v));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString().toUpperCase();
	}

	public static String currentlyTime() {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
		return dateFormat.format(date);
	}
}
