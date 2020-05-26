package com.withme.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.withme.dao.ReplyDAO;
import com.withme.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	// 댓글 조회
	@Override
	public List<ReplyVO> readReply(int party_id) throws Exception {
		return dao.readReply(party_id);
	}
	
	// 댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	// 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	// 댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	// 선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int c_id) throws Exception {
		return dao.selectReply(c_id);
	}
}