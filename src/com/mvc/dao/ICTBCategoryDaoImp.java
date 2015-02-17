package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.Category;
import com.utils.DBUtil;

public class ICTBCategoryDaoImp implements ICTBCategoryDao {
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	@Override
	public List<Category> getAllCategoryByParentId(int CTBID) {
		conn = DBUtil.getConn();
		List<Category> lcate = new ArrayList();
		try {
			String sql = "select categoryID,categoryName from category where parentID = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, CTBID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int cid = rs.getInt(1);
				String name = rs.getString(2);
				Category category = new Category(cid, name, CTBID);
				lcate.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return lcate;
	}

	@Override
	public int getParentIDByName(String CTBName) {
		conn = DBUtil.getConn();
		int parentID = 0;
		String sql = "select parentID from category where categoryName = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, CTBName);
			rs = pst.executeQuery();
			while (rs.next()) {
				parentID = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return parentID;
	}

	@Override
	public int getParentIDByID(int CTBID) {
		conn = DBUtil.getConn();
		int parentID = 0;
		String sql = "select parentID from category where categoryID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, CTBID);
			rs = pst.executeQuery();
			while (rs.next()) {
				parentID = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return parentID;
	}

	@Override
	public int getCategoryIDByName(String CTBName) {
		conn = DBUtil.getConn();
		int categoryID = 0;
		String sql = "select categoryID from category where categoryName = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, CTBName);
			rs = pst.executeQuery();
			while (rs.next()) {
				categoryID = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return categoryID;
	}

	@Override
	public String getCategoryByID(int CTBID) {
		conn = DBUtil.getConn();
		String category = null;
		String sql = "select categoryName from category where categoryID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, CTBID);
			rs = pst.executeQuery();
			while (rs.next()) {
				category = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return category;
	}

}
