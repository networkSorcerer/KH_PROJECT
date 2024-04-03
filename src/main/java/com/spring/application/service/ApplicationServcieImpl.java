package com.spring.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.application.dao.ApplicationDAO;
import com.spring.application.vo.ApplicationVO;
import com.spring.volunteer.vo.VolunteerVO;

@Service
public class ApplicationServcieImpl implements ApplicationService{
	@Autowired
	private ApplicationDAO applicationDAO;

	@Override
	public int applicationCount(ApplicationVO applicationVO) {
		int applicationCount = 0;
		applicationCount = applicationDAO.applicationCount(applicationVO);
		return applicationCount;
	}

	@Override
	public List<ApplicationVO> applicationList(ApplicationVO applicationVO) {
		List<ApplicationVO> applicationList = applicationDAO.applicationList(applicationVO);
		return applicationList;
	}

	@Override
	public int applicationSubmit(ApplicationVO applicationVO) {
		int applicationSubmit = 0;
		applicationSubmit = applicationDAO.applicationSubmit(applicationVO);
		return applicationSubmit;
	}

	@Override
	public List<ApplicationVO> applicationView(ApplicationVO applicationVO) {
		List<ApplicationVO> applicationView = applicationDAO.applicationView(applicationVO);
		return applicationView;
	}
	public int applicationViewCnt(String userId) {
		int applicationViewCnt = applicationDAO.applicationViewCnt(userId);
		return applicationViewCnt;
	}
	
	@Override
	public int applicationDelete(ApplicationVO applicationVO) {
		int applicationDelete = applicationDAO.applicationDelete(applicationVO);
		return applicationDelete;
	}

	@Override
	public int applicatoinCheck(ApplicationVO applicatinoVO) {
		int applicationCheck = 0;
		applicationCheck = applicationDAO.applicationCheck( applicatinoVO);
		return applicationCheck;
	}

	@Override
	public int increaseUserVolCnt(String[] userIds) {
		int increaseUserVolCnt = 0;
		increaseUserVolCnt = applicationDAO.increaseUserVolCnt(userIds);
		return increaseUserVolCnt;
	}

	@Override
	public int chageResult(List<Integer> applicationIds) {
		int changeResult = 0;
		changeResult = applicationDAO.changeResult(applicationIds);
		return changeResult;
	}
}
