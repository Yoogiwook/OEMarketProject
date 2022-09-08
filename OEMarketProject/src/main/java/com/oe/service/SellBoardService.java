package com.oe.service;

import java.util.List;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.MarketBoardVO;

public interface SellBoardService {
   public List<MarketBoardVO> getListWithPaging(
		   Criteria_mypage cri,String my_id,String filter
      );
   public int getTotal(String my_id,String filter);
//   public List<MarketBoardVO> getListSellNo(String my_id);
//   public List<MarketBoardVO> getListSellYes(String my_id);
}