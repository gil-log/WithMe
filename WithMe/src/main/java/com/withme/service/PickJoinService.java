package com.withme.service;

import java.util.List;

import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PickJoinVO;

public interface PickJoinService {

   // pick목록 조회
   public List<PickJoinListVO> picklist(String u_id) throws Exception;
   
   
   // pickjoin 테이블 확인
   public PickJoinListVO pickjoincheck(PartylistVO partylistVO) throws Exception;
   
   
   //pickjoin 테이블에 추가
   public void pickjoininsert(PartylistVO partylistVO) throws Exception;
   
   
   // pick버튼 누른경우
   public void pickinsert(PartylistVO partylistVO) throws Exception;
   

   // join버튼 누른경우
   public void joininsert(PartylistVO partylistVO) throws Exception;
   

   // 관심목록에서 pick버튼 누른경우
   public void pickdelete(PartylistVO partylistVO) throws Exception;
   
   
   // 파티 호스트의 u_id를 가져오자
   public PickJoinListVO getuid(int party_id) throws Exception;
   
   
   //파티 참여를 수락한 경우.
   public void joinaccept(PartylistVO partylistVO) throws Exception;
   

   //파티 참여를 거절한 경우.
   public void joinreject(PartylistVO partylistVO) throws Exception;
   
}