package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.AdoptionFeedbackBoardVO;

public interface AdoptionFeedbackBoardService {
	// 입양후기게시판 글 목록
	public List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList(AdoptionFeedbackBoardVO afbvo);

	public AdoptionFeedbackBoardVO adoptionFeedbackBoardDetail(AdoptionFeedbackBoardVO afbvo);

	// 조회수 증가 메서드
	public boolean plusCnt(AdoptionFeedbackBoardVO afbvo);

	// 게시글 등록하는 메서드
	public int insertAdoptionFeedbackBoard(AdoptionFeedbackBoardVO afbvo);

	// 게시글 수정
	public int updateAdoptionFeedbackBoard(AdoptionFeedbackBoardVO afbvo);

	// 게시글 삭제
	public int deleteAdoptionFeedbackBoard(AdoptionFeedbackBoardVO afbvo);

	// 게시글 갯수 카운트
	public int adoptionFeedbackBoardListCnt(AdoptionFeedbackBoardVO afbvo);
	
	//게시글 히스토리
	public List<AdoptionFeedbackBoardVO> boardCreateHistory (AdoptionFeedbackBoardVO afbvo);
}
