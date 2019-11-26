package com.project.bangpool.attachment.model.vo;

public class Attachment {
	
	private int fNo;
	private String bCode;
	private int refbId;
	private String originalFileName;
	private String renameFileName;
	
	public Attachment() {}

	public Attachment(int fNo, String bCode, int refbId, String originalFileName, String renameFileName) {
		super();
		this.fNo = fNo;
		this.bCode = bCode;
		this.refbId = refbId;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public int getRefbId() {
		return refbId;
	}

	public void setRefbId(int refbId) {
		this.refbId = refbId;
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
		return "Attachment [fNo=" + fNo + ", bCode=" + bCode + ", refbId=" + refbId + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + "]";
	}
}
