package com.spring.donate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.donate.dao.DonateDAO;
import com.spring.donate.vo.DonateVO;


@Service
public class DonateServiceImpl implements DonateService{
	
	@Autowired
	private DonateDAO doDAO;
	
	@Override
	public int donateInsert (DonateVO dovo) {
		int result = doDAO.donateInser(dovo);
		return result;
	}

	@Override
	public List<DonateVO> donateList(DonateVO dovo) {
		List<DonateVO> donatList = doDAO.donateList(dovo);
		return donatList;
	}

}
