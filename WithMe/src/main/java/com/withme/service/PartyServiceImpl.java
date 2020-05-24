package com.withme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.withme.dao.PartyDAO;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.SearchCriteria;

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
	public List<PartylistVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	// 게시글 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}
	
	// 게시물로 이동
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public PartyVO read(int party_id) throws Exception {
		// 게시글 조회수
		dao.partyHit(party_id);
		
		return dao.read(party_id);
	}
	
	// 해쉬태그 개수
	@Override
	public int hashCount(String keyword) throws Exception {
		
		return dao.hashCount(keyword);
	}
	
	// 파티 생성시 호스트1인에 pickjoin에 생성
	@Override
	public void pjHost(PartylistVO partylistVO) throws Exception{
		dao.pjHost(partylistVO);
	}
	
	// 파티 생성시의 party_id 가져오기 완전 불안정함
	@Override
	public int getpid() throws Exception{
		return dao.getpid();
	}
}
