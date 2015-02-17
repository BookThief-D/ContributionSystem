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

public class AdFileAction extends ActionSupport implements
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
			int flag = 0;
			int userID = ctb.getUserID();
			System.out.println(fileFileName);
			String str = fileFileName.substring(fileFileName.length()-4, fileFileName.length());
			System.out.println(str);
			fileFileName = ctb.getTitle() + str;

			String title = fileFileName;
			String container = "D://Tools/Tomcat 6.0/webapps/cs/file";
			int categoryID = ctb.getCategoryID();
			String keywords = ctb.getKeywords();

			flag = ictbb.insertCTB(userID, title, container, categoryID,
					keywords);
			if (flag > 0) {
				String realpath = ServletActionContext.getServletContext()
						.getRealPath(path);
				if (file != null) {
					File files = new File(realpath);
					if (!files.getParentFile().exists())
						files.getParentFile().mkdirs();
					FileUtils.copyFile(file, new File(files, fileFileName));
					session.put("message", "上传成功！");
				}
			}
			return "addfile";

		} catch (Exception e) {
			session.put("message", "上传失败！");
			return "addfile";
		}
		
	}

	public AdFileAction() {
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
