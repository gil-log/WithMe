package com.withme.main;

import java.net.URLEncoder;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withme.service.PartyService;
import com.withme.service.ReplyService;
import com.withme.service.UserService;
import com.withme.vo.HashtagVO;
import com.withme.vo.LevelVO;
import com.withme.vo.PageMaker;
import com.withme.vo.PartyVO;
import com.withme.vo.PartylistVO;
import com.withme.vo.ReplyVO;
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
	@Inject
	ReplyService replyService;
	
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
	public String list(int loc, Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception{
		logger.info("list");
		
		String location = "";
		switch(loc) {
		case 1 : 
			location = "서울";
			model.addAttribute("loc", URLEncoder.encode("1", "UTF-8"));
			break;
		case 2 :
			location = "경기";
			model.addAttribute("loc", URLEncoder.encode("2", "UTF-8"));
			break;
		case 3 :
			location = "강원";
			model.addAttribute("loc", URLEncoder.encode("3", "UTF-8"));
			break;
		case 4 :
			location = "충청";
			model.addAttribute("loc", URLEncoder.encode("4", "UTF-8"));
			break;
		case 5 :
			location = "전라";
			model.addAttribute("loc", URLEncoder.encode("5", "UTF-8"));
			break;
		case 6 :
			location = "경상";
			model.addAttribute("loc", URLEncoder.encode("6", "UTF-8"));
			break;
		case 7 :
			location = "제주";
			model.addAttribute("loc", URLEncoder.encode("7", "UTF-8"));
			break;
		default :
			break;
		}
		session.setAttribute("location", location);
		
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
	
		scri.setLocation(location);
		
		model.addAttribute("list", service.list(scri));
		
		logger.info(Integer.toString(service.partyHot(scri).getParty_id()));
		model.addAttribute("partyHot", service.partyHot(scri));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);

		return "party/list";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(PartyVO partyVO, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session)
			throws Exception {
		logger.info("read");
		
		
		//세션 가져오기(댓글 수정 삭제 표시)
		UserVO userVO = (UserVO) session.getAttribute("user");
		model.addAttribute("loginID",userVO.getU_id());
		
		
		model.addAttribute("read", service.read(partyVO.getParty_id()));
		model.addAttribute("scri", scri);

		List<ReplyVO> replyList = replyService.readReply(partyVO.getParty_id());
		model.addAttribute("replyList", replyList);
		
		return "party/readView";
	}
	
	// 댓글 작성
		@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session)
				throws Exception {
			logger.info("reply Write");
			UserVO userVO = (UserVO) session.getAttribute("user");

			vo.setU_id(userVO.getU_id());
			replyService.writeReply(vo);
			
			rttr.addAttribute("user_id",vo.getU_id());
			rttr.addAttribute("party_id", vo.getParty_id());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/party/readView";
		}

		// 댓글 수정 GET

		@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");

			model.addAttribute("replyUpdate", replyService.selectReply(vo.getC_id()));
			model.addAttribute("scri", scri);

			return "party/replyUpdateView";
		}

		// 댓글 수정 POST

		@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session)
				throws Exception {
			logger.info("reply Write");

			logger.info(Integer.toString(vo.getC_id()));
			logger.info(Integer.toString(vo.getParty_id()));

			replyService.updateReply(vo);

			rttr.addAttribute("party_id", vo.getParty_id());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/party/readView";
		}

		// 댓글 삭제 GET
		@RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");

			model.addAttribute("replyDelete", replyService.selectReply(vo.getC_id()));
			model.addAttribute("scri", scri);

			return "party/replyDeleteView";
		}

		// 댓글 삭제
		@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");

			replyService.deleteReply(vo);

			rttr.addAttribute("party_id", vo.getParty_id());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/party/readView";
		}
	
	
}
