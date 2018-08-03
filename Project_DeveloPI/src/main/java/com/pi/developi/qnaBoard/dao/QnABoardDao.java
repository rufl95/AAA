package com.pi.developi.qnaBoard.dao;

import java.util.List;

import com.pi.developi.qnaBoard.domain.QnAArticleDTO;
import com.pi.developi.qnaBoard.domain.QnACategoryDTO;
import com.pi.developi.qnaBoard.domain.QnAUsersDTO;

public interface QnABoardDao {

	public List<QnAArticleDTO> list();

	public void write(QnAArticleDTO dtos);

	public void delete(int article_no);

	public QnAArticleDTO getArticle(int article_no);

	public void update(QnAArticleDTO dtos);

	public void hit(int article_no);

	public List<QnAArticleDTO> serch(String keyword);

	public QnAUsersDTO getUser(int user_no);

	public QnACategoryDTO getCategory(int categoty_no);

	public List<QnAArticleDTO> listSearch(String searchOption, String keyword);

}
