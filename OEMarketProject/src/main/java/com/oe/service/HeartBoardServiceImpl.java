package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.HeartBoardVO;
import com.oe.mapper.HeartBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class HeartBoardServiceImpl implements HeartBoardService {
	private HeartBoardMapper mapper;
	
	@Override
	public List<HeartBoardVO> getList(Criteria_mypage cri, String my_id) {
		log.info("getList----------------------------");
		return mapper.getListWithPaging(cri, my_id);
	}
	
	@Override
	public void removeHeart(Criteria_mypage cri, HeartBoardVO hvo) {
		log.info("removeHeart------------------------");
		mapper.deleteHeart(cri, hvo);
	}
	
	@Override
	public int getTotal(String my_id) {
		log.info("getTotal---------------------------");
		return mapper.getTotalCount(my_id);
	}
}
