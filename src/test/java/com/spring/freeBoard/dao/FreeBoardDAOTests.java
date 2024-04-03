//package com.spring.freeBoard.dao;
//
//import java.util.List;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.spring.FreeBoard.dao.FreeBoardDAO;
//import com.spring.FreeBoard.vo.FreeBoardVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@SpringBootTest
//public class FreeBoardDAOTests {
//	
//	@Autowired
//	private FreeBoardDAO freeBoardDAO;
//	
//	
//	@Test
//	public void testFreeBoardList() {
//		FreeBoardVO freeBoardVO = new FreeBoardVO();
//		List<FreeBoardVO> freeBoardList = freeBoardDAO.freeBoardList(freeBoardVO);
//		for(FreeBoardVO list : freeBoardList) {
//			log.info(list.toString());
//			
//		}
//		log.info("ㅁㄴㅇㄹ" + freeBoardDAO.freeBoardList(freeBoardVO));
//		
//	}
//
//}
