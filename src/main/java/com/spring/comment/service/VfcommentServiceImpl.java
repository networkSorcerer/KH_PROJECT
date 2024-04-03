package com.spring.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.comment.dao.VfcommentDAO;
import com.spring.comment.vo.VfcommentVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class VfcommentServiceImpl implements VfcommentService{
	@Autowired
	private VfcommentDAO vfcommentDAO;
	
	@Override
	public List<VfcommentVO> vfcommentList(VfcommentVO vfcommentvo){
		log.info("댓글조회시작");
		List<VfcommentVO> vfcommentlist = null;
		vfcommentlist = vfcommentDAO.vfcommentList(vfcommentvo);
		log.info("댓글조회완료");
		return vfcommentlist;
	}
	
	@Override
	public int vfcommentInsert(VfcommentVO vfcommentvo){
		log.info("댓글삽입");
		int result = 0;
		result = vfcommentDAO.vfcommentInsert(vfcommentvo);
		return result;
	}
	
	@Override
	public int vfcommentUpdate(VfcommentVO vfcommentvo){
		int result = 0;
		result = vfcommentDAO.vfcommentUpdate(vfcommentvo);
		return result;
	}
	
	@Override
	public int vfcommentDelete(VfcommentVO vfcommentvo){
		int result = 0;
		result = vfcommentDAO.vfcommentDelete(vfcommentvo);
		return result;
	}

	@Override
	public VfcommentVO vfcommentDetail(VfcommentVO vvo) {
		VfcommentVO detail = vfcommentDAO.vfcommentDetail(vvo);
		if(detail != null) {
			detail.setReportDetail(detail.getReportDetail().replaceAll("\n", "<br />"));
		}

		return detail;
	}

}
