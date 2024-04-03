package com.spring.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.comment.dao.AfcommentDAO;
import com.spring.comment.vo.AfcommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AfcommentServiceImpl implements AfcommentService{
	@Autowired
	private AfcommentDAO afcommentDAO;
	
	@Override
	public List<AfcommentVO> afcommentList(AfcommentVO afcommentvo){
		log.info("댓글조회시작");
		List<AfcommentVO> afcommentlist = null;
		afcommentlist = afcommentDAO.afcommentList(afcommentvo);
		log.info("댓글조회완료");
		return afcommentlist;
	}
	
	@Override
	public int afcommentInsert(AfcommentVO afcommentvo){
		log.info("댓글삽입");
		int result = 0;
		result = afcommentDAO.afcommentInsert(afcommentvo);
		return result;
	}
	
	@Override
	public int afcommentUpdate(AfcommentVO afcommentvo){
		int result = 0;
		result = afcommentDAO.afcommentUpdate(afcommentvo);
		return result;
	}
	
	@Override
	public int afcommentDelete(AfcommentVO afcommentvo){
		int result = 0;
		result = afcommentDAO.afcommentDelete(afcommentvo);
		return result;
	}

	@Override
	public AfcommentVO afcommentDetail(AfcommentVO avo) {
		AfcommentVO detail = afcommentDAO.afcommentDetail(avo);
		if(detail != null) {
			detail.setReportDetail(detail.getReportDetail().replaceAll("\n", "<br />"));
		}

		return detail;
	}

}
