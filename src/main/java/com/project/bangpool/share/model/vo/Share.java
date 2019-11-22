package com.project.bangpool.share.model.vo;

import java.sql.Date;

public class Share {
	
	private int srbId;					
	private String srbCode;					
	private String srbTitle;			
	private String srbWriter;			
	private String srbContent;			
	private String srbLocation;			
	private int srbCount;				
	private String originalFileName;		
	private String renameFileName;	
	private Date srCreateDate;			
	private Date srModifyDate;	
	private Date srStartDate;			
	private Date srEndDate;			
	private String srStatus;
    private int srDistance;
    private int srStartHour;
    private int srEndHour;
    private String srEvent;    		// 추첨방법
    private int srEventLimit;  		// 추첨인원
    private int srEventEnterCount;  // 참가인원
    private String srItemName; 		// 아이템이름
    private String srDelivery; 		// 배송방법
    private String srWinner;   		// 당첨자
    
 	public Share() {}
 	
 	

	public Share(int srbId, String srbCode, String srbTitle, String srbWriter, String srbContent, String srbLocation,
			int srbCount, String originalFileName, String renameFileName, Date srCreateDate, Date srModifyDate,
			Date srStartDate, Date srEndDate, String srStatus, int srDistance, int srStartHour, int srEndHour,
			String srEvent, int srEventLimit, int srEventEnterCount, String srItemName, String srDelivery,
			String srWinner) {
		super();
		this.srbId = srbId;
		this.srbCode = srbCode;
		this.srbTitle = srbTitle;
		this.srbWriter = srbWriter;
		this.srbContent = srbContent;
		this.srbLocation = srbLocation;
		this.srbCount = srbCount;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.srCreateDate = srCreateDate;
		this.srModifyDate = srModifyDate;
		this.srStartDate = srStartDate;
		this.srEndDate = srEndDate;
		this.srStatus = srStatus;
		this.srDistance = srDistance;
		this.srStartHour = srStartHour;
		this.srEndHour = srEndHour;
		this.srEvent = srEvent;
		this.srEventLimit = srEventLimit;
		this.srEventEnterCount = srEventEnterCount;
		this.srItemName = srItemName;
		this.srDelivery = srDelivery;
		this.srWinner = srWinner;
	}



	public int getSrbId() {
		return srbId;
	}

	public void setSrbId(int srbId) {
		this.srbId = srbId;
	}

	public String getSrbCode() {
		return srbCode;
	}

	public void setSrbCode(String srbCode) {
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

	public Date getSrStartDate() {
		return srStartDate;
	}

	public void setSrStartDate(Date srStartDate) {
		this.srStartDate = srStartDate;
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

	public int getSrStartHour() {
		return srStartHour;
	}

	public void setSrStartHour(int srStartHour) {
		this.srStartHour = srStartHour;
	}

	public int getSrEndHour() {
		return srEndHour;
	}

	public void setSrEndHour(int srEndHour) {
		this.srEndHour = srEndHour;
	}

	public String getSrEvent() {
		return srEvent;
	}

	public void setSrEvent(String srEvent) {
		this.srEvent = srEvent;
	}

	public int getSrEventLimit() {
		return srEventLimit;
	}

	public void setSrEventLimit(int srEventLimit) {
		this.srEventLimit = srEventLimit;
	}

	public int getSrEventEnterCount() {
		return srEventEnterCount;
	}

	public void setSrEventEnterCount(int srEventEnterCount) {
		this.srEventEnterCount = srEventEnterCount;
	}

	public String getSrItemName() {
		return srItemName;
	}

	public void setSrItemName(String srItemName) {
		this.srItemName = srItemName;
	}

	public String getSrDelivery() {
		return srDelivery;
	}

	public void setSrDelivery(String srDelivery) {
		this.srDelivery = srDelivery;
	}

	public String getSrWinner() {
		return srWinner;
	}

	public void setSrWinner(String srWinner) {
		this.srWinner = srWinner;
	}



	@Override
	public String toString() {
		return "Share [srbId=" + srbId + ", srbCode=" + srbCode + ", srbTitle=" + srbTitle + ", srbWriter=" + srbWriter
				+ ", srbContent=" + srbContent + ", srbLocation=" + srbLocation + ", srbCount=" + srbCount
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", srCreateDate="
				+ srCreateDate + ", srModifyDate=" + srModifyDate + ", srStartDate=" + srStartDate + ", srEndDate="
				+ srEndDate + ", srStatus=" + srStatus + ", srDistance=" + srDistance + ", srStartHour=" + srStartHour
				+ ", srEndHour=" + srEndHour + ", srEvent=" + srEvent + ", srEventLimit=" + srEventLimit
				+ ", srEventEnterCount=" + srEventEnterCount + ", srItemName=" + srItemName + ", srDelivery="
				+ srDelivery + ", srWinner=" + srWinner + "]";
	}

 	
    
}
