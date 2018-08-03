package com.pi.developi.freeBoard.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.pi.developi.freeBoard.dao.FreeBoardDao;
import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeUserDTO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Inject
	FreeBoardDao FreeBoardDao;

	@Override
	public List<FreeArticleDTO> listAll() throws Exception {
		return FreeBoardDao.listAll();
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
	public List<FreeArticleDTO> search(String type, String keyword) {
		return FreeBoardDao.search(type,keyword);
		
	}

	@Override
	public String detailId(int no) {
		return FreeBoardDao.detailId(no);
	}

	@Override
	public List<String> listCategory(int board_no) throws Exception {
		return FreeBoardDao.listCategory(board_no);
	}


}


