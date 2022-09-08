package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;
import com.oe.domain.ReplyVO;

public interface AdminMapper {

   public List<MarketUserVO> getAdminList();
   public List<MarketUserVO> readUserList();
   public List<MarketBoardVO> readBoardList();
   public List<MarketUserVO> getUserInfo(String us_id);
   public List<MarketBoardVO> getBoardList(String us_id);
   public List<ReplyVO> getReplyList(String us_id);
    public void updateBoardCnt(@Param("bo_id") String bo_id, @Param("amount") int amount);
    public void updateReplyCnt(@Param("re_id") String re_id, @Param("amount") int amount);
    public void updateUserPass1(String my_id);
    public void updateUserPass2(String my_id);
    public int boardBlind(Long bo_num);
    public void registerAdmin(MarketUserVO vo);
    public void registerMyPage(MarketUserVO vo);
}