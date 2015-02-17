package com.mvc.bean;

public class User {
	private Integer userID;
	private String password;
	private String nickName;
	private Integer age;
	private String gender;
	private Integer typeID;
	private String email;
	private String isVerify;
	private String verifyCode;
	private String realName;
	private String cardID;
	private String debitCard;
	private String tellphone;
	private String headPic;
	private String creatDate;
	
	
	public User() {
		super();
	}



	public User(Integer userID, String password, String nickName, Integer age,
			String gender, Integer typeID, String email, String isVerify,
			String verifyCode, String realName, String cardID,
			String debitCard, String tellphone, String headPic, String creatDate) {
		super();
		this.userID = userID;
		this.password = password;
		this.nickName = nickName;
		this.age = age;
		this.gender = gender;
		this.typeID = typeID;
		this.email = email;
		this.isVerify = isVerify;
		this.verifyCode = verifyCode;
		this.realName = realName;
		this.cardID = cardID;
		this.debitCard = debitCard;
		this.tellphone = tellphone;
		this.headPic = headPic;
		this.creatDate = creatDate;
	}


	public Integer getUserID() {
		return userID;
	}


	public void setUserID(Integer userID) {
		this.userID = userID;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Integer getTypeID() {
		return typeID;
	}


	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getIsVerify() {
		return isVerify;
	}


	public void setIsVerify(String isVerify) {
		this.isVerify = isVerify;
	}


	public String getVerifyCode() {
		return verifyCode;
	}


	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}


	public String getRealName() {
		return realName;
	}


	public void setRealName(String realName) {
		this.realName = realName;
	}


	public String getCardID() {
		return cardID;
	}


	public void setCardID(String cardID) {
		this.cardID = cardID;
	}


	public String getDebitCard() {
		return debitCard;
	}


	public void setDebitCard(String debitCard) {
		this.debitCard = debitCard;
	}


	public String getTellphone() {
		return tellphone;
	}


	public void setTellphone(String tellphone) {
		this.tellphone = tellphone;
	}


	public String getHeadPic() {
		return headPic;
	}


	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}


	public String getCreatDate() {
		return creatDate;
	}


	public void setCreatDate(String creatDate) {
		this.creatDate = creatDate;
	}
	

}
