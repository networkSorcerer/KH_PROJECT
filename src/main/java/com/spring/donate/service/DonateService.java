package com.spring.donate.service;

import java.util.List;

import com.spring.donate.vo.DonateVO;

public interface DonateService {
	public List<DonateVO> donateList (DonateVO dovo);
	public int donateInsert (DonateVO dovo);
}
