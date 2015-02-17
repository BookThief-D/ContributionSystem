package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.DispatchCTB;
import com.mvc.bean.User;
import com.utils.DBUtil;

public class IDispatchDaoImp implements IDispatchDao {
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	@Override
	public int getExpertIDByCtbID(int ctbID) {
		conn = DBUtil.getConn();
		int expertID = 0;
		String sql = "select expertID from dispatch where ctbID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, ctbID);
			rs = pst.executeQuery();
			while (rs.next()) {
				expertID = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return expertID;

	}

	@Override
	public int getCtbIDByExpertID(int expertID) {
		conn = DBUtil.getConn();
		int ctbID = 0;
		String sql = "select ctbID from dispatch where expertID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, expertID);
			rs = pst.executeQuery();
			while (rs.next()) {
				ctbID = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return ctbID;

	}

	@Override
	public int insertDispatch(int ctbID, int expertID) {
		conn = DBUtil.getConn();
		int flag = 0;

		try {
			String sql = "insert into dispatch(ctbID,expertID) values(?,?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, ctbID);
			pst.setInt(2, expertID);
			flag = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	@Override
	public List<DispatchCTB> getAllByExpertID(int expertID) {
		conn = DBUtil.getConn();
		int flag = 0;
		List<DispatchCTB> dispatch = new ArrayList();
		String sql = "SELECT ctbID,expertID from dispatch where expertID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, expertID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int ctbID = rs.getInt(1);

				DispatchCTB dis = new DispatchCTB(expertID, ctbID);
				dispatch.add(dis);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return dispatch;
	}
}
