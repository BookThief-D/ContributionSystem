package com.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	
	private static String url = "jdbc:mysql://localhost:3306/contributeDB?useUnicode = true&characterEncoding = UTF-8";
	private static String user = "root";
	private static String password = "asdf";
	
	
	
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	public static Connection getConn(){
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static void closeConn(ResultSet rs,Statement st,PreparedStatement pst,Connection conn){
		try {
			if(rs != null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(st != null){
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					if(pst != null){
						pst.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn != null){
							conn.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} 
	}
}
