package com.oe.service;

import java.util.List;

import com.oe.domain.BuyBoardVO;

public interface BuyBoardService {
   public List<BuyBoardVO> readBuyAll(String my_id);
}