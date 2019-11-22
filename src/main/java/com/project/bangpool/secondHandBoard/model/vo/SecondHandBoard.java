package com.project.bangpool.secondHandBoard.model.vo;

import java.sql.Date;

public class SecondHandBoard {
	
	private int shbId;					// 게시글 번호
	private int bCode;					// 게시판 코드
	private String shbTitle;			// 제목
	private String shbWriter;			// 작성자
	private String shbContent;			// 내용
	private String shbCategory;			// 카테고리
	private int shbPrice;				// 가격
	private String shbLocation;			// 지역분류
	private int shbCount;				// 조회수
	private String shbOrgFileName;		// 이미지 파일 주소
	private String shbRenameFileName;		// 이미지 파일 주소
	private Date shbCreateDate;			// 게시글 올린 날짜
	private Date shbModifyDate;			// 게시글 수정 날짜
	private String shbStatus;			// 게시글 상태값
	
	public SecondHandBoard() {}

	public SecondHandBoard(int shbId, int bCode, String shbTitle, String shbWriter, String shbContent,
			String shbCategory, int shbPrice, String shbLocation, int shbCount, String shbOrgFileName,
			String shbRenameFileName, Date shbCreateDate, Date shbModifyDate, String shbStatus) {
		super();
		this.shbId = shbId;
		this.bCode = bCode;
		this.shbTitle = shbTitle;
		this.shbWriter = shbWriter;
		this.shbContent = shbContent;
		this.shbCategory = shbCategory;
		this.shbPrice = shbPrice;
		this.shbLocation = shbLocation;
		this.shbCount = shbCount;
		this.shbOrgFileName = shbOrgFileName;
		this.shbRenameFileName = shbRenameFileName;
		this.shbCreateDate = shbCreateDate;
		this.shbModifyDate = shbModifyDate;
		this.shbStatus = shbStatus;
	}

	public int getShbId() {
		return shbId;
	}

	public void setShbId(int shbId) {
		this.shbId = shbId;
	}

	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getShbTitle() {
		return shbTitle;
	}

	public void setShbTitle(String shbTitle) {
		this.shbTitle = shbTitle;
	}

	public String getShbWriter() {
		return shbWriter;
	}

	public void setShbWriter(String shbWriter) {
		this.shbWriter = shbWriter;
	}

	public String getShbContent() {
		return shbContent;
	}

	public void setShbContent(String shbContent) {
		this.shbContent = shbContent;
	}

	public String getShbCategory() {
		return shbCategory;
	}

	public void setShbCategory(String shbCategory) {
		this.shbCategory = shbCategory;
	}

	public int getShbPrice() {
		return shbPrice;
	}

	public void setShbPrice(int shbPrice) {
		this.shbPrice = shbPrice;
	}

	public String getShbLocation() {
		return shbLocation;
	}

	public void setShbLocation(String shbLocation) {
		this.shbLocation = shbLocation;
	}

	public int getShbCount() {
		return shbCount;
	}

	public void setShbCount(int shbCount) {
		this.shbCount = shbCount;
	}

	public String getShbOrgFileName() {
		return shbOrgFileName;
	}

	public void setShbOrgFileName(String shbOrgFileName) {
		this.shbOrgFileName = shbOrgFileName;
	}

	public String getShbRenameFileName() {
		return shbRenameFileName;
	}

	public void setShbRenameFileName(String shbRenameFileName) {
		this.shbRenameFileName = shbRenameFileName;
	}

	public Date getShbCreateDate() {
		return shbCreateDate;
	}

	public void setShbCreateDate(Date shbCreateDate) {
		this.shbCreateDate = shbCreateDate;
	}

	public Date getShbModifyDate() {
		return shbModifyDate;
	}

	public void setShbModifyDate(Date shbModifyDate) {
		this.shbModifyDate = shbModifyDate;
	}

	public String getShbStatus() {
		return shbStatus;
	}

	public void setShbStatus(String shbStatus) {
		this.shbStatus = shbStatus;
	}

	@Override
	public String toString() {
		return "SecondHandBoard [shbId=" + shbId + ", bCode=" + bCode + ", shbTitle=" + shbTitle + ", shbWriter="
				+ shbWriter + ", shbContent=" + shbContent + ", shbCategory=" + shbCategory + ", shbPrice=" + shbPrice
				+ ", shbLocation=" + shbLocation + ", shbCount=" + shbCount + ", shbOrgFileName=" + shbOrgFileName
				+ ", shbRenameFileName=" + shbRenameFileName + ", shbCreateDate=" + shbCreateDate + ", shbModifyDate="
				+ shbModifyDate + ", shbStatus=" + shbStatus + "]";
	}
	
}
