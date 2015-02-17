package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.User;
import com.mvc.biz.IUserBiz;
import com.mvc.biz.IUserBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;
import com.utils.EncoderUtil;

public class AddUser extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private IUserBiz iub = new IUserBizImp();
	private Map session;
	private User user = new User();

	@Override
	public String execute() throws Exception {
		int flag = 0;
		String email = user.getEmail();
		String nickName = user.getNickName();
		int typeID = user.getTypeID();
		int age = user.getAge();
		String gender = user.getGender();
		String realName = user.getRealName();
		String cardID = user.getCardID();
		String debitCard = user.getDebitCard();
		String tellphone = user.getTellphone();
		User userByEmail = iub.getByEmai(email);
		if (!iub.hasEmail(email)) {
			session.put("message", "用户已存在！");
			return "error";
		}
		User userInfo = iub.getByEmai(email);
		int id = iub.getMaxId() + 1;
		String verifyCode = EncoderUtil.produceUUID(id);
		String password = Base64Util.produceDegistCode("123456");
		flag = iub.insertUser(email, password, nickName, typeID, verifyCode,
				realName, age, gender, cardID, debitCard, tellphone);
		if (flag > 0) {
			session.put("message", "添加用户成功！");

		} else {
			session.put("message", "添加用户失败！");

		}
		return "message";
	}

	public AddUser() {
		super();
	}

	public AddUser(IUserBiz iub, Map session, User user) {
		super();
		this.user = user;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public User getModel() {

		return this.user;
	}
}
