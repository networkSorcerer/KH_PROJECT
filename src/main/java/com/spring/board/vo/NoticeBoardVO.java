package com.spring.board.vo;

import java.sql.Date;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeBoardVO extends CommonVO{
	/*
	 * nboard_id	number		NOT NULL,
	nboard_title	varchar2(80)		NOT NULL,
	nboard_content	varchar2(2000)		NOT NULL,
	nboard_date	date	DEFAULT sysdate	NOT NULL,
	nboard_cnt	number	DEFAULT 0	NOT NULL,
	admin_id	varchar2(20)		NOT NULL
	 */
	
	private int nboardId				=0;		//공지글ID
	private String nboardTitle			="";		//공지글 제목
	private String nboardContent		="";		//공지글 내용
	private Date nboardDate;			//공지글 작성일
	private int nboardCnt				=0;			//공지글 조회수
	public String adminId				="";			//관리자ID

}
