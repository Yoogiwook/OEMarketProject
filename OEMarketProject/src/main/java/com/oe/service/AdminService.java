package com.oe.service;

import java.util.List;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;
import com.oe.domain.ReplyVO;

public interface AdminService {
   public List<MarketUserVO> getAdminList();
    public List<MarketUserVO> adminUserList(); //회원 관리 페이지
    public List<MarketBoardVO> adminBoardList(); // 게시글 관리 페이지
//    public MyPageVO readUserInfo(String user_id);
//    public List<MarketBoardVO> adminBoardList();
   public List<MarketUserVO> getUserInfo(String us_id); //회원 정보
   public List<MarketBoardVO> getUserBoard(String us_id);
   public List<ReplyVO> getUserReply(String us_id);
   public void updatePass1(String my_id); //탈퇴 회원 유저패스 업데이트
   public void updatePass2(String my_id); //추방 회원 유저패스 업데이트
   public int userBoardBlind(Long bo_num);
   public void registerAdmin(MarketUserVO vo);
   public void registerMyPage(MarketUserVO vo);
}