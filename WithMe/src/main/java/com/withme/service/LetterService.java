package com.withme.service;

import java.util.List;

import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;
public interface LetterService {

	// pick목록 조회
	public List<LetterlistVO> letterlist(String u_id) throws Exception;
	

	// 게시글 작성
	public void write(LetterVO letterVO) throws Exception;
	
}
