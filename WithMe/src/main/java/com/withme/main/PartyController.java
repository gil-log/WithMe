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
import com.withme.vo.HashtagVO;
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
	public String list(String loc, Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception{
		logger.info("list");

		System.out.println("loc:"+loc);
		
		session.setAttribute("location", loc);
		
		String location = (String) session.getAttribute("location");
		logger.info(location);
		
		HashtagVO h1 = new HashtagVO();
		h1.setLocation(location);
		h1.setHashtag("힐링");
		HashtagVO h2 = new HashtagVO();
		h2.setLocation(location);
		h2.setHashtag("먹방");
		
		HashtagVO h3 = new HashtagVO();
		h3.setLocation(location);
		h3.setHashtag("오락");
		
		HashtagVO h4 = new HashtagVO();
		h4.setLocation(location);
		h4.setHashtag("사진");
		
		HashtagVO h5 = new HashtagVO();
		h5.setLocation(location);
		h5.setHashtag("번개");
		
		HashtagVO h6 = new HashtagVO();
		h6.setLocation(location);
		h6.setHashtag("여행");
		
		model.addAttribute("healing",service.hashCount(h1));
		model.addAttribute("mukbang",service.hashCount(h2));
		model.addAttribute("ohrak",service.hashCount(h3));
		model.addAttribute("photo",service.hashCount(h4));
		model.addAttribute("thunder",service.hashCount(h5));
		model.addAttribute("travel",service.hashCount(h6));
	
		
		
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
