package com.project.bangpool.memberlevel.model.vo;

public class ManageMember {
	private String mlCode;		// 회원등급코드
	private String mlName;		// 회원등급명
	private int loginCount;
	private int recommend;
	
	// DB loginCount, recommend 추가
	
	public ManageMember() {}

	public String getMlCode() {
		return mlCode;
	}

	public void setMlCode(String mlCode) {
		this.mlCode = mlCode;
	}

	public String getMlName() {
		return mlName;
	}

	public void setMlName(String mlName) {
		this.mlName = mlName;
	}

	public int getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "ManageMember [mlCode=" + mlCode + ", mlName=" + mlName + ", loginCount=" + loginCount + ", recommend="
				+ recommend + "]";
	}

	
	
}
