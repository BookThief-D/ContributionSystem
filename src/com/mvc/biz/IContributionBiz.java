package com.mvc.biz;

import java.util.Date;
import java.util.List;

import com.mvc.bean.Contribution;

public interface IContributionBiz {
	public Contribution getByTitle(String CTBName);

	public int insertCTB(Integer userID, String title, String container,
			Integer categoryID, String keywords);

	public List<Contribution> getByCategoryId(int CTBCatrgoryID);

	public List<Contribution> getByTime(Date starTime, Date endTime);

	public List<Contribution> getByAddTime();

	public int getNumberByCategoryID(int CTBCatrgoryID);

	public Contribution getByID(int CTBID);

	public int upload(int ctbID);

	public List<Contribution> getAllCTB();

	public List<Contribution> getBySQL(String sql);

	public int getIsJudge(int ctbID, String updateTime);

	public int deleteContribution(Integer ctbID);

}
