package com.withme.dao;

import java.util.List;

import com.withme.vo.LetterlistVO;
import com.withme.vo.LetterVO;

public interface LetterDAO {
	
	// letterlist 출력
	public List<LetterlistVO> letterlist(String u_id) throws Exception;

	// letter 작성
	public void write(LetterVO letterVO) throws Exception;
	
}
