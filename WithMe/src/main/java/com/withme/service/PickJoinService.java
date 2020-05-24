package com.withme.service;

import java.util.List;

import com.withme.vo.PartyVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PickJoinVO;

public interface PickJoinService {

   // pick목록 조회
   public List<PickJoinListVO> picklist(String u_id) throws Exception;
   

   // pick버튼 누른경우
   public void pickinsert(int party_id) throws Exception;
   

   // join버튼 누른경우
   public void joininsert(int party_id) throws Exception;

   
}