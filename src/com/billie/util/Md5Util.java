package com.billie.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 
 * @ClassName: Md5Util
 * @Description: Md5加密公共方法
 * @author zhangfeng
 * @date 2018年6月27日 下午4:39:19
 *
 */

public class Md5Util {

	/**
	 * 标准md5加密(32位)
	 * 
	 * @param inStr
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws Exception
	 */
	public static String bz32MD5(String inStr) {
		StringBuffer sb = new StringBuffer();
		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {

		}

		md.update(inStr.getBytes());

		byte b[] = md.digest();

		int i;

		for (int offset = 0; offset < b.length; offset++) {

			i = b[offset];

			if (i < 0)

				i += 256;

			if (i < 16)

				sb.append("0");

			sb.append(Integer.toHexString(i));

		}
		return sb.toString();
	}

	/**
	 * 获取一个加密的32MD5
	 * 
	 * @param inStr
	 * @return
	 */
	public static String jm32MD5(String Str) {
		// 加密字符算法(sandsaero+Str)
		String inStr = "sandsaero" + Str;
		StringBuffer sb = new StringBuffer();

		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {

		}

		md.update(inStr.getBytes());

		byte b[] = md.digest();

		int i;

		for (int offset = 0; offset < b.length; offset++) {

			i = b[offset];

			if (i < 0)

				i += 256;

			if (i < 16)

				sb.append("0");

			sb.append(Integer.toHexString(i));

		}
		return sb.toString();
	}

	public static void main(String[] args) {
		String i = Md5Util.jm32MD5("17375829235");
		String j=  Md5Util.jm32MD5("丁力");
		System.out.println(i);
		System.out.println(Md5Util.bz32MD5("123456" + i+j));
	}
}
