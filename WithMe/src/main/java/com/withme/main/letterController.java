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

import com.withme.vo.LetterlistVO;
import com.withme.vo.PartyVO;
import com.withme.vo.LetterVO;
import com.withme.service.LetterService;

@Controller
@RequestMapping("/letter/*")
public class letterController {

	private static final Logger logger = LoggerFactory.getLogger(letterController.class);

	@Inject
	LetterService service;
		
		//letterlist 조회
		@RequestMapping(value = "/letterlist", method = RequestMethod.GET)
		public String picklist(LetterlistVO letterlistVO, Model model) throws Exception{
			logger.info("letterlist");
			
			model.addAttribute("letterlist", service.letterlist(letterlistVO.getU_id()));

			return "letter/letterList";
		}
		
		// letter 작성 화면
		@RequestMapping(value = "/letterwriteView", method = RequestMethod.GET)
		public void letterwriteView() throws Exception{
			logger.info("letterwriteView");
		}
		
		// letter 작성
		@RequestMapping(value = "/letterwrite", method = RequestMethod.POST)
		public String write(LetterVO letterVO) throws Exception{
			logger.info("letterwrite");
			
			service.write(letterVO);
			
			return "letter/letterWrite";
		}
}
