package com.withme.service;

import java.util.List;

import com.withme.vo.LetterPageMakerVO;
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
public interface LetterService {

   // letter 작성
   public void write(LetterVO letterVO) throws Exception;
   
   // letter의 l_id가져오기
   public int getlid() throws Exception;
   
   //내가 보낸쪽지로 저장되기 위해
   public void sendletter(LetterlistVO letterlistVO) throws Exception;
      
   //수신자가 받은쪽지로 저장되기 위해
   public void receiveletter(LetterlistVO letterlistVO) throws Exception;
      
   //쪽지 조회
   public LetterlistVO readletter(LetterlistVO letterlistVO) throws Exception;

   //조인 요청 시스템 메세지 작성
   public void requestsystemletter(LetterVO letterVO) throws Exception;
   
   //조인 눌렀을 때 시스템 메세지 송신
   public void sendsystemletter(LetterlistVO letterlistVO) throws Exception;
         
   //파티 호스트가 시스템 메세지 수신
   public void receivesystemletter(LetterlistVO letterlistVO) throws Exception;
   
   //조인 수락 시스템 메세지 작성
   public void acceptsystemletter(LetterVO letterVO) throws Exception;
   
   //조인 거절 시스템 메세지 작성
   public void rejectsystemletter(LetterVO letterVO) throws Exception;

   //받은 쪽지 총 갯수
   public int receivecount(String uid) throws Exception;
   
   //보낸 쪽지 총 갯수
   public int sendcount(String uid) throws Exception;
   
   // 수신 letter목록 조회 + 페이징
   public List<LetterlistVO> receiveletterlist(LetterPageMakerVO letterpagemakerVO) throws Exception;

   // 발신 letter목록 조회 + 페이징
   public List<LetterlistVO> sendletterlist(LetterPageMakerVO letterpagemakerVO) throws Exception;

}