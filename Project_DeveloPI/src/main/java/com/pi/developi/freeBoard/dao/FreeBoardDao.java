package com.pi.developi.freeBoard.dao;

import java.util.List;
import java.util.Map;

import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeReplyDTO;
import com.pi.developi.freeBoard.domain.FreeUserDTO;

public interface FreeBoardDao {
	/*게시판 리스트 출력*/
	public List<FreeArticleDTO> listAll(Map<String, Object> info) throws Exception;
	/*유저 아이디 불러오기*/
	public List<String> userId() throws Exception;
	/*게시글 상세뷰*/
	public FreeArticleDTO detail(int no)throws Exception;
	/*조회수  증가*/
	public void upHit(int no)throws Exception;
	/*게시글 작성*/
	public void write(FreeArticleDTO dto);
	/**/
	public void update(FreeArticleDTO dto);

	public void delete(int no);

	public List<FreeArticleDTO> search(String type, String keyword,Map<String, Object> info);

	public String detailId(int no);

	public List<String> listCategory(int board_no) throws Exception;

	public List<FreeReplyDTO> replyList(int article_no);

	public void replyWrite(FreeReplyDTO dto);

	public List<Integer> replyNum(Map<String, Object> info);

	public void replyArticle(FreeArticleDTO dto);

	public void indentUp(FreeArticleDTO dto);
	
	public List<Integer> searchReplyNum(String searchType, String keyword, Map<String, Object> info);
	
	public int countArticle(String searchType, String keyword);

}
