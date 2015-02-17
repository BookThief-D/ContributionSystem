package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.User;
import com.mvc.biz.IUserBiz;
import com.mvc.biz.IUserBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;

public class ResetPassword extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private IUserBiz iub = new IUserBizImp();
	private Map session;
	private User user = new User();

	@Override
	public String execute() throws Exception {
		int flag = 0;
		Integer userID = user.getUserID();
		String password = Base64Util.produceDegistCode("123456");
		flag = iub.modifyPwd(userID,password);
		if (flag > 0) {
			session.put("message", "重置密码成功！");

		} else {
			session.put("message", "重置密码失败！");

		}
		return "resetPwd";

	}

	public ResetPassword() {
		super();
	}

	public ResetPassword(User user) {
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
