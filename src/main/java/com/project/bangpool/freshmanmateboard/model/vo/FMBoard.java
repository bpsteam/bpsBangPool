package com.project.bangpool.freshmanmateboard.model.vo;

import java.sql.Date;

public class FMBoard {
	
	private int fbId;				// 글 번호 
	private String bcode;			// 게시판 코드
	private String fbTitle;			// 글 제목
	private String fbWriter;		// 글 작성자
	private String fbContent;		// 게시물 내용
	private String originalFileName;// 원래파일이름
	private String renameFileName;	// 변경파일이름 
	private int  fbCount;			// 글 조회수
	private Date fbCreateDate;		// 글 작성일자
	private Date fbModifyDate;		// 글 수정일자 
	private String fbStatus;		// 글 삭제여부
	
	private String fLocation; 		// 지역분류
	private String fRentType;		// 매물구분
	private String fLivingType; 	// 매물종류(거주지형태)
	private String fRoomCount;		// 방갯수
	private String fFloor;			// 해당층수
	private String fPrice;			// 거래금액
	private String fParking;		// 주차가능여부
	private String fReqGender;		// required gender 원하는 상대성별
	private String contactInfo; 	// 연락가능번호
	private String college;
//	private Attachment att; 
	
	
//	private PageInfo pi;
	

	public FMBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	
//	
//public FMBoard(PageInfo pi) {
//		super();
//		this.pi = pi;
//	}



public FMBoard(int fbId, String bcode, String fbTitle, String fbWriter, String fbContent, String originalFileName,
		String renameFileName, int fbCount, Date fbCreateDate, Date fbModifyDate, String fbStatus, String fLocation,
		String fRentType, String fLivingType, String fRoomCount, String fFloor, String fPrice, String fParking,
		String fReqGender, String contactInfo, String college) {
	super();
	this.fbId = fbId;
	this.bcode = bcode;
	this.fbTitle = fbTitle;
	this.fbWriter = fbWriter;
	this.fbContent = fbContent;
	this.originalFileName = originalFileName;
	this.renameFileName = renameFileName;
	this.fbCount = fbCount;
	this.fbCreateDate = fbCreateDate;
	this.fbModifyDate = fbModifyDate;
	this.fbStatus = fbStatus;
	this.fLocation = fLocation;
	this.fRentType = fRentType;
	this.fLivingType = fLivingType;
	this.fRoomCount = fRoomCount;
	this.fFloor = fFloor;
	this.fPrice = fPrice;
	this.fParking = fParking;
	this.fReqGender = fReqGender;
	this.contactInfo = contactInfo;
	this.college = college;
}




//	public Attachment getAtt() {
//		return att;
//	}
//
//	public void setAtt(Attachment att) {
//		this.att = att;
//	}

//	public PageInfo getPi() {
//	return pi;
//}
//
//
//public void setPi(PageInfo pi) {
//	this.pi = pi;
//}


	public String getCollege() {
		return college;
	}
	
	public void setCollege(String college) {
		this.college = college;
	}

	public int getFbId() {
		return fbId;
	}

	public void setFbId(int fbId) {
		this.fbId = fbId;
	}

	public String getBcode() {
		return bcode;
	}

	public void setBcode(String bcode) {
		this.bcode = bcode;
	}

	public String getFbTitle() {
		return fbTitle;
	}

	public void setFbTitle(String fbTitle) {
		this.fbTitle = fbTitle;
	}

	public String getFbWriter() {
		return fbWriter;
	}

	public void setFbWriter(String fbWriter) {
		this.fbWriter = fbWriter;
	}

	public String getFbContent() {
		return fbContent;
	}

	public void setFbContent(String fbContent) {
		this.fbContent = fbContent;
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

	public int getFbCount() {
		return fbCount;
	}

	public void setFbCount(int fbCount) {
		this.fbCount = fbCount;
	}

	public Date getFbCreateDate() {
		return fbCreateDate;
	}

	public void setFbCreateDate(Date fbCreateDate) {
		this.fbCreateDate = fbCreateDate;
	}

	public Date getFbModifyDate() {
		return fbModifyDate;
	}

	public void setFbModifyDate(Date fbModifyDate) {
		this.fbModifyDate = fbModifyDate;
	}

	public String getFbStatus() {
		return fbStatus;
	}

	public void setFbStatus(String fbStatus) {
		this.fbStatus = fbStatus;
	}

	public String getfLocation() {
		return fLocation;
	}

	public void setfLocation(String fLocation) {
		this.fLocation = fLocation;
	}

	public String getfRentType() {
		return fRentType;
	}

	public void setfRentType(String fRentType) {
		this.fRentType = fRentType;
	}

	public String getfLivingType() {
		return fLivingType;
	}

	public void setfLivingType(String fLivingType) {
		this.fLivingType = fLivingType;
	}

	public String getfRoomCount() {
		return fRoomCount;
	}

	public void setfRoomCount(String fRoomCount) {
		this.fRoomCount = fRoomCount;
	}

	public String getfFloor() {
		return fFloor;
	}

	public void setfFloor(String fFloor) {
		this.fFloor = fFloor;
	}

	public String getfPrice() {
		return fPrice;
	}

	public void setfPrice(String fPrice) {
		this.fPrice = fPrice;
	}

	public String getfParking() {
		return fParking;
	}

	public void setfParking(String fParking) {
		this.fParking = fParking;
	}

	public String getfReqGender() {
		return fReqGender;
	}

	public void setfReqGender(String fReqGender) {
		this.fReqGender = fReqGender;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}




	@Override
	public String toString() {
		return "FMBoard [fbId=" + fbId + ", bcode=" + bcode + ", fbTitle=" + fbTitle + ", fbWriter=" + fbWriter
				+ ", fbContent=" + fbContent + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", fbCount=" + fbCount + ", fbCreateDate=" + fbCreateDate + ", fbModifyDate="
				+ fbModifyDate + ", fbStatus=" + fbStatus + ", fLocation=" + fLocation + ", fRentType=" + fRentType
				+ ", fLivingType=" + fLivingType + ", fRoomCount=" + fRoomCount + ", fFloor=" + fFloor + ", fPrice="
				+ fPrice + ", fParking=" + fParking + ", fReqGender=" + fReqGender + ", contactInfo=" + contactInfo
				+ ", college=" + college + "]";
	}

	
	
	
}
