package com.utils;

import java.io.IOException;
import java.util.UUID;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
/**
 * Encode util, produce uuid ,encription code
 * @author Mr.rong
 *
 */
public class EncoderUtil {
	/**
	 * 根据用户Id生成UUId（用户激活码）
	 * @param id
	 * @return
	 */
	public static String produceUUID(Integer id) {
		UUID uuid=UUID.randomUUID();
		BASE64Encoder base64=new BASE64Encoder();
		String uuidCode=uuid.toString()+"-"+id;
		base64.encode(uuidCode.getBytes());
		uuidCode=new String(base64.encode(uuidCode.getBytes()));
		return uuidCode;
	}
	/**
	 * 从用户的激活码获取UUID
	 * @param uuidCode
	 * @return
	 */
	public static String getUUID(String uuidCode) {
		String strUUID=null;
		try {
			BASE64Decoder base64=new BASE64Decoder();
			byte[] b=base64.decodeBuffer(uuidCode);
			strUUID=new String(b);
			if(strUUID.lastIndexOf("-")==-1) {
				return null;
			}
			strUUID=strUUID.substring(0,strUUID.lastIndexOf("-"));
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return strUUID;
	}
	/**
	 * 从UUID获得用户id
	 * @param uuid
	 * @return
	 */
	public static Integer getIDFromUUID(String uuidCode) {
		String strUUID=null;
		Integer id;
		try {
			BASE64Decoder base64=new BASE64Decoder();
			byte[] b=base64.decodeBuffer(uuidCode);
			strUUID=new String(b);
			if(strUUID.lastIndexOf("-")==-1) {
				return null;
			}
			strUUID=strUUID.substring(strUUID.lastIndexOf("-")+1);
			id=new Integer(Integer.parseInt(strUUID));
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		catch(Exception e) {
			return null;
		}
		return id;
	}

	public static void main(String[] args) {
		String uuid=produceUUID(6);
		System.out.println("UUID:"+uuid);
		System.out.println("getUUID:"+getUUID(uuid));
		System.out.println("UserID:"+getIDFromUUID(uuid));
	}
}
