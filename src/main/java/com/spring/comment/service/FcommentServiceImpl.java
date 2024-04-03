package com.spring.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.comment.dao.FcommentDAO;
import com.spring.comment.vo.FcommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FcommentServiceImpl implements FcommentService{
	
	@Autowired
	private FcommentDAO fcommentDAO;
	
	@Override
	public List<FcommentVO> fcommentList(FcommentVO fcommentvo){
		log.info("댓글조회시작");
		List<FcommentVO> fcommentlist = null;
		fcommentlist = fcommentDAO.fcommentList(fcommentvo);
		log.info("댓글조회완료");
		/*
		List<FcommentVO> fcommentlist = fcommentDAO.fcommentList(fcommentvo);
		*/
		return fcommentlist;
	}
	
	@Override
	public int fcommentInsert(FcommentVO fcommentvo){
		log.info("댓글삽입");
		int result = 0;
		result = fcommentDAO.fcommentInsert(fcommentvo);
		return result;
	}
	
	@Override
	public int fcommentUpdate(FcommentVO fcommentvo){
		int result = 0;
		result = fcommentDAO.fcommentUpdate(fcommentvo);
		return result;
	}
	
	@Override
	public int fcommentDelete(FcommentVO fcommentvo){
		int result = 0;
		result = fcommentDAO.fcommentDelete(fcommentvo);
		return result;
	}

	@Override
	public FcommentVO fcommentDetail(FcommentVO fvo) {
		FcommentVO detail = fcommentDAO.fcommentDetail(fvo);
		if(detail != null) {
			detail.setReportDetail(detail.getReportDetail().replaceAll("\n", "<br />"));
		}

		return detail;
	}

	
}
