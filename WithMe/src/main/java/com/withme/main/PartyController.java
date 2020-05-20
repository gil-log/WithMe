package com.withme.main;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.service.PartyService;
import com.withme.vo.PartyVO;

@Controller
@RequestMapping("/party/*")
public class PartyController {

	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@Inject
	PartyService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/party/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/party/write", method = RequestMethod.POST)
	public String write(PartyVO partyVO) throws Exception{
		logger.info("write");
		
		service.write(partyVO);
		
		return "redirect:/main";
	}
	// 게시판 목록 조회
	@RequestMapping(value = "/party/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",service.list());
		
		
		return "party/list";
		
	}
}
