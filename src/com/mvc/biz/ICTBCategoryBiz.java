package com.mvc.biz;

import java.util.List;

import com.mvc.bean.Category;

public interface ICTBCategoryBiz {
	public List<Category> getAllCategoryByParentId(int CTBID);
	public int getParentIDByName(String CTBName);
	public int getParentIDByID(int CTBID);
	public int getCategoryIDByName(String CTBName);
	public String getCategoryByID(int CTBID);
}
