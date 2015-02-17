package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.mvc.bean.User;
import com.mvc.dao.IUserDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.Base64Util;

public class AddFileAction extends ActionSupport implements SessionAware {
	private File file;
	private String fileFileName;
	private String fileContentType;
	private Map session;
	private String path = "E:\\";

	@Override
	public String execute() throws Exception {
		ServletActionContext.getRequest().setCharacterEncoding("gb2312");
		try {
			InputStream is = new FileInputStream(file);
			path = path + (String) session.get("title");
			String root = ServletActionContext.getRequest().getRealPath(path);
			fileFileName = (String) session.get("fileFileName");

			// 鍒涘缓涓�釜鏂囦欢锛岃矾寰勪负root锛屾枃浠跺悕鍙玣ileFileName
			// 鑷畾涔夋枃浠跺悕
			fileFileName = fileFileName
					.substring(fileFileName.lastIndexOf("."));
			File destFile = new File(root, fileFileName);
			// 寮�涓婁紶
			OutputStream os = new FileOutputStream(destFile);
			byte[] buffer = new byte[50000];
			int length = 0;
			// enctype="multipart/form-data"
			while (-1 != (length = is.read(buffer))) {
				os.write(buffer, 0, buffer.length);
			}
			return "success";
		} catch (Exception e) {
			return "adderror";
		}

	}

	public AddFileAction() {
		super();
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
