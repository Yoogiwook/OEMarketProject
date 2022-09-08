package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.HeartBoardVO;

public interface HeartBoardMapper {
	public List<HeartBoardVO> getListWithPaging(@Param("cri") Criteria_mypage cri, @Param("my_id") String my_id);
	public void deleteHeart(@Param("cri") Criteria_mypage cri, @Param("hvo") HeartBoardVO hvo);
	public int getTotalCount(String my_id);
}
