package com.spring.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.report.service.ReportService;
import com.spring.report.vo.ReportVO;

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@RequestMapping("/report/*")
@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	
	//reportList.jsp 출력 기능
	@GetMapping("reportList")
	public String reportList(@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO, ReportVO rvo, Model model) {
		//		log.info("reportList 호출");
		if(adminLoginVO == null) {
			return "/admin/adminLogin";
		} else {
			List<ReportVO> reportList = reportService.reportList(rvo);
			model.addAttribute("reportList", reportList);
			System.out.println(reportList);
			return "admin/report/reportList";	
		}
	}
	
	
	//reportDetail.jsp 출력 기능
	@GetMapping("reportDetail")
	public String reportDetail(@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO, ReportVO rvo, Model model) {
//		log.info("reportDetail 호출");
		if(adminLoginVO == null) {
			return "/admin/adminLogin";
		} else {
			ReportVO detail = reportService.reportDetail(rvo);
			model.addAttribute("detail", detail);
			return "admin/report/reportDetail";
		}
	}
	
	//신고기능
	@PostMapping("reportInsertFB")
	public String reportInsertFB(ReportVO rvo){
//		log.info("reportInsert 호출");
		reportService.reportInsertFB(rvo);
		return "redirect:/board/freeBoardList";
	}	
	@PostMapping("reportInsertVB")
	public String reportInsertVB(ReportVO rvo){
		reportService.reportInsertVB(rvo);
		return "redirect:/volunteerFeedbackBoard/volunteerFeedbackBoardList";
	}
	@PostMapping("reportInsertAB")
	public String reportInsertAB(ReportVO rvo){
		reportService.reportInsertAB(rvo);
		return "redirect:/adoptionFeedbackBoard/adoptionFeedbackBoardList";
	}
	@PostMapping("reportInsertFC")
	public String reportInsertFC(ReportVO rvo){
//		System.out.println(rvo);
		reportService.reportInsertFC(rvo);
		return "redirect:/board/freeBoardList";
	}
	@PostMapping("reportInsertVC")
	public String reportInsertVC(ReportVO rvo){
		reportService.reportInsertVC(rvo);
		return "redirect:/volunteerFeedbackBoard/volunteerFeedbackBoardList";
	}
	@PostMapping("reportInsertAC")
	public String reportInsertAC(ReportVO rvo){
		reportService.reportInsertAC(rvo);
		return "redirect:/adoptionFeedbackBoard/adoptionFeedbackBoardList";
	}

	//신고 처리 시 report_status 수정 기능
	@PostMapping("reportUpdateFB")
	public String reportUpdateFB(ReportVO rvo) {
//		log.info("reportUpdate 호출");
		reportService.reportUpdateFB(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("reportUpdateVB")
	public String reportUpdateVB(ReportVO rvo) {
//		log.info("reportUpdate 호출");
		reportService.reportUpdateVB(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("reportUpdateAB")
	public String reportUpdateAB(ReportVO rvo) {
//		log.info("reportUpdate 호출");
		reportService.reportUpdateAB(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("reportUpdateFC")
	public String reportUpdateFC(ReportVO rvo) {
//		log.info("reportUpdate 호출");
		reportService.reportUpdateFC(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("reportUpdateVC")
	public String reportUpdateVC(ReportVO rvo) {
//		log.info("reportUpdate 호출");
		reportService.reportUpdateVC(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("reportUpdateAC")
	public String reportUpdateAC(ReportVO rvo) {
//		log.info("reportUpdate 호출");
		reportService.reportUpdateAC(rvo);
		return "redirect:/report/reportList";
	}

	//신고 취소 기능
	@PostMapping("reportDelete")
	public String reportDelete(ReportVO rvo){
//		log.info("reportDelete call");
//		System.out.println(rvo);
		reportService.reportDelete(rvo);
		return "redirect:/board/freeBoardList";
	}
	
	//신고 수정 폼 데이터
	@GetMapping("reportUpdateForm")
	public void reportUpdateForm(ReportVO rvo, Model model) {
		ReportVO reportUpdateData = reportService.reportUpdateForm(rvo);
		model.addAttribute("reportUpdateData", reportUpdateData);
	}
	
	//신고 수정 기능
	@PostMapping("reportModify")
	public String reportModify(ReportVO rvo){
//		log.info("reportModify call");
		reportService.reportModify(rvo);
		return "redirect:/board/freeBoardList";
	}
	
	//신고 제재 횟수 증가 기능
	@PostMapping("repcntUpdate")
	public String repcntUpdate(ReportVO rvo){
//		log.info("repcntUpdate call");
//		System.out.println("userId = " + rvo.getUserId());
		reportService.repcntUpdate(rvo);
		return "redirect:/report/reportList";
	}
	
	//신고 제재 시 게시물 삭제 기능
	@PostMapping("contentDeleteFB")
	public String contentDeleteFB(ReportVO rvo) {
//		log.info("contentDeleteFB call");
		reportService.contentDeleteFB(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("contentDeleteVB")
	public String contentDeleteVB(ReportVO rvo) {
//		log.info("contentDeleteVB call");
		reportService.contentDeleteVB(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("contentDeleteAB")
	public String contentDeleteAB(ReportVO rvo) {
//		log.info("contentDeleteAB call");
		reportService.contentDeleteAB(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("contentDeleteFC")
	public String contentDeleteFC(ReportVO rvo) {
//		log.info("contentDeleteFC call");
		reportService.contentDeleteFC(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("contentDeleteVC")
	public String contentDeleteVC(ReportVO rvo) {
//		log.info("contentDeleteVC call");
		reportService.contentDeleteVC(rvo);
		return "redirect:/report/reportList";
	}
	@PostMapping("contentDeleteAC")
	public String contentDeleteAC(ReportVO rvo) {
//		log.info("contentDeleteAC call");
		reportService.contentDeleteAC(rvo);
		return "redirect:/report/reportList";
	}
	
	@PostMapping("userStop")
	public String userStop(ReportVO rvo) {
//		log.info("userStop call");
		reportService.userStop(rvo);
		return "redirect:/report/reportList";
	}
//	@PostMapping("userGo")
//	public String userGo(ReportVO rvo) {
//		log.info("userGo call");
//		reportService.userGo(rvo);
//		return "redirect:/report/reportList";
//	}	
	@PostMapping("userGoStop")
	public String userGoStop(ReportVO rvo) {
//		log.info("userGoStop call");
		reportService.userStop(rvo);
		return "redirect:/report/reportList";
	}
	
	
	@PostMapping("userDelete")
	public String userDelete(ReportVO rvo) {
//		log.info("userDelete call");
		reportService.userDelete(rvo);
		return "redirect:/report/reportList";
	}
	
	
}
