package com.withme.dao;

import java.util.List;

import com.withme.vo.PickJoinListVO;
import com.withme.vo.PickJoinVO;

public interface PickJoinDAO {
   
   // picklist 출력
   public List<PickJoinListVO> picklist(String u_id) throws Exception;

   // pick버튼 눌렀을 때
   public void pickinsert(int party_id) throws Exception;

   // join버튼 눌렀을 때
   public void joininsert(int party_id) throws Exception;
   
}