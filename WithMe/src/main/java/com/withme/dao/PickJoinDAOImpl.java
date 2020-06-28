package com.withme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PickJoinVO;
import com.withme.vo.UserVO;

@Repository
public class PickJoinDAOImpl implements PickJoinDAO{
   @Inject
   private SqlSession sqlSession;
   
   @Override
   public List<PickJoinListVO> picklist(String u_id) throws Exception {      
      return sqlSession.selectList("pickjoinMapper.picklist", u_id);
   }

   @Override
   public void pickinsert(PartylistVO partylistVO) throws Exception {
      sqlSession.insert("pickjoinMapper.pickinsert", partylistVO);
   }

   @Override
   public void joininsert(PartylistVO partylistVO) throws Exception {
      sqlSession.insert("pickjoinMapper.joininsert", partylistVO);
      
   }

   @Override
   public void pickdelete(PartylistVO partylistVO) throws Exception {
     sqlSession.update("pickjoinMapper.pickdelete", partylistVO);
      
   }

   @Override
    // 파티 호스트의 u_id를 가져오자
   public PickJoinListVO getuid(int party_id) throws Exception {
      return sqlSession.selectOne("pickjoinMapper.getuid", party_id);
   }

   @Override
   //파티 참여를 수락한 경우.
   public void joinaccept(PartylistVO partylistVO) throws Exception {
	   sqlSession.update("pickjoinMapper.joinaccept", partylistVO);
   }

   @Override
   //파티 참여를 거절한 경우.
   public void joinreject(PartylistVO partylistVO) throws Exception {
	   sqlSession.delete("pickjoinMapper.joinreject", partylistVO);
   }

	@Override
	// pickjoin 테이블 확인
	public PickJoinListVO pickjoincheck(PartylistVO partylistVO) throws Exception {
		return sqlSession.selectOne("pickjoinMapper.pickjoincheck", partylistVO);
	}
	
	@Override
	//pickjoin 테이블에 추가
	public void pickjoininsert(PartylistVO partylistVO) throws Exception {
	   sqlSession.insert("pickjoinMapper.pickjoininsert", partylistVO);
	}
}