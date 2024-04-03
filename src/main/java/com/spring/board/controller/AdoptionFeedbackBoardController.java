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

import com.spring.board.service.AdoptionFeedbackBoardService;
import com.spring.board.vo.AdoptionFeedbackBoardVO;
import com.spring.common.vo.PageDTO;
import com.spring.user.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/adoptionFeedbackBoard/*")
@Controller
public class AdoptionFeedbackBoardController {
	@Setter(onMethod_=@Autowired)
	private AdoptionFeedbackBoardService adoptionFeedbackBoardService;
	
	

	@GetMapping(value = "adoptionFeedbackBoardList")
	public String adoptionFeedbackBoardList(@ModelAttribute AdoptionFeedbackBoardVO afbvo, Model model) {
		log.info("입양후기게시글불러오기");
		List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList = adoptionFeedbackBoardService.adoptionFeedbackBoardList(afbvo);
		model.addAttribute("adoptionFeedbackBoardList", adoptionFeedbackBoardList);
		log.info("입양후기게시글불러오기완료");
		
		int total = adoptionFeedbackBoardService.adoptionFeedbackBoardListCnt(afbvo);
		model.addAttribute("pageMaker", new PageDTO(afbvo, total));
		
		return "board/adoptionFeedbackBoardList";
		
	}
	
	// 게시글 조회
	@GetMapping(value = "adoptionFeedbackBoardDetail")
	public String adoptionFeedbackBoardDetail(Model model, AdoptionFeedbackBoardVO afbvo){
		model.addAttribute("adoptionFeedbackBoard", adoptionFeedbackBoardService.adoptionFeedbackBoardDetail(afbvo));
		
		//조회수 +1
		adoptionFeedbackBoardService.plusCnt(afbvo);
		
		return "board/adoptionFeedbackBoardDetail";
	}
	
	//게시글 등록하는 페이지 접속
	@GetMapping(value = "adoptionFeedbackBoardCreate")
	public String getCreate(@SessionAttribute("userLogin") UserVO userLogin, Model model) throws Exception{
		model.addAttribute("userLogin", userLogin);
		return "board/adoptionFeedbackBoardCreate";
	}
	
	//게시글 등록하기
	@PostMapping(value = "adoptionFeedbackBoardCreate")
	public String adoptionFeedbackBoardCreate(AdoptionFeedbackBoardVO afbvo){
		
		adoptionFeedbackBoardService.insertAdoptionFeedbackBoard(afbvo);
		
		
		return "redirect:/adoptionFeedbackBoard/adoptionFeedbackBoardList";
	}
	
	//게시글 수정
	@GetMapping(value = "adoptionFeedbackBoardModify")
	public String modify(AdoptionFeedbackBoardVO afbvo, Model model) {
		model.addAttribute("adoptionFeedbackBoard", adoptionFeedbackBoardService.adoptionFeedbackBoardDetail(afbvo));
		return "board/adoptionFeedbackBoardModify";
	}
	
	@PostMapping(value = "adoptionFeedbackBoardModify")
	public String modify(AdoptionFeedbackBoardVO afbvo) {
		log.info("수정");
		adoptionFeedbackBoardService.updateAdoptionFeedbackBoard(afbvo);
		log.info("수정2");
		return "redirect:/adoptionFeedbackBoard/adoptionFeedbackBoardDetail?afboardId="+afbvo.getAfboardId();
	}
	
	//게시글 삭제
	@GetMapping(value = "delete")
	public String delete(AdoptionFeedbackBoardVO afbvo){
		log.info("삭제" + afbvo);
		adoptionFeedbackBoardService.deleteAdoptionFeedbackBoard(afbvo);
		log.info("삭제완료");
		return "redirect:/adoptionFeedbackBoard/adoptionFeedbackBoardList";
	}
	
	// 내가 작성한 게시글 히스토리
	@GetMapping(value = "adoptionFeedbackBoardHistory")
	public String boardCreateHistory (AdoptionFeedbackBoardVO afbvo, Model model) {
		
		List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList = adoptionFeedbackBoardService.adoptionFeedbackBoardList(afbvo);
		model.addAttribute("adoptionFeedbackBoardList", adoptionFeedbackBoardList);
		
		
		return "board/adoptionFeedbackBoardList";
		
	}

}
