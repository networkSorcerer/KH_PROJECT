package com.spring.map.serivce;

import java.util.List;

import com.spring.map.vo.MapVO;



public interface MapService {
	//public StringBuffer daejeonTourList() throws Exception;
	public List<MapVO> mapList(MapVO mvo);
	
}
