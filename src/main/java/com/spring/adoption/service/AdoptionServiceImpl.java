package com.spring.adoption.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.adoption.dao.AdoptionDAO;
import com.spring.adoption.vo.AdoptionVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdoptionServiceImpl implements AdoptionService{
	
	@Setter(onMethod_=@Autowired)
	private AdoptionDAO adoptionDAO;
	
	
	//글 목록 구현 
	@Override
	public List<AdoptionVO> adoptionList(AdoptionVO adoptionvo) {
		List<AdoptionVO> list = null;
		list = adoptionDAO.adoptionList(adoptionvo);
		return list;
	}
	
	
	@Override//통과
	public int adoptionListCnt(AdoptionVO adoptionvo) {
		
		return adoptionDAO.adoptionListCnt(adoptionvo);
	}

	@Override
	public AdoptionVO adoptionDetail(AdoptionVO adoptionvo) {
		adoptionDAO.readCntUpdate(adoptionvo);
		
		AdoptionVO detail = adoptionDAO.adoptionDetail(adoptionvo);
		if(detail != null) {
			detail.setAdoptionContent(detail.getAdoptionContent().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	
	@Override
	public int adoptionInsert(AdoptionVO adoptionvo) throws Exception{
		int result=0;
		if(adoptionvo.getFile().getSize() > 0 ) {
			String fileName = FileUploadUtil.fileUpload(adoptionvo.getFile(), "adoption");
			adoptionvo.setAdoptionFile(fileName);
		}
		result = adoptionDAO.adoptionInsert(adoptionvo);
		return result;
	}
	
	
	//수정 폼 구현
		@Override
		public AdoptionVO updateForm(AdoptionVO adoptionvo) {
			AdoptionVO updateData = null;
			updateData = adoptionDAO.adoptionDetail(adoptionvo);
			return updateData;
		}
		
		//게시글 수정 구현 
		@Override
		public int adoptionUpdate(AdoptionVO adoptionvo) throws Exception{
			int result = 0;
			if(!adoptionvo.getFile().isEmpty()) {
				if(!adoptionvo.getAdoptionFile().isEmpty()) {
					FileUploadUtil.fileDelete(adoptionvo.getAdoptionFile());
				}
				String fileName = FileUploadUtil.fileUpload(adoptionvo.getFile(),"adoption");
				adoptionvo.setAdoptionFile(fileName);
			}
			result = adoptionDAO.adoptionUpdate(adoptionvo);
			return result;
		}
		
		//비밀번호 확인 구현 
		@Override
		public int pwdConfirm(AdoptionVO adoptionvo) {
			int result = 0;
			result = adoptionDAO.pwdConfirm(adoptionvo);
			return result;
		}

		@Override
		public int adoptionDelete(AdoptionVO adoptionvo) throws Exception {
			int result = 0;
			if(!adoptionvo.getAdoptionFile().isEmpty()) {
				FileUploadUtil.fileDelete(adoptionvo.getAdoptionFile());
			}
			result = adoptionDAO.adoptionDelete(adoptionvo);
			return result;
		}




	




}