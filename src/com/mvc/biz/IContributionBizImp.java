package com.mvc.biz;

import java.util.Date;
import java.util.List;

import com.mvc.bean.Contribution;
import com.mvc.dao.IContributionDao;
import com.mvc.dao.IContributionDaoImp;

public class IContributionBizImp implements IContributionBiz {

	IContributionDao icdi = new IContributionDaoImp();

	@Override
	public Contribution getByTitle(String CTBName) {
		return icdi.getByTitle(CTBName);
	}

	@Override
	public List<Contribution> getByCategoryId(int CTBCatrgoryID) {
		return icdi.getByCategoryId(CTBCatrgoryID);
	}

	@Override
	public List<Contribution> getByTime(Date starTime, Date endTime) {
		return icdi.getByTime(starTime, endTime);
	}

	@Override
	public List<Contribution> getByAddTime() {
		return icdi.getByAddTime();
	}

	@Override
	public int getNumberByCategoryID(int CTBCatrgoryID) {
		return icdi.getNumberByCategoryID(CTBCatrgoryID);
	}

	@Override
	public Contribution getByID(int CTBID) {
		return icdi.getByID(CTBID);
	}

	@Override
	public List<Contribution> getAllCTB() {
		return icdi.getAllCTB();
	}

	@Override
	public List<Contribution> getBySQL(String sql) {
		return icdi.getBySQL(sql);
	}

	@Override
	public int getIsJudge(int ctbID, String updateTime) {
		return icdi.getIsJudge(ctbID, updateTime);
	}

	@Override
	public int insertCTB(Integer userID, String title, String container,
			Integer categoryID, String keywords) {
		return icdi.insertCTB(userID, title, container, categoryID, keywords);
	}

	@Override
	public int deleteContribution(Integer ctbID) {
		return icdi.deleteContribution(ctbID);
	}

	@Override
	public int upload(int ctbID) {

		return icdi.upload(ctbID);
	}

}
