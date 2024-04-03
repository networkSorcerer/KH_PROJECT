package com.spring.report.report.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.report.dao.ReportDao;
import com.spring.report.vo.ReportVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ReportDaoTest {
	@Autowired
	private ReportDao rDao;
	
//	@Test
//	public void testReportList() {
//		ReportVO rvo = new ReportVO();
//		List<ReportVO> list = rDao.reportList(rvo);
//		System.out.println(list);
//		for(ReportVO vo : list) {
//			log.info(vo.toString());
//		}
//	}

//	@Test
//	public void testReportDelete() {
//		ReportVO rvo = new ReportVO();
//		rvo.setReportId(47);
//		
//		int count =rDao.reportDelete(rvo);
//		log.info("수정된 행의 수: " + count);
//	}



}
