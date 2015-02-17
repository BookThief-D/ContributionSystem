package com.mvc.dao;

import java.util.Date;
import java.util.List;

import com.mvc.bean.Message;

public interface IMessageDao {
	public List<Message> getByNewsID(int newsID);
	public List<Message> getByUserID(int userID);
	public List<Message> getByTime();
	public Message getByMessageID(int messageID);
}
