package com.mvc.bean;

import java.util.Date;

public class Message {
	private Integer messageID;
	private Integer newsID;
	private Integer toUserID;
	private Integer userID;
	private String text;
	private String messageTime;
	public Message() {
		super();
	}
	public Message(Integer messageID, Integer newsID, Integer toUserID,
			Integer userID, String text, String messageTime) {
		super();
		this.messageID = messageID;
		this.newsID = newsID;
		this.toUserID = toUserID;
		this.userID = userID;
		this.text = text;
		this.messageTime = messageTime;
	}
	public Integer getMessageID() {
		return messageID;
	}
	public void setMessageID(Integer messageID) {
		this.messageID = messageID;
	}
	public Integer getNewsID() {
		return newsID;
	}
	public void setNewsID(Integer newsID) {
		this.newsID = newsID;
	}
	public Integer getToUserID() {
		return toUserID;
	}
	public void setToUserID(Integer toUserID) {
		this.toUserID = toUserID;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}
	
	
	
}
