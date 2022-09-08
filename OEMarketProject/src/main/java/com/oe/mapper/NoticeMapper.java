package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.Criteria_mypage;
import com.oe.domain.Criteria_notice;
import com.oe.domain.NoticeVO;

public interface NoticeMapper {
	public NoticeVO getRecentNotice(); //고객센터 메인페이지에 표시되는 최근 공지사항 1개
	public List<NoticeVO> getListFaqTop5(); //고객센터 메인페이지에 표시되는 자주 하는 질문 조회수 상위 5개
	
	public NoticeVO readNotice(Integer no_num); //관리자 게시물 상세보기
	public void updateReadCount(int no_num); //관리자 게시물 조회수 증가
	
	
	public List<NoticeVO> getListNoticeWithPaging(Criteria_mypage cri); //공지사항 목록
	public List<NoticeVO> getListFaqWithPaging(@Param("cri")Criteria_notice cri);//FAQ 목록
	
	public int getCountNotice(); //공지사항 게시글 갯수
	public int getCountFAQ();//FAQ 갯수
	
	public void insertNotice(NoticeVO vo); //공지 등록
	public void insertFAQ(NoticeVO vo); //도움말 등록
	
	public void update(NoticeVO vo); //관리자 게시글 수정
	
	public void delete(int no_num); //관리자 게시글 삭제
}
