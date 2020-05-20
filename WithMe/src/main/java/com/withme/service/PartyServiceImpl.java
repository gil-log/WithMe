package com.withme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.PartyDAO;
import com.withme.vo.PartyVO;

@Service
public class PartyServiceImpl implements PartyService{
	@Inject
	private PartyDAO dao;
	
	// 게시글 작성
	public void write(PartyVO partyVO) throws Exception{
		dao.write(partyVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<PartyVO> list() throws Exception {

		return dao.list();
	}
}
