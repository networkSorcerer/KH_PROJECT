package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.AdoptionFeedbackBoardDAO;
import com.spring.board.vo.AdoptionFeedbackBoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdoptionFeedbackBoardServiceImpl implements AdoptionFeedbackBoardService {
	@Setter(onMethod_=@Autowired)
	private AdoptionFeedbackBoardDAO adoptionFeedbackBoardDAO;

	@Override
	public List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList(AdoptionFeedbackBoardVO afbvo) {
		List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList = adoptionFeedbackBoardDAO
				.adoptionFeedbackBoardList(afbvo);

		return adoptionFeedbackBoardList;
	}

	@Override
	public AdoptionFeedbackBoardVO adoptionFeedbackBoardDetail(AdoptionFeedbackBoardVO afbvo) {
		AdoptionFeedbackBoardVO adoptionFeedbackBoardDetail = adoptionFeedbackBoardDAO
				.adoptionFeedbackBoardDetail(afbvo);

		return adoptionFeedbackBoardDetail;
	}

	// 조회수 증가
	@Override
	public boolean plusCnt(AdoptionFeedbackBoardVO afbvo) {
		log.info("조회수증가 메서드(ServiceImpl)");
		return adoptionFeedbackBoardDAO.plusCnt(afbvo);
	}

	// 게시글 등록
	@Override
	public int insertAdoptionFeedbackBoard(AdoptionFeedbackBoardVO afbvo) {
		log.info("게시글등록 메서드(ServiceImpl)");
		return adoptionFeedbackBoardDAO.insertAdoptionFeedbackBoard(afbvo);
	}

	// 게시글 수정
	@Override
	public int updateAdoptionFeedbackBoard(AdoptionFeedbackBoardVO afbvo) {
		int updateadoptionfeedbackboard = adoptionFeedbackBoardDAO.updateAdoptionFeedbackBoard(afbvo);
		return updateadoptionfeedbackboard;
	}

	// 게시글 삭제
	@Override
	public int deleteAdoptionFeedbackBoard(AdoptionFeedbackBoardVO afbvo) {
		log.info("deleteFreeBoard 메서드 실행");
		int deleteadoptionfeedbackboard = adoptionFeedbackBoardDAO.deleteAdoptionFeedbackBoard(afbvo);
		log.info("deleteFreeBoard 메서드 실행완료" + deleteadoptionfeedbackboard);
		return deleteadoptionfeedbackboard;
	}

	// 게시글 갯수 카운트
	@Override
	public int adoptionFeedbackBoardListCnt(AdoptionFeedbackBoardVO afbvo) {
			
		return adoptionFeedbackBoardDAO.adoptionFeedbackBoardListCnt(afbvo);
	
	}
	
	//게시글 히스토리
	@Override
	public List<AdoptionFeedbackBoardVO> boardCreateHistory (AdoptionFeedbackBoardVO afbvo) {
		List<AdoptionFeedbackBoardVO> adoptionFeedbackBoardList = adoptionFeedbackBoardDAO.boardCreateHistory(afbvo);

		return adoptionFeedbackBoardList;
	}
	 
	
}
