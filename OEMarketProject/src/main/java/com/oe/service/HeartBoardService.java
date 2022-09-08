package com.oe.service;

import java.util.List;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.HeartBoardVO;

public interface HeartBoardService {
	public List<HeartBoardVO> getList(Criteria_mypage cri, String my_id);
	public void removeHeart(Criteria_mypage cri, HeartBoardVO hvo);
	public int getTotal(String my_id);
}
