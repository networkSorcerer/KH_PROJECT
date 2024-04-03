package com.spring.application.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.application.service.ApplicationService;
import com.spring.application.vo.ApplicationVO;
import com.spring.common.vo.PageDTO;
import com.spring.user.vo.UserVO;
import com.spring.volunteer.vo.VolunteerVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/application/*")
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	
	@ResponseBody
	@GetMapping("/{volunteerId}")
	public int applicationCount(@PathVariable("volunteerId") int volunteerId, ApplicationVO applicationVO) {
		int applicationCount = 0;
		applicationVO.getVolunteer().setVolunteerId(volunteerId);
		applicationCount = service.applicationCount(applicationVO);
		return applicationCount;
	}
	
	@ResponseBody
	@PostMapping("/{volunteerId}")
	public List<ApplicationVO> applicationList(@PathVariable("volunteerId") int volunteerId, ApplicationVO applicationVO) {
		List<ApplicationVO> applicationList = null;
		applicationVO.getVolunteer().setVolunteerId(volunteerId);
		applicationList = service.applicationList(applicationVO);
		return applicationList;
	}
	
	@PostMapping("/applicationSubmit")
	public String applicationSubmit(Model model, RedirectAttributes ras, ApplicationVO applicationVO, UserVO user, VolunteerVO volunteer) {
        int result = 0;
        String url = "";
        applicationVO.getUser().setUserId(user.getUserId());
        applicationVO.setApplicationComment(applicationVO.getApplicationComment());
        applicationVO.getVolunteer().setVolunteerId(volunteer.getVolunteerId());
        result = service.applicationSubmit(applicationVO);
		if(result == 1) {
			url = "/project/volunteer";
		} else {
			ras.addFlashAttribute("errorMsg", "입력에 문제가 있어 다시 진행해 주세요.");
			url = "/project/volunteer";
		}
		return "redirect:"+url;
	}
	
	@GetMapping("/applicationView")
	public String applicationView(String userId, ApplicationVO applicationVO, Model model, UserVO user) {
		applicationVO.getUser().setUserId(user.getUserId());
		int applicationViewCnt = 0;
		applicationViewCnt = service.applicationViewCnt(userId);
		model.addAttribute("pageMaker", new PageDTO(applicationVO, applicationViewCnt));
		List<ApplicationVO> applicationView = null;
		applicationView = service.applicationView(applicationVO);
		model.addAttribute("view", applicationView);
		return "application/applicationView";
	}
	
	@PostMapping("/applicationDelete")
	public String applicationDelete(ApplicationVO applicationVO, String userId,RedirectAttributes ras){
		int result = 0;
		String url = "";
		
        if (userId == null) {
            // 세션에 사용자 ID가 없는 경우 메시지를 추가하고 로그인 페이지로 리다이렉트
            ras.addAttribute("errorMsg", "로그인이 필요합니다.");
            return "user/myPage";
        } 
        log.info("로그인 테스트 2");
		result = service.applicationDelete(applicationVO);
		if(result == 1) {
			System.out.println(applicationVO);
			url = "/application/applicationView?userId="+userId;
		} else {
			ras.addFlashAttribute("errorMsg", "취소에 실패했습니다. 잠시후에 다시시도해 주세요.");
			url = "/application/applicationView";
		}
		log.info("로그인 테스트 3");
		return "redirect:"+url;
	}
	
	@ResponseBody
	@PostMapping("/applicationCheck")
	public int applicationCheck(ApplicationVO applicationVO, VolunteerVO volunteer, UserVO user) {
		applicationVO.getUser().setUserId(user.getUserId());
        applicationVO.getVolunteer().setVolunteerId(volunteer.getVolunteerId());
        int applicationCheck = service.applicatoinCheck(applicationVO);
        return applicationCheck;
	}
	
	@ResponseBody
	 @PostMapping("/increaseUserVolCnt")
	    public void increaseUserVolCnt(String[]  userIds) {
		 	/*int result = 0;
	        String url = "";
	        result = service.increaseUserVolCnt(userIds);
	        applicationVO.getVolunteer().setVolunteerId(volunteer.getVolunteerId());
			if(result == 1) {
				url = "/volunteer/adminVolunteer/";
			}
			return "redirect:" + url;*/
		 	service.increaseUserVolCnt(userIds);
	    }
	
	@ResponseBody
	@PostMapping("/changeResult")
	public void changeResult(String applicationId, @RequestParam(value="applicationIds") ArrayList<Integer> applicationIds) {
		log.info("봉사 아이디 " + applicationId);
		log.info("전체 봉사 아이디 " + applicationIds.toString());
		service.chageResult(applicationIds);
	}
	
}
