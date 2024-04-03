package com.spring.comment.service;

import java.util.List;

import com.spring.comment.vo.FcommentVO;

public interface FcommentService {

	// 댓글 조회
	public List<FcommentVO> fcommentList(FcommentVO fcommentvo);

	// 댓글 작성
	public int fcommentInsert(FcommentVO fcommentvo);

	// 댓글 수정
	public int fcommentUpdate(FcommentVO fcommentvo);

	// 댓글 삭제
	public int fcommentDelete(FcommentVO fcommentvo);

	//댓글 상세
	public FcommentVO fcommentDetail(FcommentVO fvo);

}
