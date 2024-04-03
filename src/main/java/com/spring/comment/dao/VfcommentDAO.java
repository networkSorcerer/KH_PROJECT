package com.spring.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.comment.vo.FcommentVO;
import com.spring.comment.vo.VfcommentVO;
@Mapper
public interface VfcommentDAO {
	// 댓글 조회
		public List<VfcommentVO> vfcommentList(VfcommentVO vfcommentvo);

		// 댓글 작성
		public int vfcommentInsert(VfcommentVO vfcommentvo);

		// 댓글 수정
		public int vfcommentUpdate(VfcommentVO vfcommentvo);

		// 댓글 삭제
		public int vfcommentDelete(VfcommentVO vfcommentvo);
	
		//댓글 상세
		public VfcommentVO vfcommentDetail(VfcommentVO vvo);

}
