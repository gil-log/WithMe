package com.withme.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.MemberDAO;
import com.withme.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
	
		return dao.login(vo);
	}
	
}