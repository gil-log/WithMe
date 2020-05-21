package com.withme.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject SqlSession sql;
	// 회원가입

	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert("userMapper.register", vo);
	}
	
}
