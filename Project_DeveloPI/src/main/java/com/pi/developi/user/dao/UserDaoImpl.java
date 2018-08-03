package com.pi.developi.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.pi.developi.user.domain.UserDTO;


@Repository
public class UserDaoImpl implements UserDao {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.pi.developi.mappers.userMapper";

	Logger logger = Logger.getLogger(UserDaoImpl.class);

	
	/** 유저 id 불러오기 */
	@Override
	public UserDTO getId(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getId", userNo);
	}
	
	/** 유저 번호 불러오기 */
	@Override
	public int getNo(String id) {
		if(sqlSession.selectOne(namespace + ".getNo", id) == null) return 0;
		else return sqlSession.selectOne(namespace + ".getNo", id);
	}	

}
