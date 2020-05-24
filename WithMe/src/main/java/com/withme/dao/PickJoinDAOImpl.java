package com.withme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.PartyVO;
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
   public void pickinsert(int party_id) throws Exception {
      sqlSession.insert("pickjoinMapper.pickinsert", party_id);
   }

   @Override
   public void joininsert(int party_id) throws Exception {
      sqlSession.update("pickjoinMapper.joininsert", party_id);
      
   }

}