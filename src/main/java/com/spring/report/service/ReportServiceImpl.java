package com.spring.report.service;

//import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spring.report.dao.ReportDao;
import com.spring.report.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao rDao;
	
	//reportList
	@Override
	public List<ReportVO> reportList(ReportVO rvo) {
		List<ReportVO> list = null;
		list = rDao.reportList(rvo);
		return list;
	}

	//reportDetail
	@Override
	public ReportVO reportDetail(ReportVO rvo) {
		ReportVO detail = rDao.reportDetail(rvo);
		if(detail != null) {
			detail.setReportDetail(detail.getReportDetail().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	//report 취소
	@Override
	public int reportDelete(ReportVO rvo) {
		int result = rDao.reportDelete(rvo);
		return result;
		
	}

	//report 수정
	@Override
	public int reportModify(ReportVO rvo) {
		int result = rDao.reportModify(rvo);
		return result;
	}

	//신고
	@Override
	public int reportInsertFB(ReportVO rvo) {
		int result = rDao.reportInsertFB(rvo);
		return result;
	}
	@Override
	public int reportInsertVB(ReportVO rvo) {
		int result = rDao.reportInsertVB(rvo);
		return result;
	}
	@Override
	public int reportInsertAB(ReportVO rvo) {
		int result = rDao.reportInsertAB(rvo);
		return result;
	}
	@Override
	public int reportInsertFC(ReportVO rvo) {
		int result = rDao.reportInsertFC(rvo);
		return result;
	}
	@Override
	public int reportInsertVC(ReportVO rvo) {
		int result = rDao.reportInsertVC(rvo);
		return result;
	}
	@Override
	public int reportInsertAC(ReportVO rvo) {
		int result = rDao.reportInsertAC(rvo);
		return result;
	}

	//신고 처리 후 신고 상태 수정
	@Override
	public int reportUpdateFB(ReportVO rvo) {
		int result = rDao.reportUpdateFB(rvo);
		return result;
	}
	@Override
	public int reportUpdateVB(ReportVO rvo) {
		int result = rDao.reportUpdateVB(rvo);
		return result;
	}
	@Override
	public int reportUpdateAB(ReportVO rvo) {
		int result = rDao.reportUpdateAB(rvo);
		return result;
	}
	@Override
	public int reportUpdateFC(ReportVO rvo) {
		int result = rDao.reportUpdateFC(rvo);
		return result;
	}
	@Override
	public int reportUpdateVC(ReportVO rvo) {
		int result = rDao.reportUpdateVC(rvo);
		return result;
	}
	@Override
	public int reportUpdateAC(ReportVO rvo) {
		int result = rDao.reportUpdateAC(rvo);
		return result;
	}

	//신고 제재 후 유저 제재 횟수 증가
	@Override
	public int repcntUpdate(ReportVO rvo) {
		int result = rDao.repcntUpdate(rvo);
		return result;
	}

	//신고 제재 시 해당 게시물 삭제
	@Override
	public int contentDeleteFB(ReportVO rvo) {
		int result = rDao.contentDeleteFB(rvo);
		return result;
	}
	@Override
	public int contentDeleteVB(ReportVO rvo) {
		int result = rDao.contentDeleteVB(rvo);
		return result;
	}
	@Override
	public int contentDeleteAB(ReportVO rvo) {
		int result = rDao.contentDeleteAB(rvo);
		return result;
	}
	@Override
	public int contentDeleteFC(ReportVO rvo) {
		int result = rDao.contentDeleteFC(rvo);
		return result;
	}
	@Override
	public int contentDeleteVC(ReportVO rvo) {
		int result = rDao.contentDeleteVC(rvo);
		return result;
	}
	@Override
	public int contentDeleteAC(ReportVO rvo) {
		int result = rDao.contentDeleteAC(rvo);
		return result;
	}

	//신고 제재 시 유저 계정 삭제
	@Override
	public int userDelete(ReportVO rvo) {
		int result = rDao.userDelete(rvo);
		return result;
	}

	@Override
	public ReportVO reportUpdateForm(ReportVO rvo) {
		ReportVO reportUpdateData = rDao.reportDetail(rvo);
		return reportUpdateData;
	}

	//신고 제재 시 유저 계정 정지
//	private volatile LocalDateTime stopTime;
	@Override
	public int userStop(ReportVO rvo) {
//		stopTime = LocalDateTime.now();
		int result = rDao.userStop(rvo);
		return result;
	}
	@Override
	@Scheduled(fixedDelay = 1 * 60 * 1000)
	public synchronized int userGo(ReportVO rvo) {
		int result = 0;
//		if(stopTime != null && stopTime.plusMinutes(3).isBefore(LocalDateTime.now())) {
//			result = rDao.userGo(rvo);
//		}
		return result;
	}
//    @Override
//    @Scheduled(fixedRate = 604800000) // 1주일은 604,800,000밀리초
//    public void userGoStop(ReportVO rvo) {
//        // userStop 메소드 호출
//        userStop(rvo);
//
//        // userGo 메소드 호출 (일주일 후에 실행됨)
//        userGo(rvo);
//    }
    
    
	
}
