package com.mvc.dao;

import java.util.Date;
import java.util.List;

import com.mvc.bean.Contribution;

public interface IContributionDao {
	public int insertCTB(Integer userID, String title, String container,
			Integer categoryID, String keywords);

	public Contribution getByTitle(String CTBName);

	public List<Contribution> getByCategoryId(int CTBCatrgoryID);

	public List<Contribution> getByTime(Date starTime, Date endTime);

	public List<Contribution> getByAddTime();

	public int getNumberByCategoryID(int CTBCatrgoryID);

	public Contribution getByID(int CTBID);

	public List<Contribution> getAllCTB();

	public List<Contribution> getBySQL(String sql);

	public int getIsJudge(int ctbID, String updateTime);

	public int upload(int ctbID);

	public int deleteContribution(Integer ctbID);
}
