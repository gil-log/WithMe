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

import com.withme.vo.PartylistVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.PartyVO;
import com.withme.vo.PickJoinVO;
import com.withme.service.PickJoinService;

@Controller
@RequestMapping("/pick/*")
public class PickJoinController {

   private static final Logger logger = LoggerFactory.getLogger(PickJoinController.class);

   @Inject
   PickJoinService service;
      
      //picklist 조회
      @RequestMapping(value = "/picklist", method = RequestMethod.GET)
      public String picklist(PickJoinListVO pickjoinlistVO, Model model) throws Exception{
         logger.info("picklist");
         
         model.addAttribute("picklist", service.picklist(pickjoinlistVO.getU_id()));

         return "/pickList";
      }
      
      //party를 pick했을 때 동작.
      @RequestMapping(value = "/pickinsert", method = RequestMethod.GET)
      public String pickinsert(PartylistVO partylistVO) throws Exception{
         logger.info("pickinsert");
         logger.info(partylistVO.getParty_id() + "");
         
         service.pickinsert(partylistVO.getParty_id());
   
         return "redirect:/party/list";
         
      }
      
      //party를 join했을 때 동작.
      @RequestMapping(value = "/joininsert", method = RequestMethod.GET)
      public String joininsert(PartylistVO partylistVO) throws Exception{
         logger.info("joininsert");
         
         service.joininsert(partylistVO.getParty_id());
   
         return "redirect:/party/list";
         
      }
}