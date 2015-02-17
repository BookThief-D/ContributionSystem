package com.mvc.biz;

import java.util.Date;
import java.util.List;

import com.mvc.bean.Message;
import com.mvc.dao.IMessageDao;
import com.mvc.dao.IMessageDaoImp;

public class IMessageBizImp implements IMessageBiz {

	IMessageDao imd = new IMessageDaoImp();
	
	@Override
	public List<Message> getByNewsID(int newsID) {
		return imd.getByNewsID(newsID);
	}

	@Override
	public List<Message> getByUserID(int userID) {
		return imd.getByUserID(userID);
	}

	@Override
	public List<Message> getByTime(Date massageTime) {
		return imd.getByTime();
	}

	@Override
	public Message getByMessageID(int messageID) {
		return imd.getByMessageID(messageID);
	}

}
