package com.mvc.bean;

public class Category {
	private Integer categoryID;
	private String categoryName;
	private Integer parentID;
	
	
	public Category() {
		super();
	}


	public Category(Integer categoryID, String categoryName, Integer parentID) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
		this.parentID = parentID;
	}


	public Integer getCategoryID() {
		return categoryID;
	}


	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public Integer getParentID() {
		return parentID;
	}


	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}



	
	
	
}
