package com.withme.service;

import java.util.List;

import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;

public interface PartyService {

	// 게시글 작성
	public void write(PartyVO partyVO) throws Exception;
	
	// 게시글 조회
	public List<PartylistVO> list() throws Exception;
	
	// 게시물 목록 조회
	public PartyVO read(int party_id) throws Exception;
}
