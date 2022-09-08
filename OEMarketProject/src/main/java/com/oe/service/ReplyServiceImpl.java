package com.oe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oe.domain.CriteriaVO;
import com.oe.domain.ReplyPageDTO;
import com.oe.domain.ReplyVO;
import com.oe.mapper.AdminMapper;
import com.oe.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	@Autowired
	private AdminMapper ADmapper;

	@Override
	public int register(ReplyVO vo) {
		ADmapper.updateReplyCnt(vo.getRe_id(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long re_num) {
		return mapper.read(re_num);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(Long re_num) {
		ReplyVO rVo = mapper.read(re_num);
		ADmapper.updateReplyCnt(rVo.getRe_id(), -1);
		return mapper.delete(re_num);
	}

	@Override
	public List<ReplyVO> getList(CriteriaVO cri, Long bo_num) {
		return mapper.getListWithPaging(cri, bo_num);
	}

	@Override
	public ReplyPageDTO getListPage(CriteriaVO cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBo(bno), mapper.getListWithPaging(cri, bno));
	}

}
