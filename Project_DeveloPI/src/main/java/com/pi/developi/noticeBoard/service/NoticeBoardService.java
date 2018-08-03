package com.pi.developi.noticeBoard.service;

import java.util.List;

import com.pi.developi.noticeBoard.domain.NoticeBoardDTO;
import com.pi.developi.util.Criteria;

public interface NoticeBoardService {
	
	/** 공지게시판 전체목록 불러오기 */
	public List<NoticeBoardDTO> listAll(int boardNo);	
	
	/** 공지게시판 게시물 불러오기 */
	public NoticeBoardDTO detail(int articleNo);	
	
	/** 공지게시판 게시물 수정하기 */
	public void modify(NoticeBoardDTO notice);
	
	/** 공지게시판 게시물 작성하기 */
	public void write(NoticeBoardDTO notice);
	
	public void delete(int articleNo);
	
	public List<NoticeBoardDTO> search(Criteria cri);

	/** 조회수 증가 */
	public void hitUp(int articleNo);
}
