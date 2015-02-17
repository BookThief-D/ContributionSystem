package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.Contribution;
import com.mvc.bean.DispatchCTB;
import com.mvc.bean.User;
import com.mvc.biz.IContributionBiz;
import com.mvc.biz.IContributionBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;

public class AcceptContribution extends ActionSupport implements
		ModelDriven<Contribution>, SessionAware {
	private IContributionBiz ictbb = new IContributionBizImp();
	private Map session;
	private Contribution ctb = new Contribution();

	public String execute() throws Exception {
		int flag = 0;
		int ctbID = ctb.getCtbID();
		String updateTime = ctb.getUpdateTime();
		ctb = ictbb.getByID(ctbID);
		flag = ictbb.getIsJudge(ctbID, updateTime);
		if (flag > 0) {
			session.put("message", "审核成功！");
		} else {
			session.put("message", "审核失败！");
		}
		return "isjudge";

	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	@Override
	public Contribution getModel() {
		return this.ctb;
	}

}
