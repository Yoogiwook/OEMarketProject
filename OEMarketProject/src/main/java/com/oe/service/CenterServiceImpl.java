package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.CenterVO;
import com.oe.domain.Criteria_mypage;
import com.oe.domain.Criteria_suggest;
import com.oe.mapper.CenterMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CenterServiceImpl implements CenterService {
	private CenterMapper mapper;
	@Override
	public void QnAInstert(CenterVO vo) {
		mapper.QnAInstert(vo);
	}
	@Override
	public CenterVO getQnA(int ce_num) {
		return mapper.getQnA(ce_num);
	}
	@Override
	public void SuggestInstert(CenterVO vo) {
		mapper.SuggestInstert(vo);
	}
	@Override
	public List<CenterVO> getSuggestListWithPaging(Criteria_suggest cri, String us_id) {
		return mapper.getSuggestListWithPaging(cri, us_id);
	}
	@Override
	public int getSuggestTotal(String us_id) {
		return mapper.getSuggestTotal(us_id);
	}
	@Override
	public CenterVO getSuggest(int ce_num) {
		return mapper.getSuggest(ce_num);
	}
	@Override
	public List<CenterVO> getQnAListWithPaging(Criteria_mypage cri, String us_id) {
		return mapper.getQnAListWithPaging(cri, us_id);
	}
	@Override
	public int getQnATotal() {
		return mapper.getQnATotal();
	}
	@Override
	public void updateFileNum(int ce_num) {
		mapper.updateFileNum(ce_num);
	}
	@Override
	public List<CenterVO> getQnAAdminListWithPaging(Criteria_mypage cri) {
		return mapper.getQnAAdminListWithPaging(cri);
	}
	@Override
	public void updateQnAStatus(int ce_num) {
		mapper.updateQnAStatus(ce_num);
	}
	@Override
	public void suggestAdminDelete(int ce_num) {
		mapper.suggestAdminDelete(ce_num);
	}

}
