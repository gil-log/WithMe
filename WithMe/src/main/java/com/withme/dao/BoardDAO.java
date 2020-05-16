package com.withme.dao;

import com.withme.vo.BoardVO;

public interface BoardDAO {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
}