package com.oe.mapper;

import java.util.List;

import com.oe.domain.MarketUserVO;

public interface MarketUserMapper {
	
	public void joinUser(MarketUserVO vo);
	public void updateUser(MarketUserVO vo);
	public MarketUserVO readUser(String us_id);
	public MarketUserVO loginUser(MarketUserVO vo);
	public List<String> findId(MarketUserVO vo);
	public String findPass(MarketUserVO vo);
	public void joinMypage(MarketUserVO vo);
	public void updateAdrr(MarketUserVO vo);
	public String checkID(String us_id);
	public String checkNickname(String us_nickname);
	public MarketUserVO kakaologinUser(String us_id);
}
