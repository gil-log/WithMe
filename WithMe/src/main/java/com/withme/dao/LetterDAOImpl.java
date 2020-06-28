package com.withme.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.LetterPageMakerVO;
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;

@Repository
public class LetterDAOImpl implements LetterDAO{
   @Inject
   private SqlSession sqlSession;

   @Override
   public void write(LetterVO letterVO) throws Exception {
      sqlSession.insert("letterMapper.insertletter", letterVO);
      
   }

   @Override
   // letter의 l_id가져오기
   public int getlid() throws Exception {
      return sqlSession.selectOne("letterMapper.getlid");
   }

   @Override
   //내가 보낸쪽지로 저장되기 위해
   public void sendletter(LetterlistVO letterlistVO) throws Exception {
      sqlSession.insert("letterMapper.sendletter", letterlistVO);
   }
   
   //내가 보낸쪽지로 저장되기 위해
   public void receiveletter(LetterlistVO letterlistVO) throws Exception {
      sqlSession.insert("letterMapper.receiveletter", letterlistVO);
   }

   @Override
   //쪽지 조회
   public LetterlistVO readletter(LetterlistVO letterlistVO) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("letterMapper.readletter", letterlistVO);
   }
   
   @Override
   //조인 요청 시스템 메세지 작성
   public void requestsystemletter(LetterVO letterVO) throws Exception {
	   sqlSession.insert("letterMapper.requestsystemletter", letterVO);
   } 
   
   @Override
   //조인 눌렀을 때 시스템 메세지 송신
   public void sendsystemletter(LetterlistVO letterlistVO) throws Exception {
      sqlSession.insert("letterMapper.sendsystemletter", letterlistVO);
   }

   @Override
   //파티 호스트가 시스템 메세지 수신
   public void receivesystemletter(LetterlistVO letterlistVO) throws Exception {
      sqlSession.insert("letterMapper.receivesystemletter", letterlistVO);   
   }

   @Override
   //조인 수락 시스템 메세지 작성
   public void acceptsystemletter(LetterVO letterVO) throws Exception {
	   sqlSession.insert("letterMapper.acceptsystemletter", letterVO);
   }

   @Override
   //조인 거절 시스템 메세지 작성
   public void rejectsystemletter(LetterVO letterVO) throws Exception {
	   sqlSession.insert("letterMapper.rejectsystemletter", letterVO);
   }

	@Override
	//받은 쪽지 총 갯수
	public int receivecount(String uid) throws Exception {
		return sqlSession.selectOne("letterMapper.receivecount", uid);
	}
	
	@Override
	//보낸 쪽지 총 갯수
	public int sendcount(String uid) throws Exception {
		return sqlSession.selectOne("letterMapper.sendcount", uid);
	}

	@Override
    // 수신 letter목록 조회 + 페이징
	public List<LetterlistVO> receiveletterlist(LetterPageMakerVO letterpagemakerVO) throws Exception {
		return sqlSession.selectList("letterMapper.receiveletterlist", letterpagemakerVO);
	}

	@Override
    // 발신 letter목록 조회 + 페이징
	public List<LetterlistVO> sendletterlist(LetterPageMakerVO letterpagemakerVO) throws Exception {
		return sqlSession.selectList("letterMapper.sendletterlist", letterpagemakerVO);	
	}

}