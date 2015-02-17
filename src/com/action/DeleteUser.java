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

public class DeleteUser extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private IUserBiz iub = new IUserBizImp();
	private Map session;
	private User user = new User();

	@Override
	public String execute() throws Exception {
		int flag = 0;
		int userID = user.getUserID();
		User userInfo = iub.getByID(userID);
		flag = iub.deleteUser(userID);
		if (flag > 0) {
			session.put("message", "删除用户成功！");

		} else {
			session.put("message", "删除用户失败！");

		}
		return "delete";
	}

	public DeleteUser() {
		super();
	}

	public DeleteUser(IUserBiz iub, Map session, User user) {
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
