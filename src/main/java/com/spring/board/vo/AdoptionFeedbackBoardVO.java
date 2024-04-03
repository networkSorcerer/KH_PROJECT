package com.spring.board.vo;

import java.sql.Date;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdoptionFeedbackBoardVO  extends CommonVO{
	
	private int afboardId			=0;		//입양후기글ID
	private String afboardTitle		="";		//입양후기글 제목
	private String afboardContent	="";		//입양후기글 내용
	private Date afboardDate;			//입양후기글 작성일
	private int afboardCnt			=0;			//입양후기글 조회수
	
	public String userId			="";	//입양후기글 작성자 회원ID 	
	
	private String reUserId 		= "";	//신고한 회원의 ID
	private String reportDetail		= "";	//신고 상세
	private int reportId			= 0;	//신고 ID
	private int reportSort			= 0;	//신고 구분
	private int reportStatus		= 1;	//신고 상태(1: 신고됨, 2: 처리됨)

}
