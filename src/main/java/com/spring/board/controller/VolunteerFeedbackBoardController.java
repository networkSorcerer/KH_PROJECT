package com.spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.board.service.VolunteerFeedbackBoardService;
import com.spring.board.vo.VolunteerFeedbackBoardVO;
import com.spring.common.vo.PageDTO;
import com.spring.user.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/volunteerFeedbackBoard/*")
@Controller
public class VolunteerFeedbackBoardController {
	@Setter(onMethod_=@Autowired)
	private VolunteerFeedbackBoardService volunteerFeedbackBoardService;

	@GetMapping(value = "volunteerFeedbackBoardList")
	public String volunteerFeedbackBoardList(@ModelAttribute VolunteerFeedbackBoardVO vfvo, Model model) {
		log.info("봉사후기게시글불러오기");
		List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList = volunteerFeedbackBoardService.volunteerFeedbackBoardList(vfvo);
		model.addAttribute("volunteerFeedbackBoardList", volunteerFeedbackBoardList);
		log.info("봉사후기게시글불러오기완료");
		
		int total = volunteerFeedbackBoardService.volunteerFeedbackBoardListCnt(vfvo);
		model.addAttribute("pageMaker", new PageDTO(vfvo, total));
		
		return "board/volunteerFeedbackBoardList";
	}
	
	// 게시글 조회
	@GetMapping(value = "volunteerFeedbackBoardDetail")
	public String volunteerFeedbackBoardDetail(Model model, VolunteerFeedbackBoardVO vfvo){
		model.addAttribute("volunteerFeedbackBoard", volunteerFeedbackBoardService.volunteerFeedbackBoardDetail(vfvo));
		
		//조회수 +1
		volunteerFeedbackBoardService.plusCnt(vfvo);
		
		return "board/volunteerFeedbackBoardDetail";
	}
	
	//게시글 등록하는 페이지 접속
	@GetMapping(value = "volunteerFeedbackBoardCreate")
	public String getCreate(@SessionAttribute("userLogin") UserVO userLogin, Model model) throws Exception{
		model.addAttribute("userlogin", userLogin);
		return "board/volunteerFeedbackBoardCreate";
	}
	
	//게시글 등록하기
	@PostMapping(value = "volunteerFeedbackBoardCreate")
	public String volunteerFeedbackBoardCreate(VolunteerFeedbackBoardVO vfvo){
		
		volunteerFeedbackBoardService.insertVolunteerFeedbackBoard(vfvo);
		return "redirect:/volunteerFeedbackBoard/volunteerFeedbackBoardList";
	}
	
	//게시글 수정
	@GetMapping(value = "volunteerFeedbackBoardModify")
	public String modify(VolunteerFeedbackBoardVO vfvo, Model model) {
		model.addAttribute("volunteerFeedbackBoard", volunteerFeedbackBoardService.volunteerFeedbackBoardDetail(vfvo));
		return "board/volunteerFeedbackBoardModify";
	}
	
	@PostMapping(value = "volunteerFeedbackBoardModify")
	public String modify(VolunteerFeedbackBoardVO vfvo) {
		log.info("수정");
		volunteerFeedbackBoardService.updateVolunteerFeedbackBoard(vfvo);
		log.info("수정2");
		return "redirect:/volunteerFeedbackBoard/volunteerFeedbackBoardDetail?vfboardId="+vfvo.getVfboardId();
	}
	
	//게시글 삭제
	@GetMapping(value = "delete")
	public String delete(VolunteerFeedbackBoardVO vfvo){
		log.info("삭제" + vfvo);
		volunteerFeedbackBoardService.deleteVolunteerFeedbackBoard(vfvo);
		log.info("삭제완료");
		return "redirect:/volunteerFeedbackBoard/volunteerFeedbackBoardList";
	}
	
	// 내가 작성한 게시글 히스토리
	@GetMapping(value = "volunteerFeedbackBoardHistory")
	public String boardCreateHistory(VolunteerFeedbackBoardVO vfvo, Model model) {
		
		List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList = volunteerFeedbackBoardService.volunteerFeedbackBoardList(vfvo);
		model.addAttribute("volunteerFeedbackBoardList", volunteerFeedbackBoardList);
		
		return "board/volunteerFeedbackBoardList";
	}
	
	

}
