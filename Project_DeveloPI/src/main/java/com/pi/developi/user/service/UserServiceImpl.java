package com.pi.developi.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pi.developi.user.dao.UserDao;
import com.pi.developi.user.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDao dao;

	/** 유저 id 불러오기 */
	@Override
	public UserDTO getId(int userNo) {
		return dao.getId(userNo);
	}
	/** 유저 번호 불러오기 */
	@Override
	public int getNo(String id) {
		return dao.getNo(id);
	};	

}
