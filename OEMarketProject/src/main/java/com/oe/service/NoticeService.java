package com.oe.service;

import java.util.List;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.Criteria_notice;
import com.oe.domain.NoticeVO;

public interface NoticeService {
	public NoticeVO getNoticeCenter(); //고객센터 메인페이지에 표시되는 최근 공지사항 1개
	public List<NoticeVO> getListCenter(); //고객센터 메인페이지에 표시되는 자주 하는 질문 조회수 상위 5개
	
	public NoticeVO getNotice(Integer no_num); //관리자 게시물 상세보기
	public void increaseRC(Integer no_num); //관리자 게시물 조회수 증가
	
	public List<NoticeVO> getListNotice(Criteria_mypage cri); //공지사항 목록
	public List<NoticeVO> getListFaqWithPaging(Criteria_notice cri);//FAQ 목록
	
	public int getTotalNotice(); //공지사항 게시글 갯수
	public int getTotalFAQ(); //자주 하는 질문 게시글 갯수
	
	public void regNotice(NoticeVO vo); //공지 등록
	public void regFAQ(NoticeVO vo); //도움말 등록
	
	public void modify(NoticeVO vo); //관리자 게시글 수정
	
	public void remove(Integer no_num); //관리자 게시글 삭제
}
