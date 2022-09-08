package com.oe.mapper;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;
import com.oe.domain.MyPageVO;

public interface MyPageMapper {
   public MyPageVO readMyPage(String my_id);
   public void updateMyPage(MyPageVO vo);
   public void deleteMember(MyPageVO vo);
   public MarketUserVO readMarketUser(String my_id);
   public int readCountHB(String my_id);
   public void updateNick_marketuser(MyPageVO vo);
   public void updateNick_marketboard(MyPageVO vo);
   public void updateNick_buyboard(MyPageVO vo);
   public void updateNick_heartboard(MyPageVO vo);
   public void updateNick_center(MyPageVO vo);
   public void updateNick_notice(MyPageVO vo);
   public void updateNick_sellboard(MyPageVO vo);
   public void updateNick_cr_seller(MyPageVO vo);
   public void updateNick_cr_buyer(MyPageVO vo);
   public void updatePreWithdrawal(MyPageVO vo);
   public void insertWithdrawal(MyPageVO vo);
   public int nicknameChk(String my_nickname);
   public int count_sell(String my_id);
   public int count_buy(String my_id);
   public int count_chat(String my_id);
   public void updateProfile_reply(MyPageVO vo);
   public void updateNick_reply(MyPageVO vo);
   
   public int getProfile(MarketBoardVO vo);
   public void updateProfile_marketboard(MyPageVO vo);
}