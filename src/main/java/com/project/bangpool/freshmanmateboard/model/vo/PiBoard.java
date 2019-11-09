package com.project.bangpool.freshmanmateboard.model.vo;

import java.sql.Date;

public class PiBoard extends FMBoard {

	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;

	private int boardLimit;

	public PiBoard() {
	}

	public PiBoard(int fbId, String bcode, String fbTitle, String fbWriter, String fbContent, String originalFileName,
			String renameFileName, int fbCount, Date fbCreateDate, Date fbModifyDate, String fbStatus, String fLocation,
			String fRentType, String fLivingType, String fRoomCount, String fFloor, String fPrice, String fParking,
			String fReqGender, String contactInfo, String college, int currentPage, int listCount, int pageLimit,
			int maxPage, int startPage, int endPage, int boardLimit) {
		super(fbId, bcode, fbTitle, fbWriter, fbContent, originalFileName, renameFileName, fbCount, fbCreateDate,
				fbModifyDate, fbStatus, fLocation, fRentType, fLivingType, fRoomCount, fFloor, fPrice, fParking,
				fReqGender, contactInfo, college);
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	@Override
	public String toString() {
		return super.toString() + "PiBoard [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", boardLimit="
				+ boardLimit + "]";
	}
	
	

}
