package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.DispatchCTB;
import com.mvc.biz.IContributionBiz;
import com.mvc.biz.IContributionBizImp;
import com.mvc.biz.IDispatchBiz;
import com.mvc.biz.IDispatchBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DispatchContribution extends ActionSupport implements
		ModelDriven<DispatchCTB>, SessionAware {
	private IDispatchBiz idb = new IDispatchBizImp();
	private Map session;
	private DispatchCTB dispatch = new DispatchCTB();
	private IContributionBiz icb = new IContributionBizImp();

	public String execute() throws Exception {
		int flag = 0;
		int f = 0;
		int ctbID = dispatch.getCtbID();
		int expertID = dispatch.getExpertID();
		flag = idb.insertDispatch(ctbID, expertID);

		System.out.println("f : " + f + " \n flag:" + flag);
		if (flag > 0) {
			f = icb.upload(ctbID);
			if (f > 0) {
				session.put("message", "分派成功！");
			} else {
				session.put("message", "分派失败！");

			}
		} else {
			session.put("message", "分派失败！");

		}
		return "dispatch";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	@Override
	public DispatchCTB getModel() {

		return dispatch;
	}

}
