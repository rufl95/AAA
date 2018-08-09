package com.pi.developi.freeBoard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeReplyDTO;
import com.pi.developi.freeBoard.domain.FreeUserDTO;

public interface FreeBoardService {
	public List<FreeArticleDTO> listAll() throws Exception;

	public List<String> userId() throws Exception;

	public FreeArticleDTO detail(int no) throws Exception;

	public void upHit(int no,HttpSession session) throws Exception;

	public void write(FreeArticleDTO dto);

	public void update(FreeArticleDTO dto);

	public void delete(int no);

	public List<FreeArticleDTO> search(String type, String keyword);

	public String detailId(int no);

	public List<String> listCategory(int board_no) throws Exception;

	public List<FreeReplyDTO> replyList(int article_no);

	public void replyWrite(FreeReplyDTO dto);

	public List<Integer> replyNum();

	public void replyArticle(FreeArticleDTO dto);
}
