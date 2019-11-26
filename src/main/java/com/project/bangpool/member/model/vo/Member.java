package com.project.bangpool.member.model.vo;

import java.sql.Date;

public class Member {

	private String mNo;		// member No.
	private String mlCode; 	// member level code
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private String gender;
	private String birth;
	private String address;
	private String phone;
	private String mStatus;
	private Date enrollDate;
	private Date updateDate;
	private String profile; // 프로필
	private String originalFileName;// 원래파일이름
	private String renameFileName;	// 변경파일이름 

	private int loginCount;		// 추가
	private String snsId;

	public Member() {
		super();
	}

	public Member(String mNo, String mlCode, String email, String pwd, String name, String nickname, String gender,
			String birth, String address, String phone, String mStatus, Date enrollDate, Date updateDate,
			String profile, String originalFileName, String renameFileName, int loginCount, String snsId) {
		super();
		this.mNo = mNo;
		this.mlCode = mlCode;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.birth = birth;
		this.address = address;
		this.phone = phone;
		this.mStatus = mStatus;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.profile = profile;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.loginCount = loginCount;
		this.snsId = snsId;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getMlCode() {
		return mlCode;
	}

	public void setMlCode(String mlCode) {
		this.mlCode = mlCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mlCode=" + mlCode + ", email=" + email + ", pwd=" + pwd + ", name=" + name
				+ ", nickname=" + nickname + ", gender=" + gender + ", birth=" + birth + ", address=" + address
				+ ", phone=" + phone + ", mStatus=" + mStatus + ", enrollDate=" + enrollDate + ", updateDate="
				+ updateDate + ", profile=" + profile + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", loginCount=" + loginCount + ", snsId=" + snsId + "]";
	}
	

}
