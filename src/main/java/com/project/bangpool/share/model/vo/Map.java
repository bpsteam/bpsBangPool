package com.project.bangpool.share.model.vo;

public class Map {
	private int srbid;
	private String srbwriter;
	private String address;
	private String sritemname;

	public Map() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Map(int srbid, String srbwriter, String address, String sritemname) {
		super();
		this.srbid = srbid;
		this.srbwriter = srbwriter;
		this.address = address;
		this.sritemname = sritemname;
	}

	public int getSrbid() {
		return srbid;
	}

	public void setSrbid(int srbid) {
		this.srbid = srbid;
	}

	public String getSrbwriter() {
		return srbwriter;
	}

	public void setSrbwriter(String srbwriter) {
		this.srbwriter = srbwriter;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSritemname() {
		return sritemname;
	}

	public void setSritemname(String sritemname) {
		this.sritemname = sritemname;
	}

	@Override
	public String toString() {
		return "Map [srbid=" + srbid + ", srbwriter=" + srbwriter + ", address=" + address + ", sritemname="
				+ sritemname + "]";
	}

}
