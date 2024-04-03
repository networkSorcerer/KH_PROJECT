package com.spring.counseling.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.counseling.vo.CounselingVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class CounselingDAOTest {
	@Autowired
	private CounselingDAO counselingDAO;
	
	/*
	@Test
	public void userCounselingUpdatTest() {
		CounselingVO counselingVO = new CounselingVO();
		counselingVO.setUserId("member01");
		counselingVO.setCounselingJudgment("적격");
		log.info("행갯수: " + counselingDAO.userCounselingUpdate(counselingVO));
	}*/
	
	/*
	@Test
	public void adminCounselingUpdateTest() {
		CounselingVO counselingVO = new CounselingVO();
		counselingVO.setCounselingJudgment("적격");
		counselingVO.setCounselingDetail("이상 없음");
		counselingVO.setCounselingId(1);
		log.info("갯수 : " + counselingDAO.adminCounselingUpdate(counselingVO));
	}
	*/
	/*
	@Test
	public void writeForm() {
		CounselingVO counselingVO = new CounselingVO();
		counselingVO.setUserId("member11");
		log.info("행 정보" + counselingDAO.writeForm(counselingVO));
	}*/
	
	@Test
	public void counselingListTest() {
		CounselingVO counselingVO = new CounselingVO();
		counselingVO.setUserId("member11");
		List<CounselingVO> counselingList = counselingDAO.counselingList(counselingVO);
		for(CounselingVO list : counselingList) {
			log.info(list.toString());
		}
		log.info("전체 행 갯수 : " + counselingDAO.counselingList(counselingVO));
	}
}
