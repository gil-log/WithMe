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
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PickJoinVO;
import com.withme.vo.UserVO;
import com.withme.service.LetterService;
import com.withme.service.PickJoinService;

@Controller
@RequestMapping("/pick/*")
public class PickJoinController {

   private static final Logger logger = LoggerFactory.getLogger(PickJoinController.class);

   @Inject
   PickJoinService service;
   @Inject
   LetterService letterservice;
   
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
         
         PickJoinListVO pickjoinlistVO = service.pickjoincheck(partylistVO);
          
         if(pickjoinlistVO == null) {
        	 service.pickjoininsert(partylistVO);
         }
         
         
         if(partylistVO.getPng_chk()==1) {
        	 service.pickdelete(partylistVO);
         }
         else {
        	 service.pickinsert(partylistVO);
         }
         
         String url = (String)session.getAttribute("url");
         logger.info(url);
         response.sendRedirect(url);
         
      }
      

      //party를 join했을 때 동작.                       
      @RequestMapping(value = "/joininsert", method = RequestMethod.GET)
      public void joininsert(HttpSession session, PartylistVO partylistVO, LetterVO letterVO, HttpServletResponse response) throws Exception{
         logger.info("joininsert");
         
         
         UserVO userVO = (UserVO)session.getAttribute("user");
         partylistVO.setU_id(userVO.getU_id()); 
         
         PickJoinListVO pickjoinlistVO = service.pickjoincheck(partylistVO);
         
         if(pickjoinlistVO == null) {
        	 service.pickjoininsert(partylistVO);
         }
         
         service.joininsert(partylistVO);
         
         // 파티 호스트의 u_id를 가져오자
         pickjoinlistVO = service.getuid(partylistVO.getParty_id());
        
         //쪽지작성 및 저장
         letterVO.setU_id(userVO.getU_id());
         letterVO.setL_title(pickjoinlistVO.getParty_title());
         letterservice.requestsystemletter(letterVO);
         int lid = letterservice.getlid();
         
         
         LetterlistVO letterlistVO = new LetterlistVO();
         letterlistVO.setU_id(userVO.getU_id());
         letterlistVO.setL_id(lid);
         
         //내가 보낸쪽지로 저장되기 위해
         letterservice.sendsystemletter(letterlistVO);
         
         letterlistVO.setU_id(pickjoinlistVO.getU_id());
         
         //수신자가 받은쪽지로 저장되기 위해
         letterservice.receivesystemletter(letterlistVO);
         
         String url = (String)session.getAttribute("url");
         logger.info(url);
         response.sendRedirect(url);
         
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
      
      //파티 참여를 수락한 경우.
      @RequestMapping(value = "/joinaccept", method = RequestMethod.GET)
      public String joinapprove(HttpSession session, PartylistVO partylistVO, LetterVO letterVO, HttpServletResponse response) throws Exception{
         logger.info("joinaccept");
         
         //Join_Flag를 2로 변경해주는 부분
         service.joinaccept(partylistVO);
         
         UserVO userVO = (UserVO)session.getAttribute("user");
         
         //조인 수락 시스템 메세지 작성
         letterVO.setU_id(userVO.getU_id());
         letterVO.setL_title(partylistVO.getParty_title());
         letterservice.acceptsystemletter(letterVO);
         int lid = letterservice.getlid();
         
         
         LetterlistVO letterlistVO = new LetterlistVO();
         letterlistVO.setU_id(userVO.getU_id());
         letterlistVO.setL_id(lid);
         
         //내가 보낸쪽지로 저장되기 위해
         letterservice.sendsystemletter(letterlistVO);
         
         letterlistVO.setU_id(partylistVO.getU_id());
         
         //수신자가 받은쪽지로 저장되기 위해
         letterservice.receivesystemletter(letterlistVO);
         

		return "redirect:/letter/letterlist";
         
      }
      
      //파티 참여를 거절한 경우.
      @RequestMapping(value = "/joinreject", method = RequestMethod.GET)
      public String joinreject(HttpSession session, PartylistVO partylistVO, LetterVO letterVO, HttpServletResponse response) throws Exception{
         logger.info("joinreject");
         
         //Join_Flag를 0으로 변경해주는 부분
         service.joinreject(partylistVO);
         
         UserVO userVO = (UserVO)session.getAttribute("user");
         
         //조인 수락 시스템 메세지 작성
         letterVO.setU_id(userVO.getU_id());
         letterVO.setL_title(partylistVO.getParty_title());
         letterservice.rejectsystemletter(letterVO);
         int lid = letterservice.getlid();
         
         
         LetterlistVO letterlistVO = new LetterlistVO();
         letterlistVO.setU_id(userVO.getU_id());
         letterlistVO.setL_id(lid);
         
         //내가 보낸쪽지로 저장되기 위해
         letterservice.sendsystemletter(letterlistVO);
         
         letterlistVO.setU_id(partylistVO.getU_id());
         
         //수신자가 받은쪽지로 저장되기 위해
         letterservice.receivesystemletter(letterlistVO);
         

		return "redirect:/letter/letterlist";
         
      }
}