package com.withme.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.withme.dao.PlanDAO;
import com.withme.vo.PlanVO;

@Service
public class PlanServiceImpl implements PlanService {

	@Inject
	private PlanDAO dao;
	
	// 게시글 작성
	public void write(PlanVO planVO) throws Exception{
		dao.write(planVO);
	}
}
