package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.CenterVO;
import com.oe.domain.Criteria_mypage;
import com.oe.domain.Criteria_suggest;

public interface CenterMapper {
	public void QnAInstert(CenterVO vo); //문의 등록
	public CenterVO getQnA(int ce_num); //문의 글 불러오기
	public List<CenterVO> getQnAListWithPaging(
			@Param("cri")Criteria_mypage cri,@Param("us_id")String us_id
			);// 문의 내역 불러오기(이용자)
	public List<CenterVO> getQnAAdminListWithPaging(Criteria_mypage cri);// 문의 내역 불러오기(관리자)
	public int getQnATotal();// 문의 내역 갯수
	public void updateQnAStatus(int ce_num);//문의 답변완료로 상태 변경;
	//============================================================================================
	
	public void SuggestInstert(CenterVO vo); //건의사항 등록
	public CenterVO getSuggest(int ce_num); //건의 글 불러오기
    public List<CenterVO> getSuggestListWithPaging(
            @Param("cri")Criteria_suggest cri,@Param("us_id")String us_id
         );// 건의 내역 불러오기(페이징)
    public int getSuggestTotal(String us_id);// 건의 내역 갯수
    public void suggestAdminDelete(int ce_num);//건의 글 삭제
    //============================================================================================
    public void updateFileNum(int ce_num);//파일번호 업데이트
}
