// CounselingServiceImpl.java

package com.spring.counseling.service;

import com.spring.counseling.dao.CounselingDAO;
import com.spring.counseling.vo.CounselingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CounselingServiceImpl implements CounselingService {
    @Override
    public int counselingDelete(CounselingVO counselingVO) {
    	int result = counselingDAO.counselingDelete(counselingVO);
    	return result;
    }

    @Autowired
    private CounselingDAO counselingDAO;

    @Override
    public List<CounselingVO> counselingList(CounselingVO counselingVO) {
        return counselingDAO.counselingList(counselingVO);
    }

    @Override
    public CounselingVO counselingDetail(int counselingId) {
        return counselingDAO.counselingDetail(counselingId);
    }

    @Override
    public int counselingInsert(CounselingVO counselingVO) throws Exception {
        return counselingDAO.counselingInsert(counselingVO);
    }

    @Override
    public CounselingVO counselingUpdateForm(CounselingVO counselingVO) {
        return counselingDAO.counselingDetail(counselingVO.getCounselingId());
    }

    @Override
    public int counselingUpdate(CounselingVO counselingVO) {
        return counselingDAO.counselingUpdate(counselingVO);
    }

    @Override
    public int counselingDelete(int counselingId) {
        return counselingDAO.counselingDelete(counselingId);
    }

    @Override
    public int admincounselingDelete(int counselingId) {
        return 0;
    }

    @Override
    public CounselingVO getCounselingDetail(int counselingId) {
        return counselingDAO.counselingDetail(counselingId);
    }

    @Override
    public int counselingDeleteById(int counselingId) {
        return counselingDAO.counselingDelete(counselingId);
    }

	@Override
	public int adminCounselingUpdate(CounselingVO counselingVO) {
		int adminCounselingUpdate = 0;
		adminCounselingUpdate = counselingDAO.adminCounselingUpdate(counselingVO);
		return adminCounselingUpdate;
	}

	@Override
	public int userCounselingUpdate(CounselingVO counselingVO) {
		int userCounselingUpdate = 0;
		userCounselingUpdate = counselingDAO.userCounselingUpdate(counselingVO);
		return userCounselingUpdate;
	}
	
	@Override
	public CounselingVO writeForm(CounselingVO counselingVO) {
		CounselingVO writeForm = null;
		writeForm = counselingDAO.writeForm(counselingVO);
		return writeForm;
	}

	@Override
	public List<CounselingVO> adminCounselingList(CounselingVO counselingVO) {
		List<CounselingVO> adminCounselingList = null;
		adminCounselingList = counselingDAO.adminCounselingList(counselingVO);
		return adminCounselingList;
	}
}
