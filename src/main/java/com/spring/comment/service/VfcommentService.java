package com.spring.comment.service;

import java.util.List;

import com.spring.comment.vo.VfcommentVO;

public interface VfcommentService {
	// 댓글 조회
	public List<VfcommentVO> vfcommentList(VfcommentVO vfcommentvo);

	// 댓글 작성
	public int vfcommentInsert(VfcommentVO vfcommentvo);

	// 댓글 수정
	public int vfcommentUpdate(VfcommentVO vfcommentvo);

	// 댓글 삭제
	public int vfcommentDelete(VfcommentVO vfcommentvo);

	//댓글 상세
	public VfcommentVO vfcommentDetail(VfcommentVO fvo);

}
