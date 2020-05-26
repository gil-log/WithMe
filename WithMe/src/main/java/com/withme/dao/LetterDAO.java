package com.withme.dao;

import java.util.List;

import com.withme.vo.LetterlistVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.LetterVO;

public interface LetterDAO {
	
	// letterlist 출력
	public List<LetterlistVO> letterlist(String u_id) throws Exception;

	// letter 작성
	public void write(LetterVO letterVO) throws Exception;
	
	// 파티 생성시의 party_id 가져오기 완전 불안정함
	public int getlid() throws Exception;

	//내가 보낸쪽지로 저장되기 위해
	public void sendletter(LetterlistVO letterlistVO) throws Exception;
	
	//내가 보낸쪽지로 저장되기 위해
	public void receiveletter(LetterlistVO letterlistVO) throws Exception;

	//쪽지 조회
	public LetterlistVO readletter(LetterlistVO letterlistVO) throws Exception;
}
