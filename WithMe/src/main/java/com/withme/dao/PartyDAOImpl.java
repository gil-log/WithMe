package com.withme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;

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
	public List<PartylistVO> list() throws Exception {
	
		return sqlSession.selectList("partyMapper.list");

	}
	
	// 게시물 조회
	@Override
	public PartyVO read(int party_id) throws Exception {
			
		return sqlSession.selectOne("partyMapper.read", party_id);
	}
}
