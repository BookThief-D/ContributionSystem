package com.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class Base64Util {
	/**
	 * produce encryption code
	 * 
	 * @param seq
	 * @return String
	 */
	public static String produceDegistCode(String seq) {
		try {
			MessageDigest md5Code = MessageDigest.getInstance("md5");
			BASE64Encoder base64 = new BASE64Encoder();
			byte[] bTmp = md5Code.digest(seq.getBytes());
			base64.encode(bTmp);
			seq = base64.encode(bTmp);
			return seq;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		String pass = "aaaaaa";
		String pwd = produceDegistCode(pass);
		System.out.println("MM:" + pwd);
		System.out.println(produceDegistCode(pass).equals(pwd));
	}
}
