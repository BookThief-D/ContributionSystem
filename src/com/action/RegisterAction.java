package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.User;
import com.mvc.biz.IUserBiz;
import com.mvc.biz.IUserBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;
import com.utils.EncoderUtil;

public class RegisterAction extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private IUserBiz iub = new IUserBizImp();
	private Map session;
	private User user = new User();

	public String execute() throws Exception {
		int flag = 0;
		String email = user.getEmail();
		String nickname = user.getNickName();
		String password = user.getPassword();
		if (!iub.hasEmail(email)) {
			session.put("message", "用户已存在！");
			return "error";
		}
		User userInfo = iub.getByEmai(email);
		int id = iub.getMaxId() + 1;
		String verifyCode = EncoderUtil.produceUUID(id);
		password = Base64Util.produceDegistCode(password);
		flag = iub.insertUser(email, password, nickname, 4, verifyCode, "匿名",
				"../headPic/user.jpg");
		if (flag > 0) {
			userInfo = iub.getByEmai(email);
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
			session.put("message", "注册失败！");
			return "error";
		}

	}

	public RegisterAction() {
		super();
	}

	public RegisterAction(User user) {
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
