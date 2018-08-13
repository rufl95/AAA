package com.pi.developi.freeBoard.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.freemarker.autotag.FreemarkerModelBody;
import org.springframework.stereotype.Service;

import com.pi.developi.freeBoard.dao.FreeBoardDao;
import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeReplyDTO;
import com.pi.developi.freeBoard.domain.FreeUserDTO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Inject
	FreeBoardDao FreeBoardDao;

	@Override
	public List<FreeArticleDTO> listAll(Map<String, Object> info) throws Exception {
		return FreeBoardDao.listAll(info);
	}

	@Override
	public List<String> userId() throws Exception {
		// TODO Auto-generated method stub
		return FreeBoardDao.userId();
	}

	@Override
	public FreeArticleDTO detail(int no) throws Exception {
		FreeBoardDao.detail(no);
		return FreeBoardDao.detail(no);
	}

	@Override
	public void upHit(int no, HttpSession session) throws Exception {
		long update_time=0;
		if(session.getAttribute("update_tiem_"+no)!=null) {
			update_time=(long)session.getAttribute("update_time_"+no);
		}
		
		long current_time=System.currentTimeMillis();
		if(current_time-update_time>5*1000) {
			FreeBoardDao.upHit(no);
			session.setAttribute("update_time_"+no,current_time);
		}
	}

	@Override
	public void write(FreeArticleDTO dto) {
		String title=dto.getTitle();
		String content=dto.getContent();
		
		title=title.replace(" ", "&nbsp;&nbsp;");
		content=content.replace(" ", "&nbsp;&nbsp;");
		content=content.replace("\n", "<br>");
		
		dto.setTitle(title);
		dto.setContent(content);
		
		FreeBoardDao.write(dto);
		
	}

	@Override
	public void update(FreeArticleDTO dto) {
		String title=dto.getTitle();
		String content=dto.getContent();
		
		title=title.replace(" ", "&nbsp;&nbsp;");
		content=content.replace(" ", "&nbsp;&nbsp;");
		content=content.replace("\n", "<br>");
		
		dto.setTitle(title);
		dto.setContent(content);
		
		FreeBoardDao.update(dto);
		
	}

	@Override
	public void delete(int no) {
		FreeBoardDao.delete(no);
		
	}

	@Override
	public String detailId(int no) {
		return FreeBoardDao.detailId(no);
	}

	@Override
	public List<String> listCategory(int board_no) throws Exception {
		return FreeBoardDao.listCategory(board_no);
	}

	@Override
	public List<FreeReplyDTO> replyList(int article_no) {
		
		return FreeBoardDao.replyList(article_no);
	}

	@Override
	public void replyWrite(FreeReplyDTO dto) {
		FreeBoardDao.replyWrite(dto);
		
	}

	@Override
	public List<Integer> replyNum(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return FreeBoardDao.replyNum(info);
	}

	@Override
	public void replyArticle(FreeArticleDTO dto) {
		FreeBoardDao.replyArticle(dto);
		
	}

	@Override
	public void indentUp(FreeArticleDTO dto) {
		FreeBoardDao.indentUp(dto);
	}

	@Override
	public int countArticle(String searchType, String keyword) {
		// TODO Auto-generated method stub
		return FreeBoardDao.countArticle(searchType,keyword);
	}

	@Override
	public List<FreeArticleDTO> search(String type, String keyword, Map<String, Object> info) {
		// TODO Auto-generated method stub
		return FreeBoardDao.search(type,keyword,info);
	}

	@Override
	public List<Integer> searchReplyNum(String searchType, String keyword, Map<String, Object> info) {
		// TODO Auto-generated method stub
		return FreeBoardDao.searchReplyNum(searchType,keyword,info);
	}


}


