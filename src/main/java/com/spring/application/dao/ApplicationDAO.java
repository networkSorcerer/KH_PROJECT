package com.spring.application.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.application.vo.ApplicationVO;

@Mapper
public interface ApplicationDAO {
	// 총 신청자 수 
	public int applicationCount(ApplicationVO applicationVO);
	
	// 관리자 페이지에서 보이는 총 신청자 정보
	public List<ApplicationVO> applicationList(ApplicationVO applicationVO);
	
	// 봉사 신청
	public int applicationSubmit(ApplicationVO applicationVO);
	
	// 마이페이지에서 유저가 볼수있는 신청 정보
	public List<ApplicationVO> applicationView(ApplicationVO applicationVO);
	public int applicationViewCnt(String userId);
	
	// 마이페이지에서 신청 정보 삭제
	public int applicationDelete(ApplicationVO applicationVO);
	
	// 봉사 공고 신청 여부 확인
	public int applicationCheck(ApplicationVO applicationVO);
	
	// 봉사 실행 여부에 따라 봉사 활동 증가
	public int increaseUserVolCnt(String[] userIds);
	
	// 봉사 실행 여부에 따라 applicationResult 값 변경
	public int changeResult(List<Integer> applicationIds);

}
