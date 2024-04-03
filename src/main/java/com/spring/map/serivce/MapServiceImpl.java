package com.spring.map.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.map.dao.MapDAO;
import com.spring.map.vo.MapVO;

import lombok.Setter;

@Service
public class MapServiceImpl implements MapService {
	//@Override
	//public StringBuffer daejeonTourList() throws Exception {
	//	StringBuffer site = new StringBuffer("https://apis.data.go.kr/6300000/openapi2022/tourspot/gettourspot");
	//	site.append("?" + URLEncoder.encode("serviceKey", "UTF-8")+ "=Va8g%2BwrI2rBylM2BYEtI2nMGQz0tlWWqvFNg6SiQlqZaMizJqW9jQ15LoKxKTXWaPCs7eqiADX3QMVswr8DMLQ%3D%3D");
	//	site.append("&" + URLEncoder.encode("pageNo","UTF-8")+"=" +URLEncoder.encode("1","UTF-8"));
	//	site.append("&" +URLEncoder.encode("numOfRows","UTF-8")+ "=" +URLEncoder.encode("20","UTF-8"));
		
	//	OpenApiDTO openApi = new OpenApiDTO (site.toString(), "GET");
	//	StringBuffer result = URLConnectUtil.openAPIData(openApi);
	//	return result;
	//}
	
	
	@Setter(onMethod_=@Autowired)
	private MapDAO mapDAO;
	
	
	//글 목록 구현 
	@Override
	public List<MapVO> mapList(MapVO mvo) {
		List<MapVO> list = null;
		list = mapDAO.mapList(mvo);
		return list;
	}

	
}
