package com.spring.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.comment.vo.AfcommentVO;
import com.spring.comment.vo.FcommentVO;
@Mapper
public interface AfcommentDAO {
	// 댓글 조회
	public List<AfcommentVO> afcommentList(AfcommentVO afcommentvo);

	// 댓글 작성
	public int afcommentInsert(AfcommentVO afcommentvo);

	// 댓글 수정
	public int afcommentUpdate(AfcommentVO afcommentvo);

	// 댓글 삭제
	public int afcommentDelete(AfcommentVO afcommentvo);	

	//댓글 상세
	public AfcommentVO afcommentDetail(AfcommentVO avo);

}
