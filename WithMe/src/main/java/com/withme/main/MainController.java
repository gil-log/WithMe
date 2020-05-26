package com.withme.main;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.vo.HashtagVO;
import com.withme.vo.PageMaker;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.SearchCriteria;
import com.withme.vo.UserVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	// 게시판 목록 조회
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public void list(int loc,HttpSession session, HttpServletResponse response) throws Exception{
		logger.info("location");
		
		String location = "";
		String url = "/party/list";
		
		switch(loc) {
		case 1 : 
			location = "서울";
			url = "/party/list?searchType=e&keyword=%EC%84%9C%EC%9A%B8";
			break;
		case 2 :
			location = "경기";
			url = "/party/list?searchType=e&keyword=%EA%B2%BD%EA%B8%B0";
			break;
		case 3 :
			location = "강원";
			url = "/party/list?searchType=e&keyword=%EA%B0%95%EC%9B%90";
			break;
		case 4 :
			location = "충청";
			url = "/party/list?searchType=e&keyword=%EC%B6%A9%EC%B2%AD";
			break;
		case 5 :
			location = "전라";
			url = "/party/list?searchType=e&keyword=%EC%A0%84%EB%9D%BC";
			break;
		case 6 :
			location = "경상";
			url = "/party/list?searchType=e&keyword=%EA%B2%BD%EC%83%81";
			break;
		case 7 :
			location = "제주";
			url = "/party/list?searchType=e&keyword=%EC%A0%9C%EC%A3%BC";
			break;
		default :

			break;
		}
		session.setAttribute("location", location);
		session.setAttribute("url", url);
		logger.info(location);

		
		response.sendRedirect(url);

		
	}
	
	
	@RequestMapping(value = "/matching", method = RequestMethod.GET)
	public String match(Locale locale, Model model) {
		logger.info("Welcome matching! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "matching";
	}
	
}