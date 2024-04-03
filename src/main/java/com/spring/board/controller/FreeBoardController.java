package com.spring.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.board.service.AdoptionFeedbackBoardService;
import com.spring.board.service.FreeBoardService;
import com.spring.board.service.VolunteerFeedbackBoardService;
import com.spring.board.vo.AdoptionFeedbackBoardVO;
import com.spring.board.vo.FreeBoardVO;
import com.spring.board.vo.VolunteerFeedbackBoardVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RequestMapping("/board/*")
@Controller
public class FreeBoardController {
	@Setter(onMethod_=@Autowired) 
	private FreeBoardService freeBoardService;
	
	@Autowired
	private VolunteerFeedbackBoardService volunteerFeedbackBoardService;
	
	@Autowired
	private AdoptionFeedbackBoardService adoptionFeedbackBoardService;
	
	@GetMapping(value = "freeBoardList")
	public String freeBoardList(@ModelAttribute FreeBoardVO freeBoardVO, Model model) {
		log.info("게시글불러오기");
		List<FreeBoardVO> freeBoardList = freeBoardService.freeBoardList(freeBoardVO);
		model.addAttribute("freeBoardList", freeBoardList);
		
		int total = freeBoardService.freeBoardListCnt(freeBoardVO);
		model.addAttribute("pageMaker", new PageDTO(freeBoardVO, total)); 
		log.info("게시글불러오기완료");
		
		return "board/freeBoardList";
		
	}
	
	
	// 게시글 조회
	@GetMapping(value = "freeBoardDetail")
	public String freeBoardDetail(Model model, FreeBoardVO freeBoardVO){
		model.addAttribute("freeBoard", 
				freeBoardService.freeBoardDetail(freeBoardVO));
		
		freeBoardService.plusCnt(freeBoardVO);
		
		return "board/freeBoardDetail";
		
	}
	
	//게시글 등록하는 페이지 접속
	@GetMapping(value = "freeBoardCreate")
	public String getCreate() throws Exception{
		return "board/freeBoardCreate";
	}
	
	//게시글 등록하기
	@PostMapping(value = "freeBoardCreate")
	public String freeBoardCreate(FreeBoardVO freeBoardVO){
		
		freeBoardService.insertFreeBoard(freeBoardVO);
		
		//return "redirect:/board/freeBoardDetail?fboardId=" + freeBoardVO.getFboardId();
		
		return "redirect:/board/freeBoardList";
	}
	//게시글 수정
	@GetMapping(value = "freeBoardModify")
	public String modify(FreeBoardVO freeBoardVO, Model model) {
		model.addAttribute("freeBoard", freeBoardService.freeBoardDetail(freeBoardVO));
		return "board/freeBoardModify";
	}
	
	@PostMapping(value = "freeBoardModify")
	public String modify(FreeBoardVO freeBoardVO) {
		log.info("수정");
		freeBoardService.updateFreeBoard(freeBoardVO);
		log.info("수정2");
		return "redirect:/board/freeBoardDetail?fboardId="+freeBoardVO.getFboardId();
	}
	
	//게시글 삭제
	@GetMapping(value = "delete")
	public String delete(FreeBoardVO freeBoardVO){
		
		log.info("삭제" + freeBoardVO);
		freeBoardService.deleteFreeBoard(freeBoardVO);
		log.info("삭제완료");
		return "redirect:/board/freeBoardList";
	}
	
	
	/*
	 * // 내가 작성한 게시글 히스토리
	 * 
	 * @GetMapping(value = "freeBoardHistory") public String boardCreateHistory
	 * (FreeBoardVO freeBoardVO, Model model) {
	 * 
	 * log.info("게시글불러오기"); List<FreeBoardVO> freeBoardList =
	 * freeBoardService.freeBoardList(freeBoardVO);
	 * model.addAttribute("freeBoardList", freeBoardList);
	 * 
	 * return "board/freeBoardList";
	 * 
	 * }
	 */
	
	@GetMapping(value = "getBoardCreateHistory")
	public String getBoardCreateHistory (@ModelAttribute FreeBoardVO fvo, 
		VolunteerFeedbackBoardVO vfvo, AdoptionFeedbackBoardVO afvo, Model model){
		
		List<FreeBoardVO> freeBoardList = freeBoardService.boardCreateHistory(fvo);
		model.addAttribute("fboard", freeBoardList);

		List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList = 
				volunteerFeedbackBoardService.boardCreateHistory(vfvo);
		model.addAttribute("vfboard", volunteerFeedbackBoardList);

		List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList = 
				adoptionFeedbackBoardService.boardCreateHistory(afvo);
		model.addAttribute("afboard", adoptionFeedbackBoardList);
		
		return "board/boardCreateHistory";
	}
	 
}