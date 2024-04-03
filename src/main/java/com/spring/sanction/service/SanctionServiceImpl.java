package com.spring.sanction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sanction.dao.SanctionDao;
import com.spring.sanction.vo.SanctionVO;

@Service
public class SanctionServiceImpl implements SanctionService {

	@Autowired
	private SanctionDao sDao;
	
	@Override
	public int sanctionInsert(SanctionVO svo) {
		int result = sDao.sanctionInsert(svo);
		return result;
	}

}
