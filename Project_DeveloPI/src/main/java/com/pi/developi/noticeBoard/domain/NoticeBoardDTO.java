package com.pi.developi.noticeBoard.domain;

import java.util.Date;

public class NoticeBoardDTO {
	private int articleNo;
	private String title;
	private String content;
	private int userNo;
	private int categoryNo;
	private Date a_date;
	private int boardNo;
	private int groupNo;
	private int step;
	private int indent;
	private int hit;
	private int isdeleted;


	public NoticeBoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getIsdeleted() {
		return isdeleted;
	}

	public void setIsdeleted(int isdeleted) {
		this.isdeleted = isdeleted;
	}

	@Override
	public String toString() {
		return "NoticeBoardDTO [articleNo=" + articleNo + ", title=" + title + ", content=" + content + ", userNo="
				+ userNo + ", categoryNo=" + categoryNo + ", a_date=" + a_date + ", boardNo=" + boardNo + ", groupNo="
				+ groupNo + ", step=" + step + ", indent=" + indent + ", hit=" + hit + ", isdeleted=" + isdeleted + "]";
	}


}
