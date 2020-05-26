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
      sqlSession.update("pickjoinMapper.joininsert", partylistVO);
      
   }

   @Override
   public void pickdelete(PartylistVO partylistVO) throws Exception {
     sqlSession.delete("pickjoinMapper.pickdelete", partylistVO);
      
   }

   @Override
    // 파티 호스트의 u_id를 가져오자
   public PickJoinListVO getuid(int party_id) throws Exception {
      return sqlSession.selectOne("pickjoinMapper.getuid", party_id);
   }
}