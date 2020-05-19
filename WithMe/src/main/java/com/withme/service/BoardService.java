package com.withme.service;

//service = 데이터를 dao를 통해 넘겨주거나 받으면서 비즈니스 로직을 수행

import java.util.List;

import com.withme.vo.BoardVO;
import com.withme.vo.SearchCriteria;

public interface BoardService {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	// 게시글 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	// 게시물 목록 조회
	public BoardVO read(int bno) throws Exception;
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	// 게시물 삭제
	public void delete(int bno) throws Exception;
}