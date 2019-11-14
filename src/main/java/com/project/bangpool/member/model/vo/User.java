package com.project.bangpool.member.model.vo;

public class User {
	private String id;
	private String name;
	private Level level;
	private int loginCount;
	private int recommend;
	
	public User() {}

	public User(String id, String name, Level level, int loginCount, int recommend) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.loginCount = loginCount;
		this.recommend = recommend;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
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
		return "User [id=" + id + ", name=" + name + ", loginCount=" + loginCount + ", recommend=" + recommend + "]";
	}
	
	
	
	

}
