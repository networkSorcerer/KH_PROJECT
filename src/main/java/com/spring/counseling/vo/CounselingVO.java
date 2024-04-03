package com.spring.counseling.vo;

import com.spring.user.vo.UserVO;
import lombok.Data;

@Data
public class CounselingVO {
    private int counselingId; // 예약 고유 ID
    private String counselingSchedule; // 예약 일정
    private String userId; // 회원 ID
    private int adoptionId; // 입양 공고 ID
    private int animalId; // 동물 ID
    private String counselingDate; // 예약 신청 일자
    private String counselingJudgment; // 적격 판정
    private String counselingDetail; // 상담 내용
    private int counselingAge; // 연령
    private String counselingAddress; // 주소
    private String counselingJob; // 직업
    private int counselingAdopt; // 입양/임시보호 구분
    private String userName;
    private String userPhone;

    private UserVO user = new UserVO();
}