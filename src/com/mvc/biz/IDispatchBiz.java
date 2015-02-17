package com.mvc.biz;

import java.util.List;

import com.mvc.bean.DispatchCTB;

public interface IDispatchBiz {

	public int getExpertIDByCtbID(int ctbID);

	public int getCtbIDByExpertID(int expertID);

	public int insertDispatch(int ctbID, int expertID);

	public List<DispatchCTB> getAllByExpertID(int expertID);
}
