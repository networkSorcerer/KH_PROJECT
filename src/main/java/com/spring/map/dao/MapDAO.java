package com.spring.map.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.map.vo.MapVO;

@Mapper
public interface MapDAO {
	public List<MapVO> mapList(MapVO mvo);
	
	
}
