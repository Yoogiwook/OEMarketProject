package com.oe.domain;

import java.util.Date;

import lombok.Data;

/*
CREATE TABLE HEARTBOARD(
	he_bo_num NUMBER,
	he_id VARCHAR2(30),
	he_nickname VARCHAR2(30),
	he_heartdate DATE DEFAULT SYSDATE,
	CONSTRAINT fk_heart_id FOREIGN KEY (he_id) REFERENCES MARKETUSER (us_id)
	ON DELETE CASCADE,
	CONSTRAINT fk_heart_bo_num FOREIGN KEY (he_bo_num) REFERENCES MARKETBOARD (bo_num)
	ON DELETE CASCADE
);
*/

@Data
public class HeartBoardVO {
	private Integer he_bo_num;
	private String he_id, he_nickname;
	private Date he_heartdate;
	
	private MarketBoardVO mvo; //query로 join할 vo
}