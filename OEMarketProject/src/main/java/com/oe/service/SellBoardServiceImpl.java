package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.MarketBoardVO;
import com.oe.mapper.SellBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SellBoardServiceImpl implements SellBoardService {
   private SellBoardMapper mapper; 
   
   @Override
   public List<MarketBoardVO> getListWithPaging(Criteria_mypage cri, String my_id, String filter) {
      return mapper.getListWithPaging(cri,my_id, filter);
   }

   @Override
   public int getTotal(String my_id,String filter) {
      return mapper.getTotal(my_id,filter);
   }




}