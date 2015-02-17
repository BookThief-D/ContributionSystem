package com.mvc.dao;

import java.util.List;

import com.mvc.bean.DispatchCTB;

public interface IDispatchDao {
	public int getExpertIDByCtbID(int ctbID);

	public int getCtbIDByExpertID(int expertID);

	public List<DispatchCTB> getAllByExpertID(int expertID);

	public int insertDispatch(int ctbID, int expertID);
}
