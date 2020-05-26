package com.withme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.HashtagVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.PickJoinListVO;
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
	public int hashCount(HashtagVO hashtagVO) throws Exception {
		
		return sqlSession.selectOne("partyMapper.hashCount", hashtagVO);
	}
	
	// 게시글 조회수
	@Override
	public void partyHit(int party_id) throws Exception {
		
		sqlSession.update("partyMapper.partyHit", party_id);
	}
	
	// 파티 생성시 host1인에 pickjoin테이블에 생성
	@Override
	public void pjHost(PartylistVO partylistVO) throws Exception{
		sqlSession.insert("partyMapper.pjhost", partylistVO);
	}
	
	// 파티 생성시의 party_id 가져오기 완전 불안정함
	@Override
	public int getpid() throws Exception{
		return sqlSession.selectOne("partyMapper.getpid");
	}
	
	// 가장 핫한 파티 찾기
	@Override
	public PartylistVO partyHot(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("partyMapper.partyHot", scri);
	}
	
	// 가장 인싸인 파티 찾기
	@Override
	public PartylistVO partyInsa(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("partyMapper.partyInsa", scri);
	}
	
	// pick, join한 목록조회
	@Override
	public List<PickJoinListVO> pickjoinlist(PickJoinListVO pickjoinlistVO) {
	      // TODO Auto-generated method stub
	    return sqlSession.selectList("partyMapper.pickjoinlist", pickjoinlistVO);
	}
	
	// 마이페이지 일정 조회
	@Override
	public List<PartyVO> mylist(String userID) throws Exception {
	      
	   return sqlSession.selectList("partyMapper.mylist", userID);

	}
}
