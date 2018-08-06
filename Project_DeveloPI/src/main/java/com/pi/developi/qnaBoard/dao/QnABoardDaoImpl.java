package com.pi.developi.qnaBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pi.developi.qnaBoard.domain.QnAArticleDTO;
import com.pi.developi.qnaBoard.domain.QnACategoryDTO;
import com.pi.developi.qnaBoard.domain.QnAReplyDTO;
import com.pi.developi.qnaBoard.domain.QnAUsersDTO;

@Repository
public class QnABoardDaoImpl implements QnABoardDao {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.pi.developi.mappers.qnaBoardMapper";

	@Override
	public List<QnAArticleDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".listAll");
	}

	@Override
	public void write(QnAArticleDTO dtos) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".write", dtos);
	}

	@Override
	public void delete(int article_no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", article_no);
	}

	@Override
	public QnAArticleDTO getArticle(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".articleDetail", article_no);
	}

	@Override
	public void update(QnAArticleDTO dtos) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".update", dtos);
	}

	@Override
	public void hit(int article_no) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".hit", article_no);
	}

	@Override
	public List<QnAArticleDTO> serch(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".serch", keyword);
	}

	@Override
	public QnAUsersDTO getUser(int user_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getUser", user_no);
	}

	@Override
	public QnACategoryDTO getCategory(int category_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getCategory", category_no);
	}

	@Override
	public List<QnAArticleDTO> listSearch(String searchOption, String keyword) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectList(namespace + ".listSearch", map);
	}

	@Override
	public void reply(QnAReplyDTO dtos) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".reply", dtos);
	}

}
