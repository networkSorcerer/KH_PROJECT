package com.spring.sanction.vo;


import lombok.Data;

@Data
public class SanctionVO {
	private int sanctionId;
	private int sanctionStatus;
	private int sanctionResult;
	private int sanctionDate;
	
	private String boardUser;
	private String reportId;
	
}
