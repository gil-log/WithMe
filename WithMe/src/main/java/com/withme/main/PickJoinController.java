package com.withme.main;


import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withme.vo.PartylistVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PickJoinVO;
import com.withme.vo.UserVO;
import com.withme.service.PickJoinService;

@Controller
@RequestMapping("/pick/*")
public class PickJoinController {

   private static final Logger logger = LoggerFactory.getLogger(PickJoinController.class);

   @Inject
   PickJoinService service;
      
      //picklist 조회
   	  //session이용해서 로그인 아이디가져옴
      @RequestMapping(value = "/picklist", method = RequestMethod.GET)
      public String picklist(HttpSession session, Model model) throws Exception{
         logger.info("picklist");
         

         
         UserVO userVO = (UserVO)session.getAttribute("user");
         String userID = userVO.getU_id();
         
         List<PickJoinListVO> picklist = service.picklist(userID); 
         
         model.addAttribute("picklist", picklist);

         return "/pickList";
      }
      

      //party를 pick했을 때 동작.
      @RequestMapping(value = "/pickinsert", method = RequestMethod.GET)
      public void pickinsert(HttpSession session, PartylistVO partylistVO, Model model, HttpServletResponse response) throws Exception{
         logger.info("pickinsert");
             
         UserVO userVO = (UserVO)session.getAttribute("user");
         

         
         partylistVO.setU_id(userVO.getU_id()); 
         
         service.pickinsert(partylistVO);
         
         String url = (String)session.getAttribute("url");
         logger.info(url);
         response.sendRedirect(url);
         
      }
      

      //party를 join했을 때 동작.
      @RequestMapping(value = "/joininsert", method = RequestMethod.GET)
      public String joininsert(HttpSession session, PartylistVO partylistVO) throws Exception{
         logger.info("joininsert");
         
         
         UserVO userVO = (UserVO)session.getAttribute("user");
         partylistVO.setU_id(userVO.getU_id()); 
         
         
         
         service.joininsert(partylistVO);
   
         return "redirect:/party/list";
         
      }
      
      //관심 목록에서 pick했을 경우 delete 동작.
      @RequestMapping(value = "/pickdelete", method = RequestMethod.GET)
      public String pickdelete(HttpSession session, PartylistVO partylistVO) throws Exception{
         logger.info("pickdelete");
         
         UserVO userVO = (UserVO)session.getAttribute("user");
         partylistVO.setU_id(userVO.getU_id()); 
         
         service.pickdelete(partylistVO);
   
         return "redirect:/pick/picklist";
         
      }
}