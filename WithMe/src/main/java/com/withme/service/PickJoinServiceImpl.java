package com.withme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.PickJoinDAO;
import com.withme.vo.PartylistVO;
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
   public void pickinsert(PartylistVO partylistVO) throws Exception {
      dao.pickinsert(partylistVO);   
   }

   @Override
   public void joininsert(PartylistVO partylistVO) throws Exception {
      dao.joininsert(partylistVO);   
   }

   @Override
   public void pickdelete(PartylistVO partylistVO) throws Exception {
     dao.pickdelete(partylistVO);   
      
   }

   @Override
   // 파티 호스트의 u_id를 가져오자
   public PickJoinListVO getuid(int party_id) throws Exception {
      return dao.getuid(party_id);
   }
}