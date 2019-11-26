package com.project.bangpool.member.model.vo;

public class Profile {
	
	private String mNo;		// member No.
	private String originalFileName;// 원래파일이름
	private String renameFileName;	// 변경파일이름 
	
	public Profile() {
		super();
	}
	
	public Profile(String mNo, String originalFileName, String renameFileName) {
		super();
		this.mNo = mNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
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
		return "Profile [mNo=" + mNo + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName
				+ "]";
	}
	

}
