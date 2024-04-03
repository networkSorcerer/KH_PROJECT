package com.spring.admin.login.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class AdminLoginDaoTests {	
	@Setter(onMethod_ = @Autowired)
	private AdminLoginDao adminLoginDao;
	
	@Test
	public void testLoginProcess() {
		AdminLoginVO admin = new AdminLoginVO();
		admin.setAdminId("admin");
		admin.setAdminPasswd("admin1234");
		
		AdminLoginVO result = adminLoginDao.loginProcess(admin);
		log.info(result.toString());
	}
	
}
