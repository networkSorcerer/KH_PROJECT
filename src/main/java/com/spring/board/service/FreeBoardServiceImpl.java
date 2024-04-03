package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.FreeBoardDAO;
import com.spring.board.vo.FreeBoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Setter(onMethod_=@Autowired)
	private FreeBoardDAO freeBoardDAO;
	
	@Override
	public List<FreeBoardVO> freeBoardList(FreeBoardVO freeBoardVO){
		List<FreeBoardVO> freeBoardList = freeBoardDAO.freeBoardList(freeBoardVO);
		
		return freeBoardList;
	}
	
	@Override
	public FreeBoardVO freeBoardDetail(FreeBoardVO freeBoardVO) {
		FreeBoardVO freeBoardDetail = freeBoardDAO.freeBoardDetail(freeBoardVO);
		
		return freeBoardDetail;
	}
	
	//조회수 증가
	@Override
	public boolean plusCnt(FreeBoardVO freeBoardVO) {
		log.info("조회수증가 메서드(ServiceImpl)");
		return freeBoardDAO.plusCnt(freeBoardVO);
	}
	//게시글 등록
	@Override
	public int insertFreeBoard(FreeBoardVO freeBoardVO) {
		log.info("게시글등록 메서드(ServiceImpl)");
		return freeBoardDAO.insertFreeBoard(freeBoardVO);
	}
	
	//게시글 수정
	@Override
	public int updateFreeBoard(FreeBoardVO freeBoardVO) {
		int  updatefreeboard = freeBoardDAO.updateFreeBoard(freeBoardVO);
		return updatefreeboard;
	}
	
	//게시글 삭제
	@Override
	public int deleteFreeBoard(FreeBoardVO freeBoardVO) {
		log.info("deleteFreeBoard 메서드 실행");
		int deletefreeboard = freeBoardDAO.deleteFreeBoard(freeBoardVO);
		log.info("deleteFreeBoard 메서드 실행완료"+ deletefreeboard);
		return deletefreeboard;
	}
	//게시글 갯수 카운트
	@Override
	public int freeBoardListCnt(FreeBoardVO freeBoardVO) {
		
		 return freeBoardDAO.freeBoardListCnt(freeBoardVO); 
	}
	
	//게시글 히스토리
	@Override
	public List<FreeBoardVO> boardCreateHistory (FreeBoardVO freeBoardVO){
		List<FreeBoardVO> freeBoardList = freeBoardDAO.boardCreateHistory(freeBoardVO);
		
		return freeBoardList;
	}
	
}
