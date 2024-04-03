package com.spring.volunteer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.user.vo.UserVO;
import com.spring.volunteer.service.VolunteerService;
import com.spring.volunteer.vo.VolunteerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/volunteer/*")
@Controller
public class VolunteerController {
	@Autowired
	private VolunteerService service;
	
	/* users */
	
	// 봉사일정 리스트 구현
	@ResponseBody
	@GetMapping(value="/volunteerList", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<VolunteerVO> volunteerList(VolunteerVO volunteerVO) {
		List<VolunteerVO> volunteerList = null;
		volunteerList = service.volunteerList(volunteerVO);
		return volunteerList;
	}
	
	// 봉사 일정 상세 정보 구현
	@GetMapping("/volunteerDetail")
	public String volunteerDetail(@SessionAttribute(name = "userLogin", required = false) UserVO userLogin, UserVO userVO, VolunteerVO volunteerVO, Model model) {
		if (userLogin != null) {
	        userLogin.getUserId();
	    }
		VolunteerVO volunteerDetail = null;
		volunteerDetail = service.volunteerDetail(volunteerVO);
		model.addAttribute("detail", volunteerDetail);
		return "/volunteer/volunteerDetail";
	}
	
	/* admin */
	// 봉사 일정 리스트 구현(관리자 페이지)
	@ResponseBody
	@GetMapping(value="/adminVolunteerList", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<VolunteerVO> adminvolunteerList(VolunteerVO volunteerVO) {
		List<VolunteerVO> volunteerList = null;
		volunteerList = service.volunteerList(volunteerVO);
		return volunteerList;
	}
	
	// 봉사 입력 양식 이동
	@GetMapping("/volunteerWriteForm")
	public String volunteerWriteForm(@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO, UserVO userVO, VolunteerVO volunteerVO) {
		if(adminLoginVO == null) {
			return "/admin/adminLogin";
		} else {
			return "/admin/volunteer/volunteerWriteForm";

		}
	}
	
	// 봉사 공고 입력 구현
	@PostMapping("/volunteerInsert") 
	public String volunteerInsert(VolunteerVO volunteerVO, RedirectAttributes ras) throws Exception {
		int result = 0;
		String url = "";
		
		result = service.volunteerInsert(volunteerVO);
		if(result == 1) {
			url = "/project/adminVolunteerList";
		} else {
			ras.addFlashAttribute("errorMsg", "입력에 문제가 있어 다시 진행해 주세요.");
			url = "/volunteer/volunteerWriteForm";
		}
		return "redirect:"+url;
	}

	// 관리자 페이지 봉사 공고 상세 정보
	@GetMapping("/adminVolunteerDetail")
	public String adminVolunteerDetail(@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO, VolunteerVO volunteerVO, Model model) {
		if(adminLoginVO == null) {
			return "/admin/adminLogin";
		} else {
			VolunteerVO adminVolunteerDetail = null;
			adminVolunteerDetail = service.volunteerDetail(volunteerVO);
			model.addAttribute("detail", adminVolunteerDetail);
			return "/admin/volunteer/adminVolunteerDetail";
		}
	}
	
	// 관리자 페이지 봉사 공고 수정 폼 이동
	@GetMapping("/volunteerUpdateForm")
	public String volunteerUpdateForm(@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO, VolunteerVO volunteerVO, Model model) {
		if(adminLoginVO == null) {
			return "/admin/adminLogin";
		} else {
			VolunteerVO volunteerUpdateForm = null;
			volunteerUpdateForm = service.volunteerUpdateForm(volunteerVO);
			model.addAttribute("updateList", volunteerUpdateForm);
			return "/admin/volunteer/volunteerUpdateForm";
		}
	}
	
	// 관리자 페이지 봉사 공고 수정
	@PostMapping("/volunteerUpdate")
	public String volunteerUpdate(VolunteerVO volunteerVO) throws Exception {
		int result = 0;
		String url = "";
		
		result = service.volunteerUpdate(volunteerVO);
		int num = volunteerVO.getVolunteerId();
		if(result == 1) {
			url = "/volunteer/adminVolunteerDetail?volunteerId="+num;
		}
		return "redirect:"+url;
	}
	
	// 관리자 페이지 봉사 공고 삭제
	@GetMapping("/volunteerDelete")
	public String volunteerDelete(VolunteerVO volunteerVO) throws Exception {
		int result = 0;
		String url = "";
		
		result = service.volunteerDelete(volunteerVO);
		if(result == 1) {
			url = "/project/adminVolunteerList";
		}
		return "redirect:"+url;
	}
	
}
