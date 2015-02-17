package com.action;

import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.Contribution;
import com.mvc.biz.IContributionBiz;
import com.mvc.biz.IContributionBizImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ModifyContribution extends ActionSupport implements
		ModelDriven<Contribution>, SessionAware {
	private File file;
	private String fileFileName;
	private String fileContentType;
	private Map session;
	private Contribution ctb = new Contribution();
	private IContributionBiz ictbb = new IContributionBizImp();
	private String path;

	@Override
	public String execute() throws Exception {
		ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		path = "/file";
		try {
			// //////////////////////////////////////////
			int flage = 0;
			int ctbID = ctb.getCtbID();
			Contribution ct = ictbb.getByID(ctbID);
			String path = ct.getContainer() + "/" + ct.getTitle(); // 获得当前的绝对路径
			File f = new File(path);
			System.out.println("path:" + path + "      " + f.exists());
			boolean flg = false;
			if (f.exists()) { // 如果文件存在删除 如果文件不存在 打印出文件找不到
				flg = f.delete();
				System.out.println("aaaaaaaaaaaaaaa" + flg);
				if (flg) {
					flage = ictbb.deleteContribution(ctbID);
					if (flage > 0) {
					} else {
						session.put("message", "修改稿件失败！");
						return "modifyCTB";

					}
				} else {
					session.put("message", "修改稿件失败！");
					return "modifyCTB";

				}

			} else {
				session.put("message", "修改稿件失败！");
				return "modifyCTB";
			}
			// //////////////////////////////////////////
			int flag = 0;
			int userID = ctb.getUserID();
			String str = fileFileName.substring(fileFileName.length() - 4,
					fileFileName.length());
			System.out.println("fffffffffffff" + ctb.getTitle());
			fileFileName = ctb.getTitle() + str;

			String title = fileFileName;
			String container = "D://Tools/Tomcat 6.0/webapps/cs/file";
			int categoryID = ctb.getCategoryID();
			String keywords = ctb.getKeywords();

			// path = path + "/" + ctb.getUserID().toString();
			flag = ictbb.insertCTB(userID, title, container, categoryID,
					keywords);
			if (flag > 0) {

				String realpath = ServletActionContext.getServletContext()
						.getRealPath(this.path);
				if (file != null) {
					File files = new File(realpath);
					if (!files.getParentFile().exists())
						files.getParentFile().mkdirs();
					FileUtils.copyFile(file, new File(files, fileFileName));
					session.put("message", "修改成功！");
				}
			}

		} catch (Exception e) {
			session.put("message", "修改失败！");
		}
		return "modifyCTB";
	}

	public ModifyContribution() {
		super();
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public Map getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public Contribution getModel() {
		return ctb;
	}

}
