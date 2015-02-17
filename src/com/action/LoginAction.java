package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.User;
import com.mvc.biz.IUserBiz;
import com.mvc.biz.IUserBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;

public class LoginAction extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private IUserBiz iudi = new IUserBizImp();
	private Map session;
	private User user = new User();

	@Override
	public String execute() throws Exception {
		String email = user.getEmail();
		String password = user.getPassword();
		password = Base64Util.produceDegistCode(password);
		User userInfo = iudi.getByEmai(email);
		if (userInfo == null) {
			session.put("message", "用户不存在！");
			return "error";
		} else if (!userInfo.getPassword().equals(password)) {
			session.put("message", "密码错误！");
			return "error";
		} else if (null != userInfo && userInfo.getPassword().equals(password)) {
			session.put("userInfo", userInfo);
			session.put("nickName", userInfo.getNickName());
			session.put("email", userInfo.getEmail());
			switch (userInfo.getTypeID()) {
			case 1:
				return "manager";
			case 2:
				return "editor";
			case 3:
				return "expert";
			case 4:
				return "author";
			default:
				return "author";
			}
		} else {
			session.put("message", "登陆错误");
			return "error";
		}
	}

	public LoginAction() {
		super();
	}

	public LoginAction(User user) {
		super();
		this.user = user;
	}

	@Override
	public User getModel() {
		return user;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
