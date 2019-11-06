package com.project.bangpool.housemateboard.model.vo;

import java.sql.Date;

public class HMBoard {
	
	private int hbId;				//게시글 번호
	private String bcode;			//게시판코드(HMBOARD)
	private String hbTitle;			//제목
	private String hbWriter;		//작성자
	private String hbContent;		//게시물내용
	private String originalFileName;//기존파일이름
	private String renameFileName;	//변경파일이름
	private int hbCount;			//조회수
	private Date hbCreateDate;		//작성일자
	private Date hbModifyDate;		//수정일자
	private String hbStatus;		//게시글상태
	
	private String hLocation; 		//지역분류
	private String hRentType;		//매물구분
	private String hLivingType; 	//매물종류(거주지형태)
	private String hRoom;			//방갯수
	private String hFloor;			//해당층수
	private String hPrice;			// 거래금액
	private char hParking;			// 주차가능여부
	private char hreqgender;		// 원하는 상대 성별
	
	
	public HMBoard() {}


	public HMBoard(int hbId, String bcode, String hbTitle, String hbWriter, String hbContent, String originalFileName,
			String renameFileName, int hbCount, Date hbCreateDate, Date hbModifyDate, String hbStatus, String hLocation,
			String hRentType, String hLivingType, String hRoom, String hFloor, String hPrice, char hParking,
			char hreqgender) {
		super();
		this.hbId = hbId;
		this.bcode = bcode;
		this.hbTitle = hbTitle;
		this.hbWriter = hbWriter;
		this.hbContent = hbContent;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.hbCount = hbCount;
		this.hbCreateDate = hbCreateDate;
		this.hbModifyDate = hbModifyDate;
		this.hbStatus = hbStatus;
		this.hLocation = hLocation;
		this.hRentType = hRentType;
		this.hLivingType = hLivingType;
		this.hRoom = hRoom;
		this.hFloor = hFloor;
		this.hPrice = hPrice;
		this.hParking = hParking;
		this.hreqgender = hreqgender;
	}


	public int getHbId() {
		return hbId;
	}


	public void setHbId(int hbId) {
		this.hbId = hbId;
	}


	public String getBcode() {
		return bcode;
	}


	public void setBcode(String bcode) {
		this.bcode = bcode;
	}


	public String getHbTitle() {
		return hbTitle;
	}


	public void setHbTitle(String hbTitle) {
		this.hbTitle = hbTitle;
	}


	public String getHbWriter() {
		return hbWriter;
	}


	public void setHbWriter(String hbWriter) {
		this.hbWriter = hbWriter;
	}


	public String getHbContent() {
		return hbContent;
	}


	public void setHbContent(String hbContent) {
		this.hbContent = hbContent;
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


	public int getHbCount() {
		return hbCount;
	}


	public void setHbCount(int hbCount) {
		this.hbCount = hbCount;
	}


	public Date getHbCreateDate() {
		return hbCreateDate;
	}


	public void setHbCreateDate(Date hbCreateDate) {
		this.hbCreateDate = hbCreateDate;
	}


	public Date getHbModifyDate() {
		return hbModifyDate;
	}


	public void setHbModifyDate(Date hbModifyDate) {
		this.hbModifyDate = hbModifyDate;
	}


	public String getHbStatus() {
		return hbStatus;
	}


	public void setHbStatus(String hbStatus) {
		this.hbStatus = hbStatus;
	}


	public String gethLocation() {
		return hLocation;
	}


	public void sethLocation(String hLocation) {
		this.hLocation = hLocation;
	}


	public String gethRentType() {
		return hRentType;
	}


	public void sethRentType(String hRentType) {
		this.hRentType = hRentType;
	}


	public String gethLivingType() {
		return hLivingType;
	}


	public void sethLivingType(String hLivingType) {
		this.hLivingType = hLivingType;
	}


	public String gethRoom() {
		return hRoom;
	}


	public void sethRoom(String hRoom) {
		this.hRoom = hRoom;
	}


	public String gethFloor() {
		return hFloor;
	}


	public void sethFloor(String hFloor) {
		this.hFloor = hFloor;
	}


	public String gethPrice() {
		return hPrice;
	}


	public void sethPrice(String hPrice) {
		this.hPrice = hPrice;
	}


	public char gethParking() {
		return hParking;
	}


	public void sethParking(char hParking) {
		this.hParking = hParking;
	}


	public char getHreqgender() {
		return hreqgender;
	}


	public void setHreqgender(char hreqgender) {
		this.hreqgender = hreqgender;
	}


	@Override
	public String toString() {
		return "HMBoard [hbId=" + hbId + ", bcode=" + bcode + ", hbTitle=" + hbTitle + ", hbWriter=" + hbWriter
				+ ", hbContent=" + hbContent + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", hbCount=" + hbCount + ", hbCreateDate=" + hbCreateDate + ", hbModifyDate="
				+ hbModifyDate + ", hbStatus=" + hbStatus + ", hLocation=" + hLocation + ", hRentType=" + hRentType
				+ ", hLivingType=" + hLivingType + ", hRoom=" + hRoom + ", hFloor=" + hFloor + ", hPrice=" + hPrice
				+ ", hParking=" + hParking + ", hreqgender=" + hreqgender + "]";
	}


	

}
