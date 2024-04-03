package com.spring.comment.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class FcommentVO {
	private int fcommentId=0;			//댓글 고유ID
	private String fcommentContent="";		//댓글 내용
	private Date fcommentDate;			//댓글 작성일
	private int fboardId=0;				//자유글ID
	private String userId="";				//댓글 작성자 회원ID

	private String reUserId			= "";		//신고한 회원의 ID
	private String reportDetail		= "";	//신고 상세
	private int reportId			= 0;			//신고 ID
	private int reportSort			= 0;			//신고 구분
}
