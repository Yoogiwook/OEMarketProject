package com.oe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oe.domain.ChatRoomVO;
import com.oe.mapper.ChatRoomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService{
	
	@Autowired
	private ChatRoomMapper mapper;
	
	@Override
	public void register( String cr_buyer,String cr_seller,String cr_buyer_id,String cr_seller_id) {
		mapper.insert(cr_buyer,cr_seller,cr_buyer_id,cr_seller_id);
	}

	@Override
	public int checkRoom(String my_nickname, String cr_seller) {
		
		return mapper.Chk_Room(my_nickname,cr_seller);
	}

	@Override
	public List<ChatRoomVO> RoomList(String my_nickname) {
		
		return mapper.RoomList(my_nickname);
	}

	@Override
	public String getNickname(String us_id) {
		
		return mapper.getNickname(us_id);
	}

}
