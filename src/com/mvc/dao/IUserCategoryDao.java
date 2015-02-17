package com.mvc.dao;

import java.util.List;

import com.mvc.bean.Type;


public interface IUserCategoryDao {
	public String getNameByID(int CTBCategoryID);
	public int getIDByName(String CTBCategoryName);
	public List<Type> getAll();
	
}
