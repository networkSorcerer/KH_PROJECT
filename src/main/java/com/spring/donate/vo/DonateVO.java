package com.spring.donate.vo;

import lombok.Data;

@Data
public class DonateVO {
	private int do_id;				// 후원 아이디
	private int do_price;			// 후원 가격
	private String do_day;			// 후원 일정
	private String do_PM;			// 결제 수단
	private String do_FDay;			// 첫 결제일
	private int do_SPrice;			// 총 후원금액
	private String do_AHName;		// 예금주 이름
	private String do_AHPhone;		// 예금주 번호
}
