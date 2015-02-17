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

public class DownFileAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String inputPath;

	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}

	/*
	 * 下载用的Action应该返回一个InputStream实例，该方法对应在result里的inputName属性为 getDownloadFile
	 */
	public InputStream getDownloadFile() {
		return ServletActionContext.getServletContext().getResourceAsStream(
				"/upload/Struts2.txt");
	}

	public String execute() throws Exception {
		return "success";
	}
}
