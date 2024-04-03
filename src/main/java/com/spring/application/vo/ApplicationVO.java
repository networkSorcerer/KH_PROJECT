package com.spring.application.vo;

import com.spring.common.vo.CommonVO;
import com.spring.user.vo.UserVO;
import com.spring.volunteer.vo.VolunteerVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class ApplicationVO  extends CommonVO {
	public ApplicationVO(int applicationId, String attendance) {
        this.applicationId = applicationId;
        this.attendance = attendance;
    }
	private int applicationId=0;			// 신청 ID
	private String applicationDate;		// 신청 날짜
	private String applicationComment;	// 신청 다짐
	private int applicationResult;		// 봉사 결과
	//private String userId;			// 유저 아이디
	//private int volunteerId;			// 봉사 공고 아이디
	//private String userName;          // 유저 이름
	private String attendance;
	private VolunteerVO volunteer = new VolunteerVO();
	private UserVO user = new UserVO();
	// userName 필드를 설정하는 메서드
    //public void setUserName(String userName) {
    //    this.userName = userName;
    //}
    
}
