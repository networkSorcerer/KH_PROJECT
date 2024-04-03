package com.spring.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.board.vo.NoticeBoardVO;

@Mapper
public interface NoticeBoardDAO {
	///////////////////////// 유저페이지
	// 공지게시판 글 목록(유저페이지)
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO nvo);
	
	//공지게시판 글 상세보기(유저페이지)
	public NoticeBoardVO noticeBoardDetail(NoticeBoardVO nvo);
	
	// 조회수 증가 메서드
	public boolean plusCnt(NoticeBoardVO nvo);
	
	//게시글 갯수 카운트(유저페이지)
	public int noticeBoardListCnt(NoticeBoardVO nvo);
	
	
	
	
	
	///////////////////////// 관리자 페이지
	
	// 공지게시판 글 목록 (관리자 페이지)
	public List<NoticeBoardVO> adminNoticeBoardList(NoticeBoardVO nvo);
	
	//공지게시판 글 상세보기(관리자 페이지)
	public NoticeBoardVO adminNoticeBoardDetail(NoticeBoardVO nvo);

	// 게시글 등록하는 메서드(관리자 페이지)
	public int insertNoticeBoard(NoticeBoardVO nvo);

	// 게시글 수정(관리자 페이지)
	public int updateNoticeBoard(NoticeBoardVO nvo);

	// 게시글 삭제(관리자 페이지)
	public int deleteNoticeBoard(NoticeBoardVO nvo);
	
	//게시글 갯수 카운트 (관리자 페이지)
	public int adminNoticeBoardListCnt(NoticeBoardVO nvo);

}
