package com.withme.dao;

import com.withme.vo.PlanVO;

public interface PlanDAO {

	// 게시글 작성
	public void write(PlanVO planVO) throws Exception;
}
