package com.mvc.biz;

import java.util.List;

import com.mvc.bean.DispatchCTB;
import com.mvc.dao.IDispatchDao;
import com.mvc.dao.IDispatchDaoImp;

public class IDispatchBizImp implements IDispatchBiz {
	IDispatchDao idd = new IDispatchDaoImp();

	@Override
	public int getExpertIDByCtbID(int ctbID) {
		return idd.getExpertIDByCtbID(ctbID);
	}

	@Override
	public int getCtbIDByExpertID(int expertID) {
		return idd.getCtbIDByExpertID(expertID);
	}

	@Override
	public int insertDispatch(int ctbID, int expertID) {
		return idd.insertDispatch(ctbID, expertID);
	}

	@Override
	public List<DispatchCTB> getAllByExpertID(int expertID) {
		return idd.getAllByExpertID(expertID);
	}
}
