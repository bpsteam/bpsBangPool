package com.project.bangpool.showing.model.vo;

import java.sql.Date;

public class Showing{
	private int sbid;
	private String bcode;
	private String sbtitle;
	private String sbwriter;
	private String sbcontent;
	private int sbcount;
	private Date sbcreatedate;
	private Date sbmodifydate;
	private String sbstatus;
	private String originalFileName;
	private String renameFileName;
	public Showing() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Showing(int sbid, String bcode, String sbtitle, String sbwriter, String sbcontent, int sbcount,
			Date sbcreatedate, Date sbmodifydate, String sbstatus, String originalFileName, String renameFileName) {
		super();
		this.sbid = sbid;
		this.bcode = bcode;
		this.sbtitle = sbtitle;
		this.sbwriter = sbwriter;
		this.sbcontent = sbcontent;
		this.sbcount = sbcount;
		this.sbcreatedate = sbcreatedate;
		this.sbmodifydate = sbmodifydate;
		this.sbstatus = sbstatus;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}
	public int getSbid() {
		return sbid;
	}
	public void setSbid(int sbid) {
		this.sbid = sbid;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getSbtitle() {
		return sbtitle;
	}
	public void setSbtitle(String sbtitle) {
		this.sbtitle = sbtitle;
	}
	public String getSbwriter() {
		return sbwriter;
	}
	public void setSbwriter(String sbwriter) {
		this.sbwriter = sbwriter;
	}
	public String getSbcontent() {
		return sbcontent;
	}
	public void setSbcontent(String sbcontent) {
		this.sbcontent = sbcontent;
	}
	public int getSbcount() {
		return sbcount;
	}
	public void setSbcount(int sbcount) {
		this.sbcount = sbcount;
	}
	public Date getSbcreatedate() {
		return sbcreatedate;
	}
	public void setSbcreatedate(Date sbcreatedate) {
		this.sbcreatedate = sbcreatedate;
	}
	public Date getSbmodifydate() {
		return sbmodifydate;
	}
	public void setSbmodifydate(Date sbmodifydate) {
		this.sbmodifydate = sbmodifydate;
	}
	public String getSbstatus() {
		return sbstatus;
	}
	public void setSbstatus(String sbstatus) {
		this.sbstatus = sbstatus;
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
	@Override
	public String toString() {
		return "Showing [sbid=" + sbid + ", bcode=" + bcode + ", sbtitle=" + sbtitle + ", sbwriter=" + sbwriter
				+ ", sbcontent=" + sbcontent + ", sbcount=" + sbcount + ", sbcreatedate=" + sbcreatedate
				+ ", sbmodifydate=" + sbmodifydate + ", sbstatus=" + sbstatus + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + "]";
	}
	
	
}
