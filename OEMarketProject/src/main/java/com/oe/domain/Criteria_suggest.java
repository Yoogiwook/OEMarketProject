package com.oe.domain;

import lombok.Data;

@Data
public class Criteria_suggest {
//   페이지 번호
	private int pageNum;
//   한 페이지 당 노출되는 데이터의 개수
	private int amount;

	private String category;
	
	public Criteria_suggest() {
		this(1, 15);
	}

	public Criteria_suggest(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}