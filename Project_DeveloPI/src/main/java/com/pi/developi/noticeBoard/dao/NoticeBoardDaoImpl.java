package com.pi.developi.noticeBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.pi.developi.noticeBoard.domain.Criteria;
import com.pi.developi.noticeBoard.domain.NoticeBoardDTO;
import com.pi.developi.noticeBoard.domain.NoticeReplyDTO;


@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.pi.developi.mappers.noticeBoardMapper";

	Logger logger = Logger.getLogger(NoticeBoardDaoImpl.class);

	
	/** 공지게시판 전체목록 불러오기 */
	@Override
	public List<NoticeBoardDTO> listAll(Criteria cri, int boardNo) {
		// TODO Auto-generated method stub
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("boardNo", boardNo);
//		paramMap.put("userNo", userNo);	
		logger.info(cri.getSearchType());
		if(cri.getSearchType()!=null) {
		if(cri.getSearchType().equals("title")) {
			logger.info(cri.toString());
			
			return sqlSession.selectList(namespace + ".listAll_T", cri);}
		else if(cri.getSearchType().equals("content"))
			return sqlSession.selectList(namespace + ".listAll_C", cri);
		else if(cri.getSearchType().equals("userNo") && !cri.getKeyword().equals("0") )
			return sqlSession.selectList(namespace + ".listAll_U", cri);
		else
			return sqlSession.selectList(namespace + ".listAll", cri);
		}else
			return sqlSession.selectList(namespace + ".listAll", cri);
	}

	/** 공지게시판 게시물 불러오기 */
	@Override
	public NoticeBoardDTO detail(int articleNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".detail", articleNo);
	}
	
	/** 공지게시판 게시물 수정하기 */
	@Override
	public void modify(NoticeBoardDTO notice) {
		sqlSession.update(namespace + ".modify", notice);
	}
	
	/** 공지게시판 게시물 작성하기 */
	@Override
	public void write(NoticeBoardDTO notice) {
		sqlSession.selectOne(namespace + ".write", notice);
	}
	
	/** 공지게시판 게시물 작성하기 */
	@Override
	public void delete(int articleNo) {
		sqlSession.update(namespace + ".delete", articleNo);
	}
	//search
	
	/** 공지게시판 게시물 검색하기 */
	@Override
	public List<NoticeBoardDTO> search(Criteria cri) {
		return sqlSession.selectList(namespace + ".search", cri);
	}
	
	/** 조회수 증가 */
	@Override
	public void hitUp(int articleNo) {
		sqlSession.update(namespace + ".hitUp", articleNo);
	}
	
	/** 공지게시판 댓글 작성하기 */
	@Override
	public void replyRegist(NoticeReplyDTO reply) {
		 sqlSession.selectList(namespace + ".replyRegist", reply);
	};
	
	/** 공지게시판 댓글 목록 불러오기 */
	@Override
	public List<NoticeReplyDTO> replyListAll(int articleNo){
		return sqlSession.selectList(namespace + ".replyListAll", articleNo);
	}
	
	/** 답글 답답글 구현시 기존의 답글 step 증가  */
	@Override
	public void stepUp(NoticeBoardDTO notice){
		sqlSession.update(namespace + ".stepUp", notice);
	}
	
	/** 공지게시판 답글 작성하기 */
	@Override
	public void replyArticleWrite(NoticeBoardDTO notice) {
		sqlSession.insert(namespace + ".replyArticleWrite", notice);
	}
	//replyArticleWrite

	@Override
	public int listCountCriteria(Criteria cri) {
		return sqlSession.selectOne(namespace + ".countPaging", cri);
	}
	@Override
	public int replyCount(int article_no) {
		return sqlSession.selectOne(namespace+".replyCount", article_no);
	}
}
