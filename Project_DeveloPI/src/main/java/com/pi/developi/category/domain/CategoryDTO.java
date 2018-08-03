package com.pi.developi.category.domain;

public class CategoryDTO {
	private int categoryNo;
	private String name;
	private int boardNo;
	
	
	public CategoryDTO() {
	}
	
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "CategoryDTO [categoryNo=" + categoryNo + ", name=" + name + ", boardNo=" + boardNo + "]";
	}
	
	
}
