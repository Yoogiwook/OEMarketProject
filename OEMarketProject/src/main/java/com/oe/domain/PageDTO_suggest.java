package com.oe.domain;

import lombok.Data;

@Data
public class PageDTO_suggest {
	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private Criteria_suggest cri;

	public PageDTO_suggest(Criteria_suggest cri, int total) {
		this.cri = cri;
		this.total = total;

//		<<  <  ①  ②  ③  ④  ⑤  >  >>
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 5.0)) * 5;
		this.startPage = endPage - 4;
		
		int readEnd = (int)(Math.ceil(total * 1.0) / cri.getAmount()) + 1;
		
		if((Math.ceil(total * 1.0) % cri.getAmount()) == 0) {
			readEnd = (int)(Math.ceil(total * 1.0) / cri.getAmount());
		}
		
		if(endPage > readEnd) {
			endPage = readEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < readEnd;
	}
} 