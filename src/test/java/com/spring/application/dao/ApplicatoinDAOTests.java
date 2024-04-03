package com.spring.application.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.application.vo.ApplicationVO;
import com.spring.user.vo.UserVO;
import com.spring.volunteer.vo.VolunteerVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class ApplicatoinDAOTests {
	@Autowired
	private ApplicationDAO applicationDAO;
	
	/* 
	@Test
	public void applicationCount() {
		ApplicationVO applicationVO  = new ApplicationVO();
		applicationVO.getVolunteer().setVolunteerId(2);
		
		log.info("총 갯수 : " + applicationDAO.applicationCount(applicationVO));
	}*/
	
	/*  
	@Test
	public void applicationList() {
	    ApplicationVO applicationVO = new ApplicationVO();
	    // VolunteerVO 객체 생성 및 volunteerId 설정
	    //VolunteerVO volunteerVO = new VolunteerVO();
	    //volunteerVO.setVolunteerId(9);
	    
	    // applicationVO에 volunteerVO 설정
	    applicationVO.getVolunteer().setVolunteerId(9);
	    List<ApplicationVO> applicationList = applicationDAO.applicationList(applicationVO); // volunteerId가 설정된 applicationVO로 쿼리 실행
	    
	    if (applicationList != null) {
	        for(ApplicationVO list : applicationList) {
	            if (list != null) {
	                log.info(list.toString());
	            }
	        }
	        log.info("전체 행 갯수 : " + applicationDAO.applicationList(applicationVO)); // applicationList의 크기 출력
	    } else {
	        log.info("조회된 결과가 없습니다.");
	    }
	}*/
	
	/* 
	@Test
	public void applicationSubmit() {
		ApplicationVO applicationVO = new ApplicationVO();
		applicationVO.setApplicationComment("");
		applicationVO.getUser().setUserId("member03");
		applicationVO.getVolunteer().setVolunteerId(9);
		log.info("총 갯수 : " + applicationDAO.applicationSubmit(applicationVO));
	}*/
	
	/* 
	@Test
	public void applicationViewTest() {
		ApplicationVO applicationVO = new ApplicationVO();
		applicationVO.getUser().setUserId("member10");
		applicationVO.setPageNum(1);
		applicationVO.setAmount(10);
		List<ApplicationVO> applicationView = applicationDAO.applicationView(applicationVO); // volunteerId가 설정된 applicationVO로 쿼리 실행
	    
	    if (applicationView != null) {
	        for(ApplicationVO list : applicationView) {
	            if (list != null) {
	                log.info(list.toString());
	            }
	        }
	        log.info("전체 행 갯수 : " + applicationDAO.applicationView(applicationVO)); // applicationList의 크기 출력
	    } else {
	        log.info("조회된 결과가 없습니다.");
	    }
	}*/ 
	
	/* */
	@Test
	public void applicationDeleteTest() {
		ApplicationVO applicationVO = new ApplicationVO();
		applicationVO.setApplicationId(1);
		log.info("삭제된 행 : " + applicationDAO.applicationDelete(applicationVO));
	}
	
	/* 
	@Test
	public void applicationCheckTest() {
		ApplicationVO applicationVO = new ApplicationVO();
		applicationVO.getUser().setUserId("member11");
		applicationVO.getVolunteer().setVolunteerId(1);
		int applicatinoCheck = applicationDAO.applicationCheck(applicationVO);
		log.info("반환 결과 : " + applicatinoCheck);
	} */
	
	/* 
	@Test
	public void testUpdateUserVolCnt() {
		 // 테스트할 사용자 ID 목록
		String[] userIds = {"member10", "member11"};
		log.info("반환 갯수 : " + applicationDAO.increaseUserVolCnt(userIds));
	} */
	
	/*
	@Test
	public void changeResultTest() {
	    List<Integer> applicationIds = Arrays.asList(80, 93);
	    log.info("반환 행 갯수 : " + applicationDAO.changeResult(applicationIds));
	}*/
	
	/*
	@Test 
	public void applicationViewCnt() {
		String userId = "member10";
		log.info("총 행수 " + applicationDAO.applicationViewCnt(userId));
	}*/
}
