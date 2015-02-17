package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.mvc.bean.Contribution;
import com.utils.DBUtil;

public class IContributionDaoImp implements IContributionDao {
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	@Override
	public Contribution getByTitle(String CTBName) {
		conn = DBUtil.getConn();
		Contribution ctb = null;
		String sql = "select ctbID, userID, title, container,categoryID, upLoadTime, updateTime, isJudge, keywords where name = '"
				+ CTBName + "'";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				int ctbID = rs.getInt(1);
				int userID = rs.getInt(2);
				String title = rs.getString(3);
				String container = rs.getString(4);
				int categoryID = rs.getInt(5);
				String upLoadTime = rs.getString(6);
				String updateTime = rs.getString(7);
				String isJudge = rs.getString(8);
				String keywords = rs.getString(9);

				ctb = new Contribution(ctbID, userID, title, container,
						categoryID, upLoadTime, updateTime, isJudge, keywords);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return ctb;
	}

	@Override
	public List<Contribution> getByCategoryId(int CTBCatrgoryID) {
		conn = DBUtil.getConn();
		List<Contribution> ctb = new ArrayList();
		String sql = "select ctbID, userID, title, container,categoryID, upLoadTime, updateTime, isJudge, keywords from contribution  where categoryID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, CTBCatrgoryID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int ctbID = rs.getInt(1);
				int userID = rs.getInt(2);
				String title = rs.getString(3);
				String container = rs.getString(4);
				int categoryID = rs.getInt(5);
				String upLoadTime = rs.getString(6);
				String updateTime = rs.getString(7);
				String isJudge = rs.getString(8);
				String keywords = rs.getString(9);
				Contribution ctbn = new Contribution(ctbID, userID, title,
						container, categoryID, upLoadTime, updateTime, isJudge,
						keywords);
				ctb.add(ctbn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return ctb;
	}

	@Override
	public List<Contribution> getByTime(Date starTime, Date endTime) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Contribution> getByAddTime() {
		conn = DBUtil.getConn();
		List<Contribution> ctb = new ArrayList();
		String sql = "select ctbID, userID, title, container,categoryID, upLoadTime, updateTime, isJudge, keywords from contribution order by upLoadTime desc limit 8";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				int ctbID = rs.getInt(1);
				int userID = rs.getInt(2);
				String title = rs.getString(3);
				String container = rs.getString(4);
				int categoryID = rs.getInt(5);
				String upLoadTime = rs.getString(6);
				String updateTime = rs.getString(7);
				String isJudge = rs.getString(8);
				String keywords = rs.getString(9);
				Contribution ctbn = new Contribution(ctbID, userID, title,
						container, categoryID, upLoadTime, updateTime, isJudge,
						keywords);
				ctb.add(ctbn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return ctb;
	}

	@Override
	public int getNumberByCategoryID(int CTBCatrgoryID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Contribution getByID(int CTBID) {
		conn = DBUtil.getConn();
		Contribution ctb = null;
		String sql = "select ctbID, userID, title, container,categoryID, upLoadTime, updateTime, isJudge, keywords  from contribution where ctbID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, CTBID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int ctbID = rs.getInt(1);
				int userID = rs.getInt(2);
				String title = rs.getString(3);
				String container = rs.getString(4);
				int categoryID = rs.getInt(5);
				String upLoadTime = rs.getString(6);
				String updateTime = rs.getString(7);
				String isJudge = rs.getString(8);
				String keywords = rs.getString(9);
				ctb = new Contribution(ctbID, userID, title, container,
						categoryID, upLoadTime, updateTime, isJudge, keywords);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return ctb;
	}

	@Override
	public List<Contribution> getAllCTB() {
		conn = DBUtil.getConn();
		List<Contribution> ctb = new ArrayList();
		String sql = "select ctbID, userID, title, container,categoryID, upLoadTime, updateTime, isJudge, keywords from contribution";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				int ctbID = rs.getInt(1);
				int userID = rs.getInt(2);
				String title = rs.getString(3);
				String container = rs.getString(4);
				int categoryID = rs.getInt(5);
				String upLoadTime = rs.getString(6);
				String updateTime = rs.getString(7);
				String isJudge = rs.getString(8);
				String keywords = rs.getString(9);
				Contribution ctbn = new Contribution(ctbID, userID, title,
						container, categoryID, upLoadTime, updateTime, isJudge,
						keywords);
				ctb.add(ctbn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return ctb;
	}

	@Override
	public List<Contribution> getBySQL(String sql) {
		conn = DBUtil.getConn();
		List<Contribution> ctb = new ArrayList();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				int ctbID = rs.getInt(1);
				int userID = rs.getInt(2);
				String title = rs.getString(3);
				String container = rs.getString(4);
				int categoryID = rs.getInt(5);
				String upLoadTime = rs.getString(6);
				String updateTime = rs.getString(7);
				String isJudge = rs.getString(8);
				String keywords = rs.getString(9);
				Contribution ctbn = new Contribution(ctbID, userID, title,
						container, categoryID, upLoadTime, updateTime, isJudge,
						keywords);
				ctb.add(ctbn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}

		return ctb;
	}

	@Override
	public int getIsJudge(int ctbID, String updateTime) {
		conn = DBUtil.getConn();
		int flag = 0;
		String sql = "UPDATE contribution SET isJudge = ? WHERE ctbID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, updateTime);
			pst.setInt(2, ctbID);

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
	public int insertCTB(Integer userID, String title, String container,
			Integer categoryID, String keywords) {
		conn = DBUtil.getConn();
		int flag = 0;

		try {
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.util.Date currentTime = new java.util.Date();// 得到当前系统时间

			String str_date1 = formatter.format(currentTime); // 将日期时间格式化
			String str_date2 = currentTime.toString(); // 将Date型日期时间转换成字符串形式
			String sql = "insert into contribution(  userID,title, container,categoryID,keywords,upLoadTime) values(?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userID);
			pst.setString(2, title);
			pst.setString(3, container);
			pst.setInt(4, categoryID);
			pst.setString(5, keywords);
			pst.setString(6, str_date2);
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
	public int deleteContribution(Integer ctbID) {
		conn = DBUtil.getConn();
		int flag = 0;
		try {
			String sql = "DELETE FROM contribution WHERE ctbID = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, ctbID);
			flag = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	@Override
	public int upload(int ctbID) {
		conn = DBUtil.getConn();
		int flag = 0;
		String sql = "UPDATE contribution SET updateTime = ? WHERE ctbID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "t");
			pst.setInt(2, ctbID);

			flag = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

}
