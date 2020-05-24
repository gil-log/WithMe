package com.withme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.PickJoinDAO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PickJoinVO;

@Service
public class PickJoinServiceImpl implements PickJoinService{
   @Inject
   private PickJoinDAO dao;
   
   // 게시물 목록 조회
   @Override
   public List<PickJoinListVO> picklist(String u_id) throws Exception {

      return dao.picklist(u_id);
   }

   @Override
   public void pickinsert(int party_id) throws Exception {
      dao.pickinsert(party_id);   
   }

   @Override
   public void joininsert(int party_id) throws Exception {
      dao.joininsert(party_id);   
      
   }
}