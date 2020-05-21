package com.withme.service;

import com.withme.vo.UserVO;

public interface UserService {

	public void register(UserVO userVO) throws Exception;
	
	public UserVO login(UserVO userVO) throws Exception;
}
