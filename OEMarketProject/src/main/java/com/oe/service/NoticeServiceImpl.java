package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.Criteria_notice;
import com.oe.domain.NoticeVO;
import com.oe.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper mapper;
	
	
	@Override
	public NoticeVO getNoticeCenter() {
		log.info("getNoticeCenter----------------------------");
		return mapper.getRecentNotice();
	}
	
	@Override
	public List<NoticeVO> getListCenter() {
		log.info("getListCenter----------------------------");
		return mapper.getListFaqTop5();
	}
	
	@Override
	public NoticeVO getNotice(Integer no_num) {
		log.info("getNotice----------------------------");
		return mapper.readNotice(no_num);
	}
	
	@Override
	public void increaseRC(Integer no_num) {
		log.info("increaseRC----------------------------");
		mapper.updateReadCount(no_num);
	}
	
	@Override
	public List<NoticeVO> getListNotice(Criteria_mypage cri) {
		log.info("getListNotice----------------------------");
		cri = new Criteria_mypage(1, 10);
		return mapper.getListNoticeWithPaging(cri);
	}
	
	@Override
	public List<NoticeVO> getListFaqWithPaging(Criteria_notice cri) {
		return mapper.getListFaqWithPaging(cri);
	}
	
	@Override
	public int getTotalNotice() {
		log.info("getTotalNotice----------------------------");
		return mapper.getCountNotice();
	}
	
	@Override
	public int getTotalFAQ() {
		log.info("getTotalFAQ----------------------------");
		return mapper.getCountFAQ();
	}
	
	@Override
	public void regNotice(NoticeVO vo) {
		log.info("regNotice----------------------------");
		mapper.insertNotice(vo);
	}
	
	@Override
	public void regFAQ(NoticeVO vo) {
		log.info("regFAQ----------------------------");
		mapper.insertFAQ(vo);
	}
	
	@Override
	public void modify(NoticeVO vo) {
		log.info("modify----------------------------");
		mapper.update(vo);
	}
	
	@Override
	public void remove(Integer no_num) {
		log.info("remove----------------------------");
		mapper.delete(no_num);
	}
}
