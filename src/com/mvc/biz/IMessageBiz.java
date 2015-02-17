package com.mvc.biz;

import java.util.Date;
import java.util.List;

import com.mvc.bean.Message;

public interface IMessageBiz {
	public List<Message> getByNewsID(int newsID);
	public List<Message> getByUserID(int userID);
	public List<Message> getByTime(Date massageTime);
	public Message getByMessageID(int messageID);
}
