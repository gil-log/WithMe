package com.withme.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.LevelVO;
import com.withme.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject SqlSession sql;
	
	// 회원가입
	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert("userMapper.register", vo);
	}
	
	// 로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		
		return sql.selectOne("userMapper.login", vo);
	}
	
	// 유저 레벨 경험치 상승
	@Override
	public void level(LevelVO levelVO) throws Exception {
		sql.update("userMapper.level", levelVO);
	}
	
	// 유저 정보 가져오기
	@Override
	public UserVO userinfo(String u_id) throws Exception {
		return sql.selectOne("userMapper.userInfo", u_id);
	}
	
	// 호스트 정보 가져오기
	@Override
	public UserVO hostinfo(int party_id) throws Exception {
		return sql.selectOne("userMapper.hostInfo", party_id);
	}
}
