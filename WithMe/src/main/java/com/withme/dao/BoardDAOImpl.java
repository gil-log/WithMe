package com.withme.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성 boardMapper.xml에서 mapper의 namespae가 boardMapper이고 id가 insert인애를 반환해라 라는 뜻
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list() throws Exception {
	
		return sqlSession.selectList("boardMapper.list");

	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
			
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("boardMapper.delete", bno);
	}
}