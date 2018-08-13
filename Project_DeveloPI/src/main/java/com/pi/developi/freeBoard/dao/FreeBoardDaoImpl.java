package com.pi.developi.freeBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeReplyDTO;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Inject
	SqlSession SqlSession;
	
	private static String namespace = "FreeBoard";
	
	@Override
	public List<FreeArticleDTO> listAll(Map<String, Object> info) throws Exception {
		return SqlSession.selectList(namespace + ".listAll",info);
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
		SqlSession.update(namespace+".delete",no);
		
	}

	@Override
	public List<FreeArticleDTO> search(String type, String keyword,Map<String, Object> info) {
		keyword="%"+keyword+"%";
		Map<String,Object> data=new HashMap<>();
		data.put("keyword", keyword);
		data.put("info", info);
		if(type.equals("t")) 
			return SqlSession.selectList(namespace+".titleSearch",data);
		else if(type.equals("c"))
			return SqlSession.selectList(namespace+".contentSearch",data);
		else
			return SqlSession.selectList(namespace+".userSearch",data);
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

	@Override
	public List<FreeReplyDTO> replyList(int article_no) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".replyList",article_no);
	}

	@Override
	public void replyWrite(FreeReplyDTO dto) {
		SqlSession.insert(namespace+".replyWrite",dto);
		
	}

	@Override
	public List<Integer> replyNum(Map<String, Object> info) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".replyNum",info);
	}

	@Override
	public void replyArticle(FreeArticleDTO dto) {
		// TODO Auto-generated method stub
		SqlSession.insert(namespace+".replyAricle",dto);
	}

	@Override
	public void indentUp(FreeArticleDTO dto) {
		SqlSession.update(namespace+".indentUp", dto);
		
	}

	@Override
	public int countArticle(String searchType, String keyword) {
		keyword="%"+keyword+"%";
		if(searchType.equals("t")) 
			return SqlSession.selectOne(namespace+".titleSearchCount",keyword);
		else if(searchType.equals("c"))
			return SqlSession.selectOne(namespace+".contentSearchCount",keyword);
		else
			return SqlSession.selectOne(namespace+".userSearchCount",keyword);
	}

	@Override
	public List<Integer> searchReplyNum(String searchType, String keyword, Map<String, Object> info) {
		keyword="%"+keyword+"%";
		Map<String,Object> data=new HashMap<>();
		data.put("keyword", keyword);
		data.put("info", info);
		if(searchType.equals("t")) 
			return SqlSession.selectList(namespace+".titleSearchNum",data);
		else if(searchType.equals("c"))
			return SqlSession.selectList(namespace+".contentSearchNum",data);
		else
			return SqlSession.selectList(namespace+".userSearchNum",data);
	}

}
