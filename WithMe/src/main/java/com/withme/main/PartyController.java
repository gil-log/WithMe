package com.withme.main;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.service.PartyService;
import com.withme.vo.PageMaker;
import com.withme.vo.PartyVO;
import com.withme.vo.SearchCriteria;

@Controller
@RequestMapping("/party/*")
public class PartyController {

	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@Inject
	PartyService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PartyVO partyVO) throws Exception{
		logger.info("write");
		
		service.write(partyVO);
		
		return "party/writeView";
	}
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		
		model.addAttribute("healing",service.hashCount("힐링"));
		model.addAttribute("mukbang",service.hashCount("먹방"));
		model.addAttribute("ohrak",service.hashCount("오락"));
		model.addAttribute("photo",service.hashCount("사진"));
		model.addAttribute("thunder",service.hashCount("번개"));
		model.addAttribute("travel",service.hashCount("여행"));
	
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);

		return "party/list";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(PartyVO partyVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(partyVO.getParty_id()));
		
		return "party/readView";
	}
}
