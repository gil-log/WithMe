package com.withme.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;

@Repository
public class LetterDAOImpl implements LetterDAO{
   @Inject
   private SqlSession sqlSession;

   @Override
   public List<LetterlistVO> letterlist(String u_id) throws Exception {
      return sqlSession.selectList("letterMapper.letterlist", u_id);
   }

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
   
   public void writesystemletter(LetterVO letterVO) throws Exception {
      sqlSession.insert("letterMapper.writesystemletter", letterVO);
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
}