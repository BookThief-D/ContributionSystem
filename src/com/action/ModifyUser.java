package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;
import com.mvc.bean.User;
import com.mvc.biz.IUserBiz;
import com.mvc.biz.IUserBizImp;

public class ModifyUser extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private IUserBiz iub = new IUserBizImp();
	private Map session;
	private User user = new User();

	@Override
	public String execute() throws Exception {
		int flag = 0;
		Integer userID = user.getUserID();
		String email = user.getEmail();
		String password = user.getPassword();
		String nickName = user.getNickName();
		int age = user.getAge();
		String gender = "male";
		String realName = user.getRealName();
		String cardID = user.getCardID();
		String debitCard = user.getDebitCard();
		String tellphone = user.getTellphone();
		User userByEmail = iub.getByEmai(email);
		if (!password.equals(userByEmail.getPassword())) {
			password = Base64Util.produceDegistCode(password);
		}
		flag = iub.modifyUser(userID, password, nickName, age, gender, email,
				realName, cardID, debitCard, tellphone);
		if (flag > 0) {
			session.put("message", "修改成功");
		} else {
			session.put("message", "修改失败");

		}
		session.put("userInfo", userByEmail);
		return "modifyInfo";

	}

	public ModifyUser() {
		super();
	}

	public ModifyUser(User user) {
		super();
		this.user = user;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public User getModel() {
		return user;
	}

}
