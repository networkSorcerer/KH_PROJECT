package com.spring.sanction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.sanction.service.SanctionService;
import com.spring.sanction.vo.SanctionVO;

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@RequestMapping("/sanction/*")
@Controller
public class SanctionController {
	
	@Autowired
	private SanctionService sanctionService;
		
	@PostMapping("sanctionInsert")
	public String sanctionInsert(SanctionVO svo) {
//		log.info("sanctionInsert 호출");
		

		sanctionService.sanctionInsert(svo);
			
		return "redirect:/report/reportList";
	}
	
	
	
	
}
