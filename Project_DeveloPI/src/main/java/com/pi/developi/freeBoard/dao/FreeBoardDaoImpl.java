package com.pi.developi.freeBoard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeUserDTO;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Inject
	SqlSession SqlSession;
	
	private static String namespace = "FreeBoard";
	
	@Override
	public List<FreeArticleDTO> listAll() throws Exception {
		return SqlSession.selectList(namespace + ".listAll");
	}

	@Override
	public List<String> userId() throws Exception {
		return SqlSession.selectList(namespace+".userId");
	}

	@Override
	public FreeArticleDTO detail(int no) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(namespace+".detail",no);
	}

	@Override
	public void upHit(int no) throws Exception {
		SqlSession.update(namespace+".hitUp",no);
	}

	@Override
	public void write(FreeArticleDTO dto) {
		SqlSession.insert(namespace+".write",dto);	
	}

	@Override
	public void update(FreeArticleDTO dto) {
		SqlSession.update(namespace+".update",dto);
		
	}

	@Override
	public void delete(int no) {
		SqlSession.delete(namespace+".delete",no);
		
	}

	@Override
	public List<FreeArticleDTO> search(String type, String keyword) {
		keyword="%"+keyword+"%";
		if(type.equals("t")) 
			return SqlSession.selectList(namespace+".titleSearch",keyword);
		else if(type.equals("c"))
			return SqlSession.selectList(namespace+".contentSearch",keyword);
		else
			return SqlSession.selectList(namespace+".userSearch",keyword);
	}

	@Override
	public String detailId(int no) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(namespace+".detailId",no);
	}

	@Override
	public List<String> listCategory(int board_no)  throws Exception{
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".listCategory");
	}
}
