package com.withme.main;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withme.service.UserService;
import com.withme.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		logger.info("post register");
		
		service.register(vo);
		
		return null;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("user", login);
		}
		
		return "user/loginform";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/party/list";
	}
	
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginform() throws Exception{

		return "user/loginform";
	}
	
	@RequestMapping(value = "/mainlogin", method = RequestMethod.GET)
	public String mainlogin() throws Exception{
		

		return "user/mainlogin";
	}
	
}
	
