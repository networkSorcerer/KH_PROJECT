package com.spring.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.map.serivce.MapService;
import com.spring.map.vo.MapVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/map/*")
@Slf4j
public class MapController {
	//@GetMapping("/mapView")
	//public String daejeonTourView() {
	//	log.info("찾아 오시는 길");
	//	
	//	return "map/mapView";
	//}
	
	@Setter(onMethod_=@Autowired)
	private MapService mapService;
	
	@GetMapping("/mapList")
	public String mapList(@ModelAttribute MapVO mvo, Model model) {
		log.info("센터리스트 호출 성공");
		
		List<MapVO> mapList = mapService.mapList(mvo);
		model.addAttribute("mapList", mapList);
		return "project/map/mapList";
	}
//	
//	@ResponseBody
//	@GetMapping(value="/daejeonTourList", produces = "application/json; charset=UTF-8")
//	public String daejeonTourList() throws Exception {
//		log.info("대전광역시 문화관광(관광지) 리스트 ");
//		
//		StringBuffer sb =  dataService.daejeonTourList();
//		return sb.toString();
//	}
	
	 @GetMapping("/mapData")
	    @ResponseBody
	    public List<Map<String, Double>> getMapData() {
	        List<MapVO> mapList = mapService.mapList(new MapVO());
	        List<Map<String, Double>> mapData = new ArrayList<>();

	        for (MapVO center : mapList) {
	            Map<String, Double> data = new HashMap<>();
	            data.put("lat", (double) center.getCenterLat());
	            data.put("lng", (double) center.getCenterLot());
	            mapData.add(data);
	        }

	        return mapData;
	    }
	 
	 
}
