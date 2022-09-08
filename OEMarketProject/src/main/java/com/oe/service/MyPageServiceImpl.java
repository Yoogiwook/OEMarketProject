package com.oe.service;

import org.springframework.stereotype.Service;

import com.oe.domain.MarketUserVO;
import com.oe.domain.MyPageVO;
import com.oe.mapper.MarketBoardMapper;
import com.oe.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService {
   private MyPageMapper mapper;
   
   @Override
   public MyPageVO get(String my_id) {
      log.info("get★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.readMyPage(my_id);
   }
   
   @Override
   public void profileEdit(MyPageVO vo) {
      log.info("profileEdit★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆");
      mapper.updateMyPage(vo);
   }
   
   @Override
   public void withdrawal(MyPageVO vo) {
      log.info("withdrawal★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.deleteMember(vo);
   }
   
   @Override
   public MarketUserVO getUserInfo(String my_id) {
      log.info("getUserInfo★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.readMarketUser(my_id);
   }
   
   @Override
   public int getmyCountHB(String my_id) {
      log.info("getmyCountHB★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.readCountHB(my_id);
   }
   
   @Override
   public void nickEdit_marketuser(MyPageVO vo) {
      log.info("nickEdit_marketuser★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_marketuser(vo);
   }
   
   @Override
   public void nickEdit_marketboard(MyPageVO vo) {
      log.info("nickEdit_marketboard★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_marketboard(vo);
   }
   
   @Override
   public void nickEdit_buyboard(MyPageVO vo) {
      log.info("nickEdit_buyboard★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_buyboard(vo);
   }
   
   
   @Override
   public void nickEdit_heartboard(MyPageVO vo) {
      log.info("nickEdit_heartboard★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_heartboard(vo);
   }
   
   @Override
   public void nickEdit_center(MyPageVO vo) {
      log.info("nickEdit_center★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_center(vo);
   }
   
   @Override
   public void nickEdit_notice(MyPageVO vo) {
      log.info("nickEdit_notice★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_notice(vo);
   }
   
   @Override
   public void nickEdit_sellboard(MyPageVO vo) {
      log.info("nickEdit_sellboard★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_sellboard(vo);
   }
   
   @Override
   public void nickEdit_cr_seller(MyPageVO vo) {
      log.info("nickEdit_cr_seller★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_cr_seller(vo);
   }
   
   @Override
   public void nickEdit_cr_buyer(MyPageVO vo) {
      log.info("nickEdit_cr_buyer★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updateNick_cr_buyer(vo);
   }
   
   @Override
   public void saveWithdrawal(MyPageVO vo) {
      log.info("saveWithdrawal★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.updatePreWithdrawal(vo);
   }
   
   @Override
   public void moveWithdrawal(MyPageVO vo) {
      log.info("moveWithdrawal★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      mapper.insertWithdrawal(vo);
   }
   
   @Override
   public int nicknameChk(String my_nickname) {
      log.info("nicknameChk★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.nicknameChk(my_nickname);
   }
   
   @Override
   public int sellCount(String my_id) {
      log.info("sellCount★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.count_sell(my_id);
   }
   
   @Override
   public int buyCount(String my_id) {
      log.info("buyCount★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.count_buy(my_id);
   }
   
   @Override
   public int count_chat(String my_id) {
      log.info("count_chat★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★");
      return mapper.count_chat(my_id);
   }
   
   @Override
   public void profileEdit_reply(MyPageVO vo) {
      mapper.updateProfile_reply(vo);
   }

   @Override
   public void nickEdit_reply(MyPageVO vo) {
      mapper.updateNick_reply(vo);
      
   }

@Override
public void profileEdit_marketboard(MyPageVO vo) {
	mapper.updateProfile_marketboard(vo);
}

}