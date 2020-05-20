package com.withme.service;

import java.util.List;

import com.withme.vo.PartyVO;

public interface PartyService {

	// 게시글 작성
	public void write(PartyVO partyVO) throws Exception;
	
	// 게시글 조회
	public List<PartyVO> list() throws Exception;
}
