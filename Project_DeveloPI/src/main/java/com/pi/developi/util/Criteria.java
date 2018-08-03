package com.pi.developi.util;

public class Criteria {
	
	private String searchType;
	private String keyword;
	private int boardNo;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "Criteria [searchType=" + searchType + ", keyword=" + keyword + ", boardNo=" + boardNo + "]";
	}
	
}
