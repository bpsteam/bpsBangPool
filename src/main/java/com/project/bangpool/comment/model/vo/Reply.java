package com.project.bangpool.comment.model.vo;

import java.sql.Date;

public class Reply {
	
	private int rId;
	private String bCode;
	private String rContent;
	private int refbId;
	private String rWriter;
	private Date rCreateDate;
	private Date rModifyDate;
	private char rStatus;
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(int rId, String bCode, String rContent, int refbId, String rWriter, Date rCreateDate, Date rModifyDate,
			char rStatus) {
		super();
		this.rId = rId;
		this.bCode = bCode;
		this.rContent = rContent;
		this.refbId = refbId;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getbCode() {
		return bCode;
	}
	public void setbCode(String bCode) {
		this.bCode = bCode;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getRefbId() {
		return refbId;
	}
	public void setRefbId(int refbId) {
		this.refbId = refbId;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public Date getrCreateDate() {
		return rCreateDate;
	}
	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}
	public Date getrModifyDate() {
		return rModifyDate;
	}
	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}
	public char getrStatus() {
		return rStatus;
	}
	public void setrStatus(char rStatus) {
		this.rStatus = rStatus;
	}
	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", bCode=" + bCode + ", rContent=" + rContent + ", refbId=" + refbId + ", rWriter="
				+ rWriter + ", rCreateDate=" + rCreateDate + ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus
				+ "]";
	}
	
	
	
}
