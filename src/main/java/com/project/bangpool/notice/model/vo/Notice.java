 package com.project.bangpool.notice.model.vo;

import java.sql.Date;


public class Notice {
	
	private int nId;
	private String bCode;
	private String nTitle;
	private String nWriter;
	private String nContent;
	private int nCount;
	private String originalFileName;
	private String renameFileName;
	private Date nCreateDate;
	private Date nModifydate;
	private String nStatus;
	
	public Notice() {}

	public Notice(int nId, String bCode, String nTitle, String nWriter, String nContent, int nCount,
			String originalFileName, String renameFileName, Date nCreateDate, Date nModifydate, String nStatus) {
		this.nId = nId;
		this.bCode = bCode;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nContent = nContent;
		this.nCount = nCount;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.nCreateDate = nCreateDate;
		this.nModifydate = nModifydate;
		this.nStatus = nStatus;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
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

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifydate() {
		return nModifydate;
	}

	public void setnModifydate(Date nModifydate) {
		this.nModifydate = nModifydate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", bCode=" + bCode + ", nTitle=" + nTitle + ", nWriter=" + nWriter + ", nContent="
				+ nContent + ", nCount=" + nCount + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", nCreateDate=" + nCreateDate + ", nModifydate=" + nModifydate + ", nStatus="
				+ nStatus + "]";
	}
	
	
	
	

	

}
