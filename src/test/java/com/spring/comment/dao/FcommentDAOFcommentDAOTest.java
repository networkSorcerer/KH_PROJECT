package com.spring.comment.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.comment.vo.FcommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class FcommentDAOFcommentDAOTest {
	@Autowired
	private FcommentDAO fDao;

//	@Test
//	public void testDetail() {
//		FcommentVO vo = new FcommentVO();
//		vo.setFcommentId(10);
//		vo.setUserId("member02");
//		System.out.println(vo);
//		FcommentVO board = fDao.fcommentDetail(vo);
//		System.out.println(board);
//	}
}
