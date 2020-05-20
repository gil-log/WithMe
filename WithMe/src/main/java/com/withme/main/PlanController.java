package com.withme.main;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.service.PlanService;
import com.withme.vo.PlanVO;

@Controller
@RequestMapping("/plan/*")
public class PlanController {

	private static final Logger logger = LoggerFactory.getLogger(PlanController.class);
	
	@Inject
	PlanService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/plan/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/plan/write", method = RequestMethod.POST)
	public String write(PlanVO planVO) throws Exception{
		logger.info("write");
		
		service.write(planVO);
		
		return "redirect:/main";
	}
}
