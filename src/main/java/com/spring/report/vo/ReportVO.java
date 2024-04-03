package com.spring.report.vo;

import lombok.Data;

@Data
public class ReportVO {
	private int reportId			= 0;
	private int reportSort			= 0;
	private String reportDate;	
	private String reportDetail		= "";
	private int reportStatus;
	
	//모든 게시판 VO 파일 참조 필요
	private String userId			= "";
	private int fboardId			= 0;
	private int vfboardId			= 0;
	private int afboardId			= 0;
	private int fcommentId			= 0;
	private int vfcommentId			= 0;
	private int afcommentId			= 0;
	
	private String boardTitle		= "";
	private String boardDate		= "";
	private String boardUser		= "";
	private String boardContent		= "";
	private int boardId				= 0;
	private int repcnt				= 0;
	
	
	
}
