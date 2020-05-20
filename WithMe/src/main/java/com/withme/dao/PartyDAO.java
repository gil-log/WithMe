package com.withme.dao;

import java.util.List;

import com.withme.vo.PartyVO;

public interface PartyDAO {
	// 게시글 작성
	public void write(PartyVO partyVO) throws Exception;
	
	// 게시글 목록 조회
	public List<PartyVO> list() throws Exception;
}
