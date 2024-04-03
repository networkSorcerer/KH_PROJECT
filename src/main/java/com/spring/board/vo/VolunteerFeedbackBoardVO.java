package com.spring.board.vo;

import java.sql.Date;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(callSuper = false)
public class VolunteerFeedbackBoardVO extends CommonVO{
	private int vfboardId			=0;		//봉사후기글ID
	private String vfboardTitle		="";		//봉사후기글 제목
	private String vfboardContent	="";		//봉사후기글 내용
	private Date vfboardDate;			//봉사후기글 작성일
	private int vfboardCnt			=0;			//봉사후기글 조회수
	private int userVolcnt			=0;
	
	public String userId			="";	//봉사후기글 작성자 회원ID 	
	
	private String reUserId 		= "";	//신고한 회원의 ID
	private String reportDetail		= "";	//신고 상세
	private int reportId			= 0;	//신고 ID
	private int reportSort			= 0;	//신고 구분
	private int reportStatus		= 1;	//신고 상태(1: 신고됨, 2: 처리됨)
}
