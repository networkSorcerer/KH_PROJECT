package com.spring.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.board.vo.VolunteerFeedbackBoardVO;

@Mapper
public interface VolunteerFeedbackBoardDAO {
	// 봉사후기게시판 글 목록
	public List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList(VolunteerFeedbackBoardVO vfvo);

	public VolunteerFeedbackBoardVO volunteerFeedbackBoardDetail(VolunteerFeedbackBoardVO vfvo);

	// 조회수 증가 메서드
	public boolean plusCnt(VolunteerFeedbackBoardVO vfvo);

	// 게시글 등록하는 메서드
	public int insertVolunteerFeedbackBoard(VolunteerFeedbackBoardVO vfvo);

	// 게시글 수정
	public int updateVolunteerFeedbackBoard(VolunteerFeedbackBoardVO vfvo);

	// 게시글 삭제
	public int deleteVolunteerFeedbackBoard(VolunteerFeedbackBoardVO vfvo);
	
	//게시글 갯수 카운트
	public int volunteerFeedbackBoardListCnt(VolunteerFeedbackBoardVO vfvo);
	
	//게시글 히스토리
	public List<VolunteerFeedbackBoardVO> boardCreateHistory (VolunteerFeedbackBoardVO vfvo);
}
