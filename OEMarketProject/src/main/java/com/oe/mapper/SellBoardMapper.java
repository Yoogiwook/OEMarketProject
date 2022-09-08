package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.MarketBoardVO;

public interface SellBoardMapper {
   public List<MarketBoardVO> getListWithPaging(
            @Param("cri")Criteria_mypage cri,@Param("my_id")String my_id,@Param("filter")String filter
         );
   public int getTotal(@Param("my_id") String my_id,@Param("filter")String filter);

}