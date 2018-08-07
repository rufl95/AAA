package com.pi.developi.qnaBoard.domain;

import java.util.Date;

public class QnAReplyDTO {
	private int reply_no;
	private String content;
	private int user_no;
	private Date r_date;
	private int article_no;
	private String name;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getname() {
		return name;
	}

	public void setname(String user_name) {
		this.name = user_name;
	}

}
