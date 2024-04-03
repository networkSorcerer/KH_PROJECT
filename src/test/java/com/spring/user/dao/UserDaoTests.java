package com.spring.user.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.user.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class UserDaoTests {	
	@Setter(onMethod_ = @Autowired)
	private UserDao userDao;
	
	/*@Test
	public void testUserList() {
		UserVO uvo = null;
		List<UserVO> list = userDao.userList(uvo);
		for (UserVO vo : list) {
			log.info(vo.toString());
		}
	}*/
	/*@Test
	public void testUserLoginProcess() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member01");
		uvo.setUserPasswd("password");
		UserVO result = userDao.userLoginProcess(uvo);
		log.info(result.toString());
	}*/
	/*@Test
	public void testUserJoin() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member99");
		uvo.setUserPasswd("password");
		uvo.setUserName("구구구");
		uvo.setUserPhone("010-9000-9000");
		uvo.setUserEmail("member99@daum.net");
		
		int result = userDao.userJoin(uvo);
		log.info("입력된 회원 레코드 수 : " + result);
	}*/
	/*@Test
	public void testUserUpdate() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member99");
		//uvo.setUserPasswd("pass1234");
		uvo.setUserName("구구단");
		uvo.setUserPhone("010-2282-9000");
		uvo.setUserEmail("user99@daum.net");
		
		int result = userDao.userUpdate(uvo);
		log.info("수정된 회원 레코드 수 : " + result);		
	}*/
	/*@Test
	public void testUserInfo() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member00");
		UserVO info = userDao.userInfo(uvo);
		log.info(info.toString());
	}*/
	/*@Test
	public void testPwdConfirm() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member99");
		uvo.setUserPasswd("pass1234");
		int result = userDao.pwdConfirm(uvo);
		log.info((result==1) ? "일치" : "불일치");
	}*/	
	/*@Test
	public void testFindId() {
		UserVO uvo = new UserVO();
		uvo.setUserEmail("member03@naver.com");

		UserVO result = userDao.findId(uvo);
		log.info(result.toString());
	}*/
	
	/*@Test
	public void testFindUserByIdAndEmail() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member02");
		uvo.setUserEmail("member02@naver.com");
		
		int result = userDao.findUserByIdAndEmail(uvo);
		log.info((result==1) ? "회원 확인" : "회원 정보 불일치");
	}*/
	/*@Test
	public void testResetPasswd() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member02");
		uvo.setUserEmail("member02@naver.com");
		
		uvo.setUserPasswd("12341234");
		int result = userDao.resetPasswd(uvo);
		log.info((result==1) ? "성공" : "실패");
	}*/
	
	/*@Test
	public void testFindIdCheck() {
		UserVO uvo = new UserVO();
		uvo.setUserEmail("memmh@naver.com");
		int result = userDao.findIdCheck(uvo);
		log.info((result==1) ? "회원 이메일" : "비회원 이메일");
	}*/
	/*
	@Test
	public void testIdCheck() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member88");
		int result = userDao.idCheck(uvo);
		log.info((result==1) ? "존재하는 아이디" : "사용가능 아이디");
	}
	@Test
	public void testPhoneCheck() {
		UserVO uvo = new UserVO();
		uvo.setUserPhone("010-1111-1111");
		int result = userDao.phoneCheck(uvo);
		log.info((result==1) ? "존재하는 번호" : "사용가능 번호");
	}*/
	/*@Test
	public void testEmailCheck() {
		UserVO uvo = new UserVO();
		uvo.setUserEmail("memb333r01@naver.com");
		int result = userDao.emailCheck(uvo);
		log.info((result==1) ? "존재하는 이메일" : "사용가능 이메일");
	}*/
	/*@Test
	public void testCheckDuplicate() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member99");
		//uvo.setUserPhone("010-1111-1111");
		//uvo.setUserEmail("member01@naver.com");
		int result = userDao.checkDuplicate(uvo);
		log.info((result==1) ? "존재함" : "사용가능");
	}*/
	/*@Test
	public void testResetPasswd() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member00");
		uvo.setUserEmail("member01@naver.com");
		uvo.setUserPasswd("12341234");
		int result = userDao.resetPasswd(uvo);
		log.info((result==1) ? "성공" : "실패");
	}*/
	/*@Test
	public void testUserWithdrawal() {
		UserVO uvo = new UserVO();
		uvo.setUserId("member10");
		int result = userDao.userWithdrawal(uvo);
		log.info((result==1) ? "성공" : "실패");
	}*/
	
}
