package com.pi.developi.category.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pi.developi.category.dao.CategoryDao;
import com.pi.developi.user.dao.UserDao;
import com.pi.developi.user.domain.UserDTO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	CategoryDao dao;

	/** 카테고리 이름 불러오기 */
	@Override
	public String getName(int categoryNo) {
		return dao.getName(categoryNo);
	}
}
