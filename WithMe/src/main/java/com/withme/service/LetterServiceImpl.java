package com.withme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.LetterDAO;
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;

@Service
public class LetterServiceImpl implements LetterService{
	@Inject
	private LetterDAO dao;

	// 게시물 목록 조회
	@Override
	public List<LetterlistVO> letterlist(String u_id) throws Exception {
		return dao.letterlist(u_id);
	}

	@Override
	public void write(LetterVO letterVO) throws Exception {
		dao.write(letterVO);
	}
}
