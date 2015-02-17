package com.mvc.biz;

import java.util.List;

import com.mvc.bean.User;

public interface IUserBiz {
	public int insertUser(String email, String password, String nickName,
			Integer typeID, String verifyCode, String realName, String headPic);

	public int insertUser(String email, String password, String nickName,
			Integer typeID, String verifyCode, String realName, Integer age,
			String gender, String cardID, String debitCard, String tellphone);

	public User getByID(Integer userID);

	public User getByEmai(String email);

	public int editIsEmailVerify();

	public List<User> getAll();

	public List<User> getByTypeID(Integer typeID);

	public int getMaxId();

	public int getNumberByType(Integer typeID);

	public boolean hasEmail(String email);

	public int modifyUser(Integer userID, String password, String nickName,
			Integer age, String gender, String email, String realName,
			String cardID, String debitCard, String tellphone);

	public int deleteUser(Integer userID);

	public int modifyPwd(Integer userID,String password);
}
