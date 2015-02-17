package com.mvc.biz;

import java.util.List;

import com.mvc.bean.Type;
import com.mvc.dao.IUserCategoryDao;
import com.mvc.dao.IUserCategoryDaoImp;

public class IUserCategoryBizImp implements IUserCategoryBiz {
	IUserCategoryDao iucd = new IUserCategoryDaoImp();

	@Override
	public String getNameByID(int CTBCategoryID) {
		return iucd.getNameByID(CTBCategoryID);
	}

	@Override
	public int getIDByName(String CTBCategoryName) {
		return iucd.getIDByName(CTBCategoryName);
	}

	@Override
	public List<Type> getAll() {
		return iucd.getAll();
	}


}
