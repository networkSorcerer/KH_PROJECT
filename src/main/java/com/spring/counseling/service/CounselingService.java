

package com.spring.counseling.service;

import com.spring.counseling.vo.CounselingVO;

import java.util.List;

public interface CounselingService {
    int counselingDelete(CounselingVO counselingVO);

    List<CounselingVO> counselingList(CounselingVO counselingVO);
    CounselingVO counselingDetail(int counselingId);
    int counselingInsert(CounselingVO counselingVO) throws Exception;
    CounselingVO counselingUpdateForm(CounselingVO counselingVO);
    int counselingUpdate(CounselingVO counselingVO);
    int counselingDelete(int counselingId);
    int admincounselingDelete(int counselingId);

    int counselingDeleteById(int counselingId);

    CounselingVO getCounselingDetail(int counselingId);
    
    
    int adminCounselingUpdate(CounselingVO counselingVO);
    int userCounselingUpdate(CounselingVO counselingVO);
    
    CounselingVO writeForm(CounselingVO counselingVO);
    
    List<CounselingVO> adminCounselingList(CounselingVO counselingVO);


}

