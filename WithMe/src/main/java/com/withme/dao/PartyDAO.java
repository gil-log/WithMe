package com.withme.dao;

import java.util.List;

import com.withme.vo.HashtagVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.SearchCriteria;

public interface PartyDAO {
	// 게시글 작성
	public void write(PartyVO partyVO) throws Exception;
	
	// 게시글 목록 조회
	public List<PartylistVO> list(SearchCriteria scri) throws Exception;
	
	//게시글 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public PartyVO read(int party_id) throws Exception;
	
	// 해쉬태그 개수
	public int hashCount(HashtagVO hashtagVO) throws Exception;
	
	// 게시글 조회수
	public void partyHit(int party_id) throws Exception;
	
	// 파티 생성시 pickjoin에 host1 적용
	public void pjHost(PartylistVO partylistVO) throws Exception;
	
	// 파티 생성시의 party_id 가져오기 완전 불안정함
	public int getpid() throws Exception;
	
	// 가장 핫한 파티 찾기
	public PartyVO partyHot(SearchCriteria scri) throws Exception;
}
