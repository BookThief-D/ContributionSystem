package com.mvc.bean;

import java.util.Date;

public class Contribution {
	private Integer ctbID;
	private Integer userID;	
	private String title;
	private String container;
	private Integer categoryID;
	private String upLoadTime;
	private String updateTime;
	private String isJudge;
	private String keywords;

	public Contribution() {
		super();
	}

	public Contribution(Integer ctbID, Integer userID, String title,
			String container, Integer categoryID, String upLoadTime,
			String updateTime, String isJudge, String keywords) {
		super();
		this.ctbID = ctbID;
		this.userID = userID;
		this.title = title;
		this.container = container;
		this.categoryID = categoryID;
		this.upLoadTime = upLoadTime;
		this.updateTime = updateTime;
		this.isJudge = isJudge;
		this.keywords = keywords;
	}

	public Integer getCtbID() {
		return ctbID;
	}

	public void setCtbID(Integer ctbID) {
		this.ctbID = ctbID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContainer() {
		return container;
	}

	public void setContainer(String container) {
		this.container = container;
	}

	public Integer getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}

	public String getUpLoadTime() {
		return upLoadTime;
	}

	public void setUpLoadTime(String upLoadTime) {
		this.upLoadTime = upLoadTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getIsJudge() {
		return isJudge;
	}

	public void setIsJudge(String isJudge) {
		this.isJudge = isJudge;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	



}
