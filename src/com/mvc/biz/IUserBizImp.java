package com.mvc.biz;

import java.util.List;

import com.mvc.bean.User;
import com.mvc.dao.IUserDao;
import com.mvc.dao.IUserDaoImpl;

public class IUserBizImp implements IUserBiz {
	IUserDao iudao = new IUserDaoImpl();

	@Override
	public int insertUser(String email, String password, String nickName,
			Integer typeID, String verifyCode, String realName, String headPic) {
		return iudao.insertUser(email, password, nickName, typeID, verifyCode,
				realName, headPic);
	}

	@Override
	public User getByEmai(String email) {
		return iudao.getByEmai(email);
	}

	@Override
	public int editIsEmailVerify() {
		return iudao.editIsEmailVerify();
	}

	@Override
	public int getMaxId() {
		return iudao.getMaxId();
	}

	@Override
	public boolean hasEmail(String email) {
		return iudao.hasEmail(email);
	}

	@Override
	public int modifyUser(Integer userID, String password, String nickName,
			Integer age, String gender, String email, String realName,
			String cardID, String debitCard, String tellphone) {

		return iudao.modifyUser(userID, password, nickName, age, gender, email,
				realName, cardID, debitCard, tellphone);
	}

	@Override
	public List<User> getByTypeID(Integer typeID) {
		return iudao.getByTypeID(typeID);
	}

	@Override
	public int getNumberByType(Integer typeID) {
		return iudao.getNumberByType(typeID);
	}

	@Override
	public List<User> getAll() {

		return iudao.getAll();
	}

	@Override
	public int insertUser(String email, String password, String nickName,
			Integer typeID, String verifyCode, String realName, Integer age,
			String gender, String cardID, String debitCard, String tellphone) {

		return iudao.insertUser(email, password, nickName, typeID, verifyCode,
				realName, age, gender, cardID, debitCard, tellphone);
	}

	@Override
	public User getByID(Integer userID) {

		return iudao.getByID(userID);
	}

	@Override
	public int deleteUser(Integer userID) {
		return iudao.deleteUser(userID);
	}

	@Override
	public int modifyPwd(Integer userID,String password) {
		return iudao.modifyPwd(userID,password);
	}

}
