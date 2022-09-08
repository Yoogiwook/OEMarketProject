package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.ChatRoomVO;

public interface ChatRoomMapper {
	public void insert(@Param("cr_buyer") String cr_buyer,@Param("cr_seller") String cr_seller,
			@Param("cr_buyer_id") String cr_buyer_id,@Param("cr_seller_id")String cr_seller_id);
	public int Chk_Room(@Param("my_nickname") String my_nickname,@Param("cr_seller")  String cr_seller);
	public List<ChatRoomVO> RoomList(String my_nickname);
	public String getNickname(String us_id); //채팅 내 닉네임 가져오기
}
