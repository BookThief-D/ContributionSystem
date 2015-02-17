package com.mvc.bean;

public class DispatchCTB {

	private int expertID;
	private int ctbID;

	public DispatchCTB() {
		super();
	}

	public DispatchCTB(int expertID, int ctbID) {
		super();
		this.expertID = expertID;
		this.ctbID = ctbID;
	}

	public int getExpertID() {
		return expertID;
	}

	public void setExpertID(int expertID) {
		this.expertID = expertID;
	}

	public int getCtbID() {
		return ctbID;
	}

	public void setCtbID(int ctbID) {
		this.ctbID = ctbID;
	}

}
