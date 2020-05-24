package com.withme.main;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.service.PartyService;
import com.withme.service.UserService;
import com.withme.vo.LevelVO;
import com.withme.vo.PageMaker;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.SearchCriteria;
import com.withme.vo.UserVO;

@Controller
@RequestMapping("/party/*")
public class PartyController {

	private static final Logger logger = LoggerFactory.getLogger(PartyController.class);
	
	@Inject
	PartyService service;
	@Inject
	UserService userservice;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView(HttpSession session) throws Exception{
		logger.info("writeView");

		UserVO userVO = (UserVO) session.getAttribute("user");
		logger.info(userVO.getU_id());
		//session.setAttribute("user", userVO);
		//userservice.level(userVO);
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PartyVO partyVO, HttpSession session) throws Exception{
		logger.info("write");
		
		service.write(partyVO);
		int pid = service.getpid();
		logger.info(Integer.toString(pid));
		
		UserVO userVO = (UserVO) session.getAttribute("user");
		LevelVO levelVO = new LevelVO();
		levelVO.setU_id(userVO.getU_id());
		levelVO.setPoint(100);
		userservice.level(levelVO);
		
		PartylistVO partylistVO = new PartylistVO();
		partylistVO.setU_id(userVO.getU_id());
		partylistVO.setParty_id(pid);
		
		service.pjHost(partylistVO);
		
		return "redirect:/party/list";
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
