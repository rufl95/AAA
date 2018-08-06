package com.pi.developi.qnaBoard.domain;

public class QnACategoryDTO {

	private int category_no;
	private String name;
	private int board_no;

	public int getcategory_no() {
		return category_no;
	}

	public void setcategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

}
