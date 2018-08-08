package com.pi.developi.noticeBoard.domain;

import java.util.Date;

public class NoticeReplyDTO {
	private int replyNo;
	private String content;
	private int userNo;
	private Date r_date;
	private int articleNo;

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	@Override
	public String toString() {
		return "NoticeReplyDTO [replyNo=" + replyNo + ", content=" + content + ", userNo=" + userNo + ", r_date="
				+ r_date + ", articleNo=" + articleNo + "]";
	}
}
