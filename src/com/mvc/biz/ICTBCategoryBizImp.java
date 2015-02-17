package com.mvc.biz;

import java.util.List;

import com.mvc.bean.Category;
import com.mvc.dao.ICTBCategoryDao;
import com.mvc.dao.ICTBCategoryDaoImp;

public class ICTBCategoryBizImp implements ICTBCategoryBiz {
	ICTBCategoryDao ictb = new ICTBCategoryDaoImp();
	
	@Override
	public List<Category> getAllCategoryByParentId(int CTBID) {
		return ictb.getAllCategoryByParentId(CTBID);
	}

	@Override
	public int getParentIDByName(String CTBName) {
		return ictb.getParentIDByName(CTBName);
	}

	@Override
	public int getParentIDByID(int CTBID) {
		return ictb.getParentIDByID(CTBID);
	}

	@Override
	public int getCategoryIDByName(String CTBName) {
		return ictb.getCategoryIDByName(CTBName);
	}

	@Override
	public String getCategoryByID(int CTBID) {
		return ictb.getCategoryByID(CTBID);
	}

}
