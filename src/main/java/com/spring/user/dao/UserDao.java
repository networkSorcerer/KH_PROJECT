package com.spring.user.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.user.vo.UserVO;


@Mapper
public interface UserDao {
	
	public UserVO userLoginProcess(UserVO uvo); // 유저 로그인		
	
	public UserVO findId(UserVO uvo); 				// 아이디 찾기		
	public int findUserByIdAndEmail(UserVO uvo); // 아이디 이메일로 유저 확인
	public int resetPasswd(UserVO uvo);				// 비밀번호 재설정
	
	public int userJoin(UserVO uvo); 			// 회원 가입	
	public int idCheck(UserVO uvo);				// 아이디 중복 체크
	public int phoneCheck(UserVO uvo);			// 핸드폰번호 중복 체크
	public int emailCheck(UserVO uvo);			// 이메일 중복 체크
	//public int checkDuplicate(UserVO uvo); // 중복 체크 : 아이디, 핸드폰번호, 이메일
	
	public UserVO userInfo(UserVO uvo); 		// 내정보 확인 - 상세 조회	
	public int updateProfile(UserVO uvo); 		// 회원정보 수정
	public int pwdConfirm(UserVO uvo);			// 비밀번호 일치 확인
	
	public int userWithdrawal(UserVO uvo); 		// 회원 탈퇴 : 활동상태 변경
	public int userDelete(UserVO uvo);     		// 회원 데이터 삭제
	// 삭제되어야하는 자식테이블 항목.. 게시판 다, 봉사 신청, 입양 상담, 후원 
	// cascade 해야하는 항목?
	
	public List<UserVO> userList(UserVO uvo); //회원 목록 조회	
	public int userListCnt(UserVO uvo); // users 테이블의 전체 레코드 수 : 페이징처리시 필요
	
	
}
