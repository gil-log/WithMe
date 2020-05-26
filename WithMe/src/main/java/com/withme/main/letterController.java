package com.withme.main;


import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.vo.PartyVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.UserVO;
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;
import com.withme.service.LetterService;

@Controller
@RequestMapping("/letter/*")
public class letterController {

	private static final Logger logger = LoggerFactory.getLogger(letterController.class);

	@Inject
	LetterService service;
		
		//letterlist 조회
		@RequestMapping(value = "/letterlist", method = RequestMethod.GET)
		public String picklist(HttpSession session, Model model) throws Exception{
			logger.info("letterlist");
			
			UserVO userVO = (UserVO) session.getAttribute("user");
			String userID = userVO.getU_id();
			
			System.out.println(userID);
			List<LetterlistVO> letterlist = service.letterlist(userID); 
			model.addAttribute("letterlist", letterlist);
			
			return "letter/letterList";
		}
		
		// letter 작성 화면
		@RequestMapping(value = "/letterwriteView", method = RequestMethod.GET)
		public void letterwriteView(HttpSession session) throws Exception{
			logger.info("letterwriteView");

			UserVO userVO = (UserVO) session.getAttribute("user");
			logger.info(userVO.getU_id());
		}
		
		// letter 작성
		@RequestMapping(value = "/letterwrite", method = RequestMethod.POST)
		public String write(HttpSession session, LetterVO letterVO) throws Exception{
			logger.info("letterwrite");
			
			//쪽지 내용을 저장
			service.write(letterVO);
			int lid = service.getlid();
			
			UserVO userVO = (UserVO) session.getAttribute("user");
			
			LetterlistVO letterlistVO = new LetterlistVO();
			letterlistVO.setU_id(userVO.getU_id());
			letterlistVO.setL_id(lid);
			
			//내가 보낸쪽지로 저장되기 위해
			service.sendletter(letterlistVO);
			
			letterlistVO.setU_id(letterVO.getU_id());
			
			//수신자가 받은쪽지로 저장되기 위해
			service.receiveletter(letterlistVO);
			
			return "redirect:/letter/letterlist";
		}
		
		// 쪽지 조회
		@RequestMapping(value = "/letterreadView", method = RequestMethod.GET)
		public String read(HttpSession session, LetterVO letterVO, Model model) throws Exception{
			logger.info("letterreadView");
			
			/*l_id 가져오기
			service.write(letterVO);
			int lid = service.getlid();
			*/
			UserVO userVO = (UserVO) session.getAttribute("user");
			String userID = userVO.getU_id();
			
			//letterlistVO에 u_id, l_id 설정
			LetterlistVO letterlistVO = new LetterlistVO();
			letterlistVO.setU_id(userID);
			letterlistVO.setL_id(letterVO.getL_id());
			
			model.addAttribute("readletter", service.readletter(letterlistVO));
			System.out.println("letterlistVO: " + letterlistVO);
			
			return "letter/letterreadView";
		}
}
