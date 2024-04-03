package com.spring.report.service;

import java.util.List;

import com.spring.report.vo.ReportVO;

public interface ReportService {

	public List<ReportVO> reportList(ReportVO rvo);
	public ReportVO reportDetail(ReportVO rvo);
	public int reportDelete(ReportVO rvo);
	public int reportModify(ReportVO rvo);
	
	public int reportInsertFB(ReportVO rvo);
	public int reportInsertVB(ReportVO rvo);
	public int reportInsertAB(ReportVO rvo);
	public int reportInsertFC(ReportVO rvo);
	public int reportInsertVC(ReportVO rvo);
	public int reportInsertAC(ReportVO rvo);
	
	public int reportUpdateFB(ReportVO rvo);
	public int reportUpdateVB(ReportVO rvo);
	public int reportUpdateAB(ReportVO rvo);
	public int reportUpdateFC(ReportVO rvo);
	public int reportUpdateVC(ReportVO rvo);
	public int reportUpdateAC(ReportVO rvo);
	
	public int repcntUpdate(ReportVO rvo);
	public int contentDeleteFB(ReportVO rvo);
	public int contentDeleteVB(ReportVO rvo);
	public int contentDeleteAB(ReportVO rvo);
	public int contentDeleteFC(ReportVO rvo);
	public int contentDeleteVC(ReportVO rvo);
	public int contentDeleteAC(ReportVO rvo);
	public int userStop(ReportVO rvo);
	public int userDelete(ReportVO rvo);
	public ReportVO reportUpdateForm(ReportVO rvo);
	public int userGo(ReportVO rvo);
//	public void userGoStop(ReportVO rvo);


	
}
