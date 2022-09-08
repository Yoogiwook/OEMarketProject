package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.CriteriaVO;
import com.oe.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	public ReplyVO read(Long re_num);
	public int delete(Long re_num);
	public int update(ReplyVO vo);
	public List<ReplyVO> getListWithPaging(
			@Param("cri") CriteriaVO cri,
			@Param("bo_num") Long bo_num
			);

	
	// 0817 댓글
	public int getCountByBo(Long bno);
}
