package com.pi.developi.qnaBoard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pi.developi.qnaBoard.dao.QnABoardDao;
import com.pi.developi.qnaBoard.domain.QnAArticleDTO;
import com.pi.developi.qnaBoard.domain.QnACategoryDTO;
import com.pi.developi.qnaBoard.domain.QnAReplyDTO;
import com.pi.developi.qnaBoard.domain.QnAUsersDTO;

@Service
public class QnABoardServiceImpl implements QnABoardService {

	@Inject
	private QnABoardDao dao;

	@Override
	public List<QnAArticleDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(QnAArticleDTO dtos) {
		// TODO Auto-generated method stub
		dao.write(dtos);
	}

	@Override
	public void delete(int article_no) {
		// TODO Auto-generated method stub
		dao.delete(article_no);
	}

	@Override
	public QnAArticleDTO getArticle(int article_no) {
		// TODO Auto-generated method stub
		return dao.getArticle(article_no);
	}
	
	@Override
	public List<QnAReplyDTO> getReplyArticle(int article_no) {
		// TODO Auto-generated method stub
		return dao.getReplyArticle(article_no);
	}

	@Override
	public void update(QnAArticleDTO dtos) {
		// TODO Auto-generated method stub
		dao.update(dtos);
	}

	@Override
	public void hit(int article_no) {
		// TODO Auto-generated method stub
		dao.hit(article_no);
	}

	@Override
	public List<QnAArticleDTO> serch(String keyword) {
		// TODO Auto-generated method stub
		return dao.serch(keyword);
	}

	@Override
	public QnAUsersDTO getUser(int user_no) {
		// TODO Auto-generated method stub
		return dao.getUser(user_no);
	}

	@Override
	public QnACategoryDTO getCategory(int categoty_no) {
		// TODO Auto-generated method stub
		return dao.getCategory(categoty_no);
	}

	@Override
	public List<QnAArticleDTO> listSearch(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return dao.listSearch(searchOption, keyword);
	}

	@Override
	public void reply(QnAReplyDTO dtos) {
		// TODO Auto-generated method stub
		dao.reply(dtos);
	}



}
