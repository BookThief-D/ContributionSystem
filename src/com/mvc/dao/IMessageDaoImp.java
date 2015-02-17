package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mvc.bean.Contribution;
import com.mvc.bean.Message;
import com.utils.DBUtil;

public class IMessageDaoImp implements IMessageDao {
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	@Override
	public List<Message> getByNewsID(int newsID) {
		conn = DBUtil.getConn();
		List<Message> mesg = new ArrayList();
		String sql = "select messageID,   toUserID,userID, newsID, text,  messageTime where newsID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, newsID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int messageID = rs.getInt(1);
				int toUserID = rs.getInt(2);
				int userID = rs.getInt(3);
				String text = rs.getString(5);
				String messageTime = rs.getString(6);
				Message mes = new Message(messageID, newsID, toUserID, userID,
						text, messageTime);
				mesg.add(mes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return mesg;
	}

	@Override
	public List<Message> getByUserID(int userID) {
		conn = DBUtil.getConn();
		List<Message> mesg = new ArrayList();
		String sql = "select messageID,   toUserID,userID, newsID, text,  messageTime from message where userID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int messageID = rs.getInt(1);
				int toUserID = rs.getInt(2);
				int newsID = rs.getInt(4);
				String text = rs.getString(5);
				String messageTime = rs.getString(6);
				Message mes = new Message(messageID, newsID, toUserID, userID,
						text, messageTime);
				mesg.add(mes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return mesg;
	}

	@Override
	public List<Message> getByTime() {
		conn = DBUtil.getConn();
		List<Message> mesg = new ArrayList();
		String sql = "select messageID,   toUserID,userID, newsID, text,  messageTime from message order by messageTime desc limit 8";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				int messageID = rs.getInt(1);
				int toUserID = rs.getInt(2);
				int userID = rs.getInt(3);
				int newsID = rs.getInt(4);
				String text = rs.getString(5);
				String messageTime = rs.getString(6);
				Message mes = new Message(messageID, newsID, toUserID, userID,
						text, messageTime);
				mesg.add(mes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return mesg;
	}

	@Override
	public Message getByMessageID(int messageID) {
		conn = DBUtil.getConn();
		Message mesg = null;
		String sql = "select messageID,   toUserID,userID, newsID, text,  messageTime from message where messageID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, messageID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int userID = rs.getInt(3);
				int toUserID = rs.getInt(2);
				int newsID = rs.getInt(4);
				String text = rs.getString(5);
				String messageTime = rs.getString(6);
				mesg = new Message(messageID, newsID, toUserID, userID, text,
						messageTime);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return mesg;
	}

}
