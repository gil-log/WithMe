package com.withme.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.withme.vo.PlanVO;

@Repository
public class PlanDAOImpl implements PlanDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(PlanVO planVO) throws Exception {
		sqlSession.insert("planMapper.insert", planVO);
		
	}

}
