package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.VolunteerFeedbackBoardDAO;
import com.spring.board.vo.VolunteerFeedbackBoardVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class VolunteerFeedbackBoardServiceImpl implements VolunteerFeedbackBoardService {
	@Autowired
	private VolunteerFeedbackBoardDAO volunteerFeedbackBoardDAO;

	@Override
	public List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList(VolunteerFeedbackBoardVO vfvo) {
		List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList = volunteerFeedbackBoardDAO
				.volunteerFeedbackBoardList(vfvo);

		return volunteerFeedbackBoardList;
	}

	@Override
	public VolunteerFeedbackBoardVO volunteerFeedbackBoardDetail(VolunteerFeedbackBoardVO vfvo) {
		VolunteerFeedbackBoardVO volunteerFeedbackBoardDetail = volunteerFeedbackBoardDAO
				.volunteerFeedbackBoardDetail(vfvo);

		return volunteerFeedbackBoardDetail;
	}

	// 조회수 증가
	@Override
	public boolean plusCnt(VolunteerFeedbackBoardVO vfvo) {
		log.info("조회수증가 메서드(ServiceImpl)");
		return volunteerFeedbackBoardDAO.plusCnt(vfvo);
	}

	// 게시글 등록
	@Override
	public int insertVolunteerFeedbackBoard(VolunteerFeedbackBoardVO vfvo) {
		log.info("게시글등록 메서드(ServiceImpl)");
		return volunteerFeedbackBoardDAO.insertVolunteerFeedbackBoard(vfvo);
	}

	// 게시글 수정
	@Override
	public int updateVolunteerFeedbackBoard(VolunteerFeedbackBoardVO vfvo) {
		int updatevolunteerfeedbackboard = volunteerFeedbackBoardDAO.updateVolunteerFeedbackBoard(vfvo);
		return updatevolunteerfeedbackboard;
	}

	// 게시글 삭제
	@Override
	public int deleteVolunteerFeedbackBoard(VolunteerFeedbackBoardVO vfvo) {
		log.info("deleteFreeBoard 메서드 실행");
		int deletevolunteerfeedbackboard = volunteerFeedbackBoardDAO.deleteVolunteerFeedbackBoard(vfvo);
		log.info("deleteFreeBoard 메서드 실행완료" + deletevolunteerfeedbackboard);
		return deletevolunteerfeedbackboard;
	}

	// 게시글 갯수 카운트
	@Override
	public int volunteerFeedbackBoardListCnt(VolunteerFeedbackBoardVO vfvo) {

		return volunteerFeedbackBoardDAO.volunteerFeedbackBoardListCnt(vfvo);
	}
	
	//게시글 히스토리
	@Override
	public List<VolunteerFeedbackBoardVO> boardCreateHistory (VolunteerFeedbackBoardVO vfvo) {
		List<VolunteerFeedbackBoardVO> volunteerFeedbackBoardList = volunteerFeedbackBoardDAO.boardCreateHistory(vfvo);

		return volunteerFeedbackBoardList;
	}

}
