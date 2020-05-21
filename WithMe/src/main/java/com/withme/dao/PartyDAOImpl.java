package com.withme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.SearchCriteria;

@Repository
public class PartyDAOImpl implements PartyDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(PartyVO partyVO) throws Exception {
		sqlSession.insert("partyMapper.insert", partyVO);
		
	}
	// 게시물 목록 조회
	@Override
	public List<PartylistVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("partyMapper.listPage", scri);

	}
	
	// 게시글 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne("partyMapper.listCount", scri);
	}
	
	// 게시물 조회
	@Override
	public PartyVO read(int party_id) throws Exception {
			
		return sqlSession.selectOne("partyMapper.read", party_id);
	}
	
	// 해쉬 카운트
	@Override
	public int hashCount(String keyword) throws Exception {
		
		return sqlSession.selectOne("partyMapper.hashCount", keyword);
	}
	
	// 게시글 조회수
	@Override
	public void partyHit(int party_id) throws Exception {
		
		sqlSession.update("partyMapper.partyHit", party_id);
	}
	
}
