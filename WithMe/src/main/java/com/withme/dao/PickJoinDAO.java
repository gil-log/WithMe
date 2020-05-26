package com.withme.dao;

import java.util.List;

import com.withme.vo.PartylistVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PickJoinVO;

public interface PickJoinDAO {
   
   // picklist 출력
   public List<PickJoinListVO> picklist(String u_id) throws Exception;

   // pick버튼 눌렀을 때
   public void pickinsert(PartylistVO partylistVO) throws Exception;

   // join버튼 눌렀을 때
   public void joininsert(PartylistVO partylistVO) throws Exception;
   
   // 관심목록에서 pick버튼 누른경우
   public void pickdelete(PartylistVO partylistVO) throws Exception;
   
}