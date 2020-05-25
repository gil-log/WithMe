package com.withme.main;

import java.text.DateFormat;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withme.vo.BoardVO;
import com.withme.vo.PageMaker;
import com.withme.vo.ReplyVO;
import com.withme.vo.SearchCriteria;
@Controller

public class MypageController {
   private static final Logger logger = LoggerFactory.getLogger(MainController.class);
   

   
   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
   public String read(Locale locale, Model model) throws Exception{
      logger.info("Welcome home! The client locale is {}.", locale);
      
      
      return "mypage/mypage";
   }
   
}