package com.oe.mapper;

import java.util.List;

import com.oe.domain.BuyBoardVO;

public interface BuyBoardMapper {
   public List<BuyBoardVO> getList(String my_id);
}