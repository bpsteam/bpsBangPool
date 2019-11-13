package com.project.bangpool.share.model.vo;

import java.sql.Date;

public class Share {
	
	private int srbId;					
	private int srbCode;					
	private String srbTitle;			
	private String srbWriter;			
	private String srbContent;			
	private String srbLocation;			
	private int srbCount;				
	private String srOrgFileName;		
	private String srRenameFileName;	
	private Date srCreateDate;			
	private Date srModifyDate;			
	private Date srEndDate;			
	private String srStatus;
    private int srDistance;
	
    public Share() {}

	public Share(int srbId, int srbCode, String srbTitle, String srbWriter, String srbContent, String srbLocation,
			int srbCount, String srOrgFileName, String srRenameFileName, Date srCreateDate, Date srModifyDate,
			Date srEndDate, String srStatus, int srDistance) {
		this.srbId = srbId;
		this.srbCode = srbCode;
		this.srbTitle = srbTitle;
		this.srbWriter = srbWriter;
		this.srbContent = srbContent;
		this.srbLocation = srbLocation;
		this.srbCount = srbCount;
		this.srOrgFileName = srOrgFileName;
		this.srRenameFileName = srRenameFileName;
		this.srCreateDate = srCreateDate;
		this.srModifyDate = srModifyDate;
		this.srEndDate = srEndDate;
		this.srStatus = srStatus;
		this.srDistance = srDistance;
	}

	public int getSrbId() {
		return srbId;
	}

	public void setSrbId(int srbId) {
		this.srbId = srbId;
	}

	public int getSrbCode() {
		return srbCode;
	}

	public void setSrbCode(int srbCode) {
		this.srbCode = srbCode;
	}

	public String getSrbTitle() {
		return srbTitle;
	}

	public void setSrbTitle(String srbTitle) {
		this.srbTitle = srbTitle;
	}

	public String getSrbWriter() {
		return srbWriter;
	}

	public void setSrbWriter(String srbWriter) {
		this.srbWriter = srbWriter;
	}

	public String getSrbContent() {
		return srbContent;
	}

	public void setSrbContent(String srbContent) {
		this.srbContent = srbContent;
	}

	public String getSrbLocation() {
		return srbLocation;
	}

	public void setSrbLocation(String srbLocation) {
		this.srbLocation = srbLocation;
	}

	public int getSrbCount() {
		return srbCount;
	}

	public void setSrbCount(int srbCount) {
		this.srbCount = srbCount;
	}

	public String getSrOrgFileName() {
		return srOrgFileName;
	}

	public void setSrOrgFileName(String srOrgFileName) {
		this.srOrgFileName = srOrgFileName;
	}

	public String getSrRenameFileName() {
		return srRenameFileName;
	}

	public void setSrRenameFileName(String srRenameFileName) {
		this.srRenameFileName = srRenameFileName;
	}

	public Date getSrCreateDate() {
		return srCreateDate;
	}

	public void setSrCreateDate(Date srCreateDate) {
		this.srCreateDate = srCreateDate;
	}

	public Date getSrModifyDate() {
		return srModifyDate;
	}

	public void setSrModifyDate(Date srModifyDate) {
		this.srModifyDate = srModifyDate;
	}

	public Date getSrEndDate() {
		return srEndDate;
	}

	public void setSrEndDate(Date srEndDate) {
		this.srEndDate = srEndDate;
	}

	public String getSrStatus() {
		return srStatus;
	}

	public void setSrStatus(String srStatus) {
		this.srStatus = srStatus;
	}

	public int getSrDistance() {
		return srDistance;
	}

	public void setSrDistance(int srDistance) {
		this.srDistance = srDistance;
	}

	@Override
	public String toString() {
		return "Share [srbId=" + srbId + ", srbCode=" + srbCode + ", srbTitle=" + srbTitle + ", srbWriter=" + srbWriter
				+ ", srbContent=" + srbContent + ", srbLocation=" + srbLocation + ", srbCount=" + srbCount
				+ ", srOrgFileName=" + srOrgFileName + ", srRenameFileName=" + srRenameFileName + ", srCreateDate="
				+ srCreateDate + ", srModifyDate=" + srModifyDate + ", srEndDate=" + srEndDate + ", srStatus="
				+ srStatus + ", srDistance=" + srDistance + "]";
	}
	
    
    
}
