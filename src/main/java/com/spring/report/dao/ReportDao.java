package com.spring.report.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.report.vo.ReportVO;

@Mapper
public interface ReportDao {
	//reportList.jsp 출력 기능
	public List<ReportVO> reportList(ReportVO rvo);
	//reportDetail.jsp 출력 기능
	public ReportVO reportDetail(ReportVO rvo);
	
	//신고 기능, 각 콘텐츠에서 신고시 각 기능 실행
	public int reportInsertFB(ReportVO rvo);
	public int reportInsertVB(ReportVO rvo);
	public int reportInsertAB(ReportVO rvo);
	public int reportInsertFC(ReportVO rvo);
	public int reportInsertVC(ReportVO rvo);
	public int reportInsertAC(ReportVO rvo);
	
	//reportDetail에서 신고 처리시 신고 상태 수정 기능
	public int reportUpdateFB(ReportVO rvo);
	public int reportUpdateVB(ReportVO rvo);
	public int reportUpdateAB(ReportVO rvo);
	public int reportUpdateFC(ReportVO rvo);
	public int reportUpdateVC(ReportVO rvo);
	public int reportUpdateAC(ReportVO rvo);
	
	//신고 수정 기능
	public int reportModify(ReportVO rvo);
	//신고 취소 기능
	public int reportDelete(ReportVO rvo);
	
	//신고 제재 시 유저별 신고 제재 횟수 변경 기능
	public int repcntUpdate(ReportVO rvo);
	
	//신고 제재 시 게시물 삭제
	public int contentDeleteFB(ReportVO rvo);
	public int contentDeleteVB(ReportVO rvo);
	public int contentDeleteAB(ReportVO rvo);
	public int contentDeleteFC(ReportVO rvo);
	public int contentDeleteVC(ReportVO rvo);
	public int contentDeleteAC(ReportVO rvo);
	
	//신고 제재 시 유저 계정 정지
	public int userStop(ReportVO rvo);
	
	//신고 제재로 정지된 계정 복구
	public int userGo(ReportVO rvo);
	
	//신고 제재 시 유저 계정 삭제
	public int userDelete(ReportVO rvo);
	
}
