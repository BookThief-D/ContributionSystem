package com.mvc.bean;

public class Type {
	private Integer typeID;
	private String typeName;
	
	
	public Type() {
		super();
	}


	public Type(Integer typeID, String typeName) {
		super();
		this.typeID = typeID;
		this.typeName = typeName;
	}


	public Integer getTypeID() {
		return typeID;
	}


	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}


	public String getTypeName() {
		return typeName;
	}


	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
}
