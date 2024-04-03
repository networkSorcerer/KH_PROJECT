package com.spring.donate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.donate.vo.DonateVO;

@Controller
@RequestMapping("/donate")
public class DonateController {
	
	
	@GetMapping("/donatepay")
	public String donatepay(DonateVO dovo) {
		return "/donate/donatePay";
	}
	
	@GetMapping("/donateUnit")
	public String donateUnit(DonateVO dovo) {
		return "/donate/donateUnit";
	}
	
	@GetMapping("/donateUpdate")
	public String donateUpdate(DonateVO doVO ) {
		return "/donate/donateUpdate";
	}
}
