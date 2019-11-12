package com.project.bangpool.common;

public class SearchCondition {
	
	private String stitle;
	private String scontent;
	private String swriter;
	
	public SearchCondition() {}

	public SearchCondition(String stitle, String scontent, String swriter) {
		super();
		this.stitle = stitle;
		this.scontent = scontent;
		this.swriter = swriter;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public String getSwriter() {
		return swriter;
	}

	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}

	@Override
	public String toString() {
		return "SearchCondition [stitle=" + stitle + ", scontent=" + scontent + ", swriter=" + swriter + "]";
	}
	
	
	
	
	

}
