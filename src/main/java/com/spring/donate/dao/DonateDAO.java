package com.spring.donate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.donate.vo.DonateVO;

@Mapper
public interface DonateDAO {
	List<DonateVO> donateList (DonateVO dovo);
	public int donateInser (DonateVO dovo);
}
