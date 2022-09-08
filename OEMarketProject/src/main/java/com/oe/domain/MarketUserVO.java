package com.oe.domain;

import java.util.Date;

import lombok.Data;

/*
--유저테이블
CREATE TABLE MARKETUSER(
   us_num NUMBER,
   us_id VARCHAR2(30) PRIMARY KEY,
   us_pass VARCHAR2(30) NOT NULL,
   us_name VARCHAR2(30) NOT NULL,
   us_nickname VARCHAR2(30) UNIQUE,
   us_birth CHAR(8),
   us_email VARCHAR2(30),
   us_gender VARCHAR2(8), --남성(male), 여성(female)
   us_address1 VARCHAR2(150) NOT NULL, -- 시군구
   us_address2 VARCHAR2(30) NOT NULL, -- 동
   us_phone CHAR(13) NOT NULL,
   us_joindate DATE DEFAULT SYSDATE,
   us_grade NUMBER(1) DEFAULT 1, -- 관리자(0), 일반회원(1)
   us_replyCnt number DEFAULT 0, -- 작성한 댓글 갯수
   us_boardCnt number DEFAULT 0 -- 작성한 게시글 갯수
);
*/
@Data
public class MarketUserVO {
	private int us_num;
	private String us_id;
	private String us_pass;
	private String us_name;
	private String us_nickname;
	private String us_birth;
	private String us_email;
	private String us_gender;
	private String us_address1;
	private String us_address2;
	private String us_phone;
	private Date us_joindate;
	private String us_grade;
	private int us_replyCnt;
	private int us_boardCnt;
	private int us_userPass;
}