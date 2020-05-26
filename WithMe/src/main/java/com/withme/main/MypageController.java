package com.withme.main;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.vo.UserVO;
import com.withme.service.PartyService;
import com.withme.vo.PartyVO;

@Controller
public class MypageController {
   private static final Logger logger = LoggerFactory.getLogger(MainController.class);
   @Inject
   PartyService service;

   //session이용해서 로그인 아이디가져옴
   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
   public String getMypageList(Model model,HttpSession session) throws Exception{
      logger.info("mypage start");
      
      UserVO userVO = (UserVO) session.getAttribute("user");
      String userID = userVO.getU_id();
      
      List<PartyVO> mypageList = service.mylist(userID); 
      
      model.addAttribute("mypageList", mypageList);
      
      model.addAttribute("userInfo", userVO);
      
      return "mypage/mypage";
    
   }
   
}