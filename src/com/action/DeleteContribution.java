package com.action;

import java.io.File;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.Contribution;
import com.mvc.biz.IContributionBiz;
import com.mvc.biz.IContributionBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DeleteContribution extends ActionSupport implements
		ModelDriven<Contribution>, SessionAware {
	private IContributionBiz ictbb = new IContributionBizImp();
	private Map session;
	private Contribution ctb = new Contribution();

	@Override
	public String execute() throws Exception {
		int flage = 0;
		int ctbID = ctb.getCtbID();
		ctb = ictbb.getByID(ctbID);
		String path = ctb.getContainer() + "/" + ctb.getTitle(); // 获得当前的绝对路径
		File f = new File(path);
		System.out.println("path:" + path + "      " + f.exists());
		boolean flg = false;
		if (f.exists()) { // 如果文件存在删除 如果文件不存在 打印出文件找不到
			flg = f.delete();
			if (flg) {
				flage = ictbb.deleteContribution(ctbID);
				if (flage > 0) {
					session.put("message", "删除稿件成功！");
				} else {
					session.put("message", "删除稿件失败！");

				}
			} else {
				session.put("message", "删除稿件失败！");

			}

		} else {
			session.put("message", "删除稿件失败！");

		}

		return "delete";
	}

	public DeleteContribution() {
		super();
	}

	public DeleteContribution(IContributionBiz iub, Map session,
			Contribution ctb) {
		super();
		this.ctb = ctb;
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
