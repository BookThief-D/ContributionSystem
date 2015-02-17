package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.Contribution;
import com.mvc.bean.User;
import com.utils.DBUtil;

public class IUserDaoImpl implements IUserDao {
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public int insertUser(String email, String password, String nickName,
			Integer typeID, String verifyCode, String realName, String headPic) {
		conn = DBUtil.getConn();
		int flag = 0;

		try {
			String sql = "insert into user(email,password,nickName,typeID,verifyCode,realName,headPic) values(?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, nickName);
			pst.setInt(4, typeID);
			pst.setString(5, verifyCode);
			pst.setString(6, realName);
			pst.setString(7, headPic);
			flag = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	public User getByEmai(String email) {
		conn = DBUtil.getConn();
		User user = null;
		String sql = "select userID, password, nickName, age, gender,typeID, email, isVerify, verifyCode, realName, cardID,	debitCard, tellphone, headPic, creatDate from user where email = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			while (rs.next()) {
				int userID = rs.getInt(1);
				String nickName = rs.getString(3);
				String password = rs.getString(2);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				int typeID = rs.getInt(6);
				String isVerify = rs.getString(8);
				String verifyCode = rs.getString(9);
				String realName = rs.getString(10);
				String cardID = rs.getString(11);
				String debitCard = rs.getString(12);
				String tellphone = rs.getString(13);
				String headPic = rs.getString(14);
				String creatDate = rs.getString(15);

				user = new User(userID, password, nickName, age, gender,
						typeID, email, isVerify, verifyCode, realName, cardID,
						debitCard, tellphone, headPic, creatDate);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return user;
	}

	public int editIsEmailVerify() {
		conn = DBUtil.getConn();
		int flag = 0;
		// String sql ="update d_user set is_email_verify = 't'";
		// try {
		// st = conn.createStatement();
		// flag = st.executeUpdate(sql);
		// } catch (SQLException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }finally{
		// DBUtil.closeConn(rs, st, pst, conn);
		// }
		return flag;
	}

	public int getMaxId() {
		conn = DBUtil.getConn();
		int flag = 0;
		String sql = "select max(userID) from user ";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				flag = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	@Override
	public boolean hasEmail(String email) {
		conn = DBUtil.getConn();
		boolean flag = true;
		String sql = "select userID from user where email = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			while (rs.next()) {
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	@Override
	public int modifyUser(Integer userID, String password, String nickName,
			Integer age, String gender, String email, String realName,
			String cardID, String debitCard, String tellphone) {
		conn = DBUtil.getConn();
		int flag = 0;
		String sql = "UPDATE user SET nickName = ?,password = ?, age = ?,gender = ?,realName = ?,cardID = ?,debitCard = ?,tellphone = ? WHERE userID = ?;  ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, nickName);
			pst.setString(2, password);
			pst.setInt(3, age);
			pst.setString(4, gender);
			pst.setString(5, realName);
			pst.setString(6, cardID);
			pst.setString(7, debitCard);
			pst.setString(8, tellphone);
			pst.setInt(9, userID);

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
	public List<User> getByTypeID(Integer typeID) {
		conn = DBUtil.getConn();
		int flag = 0;
		List<User> use = new ArrayList();
		String sql = "SELECT userID, password, nickName, age, gender,typeID, email, isVerify, verifyCode, realName, cardID,	debitCard, tellphone, headPic, creatDate from user where typeID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, typeID);
			rs = pst.executeQuery();
			while (rs.next()) {
				int userID = rs.getInt(1);
				String nickName = rs.getString(3);
				String password = rs.getString(2);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				String email = rs.getString(7);
				String isVerify = rs.getString(8);
				String verifyCode = rs.getString(9);
				String realName = rs.getString(10);
				String cardID = rs.getString(11);
				String debitCard = rs.getString(12);
				String tellphone = rs.getString(13);
				String headPic = rs.getString(14);
				String creatDate = rs.getString(15);

				User user = new User(userID, password, nickName, age, gender,
						typeID, email, isVerify, verifyCode, realName, cardID,
						debitCard, tellphone, headPic, creatDate);
				use.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return use;
	}

	@Override
	public int getNumberByType(Integer typeID) {
		conn = DBUtil.getConn();
		int flag = 0;
		String sql = "select count(*) from user where typeID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, typeID);
			rs = pst.executeQuery();
			while (rs.next()) {
				flag = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	@Override
	public List<User> getAll() {
		conn = DBUtil.getConn();
		int flag = 0;
		List<User> use = new ArrayList();
		String sql = "SELECT userID, password, nickName, age, gender,typeID, email, isVerify, verifyCode, realName, cardID,	debitCard, tellphone, headPic, creatDate from user";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				int userID = rs.getInt(1);
				String nickName = rs.getString(3);
				String password = rs.getString(2);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				int typeID = rs.getInt(6);
				String email = rs.getString(7);
				String isVerify = rs.getString(8);
				String verifyCode = rs.getString(9);
				String realName = rs.getString(10);
				String cardID = rs.getString(11);
				String debitCard = rs.getString(12);
				String tellphone = rs.getString(13);
				String headPic = rs.getString(14);
				String creatDate = rs.getString(15);

				User user = new User(userID, password, nickName, age, gender,
						typeID, email, isVerify, verifyCode, realName, cardID,
						debitCard, tellphone, headPic, creatDate);
				use.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return use;
	}

	@Override
	public int insertUser(String email, String password, String nickName,
			Integer typeID, String verifyCode, String realName, Integer age,
			String gender, String cardID, String debitCard, String tellphone) {
		conn = DBUtil.getConn();
		int flag = 0;

		try {
			String sql = "insert into user(email,password,nickName,typeID,verifyCode,realName,age ,gender ,cardID,debitCard, tellphone) values(?,?,?,?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, nickName);
			pst.setInt(4, typeID);
			pst.setString(5, verifyCode);
			pst.setString(6, realName);
			pst.setInt(7, age);
			pst.setString(8, gender);
			pst.setString(9, cardID);
			pst.setString(10, debitCard);
			pst.setString(11, tellphone);

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
	public User getByID(Integer userID) {
		conn = DBUtil.getConn();
		User user = null;
		String sql = "select userID, password, nickName, age, gender,typeID, email, isVerify, verifyCode, realName, cardID,	debitCard, tellphone, headPic, creatDate from user where userID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userID);
			rs = pst.executeQuery();
			while (rs.next()) {

				String nickName = rs.getString(3);
				String password = rs.getString(2);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				int typeID = rs.getInt(6);
				String email = rs.getString(7);
				String isVerify = rs.getString(8);
				String verifyCode = rs.getString(9);
				String realName = rs.getString(10);
				String cardID = rs.getString(11);
				String debitCard = rs.getString(12);
				String tellphone = rs.getString(13);
				String headPic = rs.getString(14);
				String creatDate = rs.getString(15);

				user = new User(userID, password, nickName, age, gender,
						typeID, email, isVerify, verifyCode, realName, cardID,
						debitCard, tellphone, headPic, creatDate);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return user;
	}

	@Override
	public int deleteUser(Integer userID) {
		conn = DBUtil.getConn();
		int flag = 0;
		try {
			String sql = "DELETE FROM user WHERE userID = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userID);
			flag = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(rs, st, pst, conn);
		}
		return flag;
	}

	@Override
	public int modifyPwd(Integer userID,String password) {
		conn = DBUtil.getConn();
		int flag = 0;
		String sql = "UPDATE user SET password = ? WHERE userID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setInt(2, userID);

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
