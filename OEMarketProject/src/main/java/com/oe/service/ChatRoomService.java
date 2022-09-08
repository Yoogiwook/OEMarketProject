package com.oe.service;

import java.util.List;

import com.oe.domain.ChatRoomVO;

public interface ChatRoomService {
	public void register(String cr_buyer,String cr_seller,String cr_buyer_id,String cr_seller_id);
	public int checkRoom(String my_nickname,String cr_seller);
	public List<ChatRoomVO> RoomList(String my_nickname);
	public String getNickname(String us_id); //채팅 내 닉네임 가져오기
}
