package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.NoticeBoardDAO;
import com.spring.board.vo.NoticeBoardVO;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class NoticeBoardServiceImpl implements NoticeBoardService{
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;
	////////////////////유저 페이지
	//공지게시판 글 목록(유저 페이지)
	@Override
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO nvo){
		List<NoticeBoardVO> noticeBoardList = noticeBoardDAO.noticeBoardList(nvo);
		
		return noticeBoardList;
	}
	//공지게시판 글 상세보기(유저 페이지)
	@Override
	public NoticeBoardVO noticeBoardDetail(NoticeBoardVO nvo) {
		NoticeBoardVO noticeBoardDetail = noticeBoardDAO.noticeBoardDetail(nvo);
		
		return noticeBoardDetail;
	}
	
	//조회수 증가
	@Override
	public boolean plusCnt(NoticeBoardVO nvo) {
		log.info("조회수증가 메서드(ServiceImpl)");
		return noticeBoardDAO.plusCnt(nvo);
	}
	
	// 게시글 갯수 카운트
	@Override
	public int noticeBoardListCnt (NoticeBoardVO nvo) {

		return noticeBoardDAO.noticeBoardListCnt(nvo);
	}
	
	//////////////////////관리자 페이지
	//공지게시판 글 목록 (관리자 페이지)
	@Override
	public List<NoticeBoardVO> adminNoticeBoardList(NoticeBoardVO nvo){
		List<NoticeBoardVO> adminNoticeBoardList = noticeBoardDAO.adminNoticeBoardList(nvo);
		
		return adminNoticeBoardList;
	}
	
	// 공지게시판 글 상세보기(관리자 페이지)
	
	@Override
	public NoticeBoardVO adminNoticeBoardDetail(NoticeBoardVO nvo) {
		NoticeBoardVO adminNoticeBoardDetail = noticeBoardDAO.adminNoticeBoardDetail(nvo);
		
		return adminNoticeBoardDetail;
	}
	
	//공지게시판 게시글 등록(관리자 페이지)
	@Override
	public int insertNoticeBoard(NoticeBoardVO nvo) {
		log.info("게시글등록 메서드(ServiceImpl)");
		return noticeBoardDAO.insertNoticeBoard(nvo);
	}
	
	//게시글 수정
	@Override
	public int updateNoticeBoard(NoticeBoardVO nvo) {
		int  updateNoticeBoard = noticeBoardDAO.updateNoticeBoard(nvo);
		return updateNoticeBoard;
	}
	
	//게시글 삭제
	@Override
	public int deleteNoticeBoard(NoticeBoardVO nvo) {
		log.info("deleteFreeBoard 메서드 실행");
		int deleteNoticeBoard = noticeBoardDAO.deleteNoticeBoard(nvo);
		log.info("deleteFreeBoard 메서드 실행완료"+ deleteNoticeBoard);
		return deleteNoticeBoard;
	}
	
	// 게시글 갯수 카운트
	@Override
	public int adminNoticeBoardListCnt (NoticeBoardVO nvo) {

		return noticeBoardDAO.adminNoticeBoardListCnt(nvo);
	}

}
