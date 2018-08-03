package com.pi.developi.category.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.pi.developi.mappers.categoryMapper";

	Logger logger = Logger.getLogger(CategoryDaoImpl.class);

	
	/** 카테고리 이름 불러오기 */
	@Override
	public String getName(int categoryNo) {
		return sqlSession.selectOne(namespace + ".getName", categoryNo);
	}

}
