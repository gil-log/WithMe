package com.withme.main;


import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.withme.vo.PartyVO;
import com.withme.vo.PickJoinListVO;
import com.withme.vo.UserVO;
import com.withme.vo.LetterPageMakerVO;
import com.withme.vo.LetterVO;
import com.withme.vo.LetterlistVO;
import com.withme.vo.PageMaker;
import com.withme.service.LetterService;

@Controller
@RequestMapping("/letter/*")
public class letterController {

	private static final Logger logger = LoggerFactory.getLogger(letterController.class);

	@Inject
	LetterService service;
		
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
		
		// 쪽지 상세보기
		@RequestMapping(value = "/letterreadView", method = RequestMethod.GET)
		public String read(HttpSession session, LetterVO letterVO, Model model) throws Exception{
			logger.info("letterreadView");
			
			UserVO userVO = (UserVO) session.getAttribute("user");
			String userID = userVO.getU_id();
			
			//letterlistVO에 u_id, l_id 설정
			LetterlistVO letterlistVO = new LetterlistVO();
			
			letterlistVO.setU_id(userID);
			letterlistVO.setL_id(letterVO.getL_id());
			model.addAttribute("readletter", service.readletter(letterlistVO));
			
			return "letter/letterreadView";
		}

		//letterlist 조회 + 페이징 추가
		@RequestMapping(value = "/letterlist", method = RequestMethod.GET)
		public String letterlist(HttpSession session, @RequestParam(value="receiveNum", defaultValue="1") int receiveNum, 
								 @RequestParam(value="sendNum",  defaultValue="1") int sendNum, Model model) throws Exception{
			logger.info("letterlist");
			
			UserVO userVO = (UserVO) session.getAttribute("user");
			String userID = userVO.getU_id();
			
			//총 수신 쪽지 갯수
			int receivecount = service.receivecount(userID);
			
			//수신쪽지함에 페이지에 출력할 갯수
			int receivePostNum = 4;
			LetterPageMakerVO receiveletter = new LetterPageMakerVO();
			receiveletter.setU_id(userID);
			
			//하단의 페이징 번호 수
			int receivePageNum = (int)Math.ceil((double)receivecount/receivePostNum);
			
			// 출력할 게시물
			int receiveDisplayPost = (receiveNum-1)*receivePostNum + 1;
			receiveletter.setPostNum(receivePostNum);
			receiveletter.setDisplayPost(receiveDisplayPost);
			
			//한번에 표시할 페이징 번호의 갯수
			int pageNum_cnt = 4;
			//표시되는 페이지 번호 중 마지막 번호
			int receiveEndPageNum = (int)(Math.ceil((double)receiveNum/(double)pageNum_cnt) *pageNum_cnt);
			//표시되는 페이지 번호 중 첫번째 번호
			int receiveStartPageNum = receiveEndPageNum - (pageNum_cnt - 1);
			
			//마지막 번호 재계산
			int receiveEndPageNum_tmp =  (int)(Math.ceil((double)receivecount/(double)receivePostNum));
			
			if(receiveEndPageNum > receiveEndPageNum_tmp) {
				receiveEndPageNum = receiveEndPageNum_tmp;
			}
			
			boolean receivePrev = receiveStartPageNum == 1 ? false : true;
			boolean receiveNext = receiveEndPageNum * pageNum_cnt >= receivecount ? false : true;
			
			List<LetterlistVO> receiveletterlist = service.receiveletterlist(receiveletter); 

			model.addAttribute("receiveletterlist", receiveletterlist);
			model.addAttribute("receivePageNum", receivePageNum);
			
			//시작 및 끝 번호
			model.addAttribute("receiveStartPageNum" , receiveStartPageNum);
			model.addAttribute("receiveEndPageNum" , receiveEndPageNum);
			
			//이전, 현재, 다음
			model.addAttribute("receivePrev", receivePrev);
			model.addAttribute("receiveNow", receiveNum);
			model.addAttribute("receiveNext", receiveNext);
			
			/*보낸 쪽지함*/
			
			//총 발신 쪽지 갯수
			int sendcount = service.sendcount(userID);
			
			//수신쪽지함에 페이지에 출력할 갯수
			int sendPostNum = 4;
			LetterPageMakerVO sendletter = new LetterPageMakerVO();
			sendletter.setU_id(userID);
			
			//발신쪽지함에 페이징 번호
			int sendPageNum = (int)Math.ceil((double)sendcount/sendPostNum);
			
			//출력할 게시물
			int sendDisplayPost = (sendNum-1)*sendPostNum + 1;
			sendletter.setPostNum(sendPostNum);
			sendletter.setDisplayPost(sendDisplayPost);
			
			//표시되는 페이지 번호 중 마지막 번호
			int sendEndPageNum = (int)(Math.ceil((double)sendNum/(double)pageNum_cnt) *pageNum_cnt);
			//표시되는 페이지 번호 중 첫번째 번호
			int sendStartPageNum = sendEndPageNum - (pageNum_cnt - 1);
			
			//마지막 번호 재계산
			int sendEndPageNum_tmp =  (int)(Math.ceil((double)sendcount/(double)sendPostNum));
			
			if(sendEndPageNum > sendEndPageNum_tmp) {
				sendEndPageNum = sendEndPageNum_tmp;
			}
			
			boolean sendPrev = sendStartPageNum == 1 ? false : true;
			boolean sendNext = sendEndPageNum * pageNum_cnt >= sendcount ? false : true;
			
			List<LetterlistVO> sendletterlist = service.sendletterlist(sendletter); 
			model.addAttribute("sendletterlist", sendletterlist);
			model.addAttribute("sendPageNum", sendPageNum);
			
			//시작 및 끝 번호
			model.addAttribute("sendStartPageNum" , sendStartPageNum);
			model.addAttribute("sendEndPageNum" , sendEndPageNum);
			
			//이전, 현재, 다음
			model.addAttribute("sendPrev", sendPrev);
			model.addAttribute("sendNow", sendNum);
			model.addAttribute("sendNext", sendNext);
			
			
			return "letter/letterList";
		}
}
