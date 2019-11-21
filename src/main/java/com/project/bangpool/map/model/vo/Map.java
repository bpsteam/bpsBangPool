package com.project.bangpool.map.model.vo;

public class Map {
	private int mid;
	private String mName;
	private String address;
	public Map() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Map(int mid, String mName, String address) {
		super();
		this.mid = mid;
		this.mName = mName;
		this.address = address;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Map [mid=" + mid + ", mName=" + mName + ", address=" + address + "]";
	}

	
}
