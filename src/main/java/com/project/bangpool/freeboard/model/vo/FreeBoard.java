package com.project.bangpool.freeboard.model.vo;

import java.sql.Date;

public class FreeBoard {
	
	private int frbId;				//게시글 번호
	private String bcode;			//게시판코드(HMBOARD)
	private String frbTitle;			//제목
	private String frbContent;		//게시물내용
	private String frbWriter;		//작성자
	private String originalFileName;//기존파일이름
	private String renameFileName;	//변경파일이름
	private int frbCount;			//조회수
	private Date frbCreateDate;		//작성일자
	private Date frbModifyDate;		//수정일자
	private String frbStatus;		//게시글상태
	
	public FreeBoard() {
		super();
	}

	public FreeBoard(int frbId, String bcode, String frbTitle, String frbContent, String frbWriter,
			String originalFileName, String renameFileName, int frbCount, Date frbCreateDate, Date frbModifyDate,
			String frbStatus) {
		super();
		this.frbId = frbId;
		this.bcode = bcode;
		this.frbTitle = frbTitle;
		this.frbContent = frbContent;
		this.frbWriter = frbWriter;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.frbCount = frbCount;
		this.frbCreateDate = frbCreateDate;
		this.frbModifyDate = frbModifyDate;
		this.frbStatus = frbStatus;
	}

	public int getFrbId() {
		return frbId;
	}

	public void setFrbId(int frbId) {
		this.frbId = frbId;
	}

	public String getBcode() {
		return bcode;
	}

	public void setBcode(String bcode) {
		this.bcode = bcode;
	}

	public String getFrbTitle() {
		return frbTitle;
	}

	public void setFrbTitle(String frbTitle) {
		this.frbTitle = frbTitle;
	}

	public String getFrbContent() {
		return frbContent;
	}

	public void setFrbContent(String frbContent) {
		this.frbContent = frbContent;
	}

	public String getFrbWriter() {
		return frbWriter;
	}

	public void setFrbWriter(String frbWriter) {
		this.frbWriter = frbWriter;
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

	public int getFrbCount() {
		return frbCount;
	}

	public void setFrbCount(int frbCount) {
		this.frbCount = frbCount;
	}

	public Date getFrbCreateDate() {
		return frbCreateDate;
	}

	public void setFrbCreateDate(Date frbCreateDate) {
		this.frbCreateDate = frbCreateDate;
	}

	public Date getFrbModifyDate() {
		return frbModifyDate;
	}

	public void setFrbModifyDate(Date frbModifyDate) {
		this.frbModifyDate = frbModifyDate;
	}

	public String getFrbStatus() {
		return frbStatus;
	}

	public void setFrbStatus(String frbStatus) {
		this.frbStatus = frbStatus;
	}

	@Override
	public String toString() {
		return "FreeBoard [frbId=" + frbId + ", bcode=" + bcode + ", frbTitle=" + frbTitle + ", frbContent="
				+ frbContent + ", frbWriter=" + frbWriter + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + ", frbCount=" + frbCount + ", frbCreateDate=" + frbCreateDate
				+ ", frbModifyDate=" + frbModifyDate + ", frbStatus=" + frbStatus + "]";
	}
	
}
