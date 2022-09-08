package com.oe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oe.domain.CriteriaVO;
import com.oe.domain.MarketBoardVO;
import com.oe.mapper.AdminMapper;
import com.oe.mapper.MarketBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MarketBoardServiceImpl implements MarketBoardService {
	@Autowired
	private MarketBoardMapper boardMapper;
	private AdminMapper ADmapper;

	@Override
	public void crawlingDelete() {
		boardMapper.crawlingRemove();
	}

	@Override
	public void crawlingregister(MarketBoardVO vo) {
		boardMapper.crawlinginsert(vo);
	}

	/*-- 새로운 상품 등록 --*/

	@Override
	public void register(MarketBoardVO vo) {
		ADmapper.updateBoardCnt(vo.getBo_id(), 1);

		boardMapper.insert(vo);
	}

	@Override
	public MarketBoardVO get(Long bo_num) {
		return null;
	}

	@Override
	public int modify(MarketBoardVO vo) {
		return 0;
	}

	@Override
	public int remove(Long bo_num) {
		return 0;
	}

	@Override
	public List<MarketBoardVO> boardListOrderByHeart(CriteriaVO cri) {
		return boardMapper.getListBoard(cri);
	}

	@Override
	public List<MarketBoardVO> boardListOrderByRegdate(CriteriaVO cri) {
		return boardMapper.getList_regdate(cri);
	}

	@Override
	public List<MarketBoardVO> boardListOrderByLowPrice(CriteriaVO cri) {
		return boardMapper.getList_lowPrice(cri);
	}

	@Override
	public List<MarketBoardVO> boardListOrderByHighPrice(CriteriaVO cri) {
		return boardMapper.getList_highPrice(cri);
	}

	@Override
	public MarketBoardVO boardDetail(Long bo_num) {
		return boardMapper.getBoardDetail(bo_num);
	}

	@Override
	public int boardUpdate(MarketBoardVO vo) {
		return boardMapper.updateBoard(vo);

	}

	@Override
	public int boardDelete(Long bo_num) {
		MarketBoardVO MBvo = boardMapper.read(bo_num);
		ADmapper.updateBoardCnt(MBvo.getBo_id(), -1);
		return boardMapper.removeBoard(bo_num);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		return boardMapper.getTotalCount(cri);
	}

	// 0815 ====================================== 카테고리 정렬

	@Override
	public List<MarketBoardVO> categoryBook(CriteriaVO cri) {
		return boardMapper.getList_book(cri);
	}

	@Override
	public List<MarketBoardVO> categoryMusic(CriteriaVO cri) {
		return boardMapper.getList_music(cri);
	}

	@Override
	public List<MarketBoardVO> categoryArt(CriteriaVO cri) {
		return boardMapper.getList_art(cri);
	}

	@Override
	public List<MarketBoardVO> categoryWoman(CriteriaVO cri) {
		return boardMapper.getList_woman(cri);
	}

	@Override
	public List<MarketBoardVO> categoryMan(CriteriaVO cri) {
		return boardMapper.getList_man(cri);
	}

	@Override
	public List<MarketBoardVO> categoryShoes(CriteriaVO cri) {
		return boardMapper.getList_shoes(cri);
	}

	@Override
	public List<MarketBoardVO> categoryBag(CriteriaVO cri) {
		return boardMapper.getList_bag(cri);
	}

	@Override
	public List<MarketBoardVO> categoryWatch(CriteriaVO cri) {
		return boardMapper.getList_watch(cri);
	}

	@Override
	public List<MarketBoardVO> categoryJewelry(CriteriaVO cri) {
		return boardMapper.getList_jewelry(cri);
	}

	@Override
	public List<MarketBoardVO> categoryFuniture(CriteriaVO cri) {
		return boardMapper.getList_funiture(cri);
	}

	@Override
	public List<MarketBoardVO> categoryCar(CriteriaVO cri) {
		return boardMapper.getList_car(cri);
	}

	@Override
	public List<MarketBoardVO> categoryKidult(CriteriaVO cri) {
		return boardMapper.getList_kidult(cri);
	}

	@Override
	public List<MarketBoardVO> categoryFood(CriteriaVO cri) {
		return boardMapper.getList_food(cri);
	}

	@Override
	public List<MarketBoardVO> categoryPet(CriteriaVO cri) {
		return boardMapper.getList_pet(cri);
	}

	@Override
	public List<MarketBoardVO> categoryEtc(CriteriaVO cri) {
		return boardMapper.getList_etc(cri);
	}

	@Override
	public int updateViewCnt(Long bo_num) {
		return boardMapper.updateViewCnt(bo_num);
	}

	@Override
	public Long getHeartCount(Long bo_num) {
		return boardMapper.getHeartCount(bo_num);
	}

	@Override
	public void upHeartCount(MarketBoardVO vo) {
		boardMapper.upHeartCount(vo);
	}

	@Override
	public List<String> getHeartId(MarketBoardVO vo) {
		return boardMapper.getHeartId(vo);
	}

	@Override
	public void deleteHeart(MarketBoardVO vo) {
		boardMapper.deleteHeart(vo);
	}

	@Override
	public void minusHeartCount(Long bo_num) {
		boardMapper.minusHeartCnt(bo_num);
	}

	@Override
	public void plusHeartCount(Long bo_num) {
		boardMapper.plusHeartCnt(bo_num);

	}

	@Override
	public void sellOk(Long bo_num) {
		boardMapper.sellOk(bo_num);
	}

}