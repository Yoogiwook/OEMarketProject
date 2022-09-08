package com.oe.domain;

import lombok.Data;

@Data
public class Criteria_mypage {
//   페이지 번호
	private int pageNum;
//   한 페이지 당 노출되는 데이터의 개수
	private int amount;

	public Criteria_mypage() {
		this(1, 15);
	}

	public Criteria_mypage(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}