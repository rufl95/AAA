package com.pi.developi.noticeBoard.dao;

import java.util.List;

import com.pi.developi.noticeBoard.domain.NoticeBoardDTO;
import com.pi.developi.noticeBoard.domain.NoticeReplyDTO;
import com.pi.developi.util.Criteria;

public interface NoticeBoardDao {

	/** 공지게시판 전체목록 불러오기 */
	public List<NoticeBoardDTO> listAll(int boardNo);	
	
	/** 공지게시판 게시물 불러오기 */
	public NoticeBoardDTO detail(int articleNo);	
	
	/** 공지게시판 게시물 수정하기 */
	public void modify(NoticeBoardDTO notice);
	
	/** 공지게시판 게시물 작성하기 */
	public void write(NoticeBoardDTO notice);
	
	/** 공지게시판 게시물 삭제하기 */
	public void delete(int articleNo);
	
	/** 공지게시판 게시물 검색하기 */
	public List<NoticeBoardDTO> search(Criteria cri);

	/** 공지게시판 조회수 증가 */
	public void hitUp(int articleNo);
	
	//댓글
	
	/** 공지게시판 댓글 작성하기 */
	public void replyRegist(NoticeReplyDTO reply);
	
	/** 공지게시판 댓글 목록 불러오기 */
	public List<NoticeReplyDTO> replyListAll(int articleNo);	
	
	/** 답글 답답글 구현시 기존의 답글 step 증가  */
	public void stepUp(NoticeBoardDTO notice);
	
	/** 공지게시판 답글 작성하기 */
	public void replyArticleWrite(NoticeBoardDTO notice);
	
}
