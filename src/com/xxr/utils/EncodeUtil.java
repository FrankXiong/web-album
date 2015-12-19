package com.xxr.utils;

public class EncodeUtil {
	/**
	 * @decription:转换编码格式，解决数据传输到数据库后乱码问题
	 * @parm:@param strvalue
	 * @return:String
	 */
	public static String toChinese(String strvalue) {
		try {
			if (strvalue == null) {
				return "";
			} else {
				strvalue = new String(strvalue.getBytes("ISO8859_1"), "GBK");
				return strvalue;
			}
		} catch (Exception e) {
			return "";
		}

	}
}
