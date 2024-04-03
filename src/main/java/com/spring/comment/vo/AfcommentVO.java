package com.spring.comment.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class AfcommentVO {
	private int afcommentId=0;			//댓글 고유ID
	private String afcommentContent="";		//댓글 내용
	private Date afcommentDate;			//댓글 작성일
	private int afboardId=0;				//입양후기글ID
	private String userId="";				//댓글 작성자 회원ID

	private String reUserId			= "";		//신고한 회원의 ID
	private String reportDetail		= "";	//신고 상세
	private int reportId			= 0;			//신고 ID
	private int reportSort			= 0;			//신고 구분

}
