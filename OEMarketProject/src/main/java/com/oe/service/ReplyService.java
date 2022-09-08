package com.oe.service;

import java.util.List;

import com.oe.domain.CriteriaVO;
import com.oe.domain.ReplyPageDTO;
import com.oe.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	public ReplyVO get(Long re_num);
	public int modify(ReplyVO vo);
	public int remove(Long re_num);
	public List<ReplyVO> getList(CriteriaVO cri, Long bo_num);

	
	// 0817 - 수업 댓글
	public ReplyPageDTO getListPage(CriteriaVO cri, Long bno);
}
