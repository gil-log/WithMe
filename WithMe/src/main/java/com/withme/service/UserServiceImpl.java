package com.withme.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.UserDAO;
import com.withme.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject UserDAO dao;
	
	@Override
	public void register(UserVO vo) throws Exception{
		dao.register(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		return dao.login(vo);
	}
}
