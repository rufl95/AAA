package com.pi.developi.user.service;

import com.pi.developi.user.domain.UserDTO;

public interface UserService {
	
	/** 유저 id 불러오기 */
	public UserDTO getId(int userNo);	

	/** 유저 번호 불러오기 */
	public int getNo(String id);	
}
