package com.spring.sanction.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spring.sanction.vo.SanctionVO;

@Mapper
public interface SanctionDao {
	public int sanctionInsert(SanctionVO svo);
}
