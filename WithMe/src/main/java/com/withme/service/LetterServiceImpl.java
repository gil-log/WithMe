package com.withme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.LetterDAO;
import com.withme.vo.LetterPageMakerVO;
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;

@Service
public class LetterServiceImpl implements LetterService{
   @Inject
   private LetterDAO dao;

   @Override
   public void write(LetterVO letterVO) throws Exception {
      dao.write(letterVO);
   }

   @Override
   // letter의 l_id가져오기
   public int getlid() throws Exception {
      return dao.getlid();
   }

   @Override
   //내가 보낸쪽지로 저장되기 위해
   public void sendletter(LetterlistVO letterlistVO) throws Exception {
      dao.sendletter(letterlistVO);
   }
   
   //내가 보낸쪽지로 저장되기 위해
   public void receiveletter(LetterlistVO letterlistVO) throws Exception {
      dao.receiveletter(letterlistVO);
   }

   @Override
   //쪽지 조회
   public LetterlistVO readletter(LetterlistVO letterlistVO) throws Exception {
      return dao.readletter(letterlistVO);
   }
   

   @Override
   //조인 요청 시스템 메세지 작성
   public void requestsystemletter(LetterVO letterVO) throws Exception {
      dao.requestsystemletter(letterVO);
   }

   
   @Override
   //조인 눌렀을 때 시스템 메세지 송신
   public void sendsystemletter(LetterlistVO letterlistVO) throws Exception {
      dao.sendsystemletter(letterlistVO);
      
   }

   @Override
   //파티 호스트가 시스템 메세지 수신
   public void receivesystemletter(LetterlistVO letterlistVO) throws Exception {
      dao.receivesystemletter(letterlistVO);
   }

   @Override
   //조인 수락 시스템 메세지 작성
   public void acceptsystemletter(LetterVO letterVO) throws Exception {
	   dao.acceptsystemletter(letterVO);
   }

   @Override
   //조인 거절 시스템 메세지 작성
   public void rejectsystemletter(LetterVO letterVO) throws Exception {
	   dao.rejectsystemletter(letterVO);
   }

	@Override
	//받은 쪽지 총 갯수
	public int receivecount(String uid) throws Exception {
		return dao.receivecount(uid);
	}
	
	@Override
	//보낸 쪽지 총 갯수
	public int sendcount(String uid) throws Exception {
		return dao.sendcount(uid);
	}

	@Override
    // 수신 letter목록 조회 + 페이징
	public List<LetterlistVO> receiveletterlist(LetterPageMakerVO letterpagemakerVO) throws Exception {
		return dao.receiveletterlist(letterpagemakerVO);
	}

	@Override
    // 발신 letter목록 조회 + 페이징
	public List<LetterlistVO> sendletterlist(LetterPageMakerVO letterpagemakerVO) throws Exception {
		return dao.sendletterlist(letterpagemakerVO);
	}
	
	
}