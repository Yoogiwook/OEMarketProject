package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.BuyBoardVO;
import com.oe.mapper.BuyBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BuyBoardServiceImpl implements BuyBoardService {
   
   private BuyBoardMapper mapper;
   
   @Override
   public List<BuyBoardVO> readBuyAll(String my_id) {
      return mapper.getList(my_id);
   }

}