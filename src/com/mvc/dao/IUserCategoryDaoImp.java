package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.Category;
import com.mvc.bean.Type;
import com.utils.DBUtil;

public class IUserCategoryDaoImp implements IUserCategoryDao {
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	@Override
	public String getNameByID(int CTBCategoryID) {
		conn = DBUtil.getConn();
		String categoryID = null;
		String sql = "select typeName from usertype where typeID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, CTBCategoryID);
			rs = pst.executeQuery();
			while (rs.next()) {
				categoryID = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return categoryID;
	}

	@Override
	public int getIDByName(String CTBCategoryName) {
		conn = DBUtil.getConn();
		int categoryName = 0;
		String sql = "select typeName from usertype where typeID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, CTBCategoryName);
			rs = pst.executeQuery();
			while (rs.next()) {
				categoryName = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return categoryName;
	}

	@Override
	public List<Type> getAll() {
		conn = DBUtil.getConn();
		List<Type> lcate = new ArrayList();
		try {
			String sql = "select typeID,typeName from usertype ;";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				int typID = rs.getInt(1);
				String typeName = rs.getString(2);
				Type type = new Type(typID, typeName);
				lcate.add(type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return lcate;
	}



}
