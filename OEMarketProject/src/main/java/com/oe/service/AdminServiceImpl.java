package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;
import com.oe.domain.ReplyVO;
import com.oe.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor

public class AdminServiceImpl implements AdminService{

   private AdminMapper mapper;
   
   
   
   @Override
   public List<MarketUserVO> adminUserList() { return mapper.readUserList(); }
   @Override
   public List<MarketBoardVO> adminBoardList() { return mapper.readBoardList(); }
   @Override
   public List<MarketUserVO> getUserInfo(String us_id) { return mapper.getUserInfo(us_id); }
   @Override
   public List<MarketUserVO> getAdminList() { return mapper.getAdminList(); }
   @Override
   public List<MarketBoardVO> getUserBoard(String us_id) { return mapper.getBoardList(us_id); }
   @Override
   public List<ReplyVO> getUserReply(String us_id) { return mapper.getReplyList(us_id); }
   @Override
   public void updatePass1(String my_id) { mapper.updateUserPass1(my_id); }
   @Override
   public void updatePass2(String my_id) { mapper.updateUserPass2(my_id); }
   @Override
   public int userBoardBlind(Long bo_num) { return  mapper.boardBlind(bo_num); }
   @Override
   public void registerAdmin(MarketUserVO vo) { mapper.registerAdmin(vo);}
   @Override
   public void registerMyPage(MarketUserVO vo) { mapper.registerMyPage(vo);}
      
}