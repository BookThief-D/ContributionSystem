package com.mvc.biz;

import java.util.List;

import com.mvc.bean.Type;

public interface IUserCategoryBiz {
	public String getNameByID(int CTBCategoryID);
	public int getIDByName(String CTBCategoryName);
	public List<Type> getAll();
}
