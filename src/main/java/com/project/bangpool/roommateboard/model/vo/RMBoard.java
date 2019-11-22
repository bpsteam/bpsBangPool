package com.project.bangpool.roommateboard.model.vo;

import java.sql.Date;

public class RMBoard {
	
	private int rbId;				// 글 번호 
	private String bcode;			// 게시판 코드
	private String rbTitle;			// 글 제목
	private String rbWriter;		// 글 작성자
	private String rbContent;		// 게시물 내용
	private String originalFileName;// 원래파일이름
	private String renameFileName;	// 변경파일이름 
	private int  rbCount;			// 글 조회수
	private Date rbCreateDate;		// 글 작성일자
	private Date rbModifyDate;		// 글 수정일자 
	private String rbStatus;		// 글 삭제여부
	
	private String rLocation; 		// 지역분류
	private String rRentType;		// 매물구분 (전세,월세,매매)
	private String rLivingType; 	// 매물종류(거주지형태) 오피스텔,아파트
	private String rRoomCount;		// 방갯수
	private String rFloor;			// 해당층수
	private String rPrice;			// 거래금액
	private String rParking;		// 주차가능여부
	private String rReqGender;		// required gender 원하는 상대성별
	private String contactInfo; 	// 연락가능번호
	
	
	public RMBoard() {
		super();
		// TODO Auto-generated constructor stub
	}


	public RMBoard(int rbId, String bcode, String rbTitle, String rbWriter, String rbContent, String originalFileName,
			String renameFileName, int rbCount, Date rbCreateDate, Date rbModifyDate, String rbStatus, String rLocation,
			String rRentType, String rLivingType, String rRoomCount, String rFloor, String rPrice, String rParking,
			String rReqGender, String contactInfo) {
		super();
		this.rbId = rbId;
		this.bcode = bcode;
		this.rbTitle = rbTitle;
		this.rbWriter = rbWriter;
		this.rbContent = rbContent;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.rbCount = rbCount;
		this.rbCreateDate = rbCreateDate;
		this.rbModifyDate = rbModifyDate;
		this.rbStatus = rbStatus;
		this.rLocation = rLocation;
		this.rRentType = rRentType;
		this.rLivingType = rLivingType;
		this.rRoomCount = rRoomCount;
		this.rFloor = rFloor;
		this.rPrice = rPrice;
		this.rParking = rParking;
		this.rReqGender = rReqGender;
		this.contactInfo = contactInfo;
	}


	public int getRbId() {
		return rbId;
	}


	public void setRbId(int rbId) {
		this.rbId = rbId;
	}


	public String getBcode() {
		return bcode;
	}


	public void setBcode(String bcode) {
		this.bcode = bcode;
	}


	public String getRbTitle() {
		return rbTitle;
	}


	public void setRbTitle(String rbTitle) {
		this.rbTitle = rbTitle;
	}


	public String getRbWriter() {
		return rbWriter;
	}


	public void setRbWriter(String rbWriter) {
		this.rbWriter = rbWriter;
	}


	public String getRbContent() {
		return rbContent;
	}


	public void setRbContent(String rbContent) {
		this.rbContent = rbContent;
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


	public int getRbCount() {
		return rbCount;
	}


	public void setRbCount(int rbCount) {
		this.rbCount = rbCount;
	}


	public Date getRbCreateDate() {
		return rbCreateDate;
	}


	public void setRbCreateDate(Date rbCreateDate) {
		this.rbCreateDate = rbCreateDate;
	}


	public Date getRbModifyDate() {
		return rbModifyDate;
	}


	public void setRbModifyDate(Date rbModifyDate) {
		this.rbModifyDate = rbModifyDate;
	}


	public String getRbStatus() {
		return rbStatus;
	}


	public void setRbStatus(String rbStatus) {
		this.rbStatus = rbStatus;
	}


	public String getrLocation() {
		return rLocation;
	}


	public void setrLocation(String rLocation) {
		this.rLocation = rLocation;
	}


	public String getrRentType() {
		return rRentType;
	}


	public void setrRentType(String rRentType) {
		this.rRentType = rRentType;
	}


	public String getrLivingType() {
		return rLivingType;
	}


	public void setrLivingType(String rLivingType) {
		this.rLivingType = rLivingType;
	}


	public String getrRoomCount() {
		return rRoomCount;
	}


	public void setrRoomCount(String rRoomCount) {
		this.rRoomCount = rRoomCount;
	}


	public String getrFloor() {
		return rFloor;
	}


	public void setrFloor(String rFloor) {
		this.rFloor = rFloor;
	}


	public String getrPrice() {
		return rPrice;
	}


	public void setrPrice(String rPrice) {
		this.rPrice = rPrice;
	}


	public String getrParking() {
		return rParking;
	}


	public void setrParking(String rParking) {
		this.rParking = rParking;
	}


	public String getrReqGender() {
		return rReqGender;
	}


	public void setrReqGender(String rReqGender) {
		this.rReqGender = rReqGender;
	}


	public String getContactInfo() {
		return contactInfo;
	}


	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}


	@Override
	public String toString() {
		return "RMBoard [rbId=" + rbId + ", bcode=" + bcode + ", rbTitle=" + rbTitle + ", rbWriter=" + rbWriter
				+ ", rbContent=" + rbContent + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", rbCount=" + rbCount + ", rbCreateDate=" + rbCreateDate + ", rbModifyDate="
				+ rbModifyDate + ", rbStatus=" + rbStatus + ", rLocation=" + rLocation + ", rRentType=" + rRentType
				+ ", rLivingType=" + rLivingType + ", rRoomCount=" + rRoomCount + ", rFloor=" + rFloor + ", rPrice="
				+ rPrice + ", rParking=" + rParking + ", rReqGender=" + rReqGender + ", contactInfo=" + contactInfo
				+ "]";
	}
	
	
	
	

}
